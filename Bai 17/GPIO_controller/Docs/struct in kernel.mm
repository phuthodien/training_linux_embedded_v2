<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1561097188339" ID="ID_1986703980" MODIFIED="1561299835180" TEXT="Kernel Researching">
<node COLOR="#0000ff" CREATED="1561097244386" ID="ID_950821254" MODIFIED="1561111893036" POSITION="right" TEXT="int probe(struct   platform_device   *pdev)">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561097204246" HGAP="19" ID="ID_1557424167" MODIFIED="1561097518538" TEXT="struct platform_driver" VSHIFT="-60">
<node CREATED="1561097378524" ID="ID_987221209" MODIFIED="1561097380061" TEXT="int (*probe)(struct platform_device *);"/>
<node CREATED="1561097390557" ID="ID_566605391" MODIFIED="1561097391553" TEXT="int (*remove)(struct platform_device *);"/>
<node COLOR="#009999" CREATED="1561097396354" HGAP="19" ID="ID_1518100378" MODIFIED="1561302038740" TEXT="struct device_driver driver;" VSHIFT="15">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561097507796" ID="ID_1936696304" MODIFIED="1561103483856" TEXT="const char     * name;">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="full-1"/>
</node>
<node CREATED="1561100281085" ID="ID_583650765" MODIFIED="1561103487106" TEXT="struct module     * owner;"/>
<node CREATED="1561097492681" ID="ID_902648792" MODIFIED="1561103479015" TEXT="const struct of_device_id      * of_match_table;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1561099059828" ID="ID_361836893" MODIFIED="1561103491473" TEXT="char     compatible[128];"/>
<node COLOR="#cc0000" CREATED="1561099064709" ID="ID_1026136798" MODIFIED="1561103496087" TEXT="const void     *data;">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561100446110" ID="ID_1320755405" MODIFIED="1561100447331" TEXT="static const struct of_device_id omap_gpio_match[];">
<node CREATED="1561100464068" ID="ID_1374187059" MODIFIED="1561100488366" TEXT="this is global array of struct"/>
<node CREATED="1561100451061" ID="ID_1396134694" MODIFIED="1561100461787" TEXT="outside function probe"/>
</node>
<node CREATED="1561100522089" ID="ID_1771500776" MODIFIED="1561100523720" TEXT="const struct omap_gpio_platform_data *pdata;">
<node CREATED="1561100529071" ID="ID_931307461" MODIFIED="1561100538893" TEXT="this is struct your owner"/>
</node>
<node CREATED="1561100430277" ID="ID_912971237" MODIFIED="1561100431208" TEXT="struct device *dev = &amp;pdev-&gt;dev;"/>
<node CREATED="1561100411162" ID="ID_1812848074" MODIFIED="1561100415578" TEXT="const struct of_device_id *match;">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561100423853" ID="ID_1832939817" MODIFIED="1561100501883" TEXT="match = of_match_device(of_match_ptr(omap_gpio_match), dev);">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561100511529" ID="ID_81462110" MODIFIED="1561100547108" TEXT="pdata = match ? match-&gt;data : dev_get_platdata(dev);">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#cc0000" CREATED="1561100566123" ID="ID_1379125830" MODIFIED="1561100626971" TEXT="get const void *data">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1561302506064" ID="ID_826377628" MODIFIED="1561302521162" TEXT="const   struct   platform_device_id    *id_table;"/>
<node CREATED="1561103841429" HGAP="24" ID="ID_1006091003" MODIFIED="1561302513338" TEXT="API register" VSHIFT="80">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561103849024" ID="ID_422120034" MODIFIED="1561103874346" TEXT="module_platform_driver(struct  platform_driver   drv)"/>
<node CREATED="1561302133859" ID="ID_772126082" MODIFIED="1561302135205" TEXT="platform_driver_register()"/>
<node CREATED="1561302140948" ID="ID_282476771" MODIFIED="1561302142071" TEXT="platform_driver_probe()"/>
</node>
</node>
<node COLOR="#0033ff" CREATED="1561097237077" HGAP="21" ID="ID_980688387" MODIFIED="1561102909170" TEXT="struct platform_device" VSHIFT="55">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561098456123" ID="ID_180955592" MODIFIED="1561103566384" TEXT="const char    *name;">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<icon BUILTIN="full-1"/>
</node>
<node CREATED="1561098440723" ID="ID_195607465" MODIFIED="1561098441933" TEXT="u32 id;"/>
<node CREATED="1561097271919" ID="ID_1548115069" MODIFIED="1561097278614" TEXT="struct device dev">
<node CREATED="1561306279381" ID="ID_792406338" MODIFIED="1561306295406" TEXT="struct   device_node   *of_node; "/>
<node COLOR="#009999" CREATED="1561301923886" ID="ID_1196898275" MODIFIED="1561302041821" TEXT="struct device_driver *driver;" VSHIFT="13">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#ff33ff" CREATED="1561097578520" ID="ID_1474554917" MODIFIED="1561103440397" TEXT="void     * platform_data;">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561099780602" ID="ID_1426047040" MODIFIED="1561301780139" TEXT="void * dev_get_platdata(const struct device     *dev)">
<node COLOR="#ff33ff" CREATED="1561099787966" ID="ID_1837774525" MODIFIED="1561100685204" TEXT="eg: struct my_gpios *picked_gpios = dev_get_platdata(&amp;pdev-&gt;dev);">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1561297719357" ID="ID_1196225636" MODIFIED="1561297720911" TEXT="platform_device_register(&amp;omap_mpuio_device);"/>
</node>
<node CREATED="1561097592969" HGAP="21" ID="ID_1807006845" MODIFIED="1561103436090" TEXT="void     * driver_data;" VSHIFT="12">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1561102142405" ID="ID_1779596337" MODIFIED="1561102144205" TEXT="platform_set_drvdata(pdev, bank);">
<node CREATED="1561302861287" ID="ID_25935358" MODIFIED="1561302885994" TEXT="be invoked inside probe to add driver data to pdev"/>
</node>
<node CREATED="1561102235867" ID="ID_1759543996" MODIFIED="1561102237275" TEXT="platform_get_drvdata(pdev)"/>
</node>
<node CREATED="1561479071980" ID="ID_1260904475" MODIFIED="1561479073328" TEXT="to_platform_device(dev);"/>
</node>
<node CREATED="1561097280292" ID="ID_130933126" MODIFIED="1561103469205" TEXT="struct   resource     *resource"/>
<node CREATED="1561098446655" ID="ID_1530908048" MODIFIED="1561103464705" TEXT="u32     num_resources;"/>
<node CREATED="1561302246953" HGAP="19" ID="ID_1862626178" MODIFIED="1561302256496" TEXT="API register" VSHIFT="28">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561302251539" ID="ID_578147897" MODIFIED="1561302252847" TEXT="platform_device_register()"/>
</node>
</node>
<node CREATED="1561099650218" HGAP="22" ID="ID_262084378" MODIFIED="1561100698263" TEXT="API" VSHIFT="105">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561099653795" ID="ID_67948966" MODIFIED="1561103556067" TEXT="struct  resource  *platform_get_resource(struct platform_device *dev, unsigned   int  type, unsigned int   num)"/>
<node CREATED="1561099672856" ID="ID_659580991" MODIFIED="1561103529736" TEXT="int platform_get_irq(struct platform_device     * pdev, unsigned   int    num)"/>
<node CREATED="1561099780602" ID="ID_481810708" MODIFIED="1561103511006" TEXT="void *dev_get_platdata(const struct device     *dev)"/>
<node CREATED="1561103898155" ID="ID_297212895" MODIFIED="1561103903959" TEXT="MODULE_DEVICE_TABLE(of, my_of_match);"/>
</node>
</node>
<node CREATED="1561097258886" ID="ID_1349372221" MODIFIED="1561446681462" POSITION="left" TEXT="struct">
<node CREATED="1561097700158" HGAP="15" ID="ID_368756770" MODIFIED="1561608422888" TEXT="struct gpio_chip" VSHIFT="-319">
<node COLOR="#3333ff" CREATED="1561097708046" HGAP="9" ID="ID_1157822299" MODIFIED="1561443890834" TEXT="callback functions">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561103357535" HGAP="12" ID="ID_6160266" MODIFIED="1561338040241" TEXT="struct device     *parent;"/>
<node CREATED="1561103597083" HGAP="15" ID="ID_509685741" MODIFIED="1561338041302" TEXT="struct module       *owner;"/>
<node CREATED="1561097729357" HGAP="16" ID="ID_691372974" MODIFIED="1561443814102" TEXT="struct device_node    *of_node" VSHIFT="-56"/>
<node CREATED="1561338021418" HGAP="18" ID="ID_1824577282" MODIFIED="1561338044690" TEXT="struct gpio_device * gpiodev;" VSHIFT="-85">
<node CREATED="1561338061332" ID="ID_78082652" MODIFIED="1561338092761" TEXT="struct device  dev;"/>
<node CREATED="1561338143339" ID="ID_1379888907" MODIFIED="1561338192110" TEXT="struct gpio_chip  *chip;"/>
<node CREATED="1561338198549" ID="ID_2776138" MODIFIED="1561444448912" TEXT="struct gpio_desc        *descs;">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561338253837" MODIFIED="1561338253837" TEXT="struct gpio_device        *gdev;"/>
<node CREATED="1561338261059" MODIFIED="1561338261059" TEXT="const char                *label;"/>
<node CREATED="1561338264091" MODIFIED="1561338264091" TEXT="const char                *name;"/>
</node>
<node CREATED="1561338224518" ID="ID_1664217013" MODIFIED="1561540192952" TEXT="void                        *data;">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561539062221" ID="ID_5462683" MODIFIED="1561540366796" TEXT="gpiochip_add_data(&amp;bank-&gt;chip, bank);">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561539101215" ID="ID_1718372783" MODIFIED="1561539102380" TEXT="gpiochip_get_data(chip);"/>
</node>
<node CREATED="1561338214089" ID="ID_1619880437" MODIFIED="1561338214089" TEXT="struct list_head        list;"/>
</node>
<node CREATED="1561097754150" ID="ID_473989750" MODIFIED="1561608088406" TEXT="struct gpio_irq_chip    irq">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561097788581" HGAP="17" ID="ID_598221106" MODIFIED="1561432799004" TEXT="struct irq_chip     *chip" VSHIFT="-26">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#3333ff" CREATED="1561097708046" ID="ID_1500292060" MODIFIED="1561443884160" TEXT="callback functions">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561111046383" ID="ID_1534456917" MODIFIED="1561111048078" TEXT="struct device&#x9;*parent_device;"/>
<node CREATED="1561111051731" ID="ID_417499378" MODIFIED="1561111053047" TEXT="const char&#x9;*name;"/>
</node>
<node CREATED="1561103202571" ID="ID_1936943238" MODIFIED="1561432799779" TEXT="struct irq_domain     *domain">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561098221442" ID="ID_477358025" MODIFIED="1561458735889" TEXT="const struct irq_domain_ops     *ops">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561444168282" ID="ID_1968850308" MODIFIED="1561444171235" TEXT="int (*match)">
<node CREATED="1561444269696" ID="ID_1492929100" MODIFIED="1561444275429" TEXT="Match an interrupt controller device node to a host, returns 1 on a match"/>
</node>
<node CREATED="1561444176419" ID="ID_1018213700" MODIFIED="1561444177362" TEXT="int (*select)"/>
<node CREATED="1561444184202" ID="ID_390012746" MODIFIED="1561444185264" TEXT="int (*map)">
<node CREATED="1561444213877" ID="ID_1925814096" MODIFIED="1561444249815" TEXT="Create or update a mapping between a virtual irq number and a hw  irq number. This is called only once for a given mapping"/>
</node>
<node CREATED="1561444189953" ID="ID_1248616064" MODIFIED="1561444190775" TEXT="void (*unmap)"/>
<node CREATED="1561444196790" ID="ID_1978500570" MODIFIED="1561444197718" TEXT="int (*xlate)">
<node CREATED="1561444290984" ID="ID_1663225897" MODIFIED="1561444298477" TEXT="Given a device tree node and interrupt specifier, decode the hardware irq number and linux irq type value"/>
</node>
</node>
<node CREATED="1561098253087" ID="ID_298943157" MODIFIED="1561103414821" TEXT="struct fwnode_handle     *fwnode;"/>
<node CREATED="1561098261427" ID="ID_1847523013" MODIFIED="1561103419221" TEXT="void     *host_data;"/>
</node>
<node CREATED="1561097951977" ID="ID_304195453" MODIFIED="1561432800594" TEXT="const struct irq_domain_ops      *domain_ops" VSHIFT="18">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1561446682255" HGAP="19" ID="ID_391495289" MODIFIED="1561541819107" TEXT="IRQ management and interrupt controller drivers both rely on the IRQ domain, its turn built on top of the following structures:" VSHIFT="58">
<node CREATED="1561446749709" ID="ID_1279937454" MODIFIED="1561446751552" TEXT="struct irq_chip: ">
<node CREATED="1561446846642" ID="ID_292172540" MODIFIED="1561446864017" TEXT="This structure implements a set of methods describing how to drive the interrupt controller, and which are directly called by core IRQ code"/>
<node CREATED="1561446898061" ID="ID_1868597146" MODIFIED="1561446899553" TEXT="Almost every irq_chip call is given an irq_data as a parameter, from which you can obtain the corresponding irq_desc"/>
</node>
<node CREATED="1561446768100" ID="ID_812558670" MODIFIED="1561446954083" TEXT="struct irq_domain">
<node CREATED="1561446803050" MODIFIED="1561446803050" TEXT="A way to retrieve the Linux view of an IRQ from hwirq"/>
<node CREATED="1561446810566" ID="ID_750751471" MODIFIED="1561446823931" TEXT="A method to convert a firmware description of an IRQ into an ID local to this interrupt controller (hwirq)"/>
</node>
<node CREATED="1561446779037" MODIFIED="1561446779037" TEXT="struct irq_desc"/>
<node CREATED="1561446783353" MODIFIED="1561446783353" TEXT="struct irq_action"/>
<node COLOR="#ff3333" CREATED="1561446790075" ID="ID_1934944339" MODIFIED="1561541992008" TEXT="struct irq_data">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561542009002" ID="ID_986582338" MODIFIED="1561542047781" TEXT="unsigned int irq : interrupt number"/>
<node CREATED="1561542060101" ID="ID_237125065" MODIFIED="1561542082315" TEXT="unsigned long hwirq : hardware interrupt number, local to the interrupt domain"/>
<node CREATED="1561542122057" ID="ID_1294401225" MODIFIED="1561542130586" TEXT="struct irq_chip *chip;"/>
<node CREATED="1561542135519" ID="ID_1850429466" MODIFIED="1561542140751" TEXT="struct irq_domain *domain"/>
<node CREATED="1561542109181" ID="ID_615162448" MODIFIED="1561542111641" TEXT="void&#x9;&#x9;&#x9;*chip_data;"/>
</node>
</node>
<node CREATED="1561540446658" HGAP="21" ID="ID_1367026858" MODIFIED="1561541822038" TEXT="API relevant with both gpio_chip and gpio_irq structs" VSHIFT="54">
<node CREATED="1561540528703" ID="ID_630959507" MODIFIED="1561540533401" TEXT="gpiochip_irqchip_add">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node COLOR="#0033ff" CREATED="1561540206180" ID="ID_1935788989" MODIFIED="1561540538497" TEXT="gpiochip_irqchip_add_key">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561540217043" ID="ID_713148088" MODIFIED="1561540241037" TEXT="associates a certain irqchip with a certain gpiochip"/>
<node CREATED="1561540253579" ID="ID_1509277570" MODIFIED="1561540258114" TEXT="IRQ domain">
<node CREATED="1561540261139" ID="ID_34553568" MODIFIED="1561540292049" TEXT="providing an irq domain to translate the local IRQs to global irqs in the gpiolib core"/>
<node CREATED="1561540273056" ID="ID_750455029" MODIFIED="1561540283853" TEXT="An irqdomain will be stored in the gpiochip that shall be used by the driver to handle IRQ number  * translation."/>
</node>
<node CREATED="1561540304634" ID="ID_1821900619" MODIFIED="1561540309888" TEXT="The gpiochip will need to be initialized and registered before calling this function"/>
<node CREATED="1561540336210" ID="ID_34245771" MODIFIED="1561540357334" TEXT="and making sure that the gpiochip is passed as chip data to all related functions. Driver callbacks need to use gpiochip_get_data() to get their local state containers back from the gpiochip passed as chip data"/>
</node>
</node>
<node CREATED="1561541845554" HGAP="19" ID="ID_153845054" MODIFIED="1561541878794" TEXT="gpiochip_set_chained_irqchip() - connects a chained irqchip to a gpiochip" VSHIFT="40">
<node CREATED="1561541875526" ID="ID_474129499" MODIFIED="1561541876573" TEXT="gpiochip_set_cascaded_irqchip()"/>
</node>
<node CREATED="1561541808306" HGAP="17" ID="ID_1972122078" MODIFIED="1561541814596" TEXT="gpiochip_set_cascaded_irqchip() - connects a cascaded irqchip to a gpiochip" VSHIFT="58">
<node CREATED="1561541741868" ID="ID_1081659518" MODIFIED="1561541888964" TEXT="irq_find_mapping()"/>
</node>
<node CREATED="1561541891111" ID="ID_152688923" MODIFIED="1561541896088" TEXT="irq_find_mapping() - Find a linux irq from an hw irq number" VSHIFT="35"/>
</node>
</node>
</node>
</map>
