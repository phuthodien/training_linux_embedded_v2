<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1576728347321" ID="ID_883705416" MODIFIED="1576728355850" TEXT="Uboot">
<node CREATED="1576728447320" ID="ID_37065946" MODIFIED="1576728454179" POSITION="right" TEXT="Introduction">
<node CREATED="1576728455144" ID="ID_1958497179" MODIFIED="1576728553387" TEXT="Ng&#xe0;y nay c&#xe1;c h&#x1ec7; th&#x1ed1;ng m&#xe1;y t&#xed;nh mong mu&#x1ed1;n m&#x1ed9;t ph&#x1b0;&#x1a1;ng ph&#xe1;p load OS linh &#x111;&#x1ed9;ng. M&#xe1;y t&#xed;nh c&#xf3; th&#x1ec3; load OS t&#x1eeb; &#x1ed5; c&#x1ee9;ng, internet. Ngo&#xe0;i ra h&#x1ecd; mong mu&#x1ed1;n c&#xf3; th&#x1ec3; load OS v&#x1edb;i c&#xe1;c thi&#x1ebf;t l&#x1ead;p kh&#xe1;c nhau."/>
<node CREATED="1576728559271" ID="ID_1041141904" MODIFIED="1576728609189" TEXT="Boot loader ra &#x111;&#x1edd;i. Boot loader c&#xf3; nhi&#x1ec1;u lo&#x1ea1;i, trong &#x111;&#xf3; uboot l&#xe0; bootloader ph&#x1ed5; bi&#x1ebf;n cho c&#xe1;c h&#x1ec7; th&#x1ed1;ng embedded."/>
</node>
<node CREATED="1576728666346" ID="ID_242877598" MODIFIED="1576728673102" POSITION="right" TEXT="C&#xe1;c t&#xed;nh n&#x103;ng c&#x1a1; b&#x1ea3;n">
<node CREATED="1576728673883" ID="ID_396335790" MODIFIED="1576728731766" TEXT="Uboot cung c&#x1ea5;p cho user giao di&#x1ec7;n command line. T&#x1eeb; &#x111;&#xf3; user c&#xf3; th&#x1ec3; xem v&#xe0; c&#x1ea5;u h&#xec;nh c&#xe1;c th&#xf4;ng s&#x1ed1; ph&#x1ee5;c v&#x1ee5; vi&#x1ec7;c boot h&#x1ec7; &#x111;i&#x1ec1;u h&#xe0;nh."/>
</node>
<node CREATED="1576728752684" ID="ID_1080821650" MODIFIED="1576728766414" POSITION="right" TEXT="Command line v&#x1ec1; bi&#x1ebf;n m&#xf4;i tr&#x1b0;&#x1edd;ng">
<node CREATED="1576728768603" ID="ID_1509142346" MODIFIED="1576728780815" TEXT="Gi&#x1ed1;ng nh&#x1b0; Linux, uboot c&#x169;ng c&#xf3; c&#xe1;c bi&#x1ebf;n m&#xf4;i tr&#x1b0;&#x1edd;ng."/>
<node CREATED="1576728849708" ID="ID_1259460307" MODIFIED="1576728882495" TEXT="B&#x1ea3;n ch&#x1ea5;t c&#xe1;c bi&#x1ebf;n m&#xf4;i tr&#x1b0;&#x1edd;ng l&#xe0; 1 m&#x1ea3;ng c&#xe1;c string trong uboot."/>
<node CREATED="1576728882893" ID="ID_238409117" MODIFIED="1576728897887" TEXT="Gi&#xe1; tr&#x1ecb; c&#x1ee7;a c&#xe1;c bi&#x1ebf;n &#x111;&#x1b0;&#x1ee3;c x&#xe2;y d&#x1ef1;ng theo 3 c&#xe1;ch">
<node CREATED="1576728898803" ID="ID_264985618" MODIFIED="1576728909649" TEXT="Set value trong l&#xfa;c build"/>
<node CREATED="1576728910459" ID="ID_778884492" MODIFIED="1576728919088" TEXT="Set value v&#xe0;o MMC"/>
<node CREATED="1576728919572" ID="ID_1444485139" MODIFIED="1576728925440" TEXT="Set value trong l&#xfa;c runtime"/>
</node>
</node>
<node CREATED="1576729315562" ID="ID_695930074" MODIFIED="1576729319516" POSITION="right" TEXT="Uboot flow">
<node CREATED="1576736421308" ID="ID_1637416832" MODIFIED="1576736426973" TEXT="Start.S">
<node CREATED="1576736429275" ID="ID_912415566" MODIFIED="1576736448635" TEXT="Ch&#x1ee9;a c&#xe1;c &#x111;o&#x1ea1;n code assembly &#x111;&#x1ea7;u ti&#xea;n &#x111;&#x1b0;&#x1ee3;c ch&#x1ea1;y b&#x1edf;i uboot"/>
<node CREATED="1576736517995" ID="ID_1670191308" MODIFIED="1576736531509" TEXT="Kh&#x1edf;i t&#x1ea1;o cpu v&#xe0; memory &#x1edf; m&#x1ee9;c &#x111;&#x1ed9; &#x111;&#x1a1;n gi&#x1ea3;n"/>
<node CREATED="1576736531779" ID="ID_721520025" MODIFIED="1576736545581" TEXT="Kh&#x1edf;i t&#x1ea1;o serial"/>
<node CREATED="1576737928439" ID="ID_531320222" MODIFIED="1576737939198" TEXT="jump to _main() function"/>
</node>
<node CREATED="1576738045951" ID="ID_244141197" MODIFIED="1576738503167" TEXT="board_init_f">
<node CREATED="1576738048566" ID="ID_1844556880" MODIFIED="1576738059465" TEXT="Vi&#x1ebf;t b&#x1edf;i c&#xe1;c h&#xe3;ng chip"/>
<node CREATED="1576738059940" ID="ID_803960969" MODIFIED="1576738076352" TEXT="Kh&#x1edf;i t&#x1ea1;o ram v&#xe0; 1 v&#xe0;i peripheral"/>
</node>
<node CREATED="1576738504227" ID="ID_1269570462" MODIFIED="1576740347620" TEXT="init_sequence_r">
<node CREATED="1576740366064" ID="ID_397182261" MODIFIED="1576740366741" TEXT="common/board_r.c"/>
</node>
<node CREATED="1576740438049" ID="ID_214584599" MODIFIED="1576740438669" TEXT="run_main_loop"/>
<node CREATED="1576740603207" ID="ID_823219851" MODIFIED="1576740604231" TEXT="main_loop">
<node CREATED="1576740612692" ID="ID_1845388172" MODIFIED="1576740613311" TEXT="common/main.c"/>
<node CREATED="1576741443599" ID="ID_1589922140" MODIFIED="1576741470586" TEXT="Kh&#x1edf;i t&#x1ea1;o ra c&#xe1;c command line v&#xe0; environment sau &#x111;&#xf3; s&#x1ebd; d&#x1eeb;ng l&#x1ea1;i &#x1edf; d&#x1ea5;u nh&#x1eaf;c l&#x1ec7;nh c&#x1ee7;a console"/>
</node>
<node CREATED="1576741582497" ID="ID_480676281" MODIFIED="1576741683357" TEXT="do_bootm">
<node CREATED="1576741584488" ID="ID_1092675708" MODIFIED="1576741599636" TEXT="cmd/bootm.c"/>
<node CREATED="1576741600160" ID="ID_125227313" MODIFIED="1576741618540" TEXT="&#x110;&#x1ecd;c kernel image t&#x1eeb; th&#x1ebb; nh&#x1edb; v&#xe0; load v&#xe0;o ram"/>
<node CREATED="1576741627799" ID="ID_1079008750" MODIFIED="1576741635572" TEXT="&#x110;&#x1ecd;c dtb t&#x1eeb; th&#x1ebb; nh&#x1edb; v&#xe0; load v&#xe0;o ram"/>
</node>
</node>
<node CREATED="1576825363231" ID="ID_1156293095" MODIFIED="1576825379921" POSITION="right" TEXT="uboot architecture"/>
</node>
</map>
