----------------------------------------------------------------------------------
-- Company: University of Connecticut
-- Engineer: Masab Ahmad
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity dram is

port(   clk: in std_logic;
        reset: in std_logic;
        wr_en: in std_logic;
		  addr: in signed(31 downto 0);     --dram addr
		  data_store: in signed(31 downto 0);   --input data
		  data_load: out signed(31 downto 0);    --output data
		  data_init: in signed(8191 downto 0);
		  
		  nn: in std_logic; --added
		  data_from_mem: out signed(159 downto 0) --added
);

end dram;

architecture Behavioral of dram is

type dataout is array (255 downto 0) of signed(31 downto 0);

signal dram : dataout; -- READS BACKWARDS DATA MEMORY				
					
	signal j : integer := 0;

begin

	--Convert PC and addr to index into the 2d memory arrays
	j <= to_integer(addr);

   --Data Cache Process
	process(clk,reset)
   begin
       if(reset='1') then
	        dram(0) <= data_init(31 downto 0);
		dram(1) <= data_init(63 downto 32);
		dram(2) <= data_init(95 downto 64);
		dram(3) <= data_init(127 downto 96);
		dram(4) <= data_init(159 downto 128);
		dram(5) <= data_init(191 downto 160);
		dram(6) <= data_init(223 downto 192);
		dram(7) <= data_init(255 downto 224);
		dram(8) <= data_init(287 downto 256);
		dram(9) <= data_init(319 downto 288);
		dram(10) <= data_init(351 downto 320);
		dram(11) <= data_init(383 downto 352);
		dram(12) <= data_init(415 downto 384);
		dram(13) <= data_init(447 downto 416);
		dram(14) <= data_init(479 downto 448);
		dram(15) <= data_init(511 downto 480);
		dram(16) <= data_init(543 downto 512);
		dram(17) <= data_init(575 downto 544);
		dram(18) <= data_init(607 downto 576);
		dram(19) <= data_init(639 downto 608);
		dram(20) <= data_init(671 downto 640);
		dram(21) <= data_init(703 downto 672);
		dram(22) <= data_init(735 downto 704);
		dram(23) <= data_init(767 downto 736);
		dram(24) <= data_init(799 downto 768);
		dram(25) <= data_init(831 downto 800);
		dram(26) <= data_init(863 downto 832);
		dram(27) <= data_init(895 downto 864);
		dram(28) <= data_init(927 downto 896);
		dram(29) <= data_init(959 downto 928);
		dram(30) <= data_init(991 downto 960);
		dram(31) <= data_init(1023 downto 992);
		dram(32) <= data_init(1055 downto 1024);
		dram(33) <= data_init(1087 downto 1056);
		dram(34) <= data_init(1119 downto 1088);
		dram(35) <= data_init(1151 downto 1120);
		dram(36) <= data_init(1183 downto 1152);
		dram(37) <= data_init(1215 downto 1184);
		dram(38) <= data_init(1247 downto 1216);
		dram(39) <= data_init(1279 downto 1248);
		dram(40) <= data_init(1311 downto 1280);
		dram(41) <= data_init(1343 downto 1312);
		dram(42) <= data_init(1375 downto 1344);
		dram(43) <= data_init(1407 downto 1376);
		dram(44) <= data_init(1439 downto 1408);
		dram(45) <= data_init(1471 downto 1440);
		dram(46) <= data_init(1503 downto 1472);
		dram(47) <= data_init(1535 downto 1504);
		dram(48) <= data_init(1567 downto 1536);
		dram(49) <= data_init(1599 downto 1568);
		dram(50) <= data_init(1631 downto 1600);
		dram(51) <= data_init(1663 downto 1632);
		dram(52) <= data_init(1695 downto 1664);
		dram(53) <= data_init(1727 downto 1696);
		dram(54) <= data_init(1759 downto 1728);
		dram(55) <= data_init(1791 downto 1760);
		dram(56) <= data_init(1823 downto 1792);
		dram(57) <= data_init(1855 downto 1824);
		dram(58) <= data_init(1887 downto 1856);
		dram(59) <= data_init(1919 downto 1888);
		dram(60) <= data_init(1951 downto 1920);
		dram(61) <= data_init(1983 downto 1952);
		dram(62) <= data_init(2015 downto 1984);
		dram(63) <= data_init(2047 downto 2016);
		dram(64) <= data_init(2079 downto 2048);
		dram(65) <= data_init(2111 downto 2080);
		dram(66) <= data_init(2143 downto 2112);
		dram(67) <= data_init(2175 downto 2144);
		dram(68) <= data_init(2207 downto 2176);
		dram(69) <= data_init(2239 downto 2208);
		dram(70) <= data_init(2271 downto 2240);
		dram(71) <= data_init(2303 downto 2272);
		dram(72) <= data_init(2335 downto 2304);
		dram(73) <= data_init(2367 downto 2336);
		dram(74) <= data_init(2399 downto 2368);
		dram(75) <= data_init(2431 downto 2400);
		dram(76) <= data_init(2463 downto 2432);
		dram(77) <= data_init(2495 downto 2464);
		dram(78) <= data_init(2527 downto 2496);
		dram(79) <= data_init(2559 downto 2528);
		dram(80) <= data_init(2591 downto 2560);
		dram(81) <= data_init(2623 downto 2592);
		dram(82) <= data_init(2655 downto 2624);
		dram(83) <= data_init(2687 downto 2656);
		dram(84) <= data_init(2719 downto 2688);
		dram(85) <= data_init(2751 downto 2720);
		dram(86) <= data_init(2783 downto 2752);
		dram(87) <= data_init(2815 downto 2784);
		dram(88) <= data_init(2847 downto 2816);
		dram(89) <= data_init(2879 downto 2848);
		dram(90) <= data_init(2911 downto 2880);
		dram(91) <= data_init(2943 downto 2912);
		dram(92) <= data_init(2975 downto 2944);
		dram(93) <= data_init(3007 downto 2976);
		dram(94) <= data_init(3039 downto 3008);
		dram(95) <= data_init(3071 downto 3040);
		dram(96) <= data_init(3103 downto 3072);
		dram(97) <= data_init(3135 downto 3104);
		dram(98) <= data_init(3167 downto 3136);
		dram(99) <= data_init(3199 downto 3168);
		dram(100) <= data_init(3231 downto 3200);
		dram(101) <= data_init(3263 downto 3232);
		dram(102) <= data_init(3295 downto 3264);
		dram(103) <= data_init(3327 downto 3296);
		dram(104) <= data_init(3359 downto 3328);
		dram(105) <= data_init(3391 downto 3360);
		dram(106) <= data_init(3423 downto 3392);
		dram(107) <= data_init(3455 downto 3424);
		dram(108) <= data_init(3487 downto 3456);
		dram(109) <= data_init(3519 downto 3488);
		dram(110) <= data_init(3551 downto 3520);
		dram(111) <= data_init(3583 downto 3552);
		dram(112) <= data_init(3615 downto 3584);
		dram(113) <= data_init(3647 downto 3616);
		dram(114) <= data_init(3679 downto 3648);
		dram(115) <= data_init(3711 downto 3680);
		dram(116) <= data_init(3743 downto 3712);
		dram(117) <= data_init(3775 downto 3744);
		dram(118) <= data_init(3807 downto 3776);
		dram(119) <= data_init(3839 downto 3808);
		dram(120) <= data_init(3871 downto 3840);
		dram(121) <= data_init(3903 downto 3872);
		dram(122) <= data_init(3935 downto 3904);
		dram(123) <= data_init(3967 downto 3936);
		dram(124) <= data_init(3999 downto 3968);
		dram(125) <= data_init(4031 downto 4000);
		dram(126) <= data_init(4063 downto 4032);
		dram(127) <= data_init(4095 downto 4064);
		dram(128) <= data_init(4127 downto 4096);
		dram(129) <= data_init(4159 downto 4128);
		dram(130) <= data_init(4191 downto 4160);
		dram(131) <= data_init(4223 downto 4192);
		dram(132) <= data_init(4255 downto 4224);
		dram(133) <= data_init(4287 downto 4256);
		dram(134) <= data_init(4319 downto 4288);
		dram(135) <= data_init(4351 downto 4320);
		dram(136) <= data_init(4383 downto 4352);
		dram(137) <= data_init(4415 downto 4384);
		dram(138) <= data_init(4447 downto 4416);
		dram(139) <= data_init(4479 downto 4448);
		dram(140) <= data_init(4511 downto 4480);
		dram(141) <= data_init(4543 downto 4512);
		dram(142) <= data_init(4575 downto 4544);
		dram(143) <= data_init(4607 downto 4576);
		dram(144) <= data_init(4639 downto 4608);
		dram(145) <= data_init(4671 downto 4640);
		dram(146) <= data_init(4703 downto 4672);
		dram(147) <= data_init(4735 downto 4704);
		dram(148) <= data_init(4767 downto 4736);
		dram(149) <= data_init(4799 downto 4768);
		dram(150) <= data_init(4831 downto 4800);
		dram(151) <= data_init(4863 downto 4832);
		dram(152) <= data_init(4895 downto 4864);
		dram(153) <= data_init(4927 downto 4896);
		dram(154) <= data_init(4959 downto 4928);
		dram(155) <= data_init(4991 downto 4960);
		dram(156) <= data_init(5023 downto 4992);
		dram(157) <= data_init(5055 downto 5024);
		dram(158) <= data_init(5087 downto 5056);
		dram(159) <= data_init(5119 downto 5088);
		dram(160) <= data_init(5151 downto 5120);
		dram(161) <= data_init(5183 downto 5152);
		dram(162) <= data_init(5215 downto 5184);
		dram(163) <= data_init(5247 downto 5216);
		dram(164) <= data_init(5279 downto 5248);
		dram(165) <= data_init(5311 downto 5280);
		dram(166) <= data_init(5343 downto 5312);
		dram(167) <= data_init(5375 downto 5344);
		dram(168) <= data_init(5407 downto 5376);
		dram(169) <= data_init(5439 downto 5408);
		dram(170) <= data_init(5471 downto 5440);
		dram(171) <= data_init(5503 downto 5472);
		dram(172) <= data_init(5535 downto 5504);
		dram(173) <= data_init(5567 downto 5536);
		dram(174) <= data_init(5599 downto 5568);
		dram(175) <= data_init(5631 downto 5600);
		dram(176) <= data_init(5663 downto 5632);
		dram(177) <= data_init(5695 downto 5664);
		dram(178) <= data_init(5727 downto 5696);
		dram(179) <= data_init(5759 downto 5728);
		dram(180) <= data_init(5791 downto 5760);
		dram(181) <= data_init(5823 downto 5792);
		dram(182) <= data_init(5855 downto 5824);
		dram(183) <= data_init(5887 downto 5856);
		dram(184) <= data_init(5919 downto 5888);
		dram(185) <= data_init(5951 downto 5920);
		dram(186) <= data_init(5983 downto 5952);
		dram(187) <= data_init(6015 downto 5984);
		dram(188) <= data_init(6047 downto 6016);
		dram(189) <= data_init(6079 downto 6048);
		dram(190) <= data_init(6111 downto 6080);
		dram(191) <= data_init(6143 downto 6112);
		dram(192) <= data_init(6175 downto 6144);
		dram(193) <= data_init(6207 downto 6176);
		dram(194) <= data_init(6239 downto 6208);
		dram(195) <= data_init(6271 downto 6240);
		dram(196) <= data_init(6303 downto 6272);
		dram(197) <= data_init(6335 downto 6304);
		dram(198) <= data_init(6367 downto 6336);
		dram(199) <= data_init(6399 downto 6368);
		dram(200) <= data_init(6431 downto 6400);
		dram(201) <= data_init(6463 downto 6432);
		dram(202) <= data_init(6495 downto 6464);
		dram(203) <= data_init(6527 downto 6496);
		dram(204) <= data_init(6559 downto 6528);
		dram(205) <= data_init(6591 downto 6560);
		dram(206) <= data_init(6623 downto 6592);
		dram(207) <= data_init(6655 downto 6624);
		dram(208) <= data_init(6687 downto 6656);
		dram(209) <= data_init(6719 downto 6688);
		dram(210) <= data_init(6751 downto 6720);
		dram(211) <= data_init(6783 downto 6752);
		dram(212) <= data_init(6815 downto 6784);
		dram(213) <= data_init(6847 downto 6816);
		dram(214) <= data_init(6879 downto 6848);
		dram(215) <= data_init(6911 downto 6880);
		dram(216) <= data_init(6943 downto 6912);
		dram(217) <= data_init(6975 downto 6944);
		dram(218) <= data_init(7007 downto 6976);
		dram(219) <= data_init(7039 downto 7008);
		dram(220) <= data_init(7071 downto 7040);
		dram(221) <= data_init(7103 downto 7072);
		dram(222) <= data_init(7135 downto 7104);
		dram(223) <= data_init(7167 downto 7136);
		dram(224) <= data_init(7199 downto 7168);
		dram(225) <= data_init(7231 downto 7200);
		dram(226) <= data_init(7263 downto 7232);
		dram(227) <= data_init(7295 downto 7264);
		dram(228) <= data_init(7327 downto 7296);
		dram(229) <= data_init(7359 downto 7328);
		dram(230) <= data_init(7391 downto 7360);
		dram(231) <= data_init(7423 downto 7392);
		dram(232) <= data_init(7455 downto 7424);
		dram(233) <= data_init(7487 downto 7456);
		dram(234) <= data_init(7519 downto 7488);
		dram(235) <= data_init(7551 downto 7520);
		dram(236) <= data_init(7583 downto 7552);
		dram(237) <= data_init(7615 downto 7584);
		dram(238) <= data_init(7647 downto 7616);
		dram(239) <= data_init(7679 downto 7648);
		dram(240) <= data_init(7711 downto 7680);
		dram(241) <= data_init(7743 downto 7712);
		dram(242) <= data_init(7775 downto 7744);
		dram(243) <= data_init(7807 downto 7776);
		dram(244) <= data_init(7839 downto 7808);
		dram(245) <= data_init(7871 downto 7840);
		dram(246) <= data_init(7903 downto 7872);
		dram(247) <= data_init(7935 downto 7904);
		dram(248) <= data_init(7967 downto 7936);
		dram(249) <= data_init(7999 downto 7968);
		dram(250) <= data_init(8031 downto 8000);
		dram(251) <= data_init(8063 downto 8032);
		dram(252) <= data_init(8095 downto 8064);
		dram(253) <= data_init(8127 downto 8096);
		dram(254) <= data_init(8159 downto 8128);
		dram(255) <= data_init(8191 downto 8160);

			  
	  --Read data from the DRAM on a load
	  --j set by addr
	  elsif(rising_edge(clk) and wr_en='1') then
	    	  	  dram(j) <= data_store;
	  end if;
	end process;

	  --Read data from the DRAM on a load
	  --j set by addr
         data_load <= dram(j) when j < 256 else x"00000000" when j > 255;
         data_from_mem <= dram(j) & dram(j+1) & dram(j+2) & dram(j+3) & dram(j+4) 
                          when nn = '1' else x"0000000000000000000000000000000000000000"; --added
			  
end Behavioral;
