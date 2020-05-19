<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1544149943896" ID="ID_913547495" MODIFIED="1544149949684" TEXT="Signal">
<node CREATED="1544151168588" ID="ID_1395598820" MODIFIED="1544151171136" POSITION="right" TEXT="Agenda">
<node CREATED="1544167475180" ID="ID_1842914989" MODIFIED="1544167476049" TEXT="T&#x1ed5;ng quan v&#x1ec1; signal"/>
<node CREATED="1544167480884" ID="ID_1031028567" MODIFIED="1544167481982" TEXT="X&#x1eed; l&#xfd; khi nh&#x1ead;n signal"/>
<node CREATED="1544167486555" ID="ID_532169634" MODIFIED="1544167487685" TEXT="Signal table"/>
<node CREATED="1544167496363" ID="ID_935503042" MODIFIED="1544167496913" TEXT="M&#x1ed9;t s&#x1ed1; signal c&#x1a1; b&#x1ea3;n"/>
<node CREATED="1544167513492" ID="ID_1503403640" MODIFIED="1544167514209" TEXT="Send signal"/>
<node CREATED="1544167531948" ID="ID_1529473089" MODIFIED="1544167534689" TEXT="Th&#x1ef1;c h&#xe0;nh"/>
</node>
<node CREATED="1544151926787" ID="ID_388502268" MODIFIED="1544167469671" POSITION="right" TEXT="T&#x1ed5;ng quan v&#x1ec1; signal">
<node CREATED="1544152028691" ID="ID_1696876856" MODIFIED="1544167853895" TEXT="L&#xe0; software interrupt">
<node CREATED="1544156011833" ID="ID_1864072591" MODIFIED="1559016156710" TEXT="Process x&#x1eed; l&#xfd; n&#xf3; gi&#x1ed1;ng nh&#x1b0; interrupt. M&#x1ed7;i khi nh&#x1ead;n &#x111;&#x1b0;&#x1ee3;c signal, process s&#x1ebd; save gi&#xe1; tr&#x1ecb; c&#xe1;c thanh ghi trong CPU v&#xe0;o stack v&#xe0; nh&#x1ea3;y v&#xe0;o h&#xe0;m x&#x1eed; l&#xfd; signal. Sau khi ho&#xe0;n th&#xe0;nh x&#x1eed; l&#xfd; signal, process s&#x1ebd; load c&#xe1;c gi&#xe1; tr&#x1ecb; t&#x1eeb; stack v&#xe0;o CPU v&#xe0; ti&#x1ebf;p t&#x1ee5;c c&#xf4;ng vi&#x1ec7;c l&#xfa;c tr&#x1b0;&#x1edb;c."/>
</node>
<node CREATED="1544152039570" ID="ID_42848359" MODIFIED="1544152056888" TEXT="L&#xe0; ph&#x1b0;&#x1a1;ng ph&#xe1;p giao ti&#x1ebf;p ph&#x1ed5; bi&#x1ebf;n nh&#x1ea5;t gi&#x1eef;a c&#xe1;c app">
<node CREATED="1559016173704" ID="ID_182569173" MODIFIED="1559016230391" TEXT="Tr&#xea;n t&#x1ea7;ng user-space vi&#x1ec7;c s&#x1eed; d&#x1ee5;ng signal ti&#x1ec7;n l&#x1ee3;i h&#x1a1;n c&#xe1;c ph&#x1b0;&#x1a1;ng ph&#xe1;p IPC kh&#xe1;c. V&#xed; d&#x1ee5; nh&#x1b0; c&#xf3; th&#x1ec3; g&#x1eed;i signal th&#xf4;ng qua command line, shell script, vi&#x1ec7;c implement signal handler b&#x1eb1;ng code C c&#x169;ng &#x111;&#x1a1;n gi&#x1ea3;n."/>
</node>
<node CREATED="1544152592349" ID="ID_859413559" MODIFIED="1544152618975" TEXT="Kh&#xf4;ng th&#x1ec3; l&#x1b0;&#x1edd;ng tr&#x1b0;&#x1edb;c &#x111;&#x1b0;&#x1ee3;c l&#xfa;c n&#xe0;o th&#xec; nh&#x1ead;n &#x111;&#x1b0;&#x1ee3;c signal"/>
<node CREATED="1544152091811" ID="ID_1281669954" MODIFIED="1559619172187" TEXT="C&#xf3; 32 gi&#xe1; tr&#x1ecb; kh&#xe1;c nhau, m&#x1ed7;i gi&#xe1; tr&#x1ecb; &#x111;&#x1b0;&#x1ee3;c g&#xe1;n 1 t&#xea;n ri&#xea;ng bi&#x1ec7;t">
<node CREATED="1559016240346" ID="ID_1455374883" MODIFIED="1559016265343" TEXT="link: http://man7.org/linux/man-pages/man7/signal.7.html"/>
</node>
</node>
<node CREATED="1544152416483" ID="ID_192807589" MODIFIED="1544167929015" POSITION="right" TEXT="C&#xe1;c tr&#x1b0;&#x1edd;ng h&#x1ee3;p x&#x1ea3;y ra signal">
<node CREATED="1544152441531" ID="ID_1655124665" MODIFIED="1544152449815" TEXT="User s&#x1eed; d&#x1ee5;ng kill command"/>
<node CREATED="1544152450554" ID="ID_381215010" MODIFIED="1544152463407" TEXT="Process g&#x1eed;i signal"/>
<node CREATED="1544152466067" ID="ID_1485098627" MODIFIED="1544152471575" TEXT="Ch&#x1b0;&#x1a1;ng tr&#xec;nh g&#x1eb7;p l&#x1ed7;i">
<node CREATED="1559016478082" ID="ID_1436235706" MODIFIED="1559016557520" TEXT="Khi ch&#x1b0;&#x1a1;ng tr&#xec;nh g&#x1eb7;p l&#x1ed7;i v&#xed; d&#x1ee5; nh&#x1b0; truy c&#x1ead;p v&#xe0;o con tr&#x1ecf; NULL, l&#xfa;c &#x111;&#xf3; OS s&#x1ebd; g&#x1eed;i SIGSEV signal &#x111;&#x1ebf;n cho ch&#x1b0;&#x1a1;ng tr&#xec;nh. H&#xe0;m signal hander c&#x1ee7;a signal n&#xe0;y s&#x1ebd; exit ch&#x1b0;&#x1a1;ng tr&#xec;nh. &#x110;&#xe2;y l&#xe0; k&#x1ebf;t qu&#x1ea3; m&#xe0; ch&#xfa;ng ta nh&#xec;n th&#x1ea5;y m&#x1ed7;i khi ch&#x1b0;&#x1a1;ng tr&#xec;nh truy c&#x1ead;p v&#xe0;o con tr&#x1ecf; NULL."/>
</node>
<node CREATED="1544152472674" ID="ID_1095228744" MODIFIED="1544152494608" TEXT="User &#x1ea5;n 1 s&#x1ed1; t&#x1ed5; h&#x1ee3;p ph&#xed;m &#x111;&#x1eb7;c bi&#x1ec7;t"/>
</node>
<node CREATED="1544152657531" ID="ID_1411667580" MODIFIED="1559027052269" POSITION="right" TEXT="Ph&#xe2;n lo&#x1ea1;i signal">
<node CREATED="1544152690347" ID="ID_1493892619" MODIFIED="1544152704615" TEXT="Signal c&#xf3; th&#x1ec3; ignore"/>
<node CREATED="1544152705659" ID="ID_635492921" MODIFIED="1544152711871" TEXT="Signal kh&#xf4;ng th&#x1ec3; ignore"/>
<node CREATED="1544152717074" ID="ID_1473636538" MODIFIED="1544153405696" TEXT="Signal c&#xf3; th&#x1ec3; ch&#x1ee7; &#x111;&#x1ed9;ng &#x111;i&#x1ec3;u khi&#x1ec3;n &#x111;&#x1b0;&#x1ee3;c"/>
<node CREATED="1544152727986" ID="ID_852090377" MODIFIED="1544153411479" TEXT="Signal kh&#xf4;ng th&#x1ec3; ch&#x1ee7; &#x111;&#x1ed9;ng &#x111;i&#x1ec1;u khi&#x1ec3;n &#x111;&#x1b0;&#x1ee3;c"/>
</node>
<node CREATED="1544154007104" ID="ID_1258532800" MODIFIED="1544154012029" POSITION="right" TEXT="Signal table">
<node CREATED="1544154110170" ID="ID_124699186" MODIFIED="1544154130165" TEXT="M&#x1ed7;i m&#x1ed9;t process s&#x1ebd; c&#xf3; 1 b&#x1ea3;ng signal table">
<node CREATED="1559025064906" ID="ID_315989907" MODIFIED="1559025392464" TEXT="M&#x1ed7;i process c&#xf3; 1 b&#x1ea3;ng signal table.  Trong &#x111;&#xf3; m&#x1ed7;i h&#xe0;ng c&#x1ee7;a b&#x1ea3;ng s&#x1ebd; ch&#x1ee9;a s&#x1ed1; hi&#x1ec7;u signal v&#xe0; con tr&#x1ecf; h&#xe0;m tr&#x1ecf; &#x111;&#x1ebf;n handler function c&#x1ee7;a signal &#x111;&#xf3;. M&#x1ed7;i khi c&#xf3; 1 signal g&#x1eed;i &#x111;&#x1ebf;n, OS s&#x1ebd; g&#x1ecd;i ra signal handler t&#x1b0;&#x1a1;ng &#x1ee9;ng."/>
<node CREATED="1559025469947" ID="ID_1198971521" MODIFIED="1559025537167" TEXT="Con tr&#x1ecf; tr&#x1ecf; &#x111;&#x1ebf;n signal table c&#x1ee7;a process c&#xf3; th&#x1ec3; xem t&#x1ea1;i struct task_struct-&gt;pending (include/linux/sched.h)"/>
</node>
<node CREATED="1544154130617" ID="ID_518062227" MODIFIED="1544154145413" TEXT="H&#x1ec7; th&#x1ed1;ng t&#x1ef1; t&#x1ea1;o ra b&#x1ea3;ng signal table khi kh&#x1edf;i t&#x1ea1;o process"/>
<node CREATED="1544154204033" ID="ID_305014538" MODIFIED="1544154239221" TEXT="Khi m&#x1edb;i &#x111;&#x1b0;&#x1ee3;c kh&#x1edf;i t&#x1ea1;o, t&#x1ea5;t c&#x1ea3; c&#xe1;c signal hander s&#x1ebd; l&#xe0; default handler"/>
</node>
<node CREATED="1559027039616" ID="ID_1379312552" MODIFIED="1559027046453" POSITION="right" TEXT="&#x110;&#x103;ng k&#xfd; signal handler">
<node CREATED="1544153649185" ID="ID_89655834" MODIFIED="1544153663846" TEXT="signal.h"/>
<node CREATED="1544153763259" ID="ID_1425794678" MODIFIED="1544153764608" TEXT="sighandler_t signal(int signum, sighandler_t handler)"/>
<node CREATED="1544153776061" ID="ID_1138069254" MODIFIED="1544153776625" TEXT="void sig_handler(int signo)"/>
</node>
<node CREATED="1544163720365" ID="ID_885364225" MODIFIED="1544163727913" POSITION="right" TEXT="Send signal">
<node CREATED="1544163741269" ID="ID_440237907" MODIFIED="1559027313421" TEXT="int kill(pid_t pid, int signo)">
<node CREATED="1544163793262" ID="ID_272572929" MODIFIED="1544163794721" TEXT="pid &gt; 0"/>
<node CREATED="1544163797157" ID="ID_763026858" MODIFIED="1559620620966" TEXT="pid  == 0"/>
<node CREATED="1544163802509" ID="ID_1330782705" MODIFIED="1544163805129" TEXT="pid &lt; 0"/>
<node CREATED="1544163806492" ID="ID_822029605" MODIFIED="1544163814056" TEXT="pid == -1"/>
</node>
<node CREATED="1544163752853" ID="ID_336805726" MODIFIED="1544163753641" TEXT="int raise(int signo)"/>
<node CREATED="1544163753956" ID="ID_1747502127" MODIFIED="1544163758145" TEXT="kill command"/>
<node CREATED="1544163864701" ID="ID_1472096620" MODIFIED="1544163876919" TEXT="Permission to send a signal">
<node CREATED="1559027459828" ID="ID_172036580" MODIFIED="1559027518190" TEXT="Khi g&#x1eed;i signal &#x111;&#x1eb7;c bi&#x1ec7;t v&#xed; d&#x1ee5; nh&#x1b0; SIGKILL &#x111;&#x1ebf;n process thu&#x1ed9;c user kh&#xe1;c th&#xec; ch&#x1b0;&#x1a1;ng tr&#xec;nh c&#x1ea7;n quy&#x1ec1;n root &#x111;&#x1ec3; l&#xe0;m vi&#x1ec7;c &#x111;&#xf3;"/>
</node>
</node>
<node CREATED="1544153348594" ID="ID_1483974973" MODIFIED="1544153359143" POSITION="right" TEXT="Th&#x1ef1;c h&#xe0;nh">
<node CREATED="1544153360067" ID="ID_454098215" MODIFIED="1544153388127" TEXT="Vi&#x1ebf;t 1 ch&#x1b0;&#x1a1;ng tr&#xec;nh C &#x111;&#x1ec3; in ch&#x1eef; hello world m&#x1ed7;i khi user nh&#x1ea5;n ph&#xed;m Ctrl + C"/>
<node CREATED="1544154811561" ID="ID_1187580114" MODIFIED="1544155897389" TEXT="Vi&#x1ebf;t 1 ch&#x1b0;&#x1a1;ng tr&#xec;nh C sleep v&#xf4; th&#x1edd;i h&#x1ea1;n, s&#x1eed; d&#x1ee5;ng 1 ch&#x1b0;&#x1a1;ng tr&#xec;nh C kh&#xe1;c g&#x1eed;i signal &#x111;&#x1ec3; wakeup ch&#x1b0;&#x1a1;ng tr&#xec;nh C &#x111;&#x1ea7;u ti&#xea;n l&#xea;n."/>
</node>
<node CREATED="1544153478531" ID="ID_969623836" MODIFIED="1544167491449" POSITION="right" TEXT="M&#x1ed9;t s&#x1ed1; signal c&#x1a1; b&#x1ea3;n">
<node CREATED="1544153504555" ID="ID_587017620" MODIFIED="1544153505119" TEXT="SIGCHLD"/>
<node CREATED="1544153527435" ID="ID_1198450904" MODIFIED="1544153528224" TEXT="SIGILL"/>
<node CREATED="1544153540557" ID="ID_681861745" MODIFIED="1544153541426" TEXT="SIGINT"/>
<node CREATED="1544153555943" ID="ID_653917245" MODIFIED="1544153556619" TEXT="SIGKILL"/>
<node CREATED="1544153803246" ID="ID_703580689" MODIFIED="1544153803653" TEXT="SIGSEGV"/>
</node>
<node CREATED="1544156402345" ID="ID_135133775" MODIFIED="1544156423413" POSITION="right" TEXT="Nh&#x1eef;ng function an to&#xe0;n khi g&#x1ecd;i trong signal handler">
<node CREATED="1544156425723" ID="ID_1712742796" MODIFIED="1559026773174" TEXT="Khi 1 signal handler &#x111;ang ch&#x1ea1;y, n&#x1ebf;u 1 signal kh&#xe1;c c&#xf3; &#x111;&#x1ed9; &#x1b0;u ti&#xea;n cao h&#x1a1;n g&#x1eed;i &#x111;&#x1ebf;n, OS s&#x1ebd; d&#x1eeb;ng handler hi&#x1ec7;n t&#x1ea1;i v&#xe0; th&#x1ef1;c hi&#x1ec7;n h&#xe0;m handler m&#x1edb;i. Tuy nhi&#xea;n OS s&#x1ebd; kh&#xf4;ng save stack c&#x1ee7;a handler hi&#x1ec7;n t&#x1ea1;i l&#x1ea1;i. Do &#x111;&#xf3; 1 s&#x1ed1; function s&#x1ebd; g&#xe2;y l&#x1ed7;i h&#x1ec7; th&#x1ed1;ng n&#x1ebf;u b&#x1ecb; ng&#x1eaf;t gi&#x1eef;a ch&#x1eeb;ng v&#xe0; kh&#xf4;ng &#x111;&#x1b0;&#x1ee3;c ho&#xe0;n th&#xe0;nh. V&#xed; d&#x1ee5; nh&#x1b0; h&#xe0;m malloc."/>
<node CREATED="1559026774194" ID="ID_945382900" MODIFIED="1559026849478" TEXT="Linux &#x111;&#xe3; li&#x1ec7;t k&#xea; 1 s&#x1ed1; function l&#xe0; an to&#xe0;n cho signal handler g&#x1ecd;i. C&#xe1;c function n&#xe0;y kh&#xf4;ng g&#xe2;y l&#x1ed7;i n&#x1ebf;u b&#x1ecb; stop gi&#x1eef;a ch&#x1eeb;ng. Ch&#xfa;ng &#x111;&#x1b0;&#x1ee3;c g&#x1ecd;i l&#xe0; Reentrant Functions.">
<node CREATED="1559026902483" ID="ID_1633101817" MODIFIED="1559026906351" TEXT="Link: http://man7.org/linux/man-pages/man7/signal-safety.7.html"/>
</node>
<node CREATED="1559621216244" ID="ID_1386091312" MODIFIED="1559621358257" TEXT="C&#xe1;c function li&#x1ec7;t k&#xea; trong b&#x1ea3;ng tr&#xea;n kh&#xf4;ng g&#xe2;y l&#x1ed7;i h&#x1ec7; th&#x1ed1;ng khi b&#x1ecb; stop gi&#x1eef;a ch&#x1eeb;ng nh&#x1b0;ng ch&#xfa;ng c&#x169;ng kh&#xf4;ng &#x111;&#x1ea3;m b&#x1ea3;o k&#x1ebf;t qu&#x1ea3; cu&#x1ed1;i c&#xf9;ng gi&#x1ed1;ng nh&#x1b0; expectation. "/>
</node>
<node CREATED="1559030255113" ID="ID_805842103" MODIFIED="1559030262398" POSITION="right" TEXT="Ignore a signal">
<node CREATED="1559030510122" ID="ID_1944967939" MODIFIED="1559030604686" TEXT="Sau khi ignore 1 signal number. M&#x1ed7;i khi signal &#x111;&#xf3; g&#x1eed;i &#x111;&#x1ebf;n, OS s&#x1ebd; throw n&#xf3; &#x111;i v&#xe0; ko g&#x1ecd;i ra signal handler"/>
<node CREATED="1559030605689" ID="ID_1150606058" MODIFIED="1559030624590" TEXT="C&#xe1;ch ignore 1 signal">
<node CREATED="1559030708481" ID="ID_1584121088" MODIFIED="1559030719062" TEXT="signal(singal_number, SIG_IGN);"/>
</node>
</node>
<node CREATED="1544152301114" ID="ID_1068322910" MODIFIED="1544152302783" POSITION="left" TEXT="Agenda">
<node CREATED="1544152303580" ID="ID_458579958" MODIFIED="1544152326327" TEXT="K&#x1ec3; v&#x1ec1; &#x1ee9;ng d&#x1ee5;ng c&#x1ee7;a signal trong d&#x1ef1; &#xe1;n tr&#x1b0;&#x1edb;c kia"/>
<node CREATED="1544152339194" ID="ID_1635440525" MODIFIED="1544152382280" TEXT="C&#xf3; nhi&#x1ec1;u l&#x1ed7;i x&#x1ea3;y ra li&#xea;n quan &#x111;&#x1ebf;n signal"/>
</node>
<node CREATED="1544152554347" ID="ID_101401306" MODIFIED="1544152555846" POSITION="left" TEXT="T&#x1ed5;ng quan v&#x1ec1; signal">
<node CREATED="1544152556747" ID="ID_231687838" MODIFIED="1544152575559" TEXT="Trong d&#x1ef1; &#xe1;n h&#x1ed3;i x&#x1b0;a t&#x1eeb;ng th&#x1eed; ignore kill signal nh&#x1b0;ng ko &#x111;&#x1b0;&#x1ee3;c"/>
</node>
<node CREATED="1544152781011" ID="ID_1561069040" MODIFIED="1544152782367" POSITION="left" TEXT="X&#x1eed; l&#xfd; v&#x1edb;i signal">
<node CREATED="1544152783315" ID="ID_1547478941" MODIFIED="1544152791791" TEXT="V&#xed; d&#x1ee5; code &#x111;&#x1ec3; x&#x1eed; l&#xfd; 1 signal"/>
<node CREATED="1544154366673" ID="ID_1653811301" MODIFIED="1544154383045" TEXT="K&#x1ec3; v&#x1ec1; bug li&#xea;n quan &#x111;&#x1ebf;n vi&#x1ec7;c b&#x1ea5;t &#x111;&#x1ed3;ng b&#x1ed9; khi s&#x1eed; d&#x1ee5;ng signal"/>
</node>
<node CREATED="1544156545112" ID="ID_1106484620" MODIFIED="1544156545829" POSITION="left" TEXT="Nh&#x1eef;ng function an to&#xe0;n khi g&#x1ecd;i trong signal handler">
<node CREATED="1544156548271" ID="ID_1928665789" MODIFIED="1544156557709" TEXT="Ch&#xe8;n th&#xea;m h&#xec;nh &#x1ea3;nh c&#xe1;c safe function"/>
</node>
<node CREATED="1544163492277" ID="ID_1450279294" MODIFIED="1559621616060" POSITION="right" TEXT="Block a signal">
<node CREATED="1544163589117" ID="ID_631348507" MODIFIED="1544163642345" TEXT="&#x110;&#xf4;i khi trong 1 th&#x1edd;i &#x111;i&#x1ec3;m, process kh&#xf4;ng mu&#x1ed1;n x&#x1eed; l&#xfd; 1 s&#x1ed1; signal n&#xe0;o &#x111;&#xf3;, n&#xf3; c&#xf3; th&#x1ec3; block signal &#x111;&#xf3;. Signal v&#x1eab;n &#x111;&#x1b0;&#x1ee3;c g&#x1eed;i &#x111;&#x1ebf;n cho process nh&#x1b0;ng s&#x1ebd; n&#x1eb1;m trong h&#xe0;ng ch&#x1edd;, ko &#x111;&#x1b0;&#x1ee3;c x&#x1eed; l&#xfd; ngay."/>
</node>
<node CREATED="1544164930043" ID="ID_335909046" MODIFIED="1544165714926" POSITION="right" TEXT="Initialize a sigset">
<node CREATED="1544165121161" ID="ID_339657008" MODIFIED="1544165121829" TEXT="int sigfillset(sigset_t *set)"/>
<node CREATED="1559632412413" ID="ID_1107391922" MODIFIED="1559632413280" TEXT="int sigemptyset(sigset_t *set);"/>
<node CREATED="1544164937500" ID="ID_318413493" MODIFIED="1544164944628" TEXT="int sigaddset(sigset_t *set, int signo)"/>
<node CREATED="1544165145520" ID="ID_1519656565" MODIFIED="1544165146332" TEXT="int sigdelset(sigset_t *set, int signo)"/>
</node>
<node CREATED="1544165715772" ID="ID_683806079" MODIFIED="1559632486082" POSITION="right" TEXT="Request to block, unblock a signal">
<node CREATED="1544165751043" ID="ID_1839612711" MODIFIED="1544165933223" TEXT=" int sigprocmask(int how, const sigset_t *set, sigset_t *oldset)"/>
<node CREATED="1544166057451" ID="ID_1179625098" MODIFIED="1544166058263" TEXT="SIG_BLOCK"/>
<node CREATED="1544166066555" ID="ID_689734924" MODIFIED="1544166067015" TEXT="SIG_UNBLOCK"/>
<node CREATED="1544166072235" ID="ID_1897970849" MODIFIED="1544166073302" TEXT="SIG_SETMASK"/>
<node CREATED="1544166076315" ID="ID_106552119" MODIFIED="1544166081687" TEXT="Th&#x1ef1;c h&#xe0;nh">
<node CREATED="1544166082531" ID="ID_392630826" MODIFIED="1544166112593" TEXT="Vi&#x1ebf;t 1 ch&#x1b0;&#x1a1;ng tr&#xec;nh C &#x111;&#x1ec3; unset ho&#x1eb7;c block Ctrl + C signal t&#x1eeb; user"/>
<node CREATED="1544166200900" ID="ID_527256449" MODIFIED="1544166234088" TEXT="Vi&#x1ebf;t 1 ch&#x1b0;&#x1a1;ng tr&#xec;nh C &#x111;&#x1ec3; in ra c&#xe1;c signal mask c&#x1ee7;a process hi&#x1ec7;n t&#x1ea1;i"/>
</node>
</node>
<node CREATED="1544166460757" ID="ID_518845664" MODIFIED="1559634914397" POSITION="right" TEXT="Ki&#x1ec3;m tra c&#xe1;c signal &#x111;ang b&#x1ecb; pending">
<node CREATED="1544166494172" ID="ID_173338449" MODIFIED="1544166494697" TEXT="int sigpending(sigset_t *set)"/>
<node CREATED="1544166592821" ID="ID_360611070" MODIFIED="1544166638129" TEXT="M&#x1ed9;t signal &#x111;ang b&#x1ecb; block th&#xec; kernel v&#x1eab;n g&#x1eed;i n&#xf3; &#x111;&#x1ebf;n cho process nh&#x1b0;ng signal &#x111;&#xf3; s&#x1ebd; b&#x1ecb; pending trong h&#xe0;ng &#x111;&#x1ee3;i m&#xe0; kh&#xf4;ng &#x111;&#x1b0;&#x1ee3;c x&#x1eed; l&#xfd;."/>
<node CREATED="1544166641121" ID="ID_157562330" MODIFIED="1544166713530" TEXT="Th&#x1ef1;c h&#xe0;nh">
<node CREATED="1544166717660" ID="ID_1629695012" MODIFIED="1544166723337" TEXT="Vi&#x1ebf;t 1 ch&#x1b0;&#x1a1;ng tr&#xec;nh C block SIGINT, sau &#x111;&#xf3; check trong s&#x1ed1; signal pending c&#xf3; SIGINT kh&#xf4;ng, n&#x1ebf;u c&#xf3; th&#xec; tho&#xe1;t ch&#x1b0;&#x1a1;ng tr&#xec;nh"/>
</node>
</node>
<node CREATED="1544167038014" ID="ID_232058518" MODIFIED="1544169005670" POSITION="right" TEXT="Th&#x1ef1;c h&#xe0;nh">
<node CREATED="1544167047539" ID="ID_1095842247" MODIFIED="1544167256896" TEXT="Vi&#x1ebf;t ch&#x1b0;&#x1a1;ng tr&#xec;nh A fork ra ch&#x1b0;&#x1a1;ng tr&#xec;nh B. A v&#xe0; B c&#xf9;ng ghi v&#xe0;o 1 file. M&#x1ed7;i ch&#x1b0;&#x1a1;ng tr&#xec;nh s&#x1ebd; &#x111;&#x1ecd;c l&#x1ea7;n l&#x1b0;&#x1ee3;t d&#xf2;ng counter cu&#x1ed1;i c&#xf9;ng c&#x1ee7;a file v&#xe0; t&#x103;ng n&#xf3; l&#xea;n 1, sau &#x111;&#xf3; ghi ti&#x1ebf;p 1 d&#xf2;ng m&#x1edb;i l&#xe0; process ID c&#x1ee7;a ch&#xed;nh n&#xf3; k&#xe8;m bi&#x1ebf;n counter m&#x1edb;i. Ph&#x1ea3;i s&#x1eed; d&#x1ee5;ng signal &#x111;&#x1ec3; &#x111;&#x1ed3;ng b&#x1ed9; gi&#x1eef;a 2 process"/>
</node>
</node>
</map>
