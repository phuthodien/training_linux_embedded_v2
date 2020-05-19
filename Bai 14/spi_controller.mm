<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1567668303227" ID="ID_299280420" MODIFIED="1567675430191" TEXT="SPI controller">
<node CREATED="1567479202244" ID="ID_1386414256" MODIFIED="1567675434007" POSITION="right" TEXT="SPI controller">
<node CREATED="1567755805359" ID="ID_1470596483" MODIFIED="1567755807725" TEXT="Agenda">
<node CREATED="1567756002305" ID="ID_848218833" MODIFIED="1567756002813" TEXT="Controller basic template"/>
<node CREATED="1567756013408" ID="ID_341876596" MODIFIED="1567756029925" TEXT="SPI controller driver implementation"/>
<node CREATED="1567756010312" ID="ID_1322459056" MODIFIED="1567758141661" TEXT="SPI controller specific functions"/>
</node>
<node CREATED="1567665823939" ID="ID_7898222" MODIFIED="1567675454239" TEXT="Controller basic template">
<node CREATED="1567665835547" ID="ID_976359292" MODIFIED="1567665905048" TEXT="Basic functions">
<node CREATED="1567665969907" ID="ID_739695101" MODIFIED="1567666001904" TEXT="C&#xe1;c function nh&#x1b0; init, probe, irq handler,... c&#xf3; m&#x1eb7;t trong h&#x1ea7;u h&#x1ebf;t c&#xe1;c driver"/>
</node>
<node CREATED="1567665905859" ID="ID_1722863729" MODIFIED="1567665912977" TEXT="Specific functions">
<node CREATED="1567666003353" ID="ID_764479106" MODIFIED="1567675537711" TEXT="Controller th&#xf4;ng th&#x1b0;&#x1edd;ng kh&#xf4;ng support device file operation. Thay v&#xe0;o &#x111;&#xf3; n&#xf3; support m&#x1ed9;t interface cho c&#xe1;c protocol s&#x1eed; d&#x1ee5;ng"/>
<node CREATED="1567666373707" ID="ID_1880328252" MODIFIED="1567666400744" TEXT="C&#xe1;c function code theo d&#x1ea1;ng vi &#x111;i&#x1ec1;u khi&#x1ec3;n &#x111;&#x1ec3; thao t&#xe1;c v&#x1edb;i thanh ghi"/>
</node>
<node CREATED="1567665913363" ID="ID_1414004539" MODIFIED="1567666074272" TEXT="Tips and trick">
<node CREATED="1567666075579" ID="ID_653339685" MODIFIED="1567666102672" TEXT="T&#x1ead;p trung ch&#x1ee7; y&#x1ebf;u &#x1edf; c&#xe1;ch design struct private data c&#x1ee7;a device"/>
</node>
</node>
<node CREATED="1567569373650" ID="ID_1614786136" MODIFIED="1567675563791" TEXT="SPI controller driver template">
<node CREATED="1567666562525" ID="ID_1283206871" MODIFIED="1567675856640" TEXT="Kernel cung c&#x1ea5;p struct spi_master &#x111;&#x1ec3; &#x111;&#x1ea1;i di&#x1ec7;n SPI controller. Nhi&#x1ec7;m v&#x1ee5; c&#x1ee7;a driver ph&#x1ea3;i &#x111;i&#x1ec1;n &#x111;&#x1ea7;y &#x111;&#x1ee7; th&#xf4;ng tin cho struct n&#xe0;y">
<node CREATED="1567665601843" ID="ID_968434838" MODIFIED="1567665606504" TEXT="module_init"/>
<node CREATED="1567665606824" ID="ID_682616708" MODIFIED="1567665610472" TEXT="module_exit"/>
<node CREATED="1567665625443" ID="ID_160621301" MODIFIED="1567665629896" TEXT="probe function"/>
<node CREATED="1567665654539" ID="ID_392985185" MODIFIED="1567675873807" TEXT="struct spi_master operation"/>
<node CREATED="1567665692211" ID="ID_861318407" MODIFIED="1567675900903" TEXT="SPI hardware library"/>
<node CREATED="1567666609419" ID="ID_1542996850" MODIFIED="1567676553344" TEXT="struct omap2_mcspi_platform_config"/>
</node>
</node>
<node CREATED="1567666792595" ID="ID_1873825724" MODIFIED="1567666795335" TEXT="Basic functions">
<node CREATED="1567484234123" ID="ID_1972841642" MODIFIED="1567484247000" TEXT="module_init">
<node CREATED="1567484517235" ID="ID_1769175834" MODIFIED="1567484522744" TEXT="register driver"/>
</node>
<node CREATED="1567484248403" ID="ID_777463804" MODIFIED="1567484254640" TEXT="module_exit">
<node CREATED="1567484534035" ID="ID_208548612" MODIFIED="1567484540280" TEXT="unregister driver"/>
</node>
</node>
<node CREATED="1567667226952" ID="ID_630715247" MODIFIED="1567667227821" TEXT="Tips and trick">
<node CREATED="1567667233890" ID="ID_623019464" MODIFIED="1567676703510" TEXT="struct omap2_mcspi_platform_config">
<node CREATED="1567667273039" ID="ID_1342592497" MODIFIED="1567667304540" TEXT="Ch&#x1ee9;a th&#xf4;ng tin ri&#xea;ng cho t&#x1eeb;ng device file"/>
<node CREATED="1567667305943" ID="ID_807593679" MODIFIED="1567667327159" TEXT="C&#xe1;c tr&#x1b0;&#x1edd;ng th&#xf4;ng tin trong struct &#x111;&#x1b0;&#x1ee3;c define t&#x1ef1; do, ph&#x1ee5; thu&#x1ed9;c v&#xe0;o &#xfd; &#x111;&#x1ed3; c&#x1ee7;a ng&#x1b0;&#x1edd;i l&#x1ead;p tr&#xec;nh"/>
</node>
</node>
<node CREATED="1567665384011" ID="ID_445805451" MODIFIED="1567667005896" TEXT="Basic functions">
<node CREATED="1567667155057" ID="ID_747113971" MODIFIED="1567667156920" TEXT="probe function">
<node CREATED="1567667521512" ID="ID_953794340" MODIFIED="1567667537406" TEXT="Get th&#xf4;ng tin t&#x1eeb; device tree &#x111;i&#x1ec1;n v&#xe0;o struct private data"/>
<node CREATED="1567677225355" ID="ID_1158560795" MODIFIED="1567677236167" TEXT="C&#x1ea5;p ph&#xe1;t b&#x1ed9; nh&#x1edb;"/>
<node CREATED="1567677237810" ID="ID_641296819" MODIFIED="1567677249911" TEXT="Config ph&#x1ea7;n c&#x1ee9;ng"/>
<node CREATED="1567667539651" ID="ID_1598998854" MODIFIED="1567667543919" TEXT="&#x110;&#x103;ng k&#xfd; ng&#x1eaf;t"/>
<node CREATED="1567667544308" ID="ID_395937964" MODIFIED="1567677206998" TEXT="&#x110;i&#x1ec1;n th&#xf4;ng tin cho struct spi_master"/>
<node CREATED="1567667551108" ID="ID_1428892768" MODIFIED="1567667561029" TEXT="G&#xe1;n private data cho device file"/>
</node>
</node>
<node CREATED="1567667595350" ID="ID_1432299898" MODIFIED="1567667864822" TEXT="Specific functions">
<node CREATED="1567667606321" ID="ID_177574515" MODIFIED="1567677300959" TEXT="C&#xe1;c function ph&#x1ee5;c v&#x1ee5; cho spi.h">
<node CREATED="1567667615475" ID="ID_1780861695" MODIFIED="1567667719637" TEXT="Kernel &#x111;&#x1ecb;nh ngh&#x129;a s&#x1eb5;n t&#x1eeb;ng struct operation cho m&#x1ed7;i lo&#x1ea1;i device file"/>
<node CREATED="1567667719960" ID="ID_610296241" MODIFIED="1567667776544" TEXT="Ch&#xfa;ng ta c&#x1ea7;n l&#x1ef1;a ch&#x1ecd;n lo&#x1ea1;i function n&#xe0;o mu&#x1ed1;n x&#x1eed; l&#xfd; v&#xe0; t&#x1ef1; implement"/>
</node>
</node>
<node CREATED="1567668075754" ID="ID_1170242642" MODIFIED="1567668076302" TEXT="Specific functions">
<node CREATED="1567668083466" ID="ID_283364014" MODIFIED="1567752000895" TEXT="C&#xe1;c private function chuy&#xea;n d&#xf9;ng v&#x1edb;i &#x111;&#x1eb7;c t&#x1ea3; ph&#x1ea7;n c&#x1ee9;ng">
<node CREATED="1567668087490" ID="ID_651144882" MODIFIED="1567752008797" TEXT="Kh&#xf4;ng public v&#x1edb;i kernel"/>
<node CREATED="1567668097962" ID="ID_1578613691" MODIFIED="1567752046133" TEXT="D&#xf9;ng n&#x1ed9;i b&#x1ed9; trong driver, chuy&#xea;n d&#xf9;ng v&#x1edb;i &#x111;&#x1eb7;c &#x111;i&#x1ec3;m c&#x1ee7;a t&#x1eeb;ng lo&#x1ea1;i hardware">
<node CREATED="1567752073792" ID="ID_109249967" MODIFIED="1567752075501" TEXT="mcspi_write_chconf0"/>
</node>
</node>
</node>
<node CREATED="1567752659225" ID="ID_746577654" MODIFIED="1567752672821" TEXT="C&#xe1;c th&#xf4;ng tin cung c&#x1ea5;p cho spi.h">
<node CREATED="1567752685673" ID="ID_852386188" MODIFIED="1567752686053" TEXT="mode_bits"/>
<node CREATED="1567752691576" ID="ID_1354618029" MODIFIED="1567752691956" TEXT="bits_per_word_mask"/>
<node CREATED="1567752708512" ID="ID_1135039083" MODIFIED="1567752708941" TEXT="auto_runtime_pm"/>
<node CREATED="1567752723561" ID="ID_1920024620" MODIFIED="1567752723917" TEXT="max_speed_hz"/>
<node CREATED="1567752724336" ID="ID_1153934913" MODIFIED="1567752729181" TEXT="min_speed_hz"/>
</node>
<node CREATED="1567752595305" ID="ID_880531314" MODIFIED="1567752606045" TEXT="C&#xe1;c functions ph&#x1ee5;c v&#x1ee5; cho spi.h">
<node CREATED="1567753288809" ID="ID_1082765619" MODIFIED="1567753289165" TEXT="omap2_mcspi_setup"/>
<node CREATED="1567753294041" ID="ID_507045610" MODIFIED="1567753294517" TEXT="omap2_mcspi_prepare_message"/>
<node CREATED="1567753301936" ID="ID_1642646997" MODIFIED="1567753302268" TEXT="omap2_mcspi_can_dma"/>
<node CREATED="1567753306200" ID="ID_696845982" MODIFIED="1567753306533" TEXT="omap2_mcspi_cleanup"/>
</node>
</node>
</node>
</map>
