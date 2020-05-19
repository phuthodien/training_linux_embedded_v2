<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1560917202095" ID="ID_345796794" MODIFIED="1561990600472" TEXT="GPIO_BBB">
<node CREATED="1560917379782" FOLDED="true" ID="ID_303045455" MODIFIED="1561991530355" POSITION="left" TEXT="reference">
<node CREATED="1560917390793" ID="ID_103381101" MODIFIED="1560917396365" TEXT="am335x-boneblack.dts"/>
<node CREATED="1560917405322" ID="ID_787192976" MODIFIED="1561693793236" TEXT="am33xx.dtsi" VSHIFT="-13"/>
<node CREATED="1561693763202" HGAP="23" ID="ID_1048931293" MODIFIED="1561693796087" TEXT="drivers/pinctrl/pinctrl-single.c" VSHIFT="-99"/>
<node CREATED="1560924872540" HGAP="17" ID="ID_114473360" MODIFIED="1561693790416" TEXT="gpio-omap.c" VSHIFT="84">
<node CREATED="1560924881076" ID="ID_1420363597" MODIFIED="1561974796546" TEXT="probe">
<node CREATED="1560924884684" ID="ID_866405970" MODIFIED="1560925343132" TEXT="struct irq_chip" VSHIFT="-134">
<node CREATED="1560924989363" ID="ID_1069081912" MODIFIED="1560924993223" TEXT="omap_gpio_irq_startup"/>
<node CREATED="1560924995688" ID="ID_1869034728" MODIFIED="1560924997247" TEXT="omap_gpio_irq_shutdown"/>
<node CREATED="1560925000276" ID="ID_73268869" MODIFIED="1560925001663" TEXT="omap_gpio_ack_irq"/>
<node CREATED="1560925004261" ID="ID_829277193" MODIFIED="1560925005239" TEXT="omap_gpio_mask_irq"/>
<node CREATED="1560925007717" ID="ID_1329229917" MODIFIED="1560925008583" TEXT="omap_gpio_unmask_irq"/>
<node CREATED="1560925013772" ID="ID_1866125225" MODIFIED="1560925014983" TEXT="omap_gpio_irq_type"/>
<node CREATED="1560925017700" ID="ID_1155265801" MODIFIED="1560925018583" TEXT="omap_gpio_wake_enable"/>
<node CREATED="1560925021156" ID="ID_916626070" MODIFIED="1560925022391" TEXT="omap_gpio_irq_bus_lock"/>
<node CREATED="1560925025004" ID="ID_129877679" MODIFIED="1560925025926" TEXT="gpio_irq_bus_sync_unlock"/>
</node>
<node CREATED="1560925056460" HGAP="26" ID="ID_808728311" MODIFIED="1561430897894" TEXT="struct gpio_chip" VSHIFT="-49"/>
<node CREATED="1560925334021" ID="ID_1872553824" MODIFIED="1560925355118" TEXT="called to">
<node CREATED="1560925327740" ID="ID_1697121308" MODIFIED="1560925331039" TEXT="omap_gpio_mod_init"/>
<node CREATED="1560925355120" ID="ID_1462616067" MODIFIED="1560931926695" TEXT="omap_gpio_chip_init">
<node CREATED="1560929847664" HGAP="18" ID="ID_220994" MODIFIED="1560932011025" TEXT="call back" VSHIFT="-78">
<node CREATED="1560931959314" ID="ID_1774780229" MODIFIED="1560931960237" TEXT="bank-&gt;chip.request = omap_gpio_request; "/>
<node CREATED="1560931964437" ID="ID_485311721" MODIFIED="1560931965533" TEXT="bank-&gt;chip.free = omap_gpio_free;"/>
<node CREATED="1560931969931" ID="ID_557533542" MODIFIED="1560931970701" TEXT="bank-&gt;chip.get_direction = omap_gpio_get_direction; "/>
<node CREATED="1560931976092" ID="ID_30474446" MODIFIED="1560931977085" TEXT="bank-&gt;chip.direction_input = omap_gpio_input; "/>
<node CREATED="1560931981282" ID="ID_1817193433" MODIFIED="1560931982365" TEXT="bank-&gt;chip.get = omap_gpio_get;  "/>
<node CREATED="1560931988202" ID="ID_1659122374" MODIFIED="1560931989678" TEXT="bank-&gt;chip.direction_output = omap_gpio_output;  "/>
<node CREATED="1560931993930" ID="ID_1527284130" MODIFIED="1560931995005" TEXT="bank-&gt;chip.set_config = omap_gpio_set_config;  "/>
<node CREATED="1560931998430" ID="ID_240585850" MODIFIED="1560932000182" TEXT="bank-&gt;chip.set = omap_gpio_set;"/>
</node>
<node CREATED="1560930209097" ID="ID_1460367637" MODIFIED="1560930210604" TEXT="gpiochip_add_data(&amp;bank-&gt;chip, bank);"/>
</node>
<node CREATED="1560925363748" ID="ID_822866421" MODIFIED="1560925364919" TEXT="omap_gpio_show_rev"/>
<node CREATED="1560925373725" ID="ID_462936657" MODIFIED="1560925374695" TEXT="list_add_tail(&amp;bank-&gt;node, &amp;omap_gpio_list);"/>
</node>
</node>
</node>
<node CREATED="1560938582008" ID="ID_69519586" MODIFIED="1561974791293" TEXT="sysfs" VSHIFT="133">
<node CREATED="1560938597811" ID="ID_685344631" MODIFIED="1560938603741" TEXT="active_low"/>
<node CREATED="1560938604978" ID="ID_1409234554" MODIFIED="1560938608964" TEXT="direction"/>
<node CREATED="1560938610180" ID="ID_71655960" MODIFIED="1560938613212" TEXT="label"/>
<node CREATED="1560938614356" ID="ID_294668699" MODIFIED="1560938617951" TEXT="subsystem"/>
<node CREATED="1560938619858" ID="ID_1122884536" MODIFIED="1560938621100" TEXT="value"/>
<node CREATED="1560938622339" ID="ID_1670430981" MODIFIED="1560938625988" TEXT="device"/>
<node CREATED="1560938627714" ID="ID_39047023" MODIFIED="1560938631047" TEXT="edge"/>
<node CREATED="1560938634835" ID="ID_1722407419" MODIFIED="1560938635853" TEXT="power"/>
<node CREATED="1560938637034" ID="ID_556148807" MODIFIED="1560938640093" TEXT="uevent"/>
</node>
</node>
<node CREATED="1561307055978" ID="ID_927449308" MODIFIED="1561717682842" POSITION="right" TEXT="implements gpio controller">
<node CREATED="1561945296002" HGAP="89" ID="ID_583434716" MODIFIED="1561990892485" TEXT="Hardware GPIO" VSHIFT="-144">
<node CREATED="1561945325328" ID="ID_1834119438" MODIFIED="1561990902688" TEXT="What&apos;s GPIO"/>
<node CREATED="1561945334748" ID="ID_398029763" MODIFIED="1561990925957" TEXT="Function"/>
<node CREATED="1561945349820" ID="ID_1844234547" MODIFIED="1561990942156" TEXT="Register to configure active mode"/>
</node>
<node COLOR="#3333ff" CREATED="1561623530206" HGAP="111" ID="ID_1869230850" MODIFIED="1561993410918" TEXT="struct gpio_chip" VSHIFT="-321">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1560929847664" HGAP="18" ID="ID_1426297825" MODIFIED="1560932011025" TEXT="call back" VSHIFT="-78">
<node CREATED="1560931959314" ID="ID_1350363087" MODIFIED="1561992322312" TEXT="int&#x9;&#x9;&#x9;(*request)(struct gpio_chip *chip, unsigned offset);"/>
<node CREATED="1560931964437" ID="ID_844568444" MODIFIED="1561992426915" TEXT="void&#x9;&#x9;(*free)(struct gpio_chip *chip, unsigned offset);"/>
<node CREATED="1560931969931" ID="ID_1625164140" MODIFIED="1561992440483" TEXT="int&#x9;&#x9;&#x9;(*get_direction)(struct gpio_chip *chip, unsigned offset);"/>
<node CREATED="1560931976092" ID="ID_1647731123" MODIFIED="1561992448194" TEXT="int&#x9;&#x9;&#x9;(*direction_input)(struct gpio_chip *chip, unsigned offset);"/>
<node CREATED="1560931981282" ID="ID_898622241" MODIFIED="1561992456909" TEXT="int&#x9;&#x9;&#x9;(*direction_output)(struct gpio_chip *chip, unsigned offset, int value);"/>
<node CREATED="1560931988202" ID="ID_1734158958" MODIFIED="1561992464187" TEXT="int&#x9;&#x9;&#x9;(*get)(struct gpio_chip *chip, unsigned offset);"/>
<node CREATED="1560931993930" ID="ID_1015444752" MODIFIED="1561992473658" TEXT="int&#x9;&#x9;&#x9;(*get_multiple)(struct gpio_chip *chip, unsigned long *mask, unsigned long *bits);"/>
<node CREATED="1560931998430" ID="ID_1157779597" MODIFIED="1561992483183" TEXT="void&#x9;&#x9;(*set)(struct gpio_chip *chip, unsigned offset, int value);"/>
<node CREATED="1561992492044" ID="ID_1182368029" MODIFIED="1561992493060" TEXT="void&#x9;&#x9;(*set_multiple)(struct gpio_chip *chip, unsigned long *mask, unsigned long *bits);"/>
<node CREATED="1561992502261" ID="ID_516395580" MODIFIED="1561992503323" TEXT="int&#x9;&#x9;&#x9;(*set_config)(struct gpio_chip *chip, unsigned offset, unsigned long config);"/>
<node CREATED="1561992511050" ID="ID_1626776518" MODIFIED="1561992512159" TEXT="int&#x9;&#x9;&#x9;(*to_irq)(struct gpio_chip *chip, unsigned offset);"/>
</node>
<node CREATED="1561338021418" HGAP="18" ID="ID_1824577282" MODIFIED="1561338044690" TEXT="struct gpio_device * gpiodev;" VSHIFT="-85">
<node CREATED="1561338061332" ID="ID_78082652" MODIFIED="1561338092761" TEXT="struct device  dev;"/>
<node CREATED="1561338143339" ID="ID_1379888907" MODIFIED="1561338192110" TEXT="struct gpio_chip  *chip;"/>
<node CREATED="1561338198549" ID="ID_2776138" MODIFIED="1561624486987" TEXT="struct gpio_desc        *descs;">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1561338253837" ID="ID_445102609" MODIFIED="1561338253837" TEXT="struct gpio_device        *gdev;"/>
<node CREATED="1561338261059" ID="ID_127944602" MODIFIED="1561338261059" TEXT="const char                *label;"/>
<node CREATED="1561338264091" ID="ID_1429989987" MODIFIED="1561338264091" TEXT="const char                *name;"/>
</node>
<node COLOR="#ff3333" CREATED="1561338224518" ID="ID_1664217013" MODIFIED="1561624483463" TEXT="void                        *data;">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561539062221" ID="ID_5462683" MODIFIED="1561540366796" TEXT="gpiochip_add_data(&amp;bank-&gt;chip, bank);">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561539101215" ID="ID_1718372783" MODIFIED="1561624477468" TEXT="gpiochip_get_data(chip);">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1561338214089" ID="ID_1619880437" MODIFIED="1561338214089" TEXT="struct list_head        list;"/>
</node>
<node CREATED="1561623609086" ID="ID_1686682307" MODIFIED="1561624498755" TEXT="API">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1561623618239" HGAP="21" ID="ID_895907142" MODIFIED="1561624226035" TEXT="static inline int gpiochip_irqchip_add (struct gpio_chip  *gpiochip,  struct irq_chip  *irqchip, unsigned  int  first_irq,  irq_flow_handler_t handler,  unsigned  int  type)" VSHIFT="7">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1561623974426" HGAP="70" ID="ID_562151926" MODIFIED="1561992296947" TEXT="struct irq_chip" VSHIFT="-5">
<node CREATED="1560924884684" HGAP="18" ID="ID_648102410" MODIFIED="1561945408281" TEXT="callbacks" VSHIFT="-66">
<node CREATED="1560924989363" ID="ID_1687148786" MODIFIED="1561993453217" TEXT="unsigned int&#x9;(*irq_startup)(struct irq_data *data);">
<node CREATED="1561945412718" ID="ID_1662391817" MODIFIED="1561945418936" TEXT="Enable interrupt"/>
</node>
<node CREATED="1560924995688" ID="ID_265251562" MODIFIED="1561993461890" TEXT="void&#x9;&#x9;(*irq_shutdown)(struct irq_data *data);">
<node CREATED="1561945439246" ID="ID_1738528860" MODIFIED="1561945451994" TEXT="disable interrupt"/>
<node CREATED="1561946829100" ID="ID_1589636922" MODIFIED="1561946834084" TEXT="clear flag bits"/>
</node>
<node CREATED="1560925000276" ID="ID_1857041279" MODIFIED="1560925001663" TEXT="omap_gpio_ack_irq">
<node CREATED="1561945916467" ID="ID_1820901101" MODIFIED="1561945917936" TEXT="This is the start of a new interrupt. Some controllers do not need this. Linux calls this function as soon as an interrupt is raised, far before it is serviced."/>
<node CREATED="1561946133342" ID="ID_491626408" MODIFIED="1561946158606" TEXT="Clear flag bit irq"/>
</node>
<node CREATED="1560925004261" ID="ID_1524903496" MODIFIED="1560925005239" TEXT="omap_gpio_mask_irq"/>
<node CREATED="1560925007717" ID="ID_29731200" MODIFIED="1560925008583" TEXT="omap_gpio_unmask_irq"/>
<node CREATED="1560925013772" ID="ID_30575300" MODIFIED="1560925014983" TEXT="omap_gpio_irq_type"/>
<node CREATED="1560925017700" ID="ID_1809130551" MODIFIED="1560925018583" TEXT="omap_gpio_wake_enable"/>
<node CREATED="1560925021156" ID="ID_318832286" MODIFIED="1560925022391" TEXT="omap_gpio_irq_bus_lock">
<node CREATED="1561894260907" ID="ID_1309930970" MODIFIED="1561894271129" TEXT="if this is first pin on bank"/>
<node CREATED="1561894259274" ID="ID_1182387360" MODIFIED="1561894259274" TEXT="pm_runtime_get_sync(bank-&gt;chip.parent);"/>
</node>
<node CREATED="1560925025004" ID="ID_1979863644" MODIFIED="1560925025926" TEXT="gpio_irq_bus_sync_unlock">
<node CREATED="1561894220345" ID="ID_1217961873" MODIFIED="1561894227270" TEXT=" If this is the last IRQ to be freed in the bank, disable the bank module."/>
<node CREATED="1561894206001" ID="ID_667820335" MODIFIED="1561894212638" TEXT="pm_runtime_put(bank-&gt;chip.parent);"/>
</node>
</node>
<node CREATED="1561624208155" ID="ID_96401084" MODIFIED="1561624495096" TEXT="API">
<font NAME="SansSerif" SIZE="12"/>
<node CREATED="1561624057723" HGAP="16" ID="ID_328206018" MODIFIED="1561716478907" TEXT="static int  gpiochip_irqchip_add ()" VSHIFT="-24">
<node CREATED="1561965468404" ID="ID_1349654445" MODIFIED="1561965481121" TEXT="gpiochip-&gt;irqchip = irqchip;"/>
<node CREATED="1561965485465" ID="ID_644999683" MODIFIED="1561965486542" TEXT="gpiochip-&gt;irq_handler = handler;"/>
<node CREATED="1561965490850" ID="ID_538845647" MODIFIED="1561965491850" TEXT="gpiochip-&gt;to_irq = gpiochip_to_irq;"/>
<node CREATED="1561965522495" ID="ID_1089675865" MODIFIED="1561965541504" TEXT="gpiochip-&gt;irqdomain  =  irq_domain_add_simple(of_node, gpiochip-&gt;ngpio, first_irq, &amp;gpiochip_domain_ops, gpiochip);">
<node CREATED="1561965561453" ID="ID_542640857" MODIFIED="1561965590243" TEXT="Allocates an irq_domain, and optionally if first_irq is positive then also allocate irq_descs and  map all of the hwirqs to virqs starting at first_irq."/>
<node CREATED="1561965614207" ID="ID_1363197407" MODIFIED="1561965615410" TEXT="map all of the hwirqs to virqs starting at first_irq."/>
<node CREATED="1561965597838" ID="ID_1874883643" MODIFIED="1561965598932" TEXT="If device tree is used, then first_irq will be 0 and irqs get mapped dynamically on the fly."/>
<node CREATED="1561968193056" ID="ID_1628410364" MODIFIED="1561968274909" TEXT="Each bank will creates one irq_domain then add to a irq_domain_list">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1561623966686" HGAP="18" ID="ID_1248576284" MODIFIED="1561969315128" TEXT="gpiochip_set_chained_irqchip(&amp;bank-&gt;chip, irqc, bank-&gt;irq, NULL);" VSHIFT="24">
<node CREATED="1561968299758" ID="ID_1184167795" MODIFIED="1561969371501" TEXT="gpiochip_set_chained_irqchip(*gpiochip, *irqchip,  parent_irq, parent_handler)">
<node CREATED="1561969223190" ID="ID_744948253" MODIFIED="1561969275572" TEXT="/* Set the parent IRQ for all affected IRQs */ &#xa;for (offset = 0; offset &lt; gpiochip-&gt;ngpio; offset++) { &#xa;&#x9;if (!gpiochip_irqchip_irq_valid(gpiochip, offset))&#xa;&#x9;&#x9;continue; &#x9;&#xa;&#x9;irq_set_parent(irq_find_mapping(gpiochip-&gt;irqdomain, offset), parent_irq);&#xa;}"/>
</node>
</node>
</node>
</node>
<node CREATED="1561716138637" HGAP="35" ID="ID_616457868" MODIFIED="1561990681953" TEXT="sysfs" VSHIFT="114">
<node CREATED="1561716172330" ID="ID_996261968" MODIFIED="1561993836514" TEXT="export">
<node CREATED="1561890661477" ID="ID_1941564511" MODIFIED="1561890726662" TEXT="SyS_write -&gt; kernfs_fop_write -&gt; export_store">
<node CREATED="1561890680767" ID="ID_1498483399" MODIFIED="1561890689171" TEXT="gpiod_request -&gt; __gpiod_request">
<node CREATED="1561890691128" ID="ID_1522326226" MODIFIED="1561893725767" TEXT="my_gpio_request (enable_gpio_module)">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561890699618" ID="ID_115735483" MODIFIED="1561893726299" TEXT="my_gpio_get_direction">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1561890727109" ID="ID_737182689" MODIFIED="1561893712862" TEXT="gpiod_export -&gt; device_add -&gt; sysfs_create_groups -&gt; gpiod_to_irq -&gt; irq_create_mapping -&gt;  irq_domain_associate ">
<node CREATED="1561891319414" HGAP="13" ID="ID_1260107253" MODIFIED="1561893797876" TEXT=" gpiochip_irq_map  -&gt; __irq_set_handler" VSHIFT="-3">
<node CREATED="1561891420958" ID="ID_1652478597" MODIFIED="1561893740896" TEXT="__irq_get_desc_lock -&gt; omap_gpio_irq_bus_lock">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561891460367" ID="ID_1716067178" MODIFIED="1561893740250" TEXT="__irq_do_set_handler -&gt; omap_gpio_ack_irq">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561891465581" ID="ID_1272187244" MODIFIED="1561893739654" TEXT="__irq_push_desc_lock -&gt; gpio_irq_bus_sync_unlock">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
<node CREATED="1561716177318" ID="ID_11454138" MODIFIED="1561993837368" TEXT="unexport">
<node CREATED="1561893255218" ID="ID_220010904" MODIFIED="1561893291857" TEXT="SyS_write -&gt; unexport_store -&gt; gpiod_free">
<node CREATED="1561893265842" HGAP="40" ID="ID_507904704" MODIFIED="1561893786413" TEXT=" omap_gpio_free" VSHIFT="1">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1561716184746" HGAP="26" ID="ID_505398415" MODIFIED="1561993838416" TEXT="value">
<node CREATED="1561893298628" HGAP="32" ID="ID_597777777" MODIFIED="1561893770780" TEXT="SyS_read -&gt; kernfs_fop_read -&gt; dev_attr_show">
<node CREATED="1561893304302" ID="ID_908970645" MODIFIED="1561893728012" TEXT="omap_gpio_get">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1561893625016" HGAP="32" ID="ID_1651752081" MODIFIED="1561893778797" TEXT="SyS_write " VSHIFT="7">
<node CREATED="1561893751939" HGAP="220" ID="ID_1966552882" MODIFIED="1561893760892" TEXT="omap_gpio_set" VSHIFT="-1">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1561716188299" ID="ID_960466768" MODIFIED="1561893435545" TEXT="edge">
<node CREATED="1561893311896" ID="ID_451754072" MODIFIED="1561893313286" TEXT="SyS_write -&gt; edge_store">
<node CREATED="1561893321557" ID="ID_1295029611" MODIFIED="1561893322921" TEXT="gpio_sysfs_request_irq">
<node CREATED="1561893344684" ID="ID_1031822994" MODIFIED="1561893729352" TEXT="omap_gpio_get_direction">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node COLOR="#ff3300" CREATED="1561893357229" ID="ID_868812276" MODIFIED="1561894290101" TEXT="__setup_irq">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
<node CREATED="1561893359195" ID="ID_1272149728" MODIFIED="1561894301765" TEXT="omap_gpio_irq_bus_lock">
<font NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561893369011" ID="ID_210547536" MODIFIED="1561893730375" TEXT="omap_gpio_get_direction">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561893375079" ID="ID_278420381" MODIFIED="1561893730859" TEXT="omap_gpio_irq_type">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561893381663" ID="ID_1707674071" MODIFIED="1561893731810" TEXT="omap_gpio_irq_startup -&gt; omap_gpio_unmask_irq">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561893387612" ID="ID_33148485" MODIFIED="1561894302889" TEXT="gpio_irq_bus_sync_unlock">
<font NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
<node CREATED="1561893334737" ID="ID_1677464793" MODIFIED="1561893336096" TEXT="gpio_sysfs_free_irq">
<node CREATED="1561893394706" ID="ID_658977635" MODIFIED="1561893733566" TEXT="omap_gpio_irq_bus_lock">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561893400516" ID="ID_1423659867" MODIFIED="1561893734031" TEXT="omap_gpio_irq_shutdown -&gt; disable_gpio_module">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561893407839" ID="ID_1457415999" MODIFIED="1561893734542" TEXT="gpio_irq_bus_sync_unlock">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
</node>
<node CREATED="1561718122933" ID="ID_910858994" MODIFIED="1561718125058" TEXT="direction">
<node CREATED="1561893430272" ID="ID_204726902" MODIFIED="1561893490603" TEXT="SyS_write -&gt; kernfs_fop_write -&gt; dev_attr_store -&gt; direction_store">
<node CREATED="1561893468210" HGAP="17" ID="ID_1929915119" MODIFIED="1561893527967" TEXT="__gpiod_direction_output_raw" VSHIFT="-17">
<node CREATED="1561893506047" ID="ID_1045830580" MODIFIED="1561893735201" TEXT=" omap_gpio_set_config">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
<node CREATED="1561893510364" ID="ID_930396179" MODIFIED="1561893735789" TEXT="omap_gpio_output">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
<node CREATED="1561893490605" ID="ID_1805220223" MODIFIED="1561893736907" TEXT="gpiod_direction_input -&gt;omap_gpio_input">
<font BOLD="true" NAME="SansSerif" SIZE="12"/>
</node>
</node>
</node>
</node>
</node>
</node>
</map>
