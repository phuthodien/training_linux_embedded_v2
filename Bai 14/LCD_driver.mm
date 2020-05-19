<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1567479202244" ID="ID_1386414256" MODIFIED="1567484054600" TEXT="SPI driver">
<node CREATED="1567484056846" ID="ID_93227354" MODIFIED="1567755607134" POSITION="right" TEXT="Agenda">
<node CREATED="1567755611672" ID="ID_867265209" MODIFIED="1567755619653" TEXT="Protocol basic template"/>
<node CREATED="1567755748057" ID="ID_1490559391" MODIFIED="1567755757117" TEXT="LCD driver architecture"/>
<node CREATED="1567755761608" ID="ID_866285933" MODIFIED="1567755770309" TEXT="LCD driver implementation"/>
</node>
<node CREATED="1567665823939" ID="ID_7898222" MODIFIED="1567665832080" POSITION="right" TEXT="Protocol basic template">
<node CREATED="1567665835547" ID="ID_976359292" MODIFIED="1567665905048" TEXT="Basic functions">
<node CREATED="1567665969907" ID="ID_739695101" MODIFIED="1567666001904" TEXT="C&#xe1;c function nh&#x1b0; init, probe, irq handler,... c&#xf3; m&#x1eb7;t trong h&#x1ea7;u h&#x1ebf;t c&#xe1;c driver"/>
</node>
<node CREATED="1567665905859" ID="ID_1722863729" MODIFIED="1567665912977" TEXT="Specific functions">
<node CREATED="1567666003353" ID="ID_764479106" MODIFIED="1567666050919" TEXT="C&#xe1;c function &#x111;&#x1eb7;c bi&#x1ec7;t ch&#x1ec9; s&#x1eed; d&#x1ee5;ng &#x111;&#x1b0;&#x1ee3;c theo t&#x1eeb;ng lo&#x1ea1;i device. V&#xed; d&#x1ee5; watchdog c&#xf3; set time out, ethernet c&#xf3; set Mac address"/>
<node CREATED="1567666373707" ID="ID_1880328252" MODIFIED="1567666400744" TEXT="C&#xe1;c function code theo d&#x1ea1;ng vi &#x111;i&#x1ec1;u khi&#x1ec3;n &#x111;&#x1ec3; thao t&#xe1;c v&#x1edb;i thanh ghi"/>
</node>
<node CREATED="1567665913363" ID="ID_1414004539" MODIFIED="1567666074272" TEXT="Tips and trick">
<node CREATED="1567666075579" ID="ID_653339685" MODIFIED="1567666102672" TEXT="T&#x1ead;p trung ch&#x1ee7; y&#x1ebf;u &#x1edf; c&#xe1;ch design struct private data c&#x1ee7;a device"/>
</node>
</node>
<node CREATED="1567569373650" ID="ID_1614786136" MODIFIED="1567665581612" POSITION="right" TEXT="LCD driver template">
<node CREATED="1567666562525" ID="ID_1283206871" MODIFIED="1567666578432" TEXT="LCD driver &#x111;&#x1b0;&#x1ee3;c thi&#x1ebf;t k&#x1ebf; d&#x1ef1;a tr&#xea;n template c&#x1ee7;a character driver">
<node CREATED="1567665601843" ID="ID_968434838" MODIFIED="1567665606504" TEXT="module_init"/>
<node CREATED="1567665606824" ID="ID_682616708" MODIFIED="1567665610472" TEXT="module_exit"/>
<node CREATED="1567665625443" ID="ID_160621301" MODIFIED="1567665629896" TEXT="probe function"/>
<node CREATED="1567665654539" ID="ID_392985185" MODIFIED="1567665664728" TEXT="character file operation"/>
<node CREATED="1567665692211" ID="ID_861318407" MODIFIED="1567665700208" TEXT="LCD library"/>
<node CREATED="1567666609419" ID="ID_1542996850" MODIFIED="1567666610639" TEXT="struct nokia_5110"/>
</node>
</node>
<node CREATED="1567569355390" ID="ID_1367629789" MODIFIED="1567569369350" POSITION="right" TEXT="LCD driver architecture"/>
<node CREATED="1567666792595" ID="ID_1873825724" MODIFIED="1567666795335" POSITION="right" TEXT="Basic functions">
<node CREATED="1567484234123" ID="ID_1972841642" MODIFIED="1567484247000" TEXT="module_init">
<node CREATED="1567484494308" ID="ID_1197683559" MODIFIED="1567484514848" TEXT="alloc major and minor number"/>
<node CREATED="1567484517235" ID="ID_1769175834" MODIFIED="1567484522744" TEXT="register driver"/>
</node>
<node CREATED="1567484248403" ID="ID_777463804" MODIFIED="1567484254640" TEXT="module_exit">
<node CREATED="1567484526372" ID="ID_1761932091" MODIFIED="1567484533696" TEXT="free major and minor number"/>
<node CREATED="1567484534035" ID="ID_208548612" MODIFIED="1567484540280" TEXT="unregister driver"/>
</node>
</node>
<node CREATED="1567667226952" ID="ID_630715247" MODIFIED="1567667227821" POSITION="right" TEXT="Tips and trick">
<node CREATED="1567667233890" ID="ID_623019464" MODIFIED="1567667234207" TEXT="struct nokia_5110">
<node CREATED="1567667273039" ID="ID_1342592497" MODIFIED="1567667304540" TEXT="Ch&#x1ee9;a th&#xf4;ng tin ri&#xea;ng cho t&#x1eeb;ng device file"/>
<node CREATED="1567667305943" ID="ID_807593679" MODIFIED="1567667327159" TEXT="C&#xe1;c tr&#x1b0;&#x1edd;ng th&#xf4;ng tin trong struct &#x111;&#x1b0;&#x1ee3;c define t&#x1ef1; do, ph&#x1ee5; thu&#x1ed9;c v&#xe0;o &#xfd; &#x111;&#x1ed3; c&#x1ee7;a ng&#x1b0;&#x1edd;i l&#x1ead;p tr&#xec;nh"/>
</node>
</node>
<node CREATED="1567665384011" ID="ID_445805451" MODIFIED="1567667005896" POSITION="right" TEXT="Basic functions">
<node CREATED="1567667155057" ID="ID_747113971" MODIFIED="1567667156920" TEXT="probe function">
<node CREATED="1567667521512" ID="ID_953794340" MODIFIED="1567667537406" TEXT="Get th&#xf4;ng tin t&#x1eeb; device tree &#x111;i&#x1ec1;n v&#xe0;o struct private data"/>
<node CREATED="1567667539651" ID="ID_1598998854" MODIFIED="1567667543919" TEXT="&#x110;&#x103;ng k&#xfd; ng&#x1eaf;t"/>
<node CREATED="1567667544308" ID="ID_395937964" MODIFIED="1567667549905" TEXT="T&#x1ea1;o device file"/>
<node CREATED="1567667551108" ID="ID_1428892768" MODIFIED="1567667561029" TEXT="G&#xe1;n private data cho device file"/>
</node>
</node>
<node CREATED="1567667595350" ID="ID_1432299898" MODIFIED="1567667864822" POSITION="right" TEXT="Specific functions">
<node CREATED="1567667606321" ID="ID_177574515" MODIFIED="1567667608437" TEXT="character file operation">
<node CREATED="1567667615475" ID="ID_1780861695" MODIFIED="1567667719637" TEXT="Kernel &#x111;&#x1ecb;nh ngh&#x129;a s&#x1eb5;n t&#x1eeb;ng struct operation cho m&#x1ed7;i lo&#x1ea1;i device file"/>
<node CREATED="1567667719960" ID="ID_610296241" MODIFIED="1567667776544" TEXT="Ch&#xfa;ng ta c&#x1ea7;n l&#x1ef1;a ch&#x1ecd;n lo&#x1ea1;i function n&#xe0;o mu&#x1ed1;n x&#x1eed; l&#xfd; v&#xe0; t&#x1ef1; implement"/>
</node>
</node>
<node CREATED="1567668075754" ID="ID_1170242642" MODIFIED="1567668076302" POSITION="right" TEXT="Specific functions">
<node CREATED="1567668083466" ID="ID_283364014" MODIFIED="1567668084079" TEXT="C&#xe1;c function d&#xf9;ng &#x111;&#x1ec3; thao t&#xe1;c v&#x1edb;i LCD">
<node CREATED="1567668087490" ID="ID_651144882" MODIFIED="1567668097470" TEXT="LCD_DrawLine"/>
<node CREATED="1567668097962" ID="ID_1578613691" MODIFIED="1567668109399" TEXT="LCD_DrawRectangle"/>
<node CREATED="1567668109706" ID="ID_1663052886" MODIFIED="1567668116831" TEXT="Do driver SPI controller &#x111;&#x1b0;&#x1ee3;c design m&#x1ed9;t c&#xe1;ch t&#x1ed5;ng qu&#xe1;t cho t&#x1ea5;t c&#x1ea3; c&#xe1;c lo&#x1ea1;i thi&#x1ebf;t b&#x1ecb; giao ti&#x1ebf;p qua chu&#x1ea9;n SPI. Do &#x111;&#xf3; trong SPI controller kh&#xf4;ng h&#x1ed7; tr&#x1ee3; c&#xe1;c h&#xe0;m thao t&#xe1;c ri&#xea;ng v&#x1edb;i LCD. N&#x1ebf;u ch&#xfa;ng ta t&#xed;ch h&#x1ee3;p LCD v&#xe0;o h&#x1ec7; th&#x1ed1;ng th&#xec; ph&#x1ea3;i t&#x1ef1; implement c&#xe1;c h&#xe0;m thao t&#xe1;c v&#x1edb;i LCD th&#xf4;ng qua m&#xf4; t&#x1ea3; ph&#x1ea7;n c&#x1ee9;ng c&#x1ee7;a n&#xf3;"/>
</node>
</node>
</node>
</map>
