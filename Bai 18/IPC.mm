<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1568270630179" ID="ID_485691438" MODIFIED="1568270637647" TEXT="Kernel IPC">
<node CREATED="1568359613104" ID="ID_1074333751" MODIFIED="1568359735526" POSITION="right" TEXT="Introduction">
<node CREATED="1568359649271" ID="ID_1011648344" MODIFIED="1568359730476" TEXT="Linux h&#x1ed7; tr&#x1ee3; c&#x1a1; ch&#x1ebf; IPC cho ph&#xe9;p giao ti&#x1ebf;p 2 ho&#x1eb7;c nhi&#x1ec1;u process v&#x1edb;i nhau. IPC c&#xf3; r&#x1ea5;t nhi&#x1ec1;u API, tuy nhi&#xea;n ch&#x1ec9; 1 s&#x1ed1; API c&#xf3; th&#x1ec3; s&#x1eed; d&#x1ee5;ng &#x111;&#x1ec3; giao ti&#x1ebf;p gi&#x1eef;a user-space v&#xe0; kernel space"/>
</node>
<node CREATED="1568270639089" ID="ID_873624490" MODIFIED="1568270645750" POSITION="right" TEXT="share memory">
<node CREATED="1568360144079" ID="ID_512501366" MODIFIED="1568360182741" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568360147871" ID="ID_1334072937" MODIFIED="1568360218313" TEXT="Driver v&#xe0; application chia s&#x1ebb; chung nhau 1 v&#xf9;ng memory. D&#x1eef; li&#x1ec7;u &#x111;&#x1b0;&#x1ee3;c &#x111;&#x1ecd;c ghi th&#xf4;ng qua memory."/>
</node>
<node CREATED="1568273638857" ID="ID_1679577625" MODIFIED="1568273641334" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568273609666" ID="ID_307241088" MODIFIED="1568273630158" TEXT="C&#xf3; th&#x1ec3; chia s&#x1ebb; &#x111;&#x1b0;&#x1ee3;c c&#xe1;c lo&#x1ea1;i d&#x1eef; li&#x1ec7;u ph&#x1ee9;c t&#x1ea1;p."/>
<node CREATED="1568274485841" ID="ID_1184737501" MODIFIED="1568274490438" TEXT="&#x110;&#x1ed9; tr&#x1ec5; th&#x1ea5;p"/>
</node>
<node CREATED="1568273645361" ID="ID_1106035412" MODIFIED="1568273648438" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568273649305" ID="ID_803458525" MODIFIED="1568273662630" TEXT="Kh&#xf4;ng c&#xf3; c&#x1a1; ch&#x1ebf; b&#x1ea3;o v&#x1ec7; d&#x1eef; li&#x1ec7;u khi b&#x1ecb; truy c&#x1ead;p &#x111;&#x1ed3;ng th&#x1edd;i"/>
<node CREATED="1568273715833" ID="ID_242869716" MODIFIED="1568274483286" TEXT="Ch&#x1ec9; h&#x1ed7; tr&#x1ee3; c&#x1a1; ch&#x1ebf; polling"/>
<node CREATED="1568273759128" ID="ID_1854876262" MODIFIED="1568273796398" TEXT="C&#x1ea3; 2 ph&#xed;a, application v&#xe0; kernel ph&#x1ea3;i ch&#x1ee7; &#x111;&#x1ed9;ng polling &#x111;&#x1ec3; l&#x1ea5;y data."/>
</node>
<node CREATED="1568273984897" ID="ID_287949557" MODIFIED="1568273987054" TEXT="Sample code">
<node CREATED="1568367752386" ID="ID_853292183" MODIFIED="1568367753334" TEXT="https://github.com/cirosantilli/linux-kernel-module-cheat/blob/8d668d6ed3617cc47425e1413513a2d1f99a25fd/kernel_module/user/mmap.c"/>
<node CREATED="1568367762521" ID="ID_1053794862" MODIFIED="1568367762998" TEXT="https://github.com/cirosantilli/linux-kernel-module-cheat/blob/8d668d6ed3617cc47425e1413513a2d1f99a25fd/kernel_module/mmap.c"/>
</node>
</node>
<node CREATED="1568270999714" ID="ID_8104140" MODIFIED="1568271002942" POSITION="right" TEXT="signal">
<node CREATED="1568360315952" ID="ID_1180120541" MODIFIED="1568360319044" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568360327559" ID="ID_752952803" MODIFIED="1568360347868" TEXT="Application v&#xe0; driver giao ti&#x1ebf;p v&#x1edb;i nhau th&#xf4;ng qua c&#x1a1; ch&#x1ebf; g&#x1eed;i nh&#x1ead;n signal"/>
</node>
<node CREATED="1568273799033" ID="ID_514566290" MODIFIED="1568273801622" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568273802345" ID="ID_607450453" MODIFIED="1568273809758" TEXT="Implement &#x111;&#x1a1;n gi&#x1ea3;n"/>
<node CREATED="1568273811017" ID="ID_354354836" MODIFIED="1568273830390" TEXT="H&#x1ed7; tr&#x1ee3; c&#x1a1; ch&#x1ebf; interrupt, delay th&#x1ea5;p"/>
<node CREATED="1568273843793" ID="ID_1783577541" MODIFIED="1568273862038" TEXT="C&#xf3; th&#x1ec3; &#x111;&#xed;nh k&#xe8;m data &#x111;&#x1ec3; truy&#x1ec1;n v&#xe0; nh&#x1ead;n nh&#x1eef;ng lo&#x1ea1;i data ph&#x1ee9;c t&#x1ea1;p"/>
</node>
<node CREATED="1568273863241" ID="ID_1632822685" MODIFIED="1568273866749" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568273867161" ID="ID_425328550" MODIFIED="1568273881854" TEXT="Ch&#x1ec9; h&#x1ed7; tr&#x1ee3; 1 chi&#x1ec1;u t&#x1eeb; kernel l&#xea;n user-space"/>
<node CREATED="1568273883657" ID="ID_927605464" MODIFIED="1568273905462" TEXT="C&#x1ea7;n PID &#x111;&#x1ec3; g&#x1eed;i, &#x111;&#xf4;i khi driver start tr&#x1b0;&#x1edb;c khi process &#x111;&#x1b0;&#x1ee3;c kh&#x1edf;i t&#x1ea1;o"/>
<node CREATED="1568273908657" ID="ID_1552088780" MODIFIED="1568273925254" TEXT="Ch&#x1ec9; h&#x1ed7; tr&#x1ee3; 1 v&#xe0;i lo&#x1ea1;i user-define signal"/>
</node>
<node CREATED="1568273989273" ID="ID_1357804528" MODIFIED="1568273991302" TEXT="Sample code">
<node CREATED="1568368120762" ID="ID_367512699" MODIFIED="1568368121422" TEXT="http://yongbingchen.github.io/blog/2013/03/11/sending-a-signal-from-linux-kernel/"/>
</node>
</node>
<node CREATED="1568271009689" ID="ID_415513236" MODIFIED="1568271016278" POSITION="right" TEXT="user-space helper API">
<node CREATED="1568274251162" ID="ID_1270825071" MODIFIED="1568274259046" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568274259809" ID="ID_1347718176" MODIFIED="1568274285870" TEXT="C&#xf3; th&#x1ec3; s&#x1eed; d&#x1ee5;ng 1 s&#x1ed1; h&#xe0;m c&#x1ee7;a kernel &#x111;&#x1ec3; run 1 process t&#x1eeb; kernel"/>
</node>
<node CREATED="1568273946889" ID="ID_164251805" MODIFIED="1568360407540" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568273951569" ID="ID_1945234494" MODIFIED="1568273957590" TEXT="C&#xf3; th&#x1ec3; s&#x1eed; d&#x1ee5;ng &#x111;&#x1ec3; start process"/>
<node CREATED="1568273959169" ID="ID_10043182" MODIFIED="1568273973630" TEXT="Data truy&#x1ec1;n theo d&#x1ea1;ng argument c&#x1ee7;a h&#xe0;m main"/>
</node>
<node CREATED="1568274004777" ID="ID_211155619" MODIFIED="1568274008238" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568274009729" ID="ID_1414933645" MODIFIED="1568274030511" TEXT="C&#xf3; th&#x1ec3; start 1 process m&#x1edb;i khi programme &#x111;&#xf3; &#x111;&#xe3; &#x111;&#x1b0;&#x1ee3;c ch&#x1ea1;y r&#x1ed3;i"/>
<node CREATED="1568274031145" ID="ID_346738781" MODIFIED="1568274047918" TEXT="C&#xf3; th&#x1ec3; start process tr&#x1b0;&#x1edb;c khi h&#x1ec7; th&#x1ed1;ng process &#x111;&#x1b0;&#x1ee3;c kh&#x1edf;i t&#x1ea1;o ho&#xe0;n ch&#x1ec9;nh"/>
<node CREATED="1568274051401" ID="ID_189595815" MODIFIED="1568274063038" TEXT="Kh&#xf4;ng h&#x1ed7; tr&#x1ee3; truy&#x1ec1;n data c&#xf3; c&#x1ea5;u tr&#xfa;c ph&#x1ee9;c t&#x1ea1;p"/>
</node>
<node CREATED="1568274867353" ID="ID_137280303" MODIFIED="1568274870230" TEXT="Sample code">
<node CREATED="1568368215849" ID="ID_4426923" MODIFIED="1568368216366" TEXT="https://insujang.github.io/2017-05-10/usermode-helper-api/"/>
</node>
</node>
<node CREATED="1568271606834" ID="ID_858716400" MODIFIED="1568271607326" POSITION="right" TEXT="Procfs, Sysfs, and Similar Kernel Interfaces">
<node CREATED="1568270679761" ID="ID_1659228801" MODIFIED="1568270683638" TEXT="Proc file system">
<node CREATED="1568274322465" ID="ID_988651256" MODIFIED="1568274325238" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568274309393" ID="ID_1010086684" MODIFIED="1568274319278" TEXT="T&#x1ea1;o ra 1 file trong th&#x1b0; m&#x1ee5;c /proc"/>
<node CREATED="1568274369985" ID="ID_47139045" MODIFIED="1568274387109" TEXT="Implement c&#xe1;c h&#xe0;m &#x111;&#x1ecd;c ghi cho file &#x111;&#xf3;. Giao ti&#x1ebf;p gi&#x1ed1;ng nh&#x1b0; giao ti&#x1ebf;p qua device file"/>
</node>
<node CREATED="1568274390577" ID="ID_841491934" MODIFIED="1568274393318" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568274394025" ID="ID_641359118" MODIFIED="1568274419405" TEXT="H&#x1ed7; tr&#x1ee3; user l&#x1ea5;y th&#xf4;ng tin b&#x1eb1;ng command line, shell script"/>
</node>
<node CREATED="1568274421161" ID="ID_292702392" MODIFIED="1568274424214" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568274425249" ID="ID_386231161" MODIFIED="1568274457038" TEXT="Ch&#x1ec9; h&#x1ed7; tr&#x1ee3; truy&#x1ec1;n data theo d&#x1ea1;ng string"/>
<node CREATED="1568274468761" ID="ID_1866031913" MODIFIED="1568274475734" TEXT="&#x110;&#x1ed9; tr&#x1ec5; cao"/>
</node>
<node CREATED="1568275685825" ID="ID_1308543547" MODIFIED="1568275687942" TEXT="Sample code">
<node CREATED="1568368313187" ID="ID_498368229" MODIFIED="1568368313574" TEXT="https://linux.die.net/lkmpg/x769.html"/>
</node>
</node>
<node CREATED="1568270683889" ID="ID_408243076" MODIFIED="1568270687886" TEXT="Sys file system">
<node CREATED="1568274604393" ID="ID_1942559362" MODIFIED="1568274608038" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568274309393" ID="ID_1294411890" MODIFIED="1568274658806" TEXT="T&#x1ea1;o ra 1 folder trong th&#x1b0; m&#x1ee5;c /proc"/>
<node CREATED="1568274369985" ID="ID_1188138486" MODIFIED="1568274387109" TEXT="Implement c&#xe1;c h&#xe0;m &#x111;&#x1ecd;c ghi cho file &#x111;&#xf3;. Giao ti&#x1ebf;p gi&#x1ed1;ng nh&#x1b0; giao ti&#x1ebf;p qua device file"/>
</node>
<node CREATED="1568274860265" ID="ID_222427670" MODIFIED="1568274864310" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568274843209" ID="ID_33473299" MODIFIED="1568274854870" TEXT="Ra &#x111;&#x1edd;i sau v&#xe0; c&#xf3; nhi&#x1ec1;u &#x1b0;u &#x111;i&#x1ec3;m h&#x1a1;n procfs"/>
<node CREATED="1568274885826" ID="ID_1816373646" MODIFIED="1568274886238" TEXT="H&#x1ed7; tr&#x1ee3; user l&#x1ea5;y th&#xf4;ng tin b&#x1eb1;ng command line, shell script"/>
</node>
<node CREATED="1568274421161" ID="ID_1129713014" MODIFIED="1568361162340" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568274425249" ID="ID_511884493" MODIFIED="1568274457038" TEXT="Ch&#x1ec9; h&#x1ed7; tr&#x1ee3; truy&#x1ec1;n data theo d&#x1ea1;ng string"/>
<node CREATED="1568274468761" ID="ID_584248944" MODIFIED="1568274475734" TEXT="&#x110;&#x1ed9; tr&#x1ec5; cao"/>
</node>
<node CREATED="1568275689585" ID="ID_553418128" MODIFIED="1568275691438" TEXT="Sample code">
<node CREATED="1568368290248" ID="ID_1049664150" MODIFIED="1568368290693" TEXT="http://pradheepshrinivasan.github.io/2015/07/02/Creating-an-simple-sysfs/"/>
</node>
</node>
</node>
<node CREATED="1568271627441" ID="ID_1323807387" MODIFIED="1568361321591" POSITION="right" TEXT="Socket base">
<node CREATED="1568271631921" ID="ID_368845472" MODIFIED="1568271646222" TEXT="UDP socket">
<node CREATED="1568275679938" ID="ID_295147441" MODIFIED="1568275683358" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568275692745" ID="ID_1731891862" MODIFIED="1568275738542" TEXT="Kernel v&#xe0; application giao ti&#x1ebf;p v&#x1edb;i nhau th&#xf4;ng qua socket"/>
</node>
<node CREATED="1568275825777" ID="ID_62611476" MODIFIED="1568275828398" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568275829641" ID="ID_1249166771" MODIFIED="1568275851126" TEXT="&#x110;&#x1b0;&#x1ee3;c kernel &#x111;&#x1ea3;m b&#x1ea3;o s&#x1ef1; &#x111;&#x1ed3;ng b&#x1ed9; khi truy c&#x1ead;p &#x111;&#x1ed3;ng th&#x1edd;i"/>
</node>
<node CREATED="1568275856313" ID="ID_1722695978" MODIFIED="1568275859350" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568275859993" ID="ID_1307022760" MODIFIED="1568275868990" TEXT="T&#x1ed1;c &#x111;&#x1ed9; ch&#x1ead;m"/>
</node>
<node CREATED="1568368351577" ID="ID_1975733658" MODIFIED="1568368369774" TEXT="Sample code">
<node CREATED="1568368363497" ID="ID_803716025" MODIFIED="1568368364134" TEXT="https://kernelnewbies.org/Simple_UDP_Server"/>
</node>
</node>
<node CREATED="1568271646753" ID="ID_1962960074" MODIFIED="1568271648710" TEXT="Netlink">
<node CREATED="1568356708632" ID="ID_809306145" MODIFIED="1568356711988" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568356713079" ID="ID_626367906" MODIFIED="1568356735580" TEXT="T&#x1ea1;o ra 1 k&#xea;nh truy&#x1ec1;n g&#x1ecd;i l&#xe0; bus. C&#xe1;c application ho&#x1eb7;c kernel s&#x1ebd; &#x111;&#x103;ng k&#xfd; l&#x1eaf;ng nghe v&#xe0;o bus &#x111;&#xf3;"/>
<node CREATED="1568356736479" ID="ID_548978313" MODIFIED="1568356755252" TEXT="Cho ph&#xe9;p truy&#x1ec3;n theo 2 ch&#x1ebf; &#x111;&#x1ed9; unicast ho&#x1eb7;c broad cast"/>
</node>
<node CREATED="1568356936872" ID="ID_1340241108" MODIFIED="1568356940004" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568356990447" ID="ID_1080657893" MODIFIED="1568356991020" TEXT="Cho ph&#xe9;p truy&#x1ec3;n theo 2 ch&#x1ebf; &#x111;&#x1ed9; unicast ho&#x1eb7;c broad cast"/>
</node>
<node CREATED="1568357000343" ID="ID_1486693122" MODIFIED="1568357005244" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568357006575" ID="ID_542789870" MODIFIED="1568357015476" TEXT="Kh&#xf4;ng th&#x1ec3; chuy&#x1ec1;n theo ki&#x1ec3;u b&#x1ecb; &#x111;&#x1ed9;ng"/>
<node CREATED="1568357018551" ID="ID_267190601" MODIFIED="1568357023972" TEXT="Implement ph&#x1ee9;c t&#x1ea1;p"/>
<node CREATED="1568357024551" ID="ID_59327099" MODIFIED="1568357026004" TEXT="Ch&#x1ead;m"/>
</node>
<node CREATED="1568368503362" ID="ID_125236300" MODIFIED="1568368505230" TEXT="Sample">
<node CREATED="1568368505945" ID="ID_1308734818" MODIFIED="1568368506454" TEXT="https://www.linuxjournal.com/article/7356"/>
<node CREATED="1568368515025" ID="ID_1947580044" MODIFIED="1568368516462" TEXT="https://people.netfilter.org/pablo/netlink/netlink-libmnl-manual.pdf"/>
</node>
</node>
</node>
<node CREATED="1568271664033" ID="ID_367864033" MODIFIED="1568362084603" POSITION="right" TEXT="Device file">
<node CREATED="1568357059222" ID="ID_627892852" MODIFIED="1568357063124" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568357064055" ID="ID_1316732430" MODIFIED="1568357072740" TEXT="T&#x1ea1;o ra 1 file trong folder /dev"/>
<node CREATED="1568357072999" ID="ID_356579514" MODIFIED="1568357084284" TEXT="Giao ti&#x1ebf;p v&#x1edb;i kernel th&#xf4;ng qua c&#xe1;c operation c&#x1ee7;a file &#x111;&#xf3;"/>
</node>
<node CREATED="1568357086655" ID="ID_493563749" MODIFIED="1568357088979" TEXT="&#x1af;u &#x111;i&#x1ec3;m">
<node CREATED="1568357089727" ID="ID_297596071" MODIFIED="1568357102772" TEXT="&#x110;&#x1b0;&#x1ee3;c kernel hi&#x1ec3;u nh&#x1b0; 1 lo&#x1ea1;i thi&#x1ebf;t b&#x1ecb; trong h&#x1ec7; th&#x1ed1;ng"/>
<node CREATED="1568357103351" ID="ID_1547721510" MODIFIED="1568357123332" TEXT="C&#xf3; th&#x1ec3; t&#xed;ch h&#x1ee3;p theo chu&#x1ea9;n c&#x1ee7;a OS"/>
</node>
<node CREATED="1568357124671" ID="ID_1429139150" MODIFIED="1568357129308" TEXT="Nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m">
<node CREATED="1568357131271" ID="ID_1203181800" MODIFIED="1568357134780" TEXT="Ch&#x1ead;m"/>
<node CREATED="1568357135511" ID="ID_1845996811" MODIFIED="1568357144060" TEXT="Kh&#xf4;ng truy&#x1ec1;n &#x111;&#x1b0;&#x1ee3;c data theo d&#x1ea1;ng con tr&#x1ecf;"/>
</node>
<node CREATED="1568359166447" ID="ID_575220348" MODIFIED="1568359169108" TEXT="Example"/>
</node>
<node CREATED="1568362085404" ID="ID_713001365" MODIFIED="1568362086089" POSITION="right" TEXT="Notification Chains">
<node CREATED="1568362091678" ID="ID_795518657" MODIFIED="1568362094251" TEXT="Gi&#x1edb;i thi&#x1ec7;u">
<node CREATED="1568362095216" ID="ID_794578563" MODIFIED="1568362108242" TEXT="Ch&#x1ec9; s&#x1eed; d&#x1ee5;ng &#x111;&#x1ec3; giao ti&#x1ebf;p trong kernel"/>
<node CREATED="1568362113223" ID="ID_1349062635" MODIFIED="1568362158837" TEXT="T&#x1ea1;o ra 1 k&#xea;nh truy&#x1ec1;n trong kernel, b&#x1ea5;t c&#x1ee9; ai quan t&#xe2;m &#x111;&#x1ec1;u c&#xf3; th&#x1ec3; &#x111;&#x103;ng k&#xfd; 1 call back function l&#x1eaf;ng nghe v&#xe0;o channel &#x111;&#xf3;"/>
<node CREATED="1568362175608" ID="ID_562203804" MODIFIED="1568362226226" TEXT="C&#xe1;c s&#x1ef1; ki&#x1ec7;n nh&#x1b0; cpu up/down, network up/down &#x111;&#x1ec1;u &#x111;&#x1b0;&#x1ee3;c th&#xf4;ng b&#xe1;o qua channel ri&#xea;ng"/>
</node>
<node CREATED="1568367793129" ID="ID_1597750499" MODIFIED="1568367795942" TEXT="Sample code">
<node CREATED="1568367800025" ID="ID_441289459" MODIFIED="1568367801006" TEXT="https://0xax.gitbooks.io/linux-insides/Concepts/linux-cpu-4.html"/>
</node>
</node>
</node>
</map>
