#include <linux/uaccess.h> /* copy_from_user */
#include <linux/debugfs.h>
#include <linux/fs.h>
#include <linux/init.h>
#include <linux/kernel.h> /* min */
#include <linux/mm.h>
#include <linux/module.h>
#include <linux/proc_fs.h>
#include <linux/slab.h>
#include <linux/cdev.h>

#define DEVICE_NAME "exam_mmap"
static dev_t dev_num;
struct class *my_class;
struct device *my_dev;
struct cdev my_cdev;

struct mmap_info {
    char *data;
};

/* After unmap. */
static void vm_close(struct vm_area_struct *vma)
{
	struct mmap_info *info;
	info = (struct mmap_info *)vma->vm_private_data;
	pr_info("PhuLA %s, %d, data = %s\n", __func__, __LINE__, info->data);
}

/* First page access. */
static int vm_fault(struct vm_fault *vmf)
{
	struct page *page;
	struct mmap_info *info;
	struct vm_area_struct *vma = vmf->vma;

	pr_info("PhuLA %s, %d\n", __func__, __LINE__);
	info = (struct mmap_info *)vma->vm_private_data;
	if (info->data) {
		page = virt_to_page(info->data);
		get_page(page);
		vmf->page = page;
	}
	return 0;
}

/* Aftr mmap. TODO vs mmap, when can this happen at a different time than mmap? */
static void vm_open(struct vm_area_struct *vma)
{
	pr_info("PhuLA %s, %d\n", __func__, __LINE__);
}

static struct vm_operations_struct vm_ops =
{
	.close = vm_close,
	.fault = vm_fault,
	.open = vm_open,
};

static int mmap(struct file *filp, struct vm_area_struct *vma)
{
	pr_info("PhuLA %s, %d\n", __func__, __LINE__);
	vma->vm_ops = &vm_ops;
	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
	vma->vm_private_data = filp->private_data;
	vm_open(vma);
	return 0;
}

static int open(struct inode *inode, struct file *filp)
{
	struct mmap_info *info;

	pr_info("PhuLA %s, %d\n", __func__, __LINE__);
	info = kmalloc(sizeof(struct mmap_info), GFP_KERNEL);

	info->data = (char *)get_zeroed_page(GFP_KERNEL);
	memcpy(info->data, "asdf", strlen("asdf"));
	filp->private_data = info;
	return 0;
}

static int release(struct inode *inode, struct file *filp)
{
	struct mmap_info *info;

	pr_info("PhuLA %s, %d\n", __func__, __LINE__);
	info = filp->private_data;
	free_page((unsigned long)info->data);
	kfree(info);
	filp->private_data = NULL;
	return 0;
}

static const struct file_operations fops = {
	.mmap = mmap,
	.open = open,
	.release = release,
};

static int myinit(void)
{
	alloc_chrdev_region(&dev_num, 0, 1, DEVICE_NAME);
	my_class = class_create(THIS_MODULE, DEVICE_NAME);
	cdev_init(&my_cdev, &fops);
	my_cdev.owner = THIS_MODULE;
	cdev_add(&my_cdev, dev_num, 1);
	device_create(my_class, NULL, dev_num, NULL, DEVICE_NAME);

	return 0;
}

static void myexit(void)
{
	cdev_del(&my_cdev);
	device_destroy(my_class, dev_num);
	class_destroy(my_class);
	unregister_chrdev(dev_num, DEVICE_NAME);
}

module_init(myinit)
module_exit(myexit)
MODULE_LICENSE("GPL");