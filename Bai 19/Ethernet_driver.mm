<map version="1.0.1">
<!-- To view this file, download free mind mapping software FreeMind from http://freemind.sourceforge.net -->
<node CREATED="1552631009308" ID="ID_1023491247" MODIFIED="1552631117365" TEXT="Ethernet_driver">
<node CREATED="1552631129272" ID="ID_1360231460" MODIFIED="1552631160634" POSITION="right" TEXT="Presentation">
<node CREATED="1552631235919" ID="ID_1913420137" MODIFIED="1552631238040" TEXT="Agenda">
<node CREATED="1552633624067" ID="ID_83564860" MODIFIED="1552633625264" TEXT="Overview"/>
<node CREATED="1552633629339" ID="ID_1597742623" MODIFIED="1552633629932" TEXT="Network interface"/>
<node CREATED="1552633640571" ID="ID_934263656" MODIFIED="1552633643807" TEXT="Socket"/>
<node CREATED="1552633638259" ID="ID_89634795" MODIFIED="1552633638840" TEXT="Lu&#x1ed3;ng di chuy&#x1ec3;n c&#x1ee7;a m&#x1ed9;t g&#xf3;i tin"/>
<node CREATED="1552633647939" ID="ID_235386798" MODIFIED="1552633648432" TEXT="C&#x1ea5;u tr&#xfa;c source code c&#x1ee7;a ethernet driver"/>
</node>
<node CREATED="1552631251742" ID="ID_354452177" MODIFIED="1552631256419" TEXT="Overview">
<node CREATED="1552631278702" ID="ID_490907625" MODIFIED="1552631299761" TEXT="Linux x&#xe2;y d&#x1ef1;ng 1 subsystem ri&#xea;ng &#x111;&#x1ec3; &#x111;i&#x1ec1;u khi&#x1ec3;n network"/>
</node>
<node CREATED="1552631307517" ID="ID_712023901" MODIFIED="1552631681361" TEXT="Network interface">
<node CREATED="1552631322478" ID="ID_1876014245" MODIFIED="1552631331985" TEXT="G&#x1eaf;n v&#x1edb;i 1 device trong th&#x1b0; m&#x1ee5;c dev"/>
<node CREATED="1552631334132" ID="ID_552460067" MODIFIED="1552631354019" TEXT="Config th&#xf4;ng qua ifconfig command"/>
<node CREATED="1552631354501" ID="ID_1381296838" MODIFIED="1552631370938" TEXT="C&#xf3; nh&#x1eef;ng thu&#x1ed9;c t&#xed;nh ri&#xea;ng nh&#x1b0; MAC address, ip address,..."/>
</node>
<node CREATED="1552631682540" ID="ID_1813841435" MODIFIED="1552631693250" TEXT="Config cho network interface">
<node CREATED="1552631693917" ID="ID_992572618" MODIFIED="1552631705738" TEXT="Tr&#x1b0;&#x1edb;c khi s&#x1eed; d&#x1ee5;ng &#x111;&#x1b0;&#x1ee3;c th&#xec; interface c&#x1ea7;n ph&#x1ea3;i &#x111;&#x1b0;&#x1ee3;c config"/>
<node CREATED="1552631706717" ID="ID_1749288670" MODIFIED="1552631751026" TEXT="Config t&#x1ef1; &#x111;&#x1ed9;ng th&#xf4;ng qua c&#xe1;c file config nh&#x1b0; /etc/network/interfaces"/>
<node CREATED="1552631757413" ID="ID_1534334158" MODIFIED="1552631773882" TEXT="Con fig b&#x1eb1;ng tay th&#xf4;ng qua ifconfig command"/>
</node>
<node CREATED="1552631484662" ID="ID_1889771298" MODIFIED="1552631486970" TEXT="Socket">
<node CREATED="1552631488109" ID="ID_632371028" MODIFIED="1552634245008" TEXT="L&#xe0; 1 file c&#xf3; kh&#x1ea3; n&#x103;ng &#x111;&#x1ecd;c ghi"/>
<node CREATED="1552631507317" ID="ID_1785142282" MODIFIED="1552631587562" TEXT="N&#x1ebf;u &#x111;&#x1b0;&#x1ee3;c g&#x1eaf;n address th&#xec; socket s&#x1ebd; &#x111;&#x1b0;&#x1ee3;c g&#x1eaf;n v&#x1edb;i interface c&#xf3; ip address t&#x1b0;&#x1a1;ng &#x1ee9;ng"/>
<node CREATED="1552631588126" ID="ID_429976314" MODIFIED="1552631615794" TEXT="C&#xe1;c h&#xe0;m &#x111;&#x1ecd;c/ghi v&#xe0;o socket s&#x1ebd; &#x111;&#x1b0;&#x1ee3;c x&#x1eed; l&#xfd; b&#x1edf;i h&#xe0;m &#x111;&#x1ecd;c ghi c&#x1ee7;a network interface"/>
</node>
<node CREATED="1552631966189" ID="ID_661314504" MODIFIED="1552632092475" TEXT="Lu&#x1ed3;ng di chuy&#x1ec3;n c&#x1ee7;a m&#x1ed9;t g&#xf3;i tin">
<node CREATED="1552632093237" ID="ID_929122003" MODIFIED="1552632101825" TEXT="&#x110;&#xf3;ng g&#xf3;i &#x1edf; t&#x1ea7;ng application"/>
<node CREATED="1552632103629" ID="ID_129699220" MODIFIED="1552632111656" TEXT="Application ghi xu&#x1ed1;ng socket"/>
<node CREATED="1552632114477" ID="ID_741688159" MODIFIED="1552632167154" TEXT="Kernel &#x111;&#xf3;ng g&#xf3;i l&#x1ea1;i theo t&#x1eeb;ng giao th&#x1ee9;c TCP/UDP"/>
<node CREATED="1552632180324" ID="ID_77157673" MODIFIED="1552632227192" TEXT="Kernel &#x111;&#xf3;ng g&#xf3;i data v&#xe0; th&#xf4;ng tin ph&#x1ee5; th&#xea;m th&#xe0;nh struct skb"/>
<node CREATED="1552632231813" ID="ID_1857123647" MODIFIED="1552632307074" TEXT="Driver l&#x1ea5;y data t&#x1eeb; struct skb v&#xe0; g&#x1eed;i ra ngo&#xe0;i"/>
</node>
<node CREATED="1568712425249" ID="ID_1580921932" MODIFIED="1568712431123" TEXT="Sending flow">
<node CREATED="1568712476641" ID="ID_979308606" MODIFIED="1568712504709" TEXT="sendto(socket, buffer, buflen, 0, &amp;dest, sizeof(dest));"/>
<node CREATED="1568712478920" ID="ID_1622753501" MODIFIED="1568712559740" TEXT="SYSCALL_DEFINE6(sendto, int, fd, void __user *, buff, size_t, len, unsigned int, flags, struct sockaddr __user *, addr, int, addr_len)"/>
<node CREATED="1568712615384" ID="ID_568414689" MODIFIED="1568712626597" TEXT="sock-&gt;ops-&gt;sendmsg -&gt; inet_sendmsg"/>
<node CREATED="1568712627919" ID="ID_716917933" MODIFIED="1568712656181" TEXT="sk-&gt;sk_prot-&gt;sendmsg -&gt; udp_sendmsg">
<node CREATED="1568712753008" ID="ID_433212457" MODIFIED="1568712763301" TEXT="daddr = inet-&gt;inet_daddr"/>
<node CREATED="1568712766096" ID="ID_1391783748" MODIFIED="1568712767293" TEXT="dport = inet-&gt;inet_dport;"/>
<node CREATED="1568713731312" ID="ID_628997944" MODIFIED="1568713731725" TEXT="flowi4_init_output"/>
<node CREATED="1568713738896" ID="ID_1201309258" MODIFIED="1568713739150" TEXT="ip_make_skb"/>
</node>
<node CREATED="1568712657624" ID="ID_928140521" MODIFIED="1568713759861" TEXT="udp_send_skb"/>
<node CREATED="1568713760552" ID="ID_1619989212" MODIFIED="1568713790349" TEXT="ip_send_skb"/>
<node CREATED="1568713835032" ID="ID_642721480" MODIFIED="1568713836332" TEXT="__ip_local_out"/>
<node CREATED="1568713882256" ID="ID_969601778" MODIFIED="1568713882595" TEXT="nf_hook"/>
<node CREATED="1568713910808" ID="ID_348342620" MODIFIED="1568713911093" TEXT="ip_finish_output"/>
<node CREATED="1568714036704" ID="ID_781868926" MODIFIED="1568714037093" TEXT="dev_queue_xmit"/>
<node CREATED="1568714077185" ID="ID_222559287" MODIFIED="1568714077804" TEXT="net_tx_action"/>
<node CREATED="1568714087576" ID="ID_1264866777" MODIFIED="1568714087888" TEXT="dev_hard_start_xmit"/>
<node CREATED="1568714260896" ID="ID_1044746980" MODIFIED="1568714261205" TEXT="https://blog.packagecloud.io/eng/2017/02/06/monitoring-tuning-linux-networking-stack-sending-data/#sock_sendmsg-__sock_sendmsg-and-__sock_sendmsg_nosec"/>
</node>
<node CREATED="1568782797265" ID="ID_1548579448" MODIFIED="1568782798485" TEXT="New API">
<node CREATED="1568782801328" ID="ID_1501997131" MODIFIED="1568782842293" TEXT="Polling c&#xf3; nh&#x1b0;&#x1ee3;c &#x111;i&#x1ec3;m &#x111;&#x1ed9; tr&#x1ec5; cao khi x&#x1eed; l&#xfd; event"/>
<node CREATED="1568782842817" ID="ID_1763258146" MODIFIED="1568782866749" TEXT="Interrupt g&#xe2;y treo h&#x1ec7; th&#x1ed1;ng khi t&#x1ea7;n su&#x1ea5;t ng&#x1eaf;t x&#x1ea3;y ra li&#xea;n t&#x1ee5;c"/>
<node CREATED="1568782867135" ID="ID_1630617809" MODIFIED="1568782886597" TEXT="New API l&#xe0; ph&#x1b0;&#x1a1;ng ph&#xe1;p k&#x1ebf;t h&#x1ee3;p gi&#x1eef;a polling v&#xe0; interrupt"/>
</node>
<node CREATED="1568714103168" ID="ID_292680162" MODIFIED="1568714105069" TEXT="Receiving flow">
<node CREATED="1568714424641" ID="ID_1665221301" MODIFIED="1568714424982" TEXT="https://blog.packagecloud.io/eng/2016/06/22/monitoring-tuning-linux-networking-stack-receiving-data/"/>
</node>
<node CREATED="1552631925061" ID="ID_1974486834" MODIFIED="1552631930450" TEXT="Struct skb">
<node CREATED="1552631931661" ID="ID_1406967502" MODIFIED="1552632340978" TEXT="L&#xe0; struct linux t&#x1ef1; &#x111;&#x1ecb;nh ngh&#x129;a, &#x111;&#x1b0;&#x1ee3;c d&#xf9;ng &#x111;&#x1ec3; qu&#x1ea3;n l&#xfd; g&#xf3;i tin c&#x1ee7;a network trong kernel"/>
</node>
<node CREATED="1552632621950" ID="ID_798195206" MODIFIED="1552632634137" TEXT="C&#x1ea5;u tr&#xfa;c source code c&#x1ee7;a ethernet driver"/>
<node CREATED="1552632646253" ID="ID_1924017507" MODIFIED="1552632649970" TEXT="B&#xe0;i t&#x1ead;p v&#x1ec1; nh&#xe0;">
<node CREATED="1552632652108" ID="ID_568074630" MODIFIED="1552634513679" TEXT="Vi&#x1ebf;t loopback network driver. Cho ph&#xe9;p ng&#x1b0;&#x1edd;i d&#xf9;ng up/down interface. Sau khi config, ng&#x1b0;&#x1edd;i d&#xf9;ng c&#xf3; th&#x1ec3; g&#x1eed;i v&#xe0; nh&#x1ead;n b&#x1ea3;n tin th&#xf4;ng qua l&#x1ead;p tr&#xec;nh v&#x1edb;i socket gi&#x1ed1;ng nh&#x1b0; c&#xe1;c network interface kh&#xe1;c."/>
<node CREATED="1552632867702" ID="ID_846175779" MODIFIED="1552633007395" TEXT="Vi&#x1ebf;t 1 kernel module, swap l&#x1ea1;i h&#xe0;m sock_send system call b&#x1eb1;ng h&#xe0;m my_send. Trong h&#xe0;m my_send s&#x1ebd; detect ra b&#x1ea3;n in http, &#x111;&#x1ecd;c data trong b&#x1ea3;n tin &#x111;&#xf3; v&#xe0; l&#x1ea5;y v&#x1ec1; t&#x1ea5;t c&#x1ea3; c&#xe1;c chu&#x1ed7;i string c&#xf3; t&#x1eeb; password &#x1edf; &#x111;&#x1ea7;u r&#x1ed3;i l&#x1b0;u v&#xe0;o file."/>
</node>
</node>
</node>
</map>
