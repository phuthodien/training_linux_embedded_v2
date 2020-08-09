<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1591804478795" ID="ID_324372951" MODIFIED="1591804495183" TEXT="Linux booting sequence">
<node CREATED="1591804502251" ID="ID_104931094" MODIFIED="1591804531459" POSITION="right" TEXT="arch/arm/kernel/head.S">
<node CREATED="1591804553211" ID="ID_522158251" MODIFIED="1591804562305" TEXT="enable mmu">
<node CREATED="1591804564386" ID="ID_1258019501" MODIFIED="1591804621799" TEXT="__turn_mmu_on"/>
</node>
<node CREATED="1591804692920" ID="ID_812202454" MODIFIED="1591804706985" TEXT="jump to secondary_start_kernel function"/>
</node>
<node CREATED="1591806588731" ID="ID_816581392" MODIFIED="1591806602425" POSITION="right" TEXT="arch/arm/kernel/head-common.S">
<node CREATED="1591806606834" ID="ID_412354165" MODIFIED="1591806617645" TEXT="jump to start_kernel function"/>
</node>
<node CREATED="1591806648110" ID="ID_202710688" MODIFIED="1591806652493" POSITION="right" TEXT="init/main.c">
<node COLOR="#ff3333" CREATED="1591806654980" ID="ID_5914292" MODIFIED="1592192112108" TEXT="start_kernel">
<node CREATED="1591806691940" ID="ID_1066012580" MODIFIED="1591806710155" TEXT="It is the first function of linux kernel"/>
<node CREATED="1591806967330" ID="ID_1638535744" MODIFIED="1591806968452" TEXT="boot_cpu_init">
<node CREATED="1591806969986" ID="ID_456765541" MODIFIED="1591806982621" TEXT="enable and wakeup all cpu"/>
</node>
<node CREATED="1591807041240" ID="ID_132273547" MODIFIED="1591807043294" TEXT="setup_command_line(command_line);">
<node CREATED="1591807045936" ID="ID_3285673" MODIFIED="1591807062166" TEXT="passer kernel command line"/>
</node>
<node CREATED="1591847913416" ID="ID_355556214" MODIFIED="1591847915126" TEXT="setup_arch(&amp;command_line);">
<node CREATED="1591847927979" ID="ID_942753168" MODIFIED="1591847953417" TEXT="Secondary setup for each architecture"/>
<node CREATED="1591848002658" ID="ID_1232440108" MODIFIED="1591861126291" TEXT="setup_arch">
<node CREATED="1591848324117" ID="ID_1618686317" MODIFIED="1591848325180" TEXT="setup_machine_fdt(__atags_pointer);">
<node CREATED="1591848326420" ID="ID_1720914834" MODIFIED="1591848334233" TEXT="passer device tree in ram"/>
</node>
<node CREATED="1591848397649" ID="ID_80896540" MODIFIED="1591848420225" TEXT="paging_init(mdesc);">
<node CREATED="1591848399927" ID="ID_841124948" MODIFIED="1591848404900" TEXT="Init paging memory"/>
</node>
<node COLOR="#ff3333" CREATED="1591848421245" ID="ID_922089953" MODIFIED="1592192133866" TEXT="unflatten_device_tree();">
<node CREATED="1591848423130" ID="ID_133803260" MODIFIED="1591848563459" TEXT="create tree of device from device tree blob"/>
</node>
</node>
</node>
<node CREATED="1591807170644" ID="ID_1449671114" MODIFIED="1591807171781" TEXT="mm_init">
<node CREATED="1591807173529" ID="ID_1008249814" MODIFIED="1591807180910" TEXT="enable virtual memory"/>
</node>
<node CREATED="1591807193392" ID="ID_1807899119" MODIFIED="1591807194211" TEXT="sched_init">
<node CREATED="1591807195572" ID="ID_1829293220" MODIFIED="1591807206508" TEXT="enable scheduler"/>
</node>
<node CREATED="1591807328900" ID="ID_216735104" MODIFIED="1591807330254" TEXT="init_IRQ">
<node CREATED="1591807332992" ID="ID_1364614478" MODIFIED="1591807339187" TEXT="init interrupt system"/>
</node>
<node CREATED="1591807597298" ID="ID_1555015334" MODIFIED="1591807598227" TEXT="init_timers">
<node CREATED="1591807599551" ID="ID_1839794109" MODIFIED="1591807603116" TEXT="init system timer"/>
</node>
<node CREATED="1591807685841" ID="ID_232439949" MODIFIED="1591807686681" TEXT="console_init">
<node COLOR="#ff3333" CREATED="1591807688196" ID="ID_686781632" MODIFIED="1592192150955" TEXT="init console device, every log is printed before this function is till stay in buffer"/>
</node>
<node CREATED="1591844282388" ID="ID_189929184" MODIFIED="1591844283866" TEXT="vfs_caches_init">
<node COLOR="#ff3333" CREATED="1591844286615" ID="ID_314362935" MODIFIED="1592192158581" TEXT="Create mini file system in ram (ram disk)"/>
</node>
<node CREATED="1591808198111" ID="ID_1048725705" MODIFIED="1591843902549" TEXT="rest_init">
<node CREATED="1591808252838" ID="ID_1738266060" MODIFIED="1591808254455" TEXT="kernel_thread(kernel_init, NULL, CLONE_FS | CLONE_SIGHAND);">
<node CREATED="1591808256594" ID="ID_544165944" MODIFIED="1591808264199" TEXT="spawn init process"/>
</node>
<node COLOR="#ff3333" CREATED="1591808457619" ID="ID_191749590" MODIFIED="1592192353195" TEXT="kernel_thread(kthreadd, NULL, CLONE_FS | CLONE_FILES);">
<node CREATED="1591808463064" ID="ID_961714123" MODIFIED="1591808469074" TEXT="spawn kernel threads"/>
</node>
</node>
</node>
<node CREATED="1591843963149" ID="ID_832331319" MODIFIED="1591868444715" TEXT="kernel_init">
<node CREATED="1591864349567" ID="ID_1431193843" MODIFIED="1591864350872" TEXT="kernel_init_freeable">
<node CREATED="1591864573012" ID="ID_1082489998" MODIFIED="1591864573977" TEXT="do_pre_smp_initcalls">
<node COLOR="#ff3333" CREATED="1591864575735" ID="ID_854486120" MODIFIED="1592192169467" TEXT="call init() functions of all built in driver">
<node CREATED="1591865429206" ID="ID_255671617" MODIFIED="1591865463333" TEXT="register and init file system"/>
</node>
<node CREATED="1591864697563" ID="ID_342250302" MODIFIED="1591864704931" TEXT="__platform_driver_register">
<node CREATED="1591864707867" ID="ID_573704107" MODIFIED="1591864721351" TEXT="register driver struct for virtual bus"/>
</node>
<node COLOR="#ff3333" CREATED="1591864891857" ID="ID_847989353" MODIFIED="1592192178578" TEXT="bus_for_each_dev">
<node CREATED="1591864895115" ID="ID_1351694919" MODIFIED="1591864960343" TEXT="compare the compatible string in struct driver with compatible string from device tree node to call probe function of matches driver"/>
</node>
</node>
<node COLOR="#ff3333" CREATED="1591867967759" ID="ID_495937195" MODIFIED="1592192190195" TEXT="prepare_namespace">
<node CREATED="1591867979488" ID="ID_1291929876" MODIFIED="1592192187213" TEXT="mount_root">
<node CREATED="1591867981884" ID="ID_292035453" MODIFIED="1591868023140" TEXT="mount the root folder, create file system from flash storage"/>
</node>
</node>
</node>
<node COLOR="#ff3333" CREATED="1591844485941" ID="ID_1545917003" MODIFIED="1592192193242" TEXT="try_to_run_init_process(&quot;/sbin/init&quot;)">
<node CREATED="1591844498633" ID="ID_1133282203" MODIFIED="1591868048987" TEXT="Run init process from flash storage"/>
</node>
</node>
</node>
<node CREATED="1591868535672" ID="ID_952125817" MODIFIED="1592065501229" POSITION="right" TEXT="systemd">
<node CREATED="1592065525942" ID="ID_835517546" MODIFIED="1592190835543" TEXT="run script in /etc/init.d">
<node CREATED="1592190862244" ID="ID_1018049897" MODIFIED="1592190878174" TEXT="init needed daemon"/>
<node CREATED="1592190879596" ID="ID_934535056" MODIFIED="1592190901315" TEXT="mount partition"/>
<node CREATED="1592190902527" ID="ID_431597720" MODIFIED="1592190914878" TEXT="config network interface"/>
<node COLOR="#ff3333" CREATED="1592190916314" ID="ID_1053960878" MODIFIED="1592192199027" TEXT="run graphic server application. For beagle black it is X11 server."/>
</node>
</node>
<node CREATED="1591868688433" ID="ID_1371766162" MODIFIED="1591868693157" POSITION="left" TEXT="platform">
<node CREATED="1591868694597" ID="ID_337267073" MODIFIED="1591868698895" TEXT="Beagle bone black"/>
</node>
<node CREATED="1591868700355" ID="ID_1872086470" MODIFIED="1591868705212" POSITION="left" TEXT="Kernel version">
<node CREATED="1591868706807" ID="ID_1549586565" MODIFIED="1591868714593" TEXT="3.13"/>
</node>
<node CREATED="1591868716963" ID="ID_1999258166" MODIFIED="1592065485630" POSITION="left" TEXT="systemd version"/>
</node>
</map>
