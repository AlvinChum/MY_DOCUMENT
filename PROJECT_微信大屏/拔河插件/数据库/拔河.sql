-- phpMyAdmin SQL Dump
-- version 3.3.8.1
-- http://www.phpmyadmin.net
--
-- 主机: w.rdc.sae.sina.com.cn:3307
-- 生成日期: 2016 年 05 月 24 日 16:10
-- 服务器版本: 5.6.23
-- PHP 版本: 5.3.3

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `app_wwapi`
--

-- --------------------------------------------------------

--
-- 表的结构 `weixin_admin`
--

CREATE TABLE IF NOT EXISTS `weixin_admin` (
  `user` text NOT NULL,
  `pwd` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_admin`
--

INSERT INTO `weixin_admin` (`user`, `pwd`) VALUES
('admin', 'cz@@7218160');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_bh_config`
--

CREATE TABLE IF NOT EXISTS `weixin_bh_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `ads` varchar(255) NOT NULL,
  `timelimit` int(3) NOT NULL,
  `teamapic` varchar(255) NOT NULL,
  `teambpic` varchar(255) NOT NULL,
  `teama` varchar(255) NOT NULL,
  `teamb` varchar(255) NOT NULL,
  `rule` text NOT NULL,
  `footer` text NOT NULL,
  `shaketype` tinyint(1) NOT NULL,
  `threshold` int(9) NOT NULL,
  `zjtype` int(1) NOT NULL,
  `zjpersonnum` int(2) NOT NULL,
  `zjpaichu` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `weixin_bh_config`
--

INSERT INTO `weixin_bh_config` (`id`, `title`, `ads`, `timelimit`, `teamapic`, `teambpic`, `teama`, `teamb`, `rule`, `footer`, `shaketype`, `threshold`, `zjtype`, `zjpersonnum`, `zjpaichu`) VALUES
(1, '来拔河吧', 'a:1:{i:0;s:44:"http://wwapi-img.stor.sinaapp.com/tug-ad0jpg";}', 45, '../tug/style/images/team1.jpg', '../tug/style/images/team2.jpg', '女队', '男队', '请先选择您归属的队伍，当大屏幕游戏开始时，摇动您的手机，您摇晃的次数越多，您所在的队伍的总分就越高，最终得分高的队伍将获得胜利！', '微屏科技', 3, 800, 1, 5, 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_bh_replay`
--

CREATE TABLE IF NOT EXISTS `weixin_bh_replay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` tinyint(1) NOT NULL,
  `starttime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `weixin_bh_replay`
--

INSERT INTO `weixin_bh_replay` (`id`, `status`, `starttime`) VALUES
(1, 0, 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_bh_user`
--

CREATE TABLE IF NOT EXISTS `weixin_bh_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wecha_id` varchar(255) NOT NULL,
  `pic` text NOT NULL,
  `uname` varchar(255) NOT NULL,
  `count` int(11) NOT NULL,
  `whoteam` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wecha_id` (`wecha_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- 转存表中的数据 `weixin_bh_user`
--


-- --------------------------------------------------------

--
-- 表的结构 `weixin_cj_shady`
--

CREATE TABLE IF NOT EXISTS `weixin_cj_shady` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(11) NOT NULL,
  `grade` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- 转存表中的数据 `weixin_cj_shady`
--

INSERT INTO `weixin_cj_shady` (`id`, `phone`, `grade`) VALUES
(18, '13439137011', 3),
(19, '18671738117', 3);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_cookie`
--

CREATE TABLE IF NOT EXISTS `weixin_cookie` (
  `cookie` text NOT NULL,
  `cookies` text NOT NULL,
  `token` int(11) NOT NULL,
  `id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- 转存表中的数据 `weixin_cookie`
--

INSERT INTO `weixin_cookie` (`cookie`, `cookies`, `token`, `id`) VALUES
('', '', 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_flag`
--

CREATE TABLE IF NOT EXISTS `weixin_flag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `flag` int(11) DEFAULT NULL,
  `vote` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `avatar` text,
  `content` text,
  `fakeid` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `othid` int(11) NOT NULL DEFAULT '0',
  `cjstatu` tinyint(4) NOT NULL DEFAULT '0',
  `datetime` int(10) DEFAULT NULL,
  `verify` varchar(4) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `shady` tinyint(2) NOT NULL DEFAULT '0',
  `cjgrade` tinyint(1) DEFAULT NULL,
  `fromtype` varchar(25) DEFAULT NULL,
  `mingzi` varchar(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`),
  KEY `openid_2` (`openid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=629 ;

--
-- 转存表中的数据 `weixin_flag`
--

INSERT INTO `weixin_flag` (`id`, `openid`, `flag`, `vote`, `nickname`, `avatar`, `content`, `fakeid`, `sex`, `status`, `othid`, `cjstatu`, `datetime`, `verify`, `phone`, `shady`, `cjgrade`, `fromtype`, `mingzi`) VALUES
(1, 'oeYLUvsNVizHD9EYh2_CVSzIJbXw', 2, '', '4368616e', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HZ9zabquagNo9hxmqCrOO3HwfgMiafZqNe7PPWe5Opoibb0EeWehwXWYjMwz96arHpYCuGUcmd9ia0y/0', 'e68891e59ca8', '2616802536', '1', 1, 0, 0, 1463621521, 'n217', '13800138000', 1, 1, 'weixin', 'Chan'),
(251, 'oeYLUvnBxGjj2EjaWIqV58Il87aI', 2, '', 'e59ca3e793a6e4bca6e4b881e79a84e78eabe791b0f09f8cb9', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAfUokLPyZtEy7Q0ibS3eFd1XPQUvAkPVCVNF4RbQKnWWpzhKibiaGhGBcVx75A1BqgMib2m6icZfag0Aic/0', 'e4bda0e5a6b9e5958a', '7373269928', '1', 2, 0, 0, 1463562816, 'mqgw', '15156389078', 0, 2, 'weixin', '拼爹'),
(3, 'oeYLUvlaAzL3-Lb9ZvAvbnueCCP4', 2, '', '536537456ef09f989d', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfZzIicKFxaMTEtyrbKCAL5EVUib0glkRRSWOkEs1XCaMNxzLdP3alaICxs7vqkoM7bAY4SroMxcR79/0', 'e4bda0e5a5bd7462e69d83', '1193127255', '1', 2, 0, 0, 1463579929, '8orz', '15764945361', 0, 2, 'weixin', '一震'),
(21, 'oeYLUvpfsnsQ6X_RjLNvW3nnAt1w', 2, '', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 'e69da5e4ba86', '8371151877', '2', 2, 0, 0, 1463013972, 's5cz', '13971495345', 4, 4, 'weixin', '杨洁'),
(5, 'oeYLUvqXQ0zkbgI3V5CQbxScsWYs', 2, '', 'e29c8eefb98f4d63e9b98fe5b09120f09f8ea420202020202020e2808de582b3e5aa92e5bdb1e8a696', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKe3w0VyxiaibFAX6Qjyd528vJqxYrW5E3YMJTjpK9tE7OYAjOJCMiaJ8wtYOpAGyudrtfspUdMZr2Mg/0', 'e5a4a7e983bde4bc9a', '8944847666', '1', 2, 0, 0, 1463579924, 'roat', '13768108787', 0, 2, 'weixin', '张鹏'),
(9, 'oeYLUvkDMbErL6j8oFyj1QKthzqI', 2, '25', 'e5bca0e699b6', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQVtyla2ZeVJ6UX6ILHfBPdNnQBxOfDZW3VlUQV4GviahtlZLPxfvibENYdwgyFS6AaDLO2DnzqX3qh/0', '此消息为图片！', '5447320062', '1', 2, 0, 0, 1463460296, 'snjd', '13100604279', 2, 2, 'weixin', '张晶'),
(11, 'oeYLUvu1E_kpI1fZ0yMZ7fk5ThtA', 2, '', 'e7baa2e8b186', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfSQOXTibKT6dYqyNWVHxbcXicp3my7d64ia18cLicok6Q3RomWY0KLviacu8Nx8cy071p6xQBlKsflpOm/0', NULL, '7313864771', '2', 0, 0, 0, 1456458200, 'reob', '15386730002', 0, NULL, 'weixin', '许琴'),
(34, 'oeYLUvv7ZZ0MYFtYwS9EUydxJ3c0', 2, '', '41e280a223e88d89e88e93f09f8d93e5aeb6', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv64ibR1FPiacLZEW1UyPU9Qycm9nkzWluCqR5zUzAHC40icgtCNBHIZp9eteHHrPgRZY9LC1AD9wqOEQ/0', NULL, '711243538', '2', 0, 0, 0, 1456648082, 'jwho', '15075123456', 0, NULL, 'weixin', '就'),
(13, 'oeYLUvr1w1tsM_3zqpwaAsaUtNqA', 2, '', 'e4bb8ae697a5e5bbbae6b996', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HUrxkgj4PjtLeVDp4fxiaUYRGq46OfBQ8Op5RGgK8829Vp4QBZrMfj3ym5n1jCvSUjN2fCtLnJovb/0', 'e68891e8a681e58faae883bde79c8be79c8b', '8340965023', '2', 1, 0, 0, 1463713896, 'igqh', '18261291186', 0, 1, 'weixin', '小涛'),
(14, 'oeYLUvquD5EsvrC3aJQfLBWi-ssw', 2, '', 'e889bee28094e6b39be6bba5efbc8ce6b39be6bba5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1iaUuczdqXD3oibvZrdySgrxU7yhc0ssiamwlrSK4JczhW1xqG572xLYglZiaRD34gJDtLiaUqPqVPjzc/0', 'e59388e59388e59388e595a6e38082e68891e4bbac', '4460296810', '1', 2, 0, 0, 1462852090, 'ao6l', '12345678910', 0, 1, 'weixin', '咖喱啊'),
(15, 'oeYLUvjVVrG5fdCSFzKEeni80bpg', 2, '', 'e4b8b9e69eab', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQCkq1k2TJVoNicShVTusaMmfSPhGccASYjQGMPX2K8twib7pbLWpzZQ1acmf8niaHZWTl7NB8Fp2ULO/0', 'e4bda0e5a5bd', '5558183133', '1', 2, 0, 0, 1463014021, 'djws', '18703530353', 0, 4, 'weixin', '朱'),
(16, 'oeYLUvpg9YI6sY8HjSMuh2s8zAPA', 2, '', 'e88e8ee88e8e', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL842QqpodqWnRtzzmHEKsvE7WMxFDZmxDL1z6rkib9OtoWcibpM2wGQ854z0gqIHiaUuQj9MGlLct5g/0', '2f3a3a7c', '6279298208', '2', 2, 0, 0, 1463621523, 'ehu2', '15927429026', 0, 1, 'weixin', '许小莎'),
(17, 'oeYLUvvXccyJpEG05NnKIOs1BjKo', 2, '', 'e58898e790a6', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELUIJSvx8fXjIgrgZlOBMoQaGhDGz7JJmIBhEa52ljxZVc8E65uAhu8ibyOsQUAlbmUiaWrambSFNKA/0', '此消息为图片！', '4848544636', '1', 2, 0, 0, 1463562850, 'c9f0', '13886147677', 0, 2, 'weixin', '刘琦'),
(18, 'oeYLUvhXPfYWYBZhb98eCKJA3RSI', 2, '', 'f09f8e80f09f9284f09f9285f09f8c9ff09f928bf09f9293e895bee29ca8f09f9298', 'http://wx.qlogo.cn/mmopen/uI5pczeERTbBENy5dslsarWK3hbQT2fgiasz7PqZMla4VlsrAJSjz9QKEvZ7iazxPODo29icYWWiaYSh5OSI2hIZzaGb9ibPtHeXy/0', '2f3a2c402d442f3a2c402d442f3a2c402d44', '7682995604', '2', 2, 0, 0, 1462852076, 'jg4a', '15926239524', 0, 1, 'weixin', '柳蕾'),
(19, 'oeYLUvvg2USwfzvZePk540atyW6I', 2, '', '4c59', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYomdeMtjZTdzlrIibrLo0ddiaFtGq8kGAO4dB0L8jCh3wXFRZLCb8Hl686eMX2O7hBrqtDcM6O4oiaBoQ0s5Rzhgu/0', '2f3a73686974', '1259657443', '1', 2, 0, 0, 1462412786, 'ws6j', '15071380538', 0, 1, 'weixin', '刘跃'),
(20, 'oeYLUvs6sPi71Ej2Q5ZGZjLx7AmE', 2, '', 'e68891e684bfe6848f', 'http://wx.qlogo.cn/mmopen/nnPYsicXP1K3W7vYlcpgALxPEt2FMujcazZoibfE8cDrUJmqrjR4eJwyvBrNnhACElGFEhuq7OWEFHEnr4VDXzHU1LP7ZibUvwe/0', NULL, '7089232205', '2', 0, 0, 0, 1456471175, 'p9wa', '13935533553', 0, NULL, 'weixin', '军'),
(39, 'oeYLUvkRWeNnVZKqRK9t_rLBTY_w', 2, '', 'e883a1e88081e5b888', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQTyrPqRaAIn25L5Yicv9V7DibD0kdGzIXXVPVb1ibpcAztevILDEOAaHZgicgOvlSKia3VHn5K7CGJCPW/0', 'e69d8ee88081e5b888', '4637128536', '2', 2, 0, 0, 1463562845, 'wfr2', '15231097732', 0, 2, 'weixin', '胡梦雪'),
(33, 'oeYLUvnxhtHv-EsULgAYKOKv0iXI', 2, '', 'e998bfe789b9', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1qz2uFY1k12fA48yuA9EqvqYoN2uj2v9uulA2O4FB36h79alIc6Cw5jsw0MqBwDFB8fLxwqr1CPS/0', '此消息为图片！', '830057340', '1', 2, 0, 0, 1463401435, 'ptah', '15080667088', 0, 1, 'weixin', '张特'),
(239, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 2, '26', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', NULL, '5520393344', '1', 0, 0, 0, 1459486669, '4sit', '13888888888', 0, NULL, 'weixin', '微屏科技'),
(35, 'oeYLUvgqdx8lcv5FlMC58d498dkI', 2, '', 'e586afe7bb8de5869b', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI7Vde2sg77aP8cJLK4m0sFNoc3WIMNHIeDB95mTiaGCb4rQEZrSOWS4yBN3utR2TiceNy3gxc2SeBg/0', NULL, '854191603', '1', 0, 0, 0, 1456649741, 'uu93', '15058909822', 0, NULL, 'weixin', '冯绍军'),
(74, 'oeYLUvlzIIJC53u2lgPXwdjluWj8', 2, '', '6d6f', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4Niar8EdEZ2OneMLUX95hLp53T7krsgbRgYfztOIjNiccoXtjrvgico50H54L5PeyY9SRMgcQPAstsaeJuGV1cW8Zt9S4ib2J3iaso/0', NULL, '8567645763', '2', 0, 0, 0, 1456992028, 'pb5g', '13711141216', 0, NULL, 'weixin', 'mo'),
(37, 'oeYLUvvKv6O8TYPOHmrHF0EYlGVE', 2, '', '46616e6379', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv4PTDBibfjgmkA73eLCdsLEJpZhNZBbXJFfRUmbEU0iczRiaDXL3rpuglE8AqDUUPfYZI6lbGmtYxW2g/0', 'e68b8de68b8de4b990', '7587473407', '1', 1, 0, 0, 1463713900, '5bwa', '15538880888', 0, 1, 'weixin', '孑然'),
(38, 'oeYLUvtnG-GDe596Ao8-frdwPf2g', 2, '', 'e88b8fe69f92', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6EZPWO6KsSiboVQcadu8rP7Nd61fJXiccfz7ZYyeBokPrrr74Ib8NrodwticZVQW4hicyHWwz7zESSLQ/0', 'e4bcafe587bde7bd91e7bb9c', '6174307207', '2', 2, 0, 0, 1463460307, 'mmgd', '15128876520', 0, 2, 'weixin', '苏柒'),
(95, 'oeYLUvj3KwivToCds1OVEngoMpmo', 2, '26', '537565e38081735553753375', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6XicSkyXI6NQ1CqWbTdA4VhwTp0M4YX9baGA3PDCJsuiaibZ1iaiaRhCnnBpM1d7VlEfJjh0cibt4yNlWQic/0', 'e4bda0', '2487946959', '2', 2, 0, 0, 1463579911, '27rh', '18617070202', 0, 2, 'weixin', '彭'),
(64, 'oeYLUvglQuX0c32oQJ_4-OasYEBI', 2, '', '41e5b9b3e58e9fe29d81d289d289d289d289d289d289d289d289', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlibqxYIesf0rqAWfht2wFKM1CZPwQlsgbukEvud7BGh3hHqHb9YghfFoy9Ik3j0iaR96UgwIff9PTIRWrzMDTexI/0', NULL, '134114944', '1', 0, 0, 0, 1456890157, 'jr0i', '13564646464', 0, NULL, 'weixin', '任安'),
(43, 'oeYLUvpOcQg2uf0r6JLTvouSSU3c', 2, '', 'e4b88be4b880e7ab99c397e7ad89e5be8540e5b9b8e7a68f', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcnhclBQSBsbvZyjmiamAKPfkQA6Bsj8cYMGIQ5Y3xbs1HUBu8dXCHX7dfGlWeAmJDQ1t7gw3rTLB/0', NULL, '4728123228', '1', 0, 0, 0, 1456725551, 'y4b6', '13417709179', 0, NULL, 'weixin', '嫌弃'),
(45, 'oeYLUvm2oNpJth4ZYh-yupav3OrY', 2, '', 'e99baa', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQVicW8TEZG7ic9IOMs3p26fmI1iamPcoo3T0KYG9MNq3KIUlUSWHLrNfiaTxA3YXg3ibEmAfkwicubseuJ/0', NULL, '5463336607', '2', 0, 0, 0, 1456739728, 'qjip', '13835336681', 0, NULL, 'weixin', '雪'),
(44, 'oeYLUvgjoQaq1sFpxFNoC1J7W1Ug', 2, '', '56617279', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv4A109YKOAfnia2GjeVGRMcT7OXfpXjCEUmlc4oEl8LdwaDeO0iaKmQo8oicBFULRRg6YBygQNibVt0t3Z8mRJJ69jd/0', NULL, '8260609091', '1', 0, 0, 0, 1456730844, 'kbmm', '13724376189', 0, NULL, 'weixin', '周大福'),
(46, 'oeYLUvmjr1P-9exhAIkAg5-CqIug', 2, '', 'e88ab1e5bc80e79a84e5a3b0e99fb3', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfejJ8B2sicsjNicziaattsIqbnictOrKozKSVyiba48OJ0XkJZQeUSjEs6w21GSFQD2ZLGj2SpcgicXxG8/0', NULL, '3001363918', '2', 0, 0, 0, 1456739875, 'i0s1', '13994521577', 0, NULL, 'weixin', '王闻'),
(47, 'oeYLUvhMMHhGXGBBZfD-tCqES3UA', 2, '', 'e697b6e997b4e983bde593aae584bfe58ebbe4ba86', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQLWNjOAiawhsjAl4mHBUXL6NIvOmnByJibThJfyFoJ36O2L0FIRcrLbpfT1PPANRNsSa6nVzVF1fe0/0', NULL, '6023408606', '2', 0, 0, 0, 1456739928, 'jwn5', '13935301870', 0, NULL, 'weixin', '啊哈'),
(336, 'oeYLUvl3zS9ZIvIGoFFnHvLeSiRA', 2, '', 'e8b4a2e8b28ce58f8ce585a8', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiccomtmoAxHDIqeLHEuQFl31rnKqvkcK4IPu12gRZydBUwibMr5kwys5bupqgKlGrOPzStPj3yELXLpV0VX0LkeQ/0', 'e4bda0e5a5bd', '868905513', '1', 2, 0, 0, 1463014006, 'wsig', '', 0, 4, 'weixin', ''),
(51, 'oeYLUvnODuQrPfll_v1omZDqzybE', 2, '24', 'e6a183e88ab1e88a82f09f8cb8e68aa5e5908de585a5e58fa3f09f8cb8e5ae9de5ae9d', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQHrlCianCQTeYKAESBicicA3mJCwfaAr68uF18uyBYE4nNpM8peqUVLP68MgHKvZAn2bLzKajDf9zhq/0', 'efbc81', '7638291352', '2', 2, 0, 0, 1463579926, 'rx0p', '13076206677', 0, 2, 'weixin', '宝宝'),
(65, 'oeYLUvopFdxgJ1962gAb-5g8Kc8o', 2, '', 'e5bca0e4bc9ae69996', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELHO06NKibkz4k8yJYBaicialH7KQIQ5DTNLnN9OuLKRvibNyQxpbQgicEfZIgGwnd8hv4sLKdb950PJXg/0', NULL, '6068895806', '1', 0, 0, 0, 1456896444, 'o97q', '11111111111', 0, NULL, 'weixin', 'tesr'),
(66, 'oeYLUvpecdwnBP7XxZTGXs9VbL24', 2, '', 'e790aae790aa', 'http://wx.qlogo.cn/mmopen/uI5pczeERTZoJjscTFNEQ646stq3qyodGlmReumH6UribvTyE7pKkgVM8DibFJgPibSQBkwNxFwcFJJnHrr217SEA/0', NULL, '9339938595', '0', 0, 0, 0, 1456903742, 'oc5u', '18101679821', 0, NULL, 'weixin', '琪琪'),
(610, 'oeYLUvsPPs85_6K3e01jJp3YdGxE', 2, '', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 'e59ca8e4b88de59ca8', '7990418405', '1', 2, 0, 0, 1464004688, '5r4l', '13636363636', 0, NULL, 'weixin', '张飞'),
(514, 'oeYLUvhvMxzQ6lYq9Hj-uYGd295g', 2, '', '46694669e4b88de59083e7b396', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIia47UeNLmdofQxFAIT7yiaLQoWZfJ9b8EkyZFNm4EO8MkswHaj5FNLUs6ic1ajclCE2FcPUgo62kfw/0', 'e68891e59ca8e78eb0e59cba', '3978894255', '2', 2, 0, 0, 1463579922, '0y0s', '18633065291', 0, 2, 'weixin', 'fenn'),
(82, 'oeYLUvjmZ47yiFFg1mcVnvFBCcvw', 2, '27', 'e4bba320e68890e58d8e', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQJenSMibu86ssUj21EXPGroHmB8LZnPvo5hmZwPGEjaibSuOdh71JyuQMVIPrux4RT3f9HbiaHE5unr/0', NULL, '6212509869', '1', 0, 0, 0, 1457334727, 'zmpq', '13249065328', 0, NULL, 'weixin', '测试'),
(71, 'oeYLUvgHsfG3HprJH82TSweEBx8g', 2, '', 'e4b990e4b990e4b99de99bb6e5908e', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQCmRz0LYpiczF4Aia2TwzzkLajOEBZRozqjFiaMI2m3CpHcfTIOwg2DoM58py3YIUZFeU8iaS9xW6abA/0', NULL, '5348800943', '1', 0, 0, 0, 1456976013, 'w3x0', '18700491418', 0, NULL, 'weixin', ''),
(73, 'oeYLUvklNSOwiZLs8Rf7ucwzT730', 2, '', 'e9a1bee5a588e789b9', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Uj3eCRibJ6hL8oL4Ohc31w5zpVGCNXb7FKYSib9iaCBoDibNYHiac4OC6iaKEr2zuI3mEaGmmibbk0zLOiazNIHdRGXEGr/0', NULL, '469965153', '2', 0, 0, 0, 1457001234, 'l8nj', '46794325165', 0, NULL, 'weixin', '顾心怡'),
(76, 'oeYLUvkyFdnGaRV1StEugm7cLnkA', 2, '23', 'e69da5e7949f', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv5tFOsr27kmNicCxL7hXOqAAeXLqicVUqmpNGS3M4LTrdCdEtM7yTNia8jN3YwxDwPBV8rzKshzpicTT2doicbZXdS6U/0', NULL, '3242817915', '1', 0, 0, 0, 1457060676, 'stez', '13638162222', 0, NULL, 'weixin', '周升'),
(77, 'oeYLUvqHDfiP_k44SAWC-jE4Tczw', 2, '', '434a20e383bee284a1', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1nYfZjafHVLejriaIgGoLJx1UL123yQ32YKmC2TKtsiaBdwUVIya2cgbbhjC4fncjjU5QAA5pat8pb/0', NULL, '256361265', '1', 0, 0, 0, 1457150347, 'ymr6', '15665429630', 0, NULL, 'weixin', '陈杰'),
(78, 'oeYLUvu2OwGj_U2S_8pWfg4BHmp4', 2, '', 'e6b885e9a699e69ca8', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5CLp3z6TiabpqhNnaVlhGFZFzZBPWSP9pjibIbKJPopa9Ddl9z65beVZ20Wyev57AKiaE6yeWLqtCiag/0', 'e4b88ae5a299', '5945592651', '2', 2, 0, 0, 1463562842, 'nahi', '15865698568', 0, 2, 'weixin', '来'),
(121, 'oeYLUvuXsRDlhfQG36pmuX9YdpE4', 2, '', '613030303031e5a49ae782b9e8a7a6e691b8e5b18fe5ae9ae588b620e98592e5ba97e79bb4e692ad', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCXSR1nibCibaJTT0Bw7QrWeuvgnrNCNgcfbYGJZarJibnSic5HN9oMSHS4aH8v0cSEicwksYq3MTMxqTQ/0', NULL, '6507146151', '1', 0, 0, 0, 1457956201, 'r2rq', '11111111111', 0, NULL, 'weixin', 'YY'),
(96, 'oeYLUvsO06o5JMqiBIwBiaWv-dzs', 2, '', 'e6988ee69c88', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK7nEicuNqKNfCAfpfX2ib6YF1FIpcNvtia9Kd5fd561jP8g8Ys0b3bku136oN0pFxkpgatHwTrXice4g/0', 'e68abde5a596', '7160318667', '1', 1, 0, 0, 1463621518, 'ugps', '13555555555', 1, 1, 'weixin', '熊'),
(97, 'oeYLUvg3ZKeyxbYY94fn86rA0jtU', 2, '', 'e5b08fe882a5', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfbl1W8yUAw5ErmJHMACZ4IOeichUhLBcanfraeSIDibvpiaRkjYDvv6Y58h6ILo94FnibcJKOPKejFfY/0', '此消息为图片！', '3641501831', '1', 2, 0, 0, 1463562847, '59q1', '15000000000', 0, 2, 'weixin', 'jack'),
(287, 'oeYLUvjmhW7jqz5zEkQjXTCdnIFc', 2, '', 'e4bb8ae889af20f09f87a8f09f87b3', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAZibJTgEwmj4f8QXBueX2hJFegYjFRsz7ibhbE3uIQUVdPW6s7fKDoQ0WMSKVkUCZf9nUybHHAJG3Q/0', NULL, '9911887189', '1', 0, 0, 0, 1460373209, 'ldzh', '13847025123', 0, NULL, 'weixin', '王金良'),
(99, 'oeYLUvq6qwvY1GFwe4tG_hKec488', 2, '', 'e6818be6818be6989fe8beb0', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv5FaaGVYnk4dAjiaaI65NvicSO3gwialflCw5I4YW5vwANkibYIR5WsmE0So71Q8jPDF7ZbZYcr4f6CDw/0', NULL, '4645554439', '1', 0, 0, 0, 1457677112, 'squ9', '18956782345', 0, NULL, 'weixin', 'hhv'),
(100, 'oeYLUvs3-uNCQSvISdfQTEe8i9Bg', 2, '', 'e99ba8e4b8ade6bcabe6ada5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SkiaFojMswqBYCAxp8zJtelBMfyiaO68UdUczHDo4uGRjDRUqgnk6RY6goSGibib5eGKn2VNbgXlCibJGmga2fKgAQF0/0', NULL, '5619335244', '1', 0, 0, 0, 1458046824, 'sifu', '15627009797', 0, NULL, 'weixin', '吴勇新'),
(101, 'oeYLUvrUvJNGiUHnlZdwj_s5UlxY', 2, '', 'e5b195e9b98f', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQPqfDzVibORBZyGDCLUukXCu08sqGKPEW0pXNpiaGH9DQT1ibfQxh5cpicqFkywH3X2hK6IAbthMibegR/0', '20e68b94e6b2b3', '8889857980', '1', 2, 0, 0, 1463393150, '0w8m', '13302764089', 0, 1, 'weixin', '陈'),
(102, 'oeYLUvvxcrL_h7kOY6gADXVrSFmQ', 2, '', 'e4b8bde4b8bde7898c', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Uj3eCRibJ6hLibtLSv7Hzp0pJudlt45ezmibicSJuObHjibds7KL0RQTd4ib03u8GVIvttDAjL2WaYY3UdADUOwBzPjx/0', NULL, '7480745959', '2', 0, 0, 0, 1457706298, '0vp7', '11111111111', 0, NULL, 'weixin', '111'),
(103, 'oeYLUvni2vlHRdf9IeD6PDguhJcQ', 2, '26', '4d', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK8tx5SG8sNWz6LJ1s09yY858ADKYkP1pblVuZlWVu4DJjSfBhOlA7umDMkKuk7qJcwbvtibCUiakXQ/0', NULL, '6965434951', '1', 0, 0, 0, 1457706846, 'pl0l', '22345778910', 0, NULL, 'weixin', '1'),
(288, 'oeYLUviKmhdXrLbRAZ7aEEwh5CPg', 2, '', 'e5ae8ce7be8ee5a99ae7a4bc', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKsqB95GRUVPVOia2uIEHgbCO0PMlVRNL5J6tvOia4BN7WlyuBmdluz1WSlUicyP55Qm5MszoDZvUGkg/0', NULL, '4044283133', '1', 0, 0, 0, 1460373218, 'cnle', '15247073222', 0, NULL, 'weixin', '王宇'),
(108, 'oeYLUvr6u03qEWUyXj-f31kZJEYw', 2, '', 'e5b08fe7a59ee4bb99', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQZwGQ2emkDwYTn05e5ibIG0Diakn6biaKGUibrRdvCl8BJCE33eiaicuribIAziaxibtFe8N9x7JWyO74quqx/0', NULL, '3363926254', '1', 0, 0, 0, 1457754589, 'ysb3', '18641100190', 0, NULL, 'weixin', '王豪'),
(109, 'oeYLUvmsSqA0ZIh9dDq-ZGEZ4Z8k', 2, '', 'e4baaee5ad90e38090e4ba92e88194e7bd91e5b9bfe5918ae38091', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBB15YInN1Ik0GchhVPn0CCDVicpO40t8totU3BPa3TALq7bxs6NmhVVC6r8oJD5LDpjH4PafxVntQ/0', NULL, '6994634876', '1', 0, 0, 0, 1457754736, '7bu2', '15942696565', 0, NULL, 'weixin', '333'),
(110, 'oeYLUviTEzoeeJo_wwI219sTeVyg', 2, '', 'e69d8ee4b887e6ada6', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQeiaf1BtBujYv3gPiadEmUyZbjM4Wku5cd1hKgWld2Ql9CReOTiaQmOSORPXib2icf2tV8otCHjl6JTIm/0', NULL, '1865006345', '1', 0, 0, 0, 1457767358, 'jep6', '18716199088', 0, NULL, 'weixin', '李万武'),
(111, 'oeYLUvnHyj8mGswnu4QUX6qI-AKg', 2, '', '41e696b9e58588e7949f', 'http://wx.qlogo.cn/mmopen/h3ekYhRVGbibNzdliarjeBpibEGYs93BwPsD4M5zKzuzicLIaCS43dia6unS3p6sMb21A1d1ib0Ms0C1HUWJLnMj3vrNl7w5meK53N/0', NULL, '4179505426', '1', 0, 0, 0, 1457793088, 'wxd1', '13500222222', 0, NULL, 'weixin', '方'),
(127, 'oeYLUvj2Yv_gKHqhkg3AcBBLm8us', 2, '', 'e6b1a0', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAAU6z0dq9eicl9CSeicQFO8nxiconZTm7UM84SKygd4yCOJDicKVr4SKC7bAO9I16H9kcFNFEYvD6SLw/0', NULL, '1350847545', '1', 0, 0, 0, 1458046894, '1b0r', '18666338860', 0, NULL, 'weixin', '池池'),
(119, 'oeYLUvtieK4XmSBg_JS89zjEhwss', 2, '', 'e5a4a9e6b6afe59ca8e7babfe78e8be69687e6b88a', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCSTDd7gmykqOZTcV7DkYjnnWImUGdCUcicuFr04ll1NiaFaJeU8Z0LUbaUMib0e2d6o9Yj6F8ssS4QA/0', NULL, '5533879275', '1', 0, 0, 0, 1457924605, 'cbgm', '13289583990', 0, NULL, 'weixin', 'err'),
(120, 'oeYLUvqmco3PGk-bERU_PFbd3qwM', 2, '', 'e794a8e5bf83e7ad89e5be85', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQdURBSpmZa6ehrHPw2A1rUibTltFqXDZFM8ic9GdynHDAx6r6WicE4NZeQEcKlto93ezV4zCXticSoqW/0', NULL, '9801266993', '1', 0, 0, 0, 1457946153, '12oo', '18957512000', 0, NULL, 'weixin', '俞卫良'),
(122, 'oeYLUvpa06jGYs2oYgawmFcIDKlE', 2, '27', 'e69d8ee5ae8fe59bbe', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1ia8Vg8qgN7Wvk7LEf4gVvfbJQL4nc89Kltw0GgcjnqElpyF3AbglVt4zzojACibxAuE9UibfYrz4ce/0', 'e5a4a7e5aeb6e5a5bd', '2028624409', '1', 2, 0, 0, 1463562804, 'qosb', '18321529028', 0, 2, 'weixin', '李宏图'),
(136, 'oeYLUvqNMNOAAhXkxfTeecBQnEKw', 2, '', 'e5b7a6e58fb3', 'http://wx.qlogo.cn/mmopen/69vgJtoLPwwYEFjmLHt41za0QxJECadsw59w7n1Hxx52v1X04V0kibfZBXxkTzIEYibCSicfu78tc5zcR7wqcZnf6y0uiczrPScT/0', NULL, '9618762382', '1', 0, 0, 0, 1458141256, 'waee', '13876567027', 0, NULL, 'weixin', '左右'),
(134, 'oeYLUvuNjPuR7YUCBP4OAq8QWjAo', 2, '', 'e98391e6b4b5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5Hd7pmNzOt196SQ4Z53GdP2C5WeMSwj6iaicElnXXYU3IsfbhInSB9ShLHAlBrLSP2esjjbPMQeQIVF/0', NULL, '1307749274', '1', 0, 0, 0, 1458136182, 'yp2i', '13111111333', 0, NULL, 'weixin', '郑生'),
(123, 'oeYLUvheApIetS66GfkuTqAo-kUU', 2, '', 'e9a39ee9a39e', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCnJecDyzNwuu9zeyXg81UQansxVzG7PZKylxHRvibiaGKSSH8qAw7XRPQTydDpe3ic17l4HrXep2xaw/0', NULL, '5325021093', '1', 0, 0, 0, 1457967829, 'veri', '18681885315', 0, NULL, 'weixin', '孙飞'),
(124, 'oeYLUvqNJazdfERlHkqnXOvQS0gY', 2, '', 'e68ab1e78e89e8978fe5b1b1', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1XeNMnAJRapj0M0eAoMfh4fgSCL1Cd0xQjwLt4qqPrakiaUTibRYZtQoOqHFYWQOLibiaQxzBFI6peRxB3GvWnwzmYF/0', 'e4bda0e5a5bd', '6597287669', '2', 3, 394, 0, 1463579904, 'mnwr', '13907852126', 0, 2, 'weixin', '罗总'),
(129, 'oeYLUvklxhGP2OUqMCmRP1qCe7tw', 2, '', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', NULL, '2503059260', '1', 0, 0, 0, 1458090237, 'en98', '18188118181', 0, NULL, 'weixin', '高翔'),
(130, 'oeYLUvpO110Xr1iULpnEN3Ee8_9A', 2, '', 'e78e8be585b8e6ada6', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1XeNMnAJRapjxEHMn5K4pbDowZEhWEz4Ke2YriaakFXGXFicSYjDnaUZolFUL2mkPO6b1ZHJh2Q51KZHv5xxoUUpD/0', NULL, '4920958708', '1', 0, 0, 0, 1458121689, '4dh9', '13480240707', 0, NULL, 'weixin', '安安'),
(132, 'oeYLUvgTXKBTmgQnZxXL2TZcGLJs', 2, '23', '41e4ba92e88194e6989fe7a9ba20ee94a020ee8194', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfUjibiclwicQwBLmDl4fG4uTGn5Epbk9Jh5eicicalgDILvWEA5z8nhh0Sic0UgP4Pzr7D6ib7vK4wWtZTI/0', NULL, '9956513606', '1', 0, 0, 0, 1458139809, '4qe3', '15210000000', 0, NULL, 'weixin', '好哈哈'),
(164, 'oeYLUvi9Nw39JVWm8t_insyRe-Ww', 2, '26', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', NULL, '8127051542', '1', 0, 0, 0, 1458282537, 'iqni', '', 0, NULL, 'weixin', ''),
(137, 'oeYLUvg0bgMh7_VBK1MpI63tD0hc', 2, '', 'e5a48fe5a4a9e79a84e9a38e', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1WNLCaNliazSrQ4XLhRqTEysCO9TicSDyyuHJJHmeFw9fXJOtsaPibm39EXyHz9ZLGpSdHic3C4ArC9zw/0', 'e5bc80e59cbae5af86e7a081', '4909849180', '1', 1, 0, 0, 1463621531, 'a68h', '18508417006', 0, 1, 'weixin', '东哥'),
(281, 'oeYLUvvJ-1qQS2zAsrSG7DQM5_-o', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'b620', NULL, 0, NULL, 'weixin', NULL),
(292, 'oeYLUvqS-MYT8QvE21DJI7TOT18E', 2, '', '43726f6e6f757320', 'http://wx.qlogo.cn/mmopen/Dibr7ssrDIq8Z7dkPgdyEZOeeONWDNzFoC1LE963De9zTKQAqq8n27xvagic0qXvYn1puZ0qicy55HL0nsGKazjSnPtOdVDF9WR/0', NULL, '3472084616', '1', 0, 0, 0, 1460388456, 'e2ia', '18888888888', 0, NULL, 'weixin', '孙小宝'),
(139, 'oeYLUvuQpDWnw5W-ocMwbY23M6oM', 2, '', '41414141414141e59490e7829ce7bf94', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQTibGibchz9sH5K2VF6yZpnEdAW6ouibRcC33dHpUflibZ2KvCNvwF9ibJKqDIHnzg8zbysN5W3gDicNUQ/0', NULL, '3050063673', '0', 0, 0, 0, 1458185107, 'bb8i', '13578653666', 0, NULL, 'weixin', '唐生'),
(140, 'oeYLUvvJyEZd2BcVkzyNTxFSenhQ', 2, '', 'e59088e58a9be59088e7be8ee58898e5bbbae5889a', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HdOptEYTokicEWIVu8pEC7r8pzuBm2NWh543DianyUord4gP7IZkPvDTnHskjnZeD4KFBb4mByC5Pg/0', NULL, '6945324720', '1', 0, 0, 0, 1458185600, 'vzaq', '18291100921', 0, NULL, 'weixin', '刘建刚'),
(141, 'oeYLUvu1wtxf3WtiSUE_6yUDZBBE', 2, '', '41c2b7e59095e6b2bce6b19fc2b7e59088e58a9be59088e7be8e3138363634333033393533', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAtH8E7xVCKMdXFGc6m81sGaAFNXichNecce2IW4SJTZRbpRBp1E9VDIWuJ2gvhpW4gNib98Vy3qtdicfZS4B31tfDTd57pibic3ZI4/0', NULL, '2574268788', '1', 0, 0, 0, 1458185498, 'ldu0', '18664303953', 0, NULL, 'weixin', '云飞'),
(142, 'oeYLUvhEoYW7Km8a3kSXQI9WqD3w', 2, '', 'e59088e58a9be59088e7be8ee5b08fe7bd97e5bf97e7a5a5e5ad90e5bcb9', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFc6BnIcBWw6kNm9WnZkgibj8p3VWsDf9JAXfGhicHo1NdYBMTGWhQRPS4Rx73yRmAowWbSRGHDACV/0', NULL, '4599648846', '1', 0, 0, 0, 1458200280, '49ai', '18603891927', 0, NULL, 'weixin', '陈苏腾'),
(143, 'oeYLUvjG3_GFbJUgwKN6lj_a7_U0', 2, '', 'e298864de9b9bf', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIgVNcCl1LULwjkjFCtqkeFLbpX1mYHLCGBqF94a7HDuH9AvBzBtBOsoF3yLOQX6kXtwxrY4xkGMg/0', NULL, '6552785488', '2', 0, 0, 0, 1458200435, '7y1a', '18654792597', 0, NULL, 'weixin', '于芳媛'),
(144, 'oeYLUvn9UQWM_IdJhCIQmQQB-GTE', 2, '', 'e59088e58a9be59088e7be8e20e8b5b5e4baae', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SmtLx78H2nEKSdXTH1COB05HEpTtjg6lC9O0RvklWgQVBpJvNoAWjuaV08zHW7dqI5DPqzQ1bv8vGpKHTjWtEKr/0', NULL, '6092436765', '1', 0, 0, 0, 1458200486, 'vkz5', '13999999999', 0, NULL, 'weixin', '赵亮'),
(145, 'oeYLUvj8WD4EARkwsgWj37UarRDI', 2, '26', 'e8b7afe58589', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJRNZibD4BdfQprcuFpjQ8o0ddiaUSX5eq2rYF81qGHNJbicpFmYWlj0P5g3zoFAXSbh86UYtiarTNCbg/0', '31', '1386712275', '1', 2, 0, 0, 1463014009, '75lk', '13928995655', 0, 4, 'weixin', '老路'),
(146, 'oeYLUvm-xa2uOOXLNopRclCZV4pc', 2, '', 'e5bca0e890b1e4b8bd', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1UdA5AHepjkkkYWM8bLDI0q8IsEeqjJaicVTOY6sqKs1ibU8ia3gWGBKb5W1NNgOicHnZeVSl32FODgQwnSmXJnnKNI/0', '此消息为图片！', '6488476372', '2', 2, 0, 0, 1463562843, 'kwm2', '13763331544', 0, 2, 'weixin', '张小姐'),
(147, 'oeYLUviKcDkRbtZax27E3XtwFRpY', 2, '', '4b617965', 'http://wx.qlogo.cn/mmopen/uI5pczeERTZYNusGpibqnaMhHxwPWaq9vJhUq2hZpGQRETc8pxJc8Iegn3qNtgtgPZZr0uCjBNv7jX40z62sodCiboInhQB9iap/0', '77656978696e', '2958089863', '2', 2, 0, 0, 1463542569, 'k918', '13431054228', 0, 1, 'weixin', 'kaye'),
(148, 'oeYLUvs14PnoUpG79Fbagl9ZbnFk', 2, '', '4c216df09f8c9e', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIEqujLiaJg91Qs1tPeox1gDLpDJDBZsgr0ApibOflNrHib2rKeltVJhznaBibsNpibNmYKJZoLbicyPwqw/0', NULL, '9868750940', '2', 0, 0, 0, 1458202714, '3td0', '15918771687', 0, NULL, 'weixin', 'aaa'),
(149, 'oeYLUvouTjgpFn-ZUWh0y8nFc4Ng', 2, '', 'e7aba5e5b78d', 'http://wx.qlogo.cn/mmopen/A62278ykN40OAWKL4hCepfj1kblqrRzc5mcqAOn6PuGaEJgOgQ1t2nt0s1hdfibCMaEwgnP3O13A0uOXeLibp9D1icReEmA0fGn/0', '6a6868', '3150161489', '1', 2, 0, 0, 1463192909, 'iz2w', '13711430754', 0, 1, 'weixin', 'tong'),
(448, 'oeYLUvtnb200kPzJ7kvn58VsJhfE', 2, '', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicuNLOIoBxqv08v9xym0LSX0KWia3ZdzspiaPTPUOLNiahdeVUlYw5Ur8glpxeMLWicLI4NrzURu3KeOT/0', NULL, '1941394969', '1', 0, 0, 0, 1462705634, 'n1yb', '', 0, NULL, 'weixin', ''),
(243, 'oeYLUvu0ZZg2ovxKsIQGgi9tGK4s', 2, '', 'e6a2a6e5b7a5e58e82e5a99ae5ba8620e6b4aa', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI5AslLbam8xXhsHubhU2bt0iaJw6SpeDwd2HRianz7GibiaicDssuaqIySxZwJJQPLUuGicXsPstLhg7QQ/0', 'e4bda0e78c9c', '3485987552', '1', 2, 0, 0, 1463013969, 'dcof', '13040108666', 0, 4, 'weixin', '好的'),
(244, 'oeYLUviZLKIUoMfMX8C7O6GaZG0k', 2, '', 'e6b0b4e69ca8e5b9b4e58d8e', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicnmOX6bxWsZoCHEbLkb73X5tv2Mxos2u3VfFDtT0j4wsQnNuO5jCLrTjgcyufxzVwoWzziaCSjmqG/0', NULL, '2788355013', '1', 0, 0, 0, 1459523666, 'ogpx', '13305376663', 0, NULL, 'weixin', '好肉肉'),
(163, 'oeYLUvpS_U3DOHLESF0i3oInSvsY', 2, '', 'e5b08fe79aaee593a5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcbkJicCGwiarr06F1bJnt9mkZRDMzsBKDHBDW1DXmRfaZFxfRC7r8Wia3F6rWOrenbohwTKZCrK9DL/0', NULL, '3465325689', '1', 0, 0, 0, 1458274641, '4xq7', '', 0, NULL, 'weixin', ''),
(166, 'oeYLUvqWM_84QpEjr5cmJyaiv15s', 2, '', 'e4b990e6988ce7a2a7e6a182e59bade5bca0e69993e99c9e', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5mU6YoksR1NUic5Ho22pTpJGH3BzKWEem1hjWZrDvDqlyv9DgYoGhyKIMdvK4puIYDZll7B62DibVsbpWWXpoiaBmMET725PJoac/0', NULL, '5025514743', '2', 0, 0, 0, 1458353496, '9pt5', '', 0, NULL, 'weixin', ''),
(207, 'oeYLUvlpTSA78ZgAoa1bekFZYgPU', 2, '26', '53616c76657265303030', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5KJNcs7e07YzMD1LQLUlLKv1N2BRQQZwbibE44Wut78DicXebpt5zeShOEvkjZLKIURUULOGcptHTewTwYXcMHQbP6dU3eAjHfc/0', 'e9878de7bdae0a', '951187543', '1', 2, 0, 0, 1463562820, '0a4w', '', 0, 2, 'weixin', ''),
(173, 'oeYLUvrZbDMMyALJr5wpbLtwdK30', 2, '', 'e6829ff09f88b3efb88f', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIEwia4zVxrW2bNibJficbeysTATiceXT4CvHEyuHgKeQwSJu6o0mVWKZg7gIIfTpU6NoQehdPwhV5cQw/0', NULL, '9950648455', '1', 0, 0, 0, 1458544127, 'fuwk', '', 0, NULL, 'weixin', ''),
(170, 'oeYLUvs54_t1y83Ffk3x2Mfes3xI', 2, '', 'e68891e4bbace7949fe69da5e5b0b1e698afe5ada4e78bac', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1X8LOUlaS1VmObuIldOkp5J3v5QCRF2CBbgs6Z9sLicuNLuWW94HTCLibGHOia4B3J4Ff2NatUCe7jibQ7XZ3U51ZoZ/0', NULL, '795901408', '1', 0, 0, 0, 1458539349, 'or8i', '', 0, NULL, 'weixin', ''),
(174, 'oeYLUvrO4RclNJEW5kQn67VzaUXQ', 2, '', 'e682a6', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5KJNcs7e07YzMD1LQLUlLKmfQ3odTUx9b9YzpRL3SXAeicefP6tXH1Vz5DxA8tfIvy5XNXk1DSopmQtSFn8M13gL3p6zD9Pecc/0', NULL, '7843398958', '2', 0, 0, 0, 1458609435, 'hjil', '', 0, NULL, 'weixin', ''),
(232, 'oeYLUvntzErPehs2DEOa_q83qG44', 2, '', 'e88c83e5b29a', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARNe95gIa1OrPllib3TwUfJQicKlha8bruW8tRBibrSV7mf7kibXriafChlcs6IWtTO1xRn7giamIkGQEm/0', NULL, '7800092484', '2', 0, 0, 0, 1459412417, 'wlhx', '', 0, NULL, 'weixin', ''),
(296, 'oeYLUvjZliCKNAMnIxZvSCWKB-wI', 2, '', '53', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKb8G3BicjWibohQicnWoxRcfCCa6Hrf88GCKbmpoRiajojgtT59HUREBf6bznEj7XkzLQlpcRQiab43LA/0', NULL, '6981497975', '1', 0, 0, 0, 1460440353, '1hgs', '', 0, NULL, 'weixin', ''),
(180, 'oeYLUvsB7gJNUFtZ2tA-Pkc54FRI', 2, '', 'e5b881e88194e585a8e79083e280a2e59586e5ada6e999a2', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYomdeMtjZTd4BbPdGTUoaPGspD2VAI97wOm0vdibIx4AyiaPwgoHN4RwMGz284X8YtPQYHaZ02ofC93e91as4nQJ/0', '31', '6263630137', '1', 2, 0, 0, 1462593352, 'df7k', '', 0, 1, 'weixin', ''),
(515, 'oeYLUvjH1LjcmwMajIq5wbpJ4lL8', 2, '', '686f6c64206661737420746f20666f766572', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicmK23ZVV0f9Ohn4fKhHPxoTdfdEHkckwagibSI7w7m2pyzL7Miak9zLKWKmbkLq1Mnib2ibUgRKqiaYvs/0', NULL, '775714191', '1', 0, 0, 0, 1463478997, 'ytqc', '13185740014', 0, NULL, 'weixin', '陈材'),
(352, 'oeYLUvuws0PbCYgk3-WDbr0osMRg', 2, '', 'e6b1aae6b48b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCGFq9ia8FuOJMo0d9lLz8yMSzdwj5atC8fiaB8mibbHObfgjKAyX1Fic2h4Cuexd2aic9y6Zj9cgicibMQw/0', '此消息为图片！', '7701939859', '1', 2, 0, 0, 1463562835, 'hgda', '18667854401', 0, 2, 'weixin', '汪利华'),
(184, 'oeYLUvgp8GeY_1zUVCYGv5PyJ6p8', 2, '', 'e9bb84e99baae9a39e', 'http://wx.qlogo.cn/mmopen/bbFDjtT9hT3JgHSvE6cj4DzXBibBw5wvAdhe9yFLkyUDNDaSycOIY0NpupR3xqYr3xa0UlSd6ur5fuhqgUuSVswy9Vym2fV9ib/0', NULL, '1833025064', '2', 0, 0, 0, 1458875636, '7s4b', '', 0, NULL, 'weixin', ''),
(185, 'oeYLUvlHKfYzJJj6pVdx5o4qwxBw', 2, '', '4130e29ca8e58898e5b9bfe29ca8', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIDwxVKEuHyVUGknUEMkur7TicQrPTeFuVgwiatOic2O7icwk99mx9PjsuVnicYL4NgQq3w08IAHw8OYKA/0', NULL, '5272304213', '1', 0, 0, 0, 1458901843, 'c2g1', '', 0, NULL, 'weixin', ''),
(201, 'oeYLUvkS0y1UdL8T2nbajwhM0-2A', 2, '', '41e6bcabe6ada5e4ba91e7abaf41efbc88e5a79ae78e89e5bcbaefbc89', 'http://wx.qlogo.cn/mmopen/uI5pczeERTbrr9iccZGPaiaNO9pMDyOGiaoz3pwX6Ylib04t3jvIX55VbDLfhePiaibxxPqETDdT8bL6Kr2iazchY6JlQ/0', NULL, '6237534103', '1', 0, 0, 0, 1459078444, 'rnng', '', 0, NULL, 'weixin', ''),
(189, 'oeYLUvrOn4PuIn7ikYdKK235fS38', 2, '', '7869786967616d6573', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQV1Q4shuNwTfatdb3KYYoaayzmsKRoZ48LUPmaNibPZ3VFdjKlBbJlLicp5HXfh4rl1hr4XKH6GOx2/0', NULL, '2689333934', '0', 0, 0, 0, 1458969417, 'vqjz', '', 0, NULL, 'weixin', ''),
(192, 'oeYLUvjzLK0mYS4rbIZRGO8I--FU', 2, '', 'e5bdaa', 'http://wx.qlogo.cn/mmopen/nnPYsicXP1K3W7vYlcpgAL492cZaG33caSXhO6sIWqgcic4RuiaZ4v4nJoVPvz5PILdg5sMpYSWGURg4xoYABNc1cmeTicxQSrzq/0', 'e6b58be8af95', '4661504177', '1', 2, 0, 0, 1463562840, 'bfiw', '', 0, 2, 'weixin', ''),
(193, 'oeYLUvhEcT412CiE1j4ryuenMwIw', 2, '', 'e680aae59296', 'http://wx.qlogo.cn/mmopen/uI5pczeERTZ1lUpIQlIy73q40bzCicSLwiaDsfNcNIdMLicSjJficwrqt9sG9GU7iaTWXMG8dLpQPZF3q7DN4lTrBng/0', 'e4b88ae5a299', '2959110826', '1', 2, 0, 0, 1463393154, '12o5', '', 0, 1, 'weixin', ''),
(195, 'oeYLUvnQxIXcx5BMXiYo9hv8Gzi0', 2, '', '6363', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HeVicibF3icWuKHtsUYrdy0rkPvULLOEsMPtNEwD7fWDicYJnmicyBVZOVGBicdQkN6s3ibM2YR9yxqib565/0', NULL, '7136531127', '1', 0, 0, 0, 1458991716, 'g7a4', '', 0, NULL, 'weixin', ''),
(200, 'oeYLUvjB28elvRJ3PXyi1Xbh8ZC4', 2, '', 'e58d97e998b3e78e89e99b95', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1vH9AYILIjBXia5d6BLu4EPz7O6NoibCPpSFicSgDibuXbJKY391iatjp0cdXqQ6bw799hcQWIFygCVicia/0', 'e4b88ae5a299', '222434810', '1', 2, 0, 0, 1463013994, 'mn5i', '', 0, 4, 'weixin', ''),
(202, 'oeYLUvlr-k_kimyRumxrI_4xbSpw', 2, '', 'e4bf9ee59cb3e8be89', 'http://wx.qlogo.cn/mmopen/uI5pczeERTblLH8kdxFgD2iaYHF8K4kOG6dbjMOlRMWjRmuibBbCQdPPUQMvWsia4XNlGRYnYUIvop9MLd5cNglzg/0', NULL, '6879043003', '1', 0, 0, 0, 1459131445, '8937', '', 0, NULL, 'weixin', ''),
(290, 'oeYLUvm9xjlPAme580foVhUQKIH4', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '2ryk', NULL, 0, NULL, 'weixin', NULL),
(211, 'oeYLUvujugI5z99VDrOWTYLnX4e8', 2, '', 'e698a5e5a48fe7a78be586ac', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAvBPd7bEZoS8HOpcWXHib0CdYKazjkfZ9wv8BSRu1vTeFgHDt5WRB26ibcqvic3fn6ic0ibWqN1noovww/0', NULL, '7051915343', '2', 0, 0, 0, 1459205166, 'mn7q', '', 0, NULL, 'weixin', ''),
(215, 'oeYLUvsD0pCzTnG1dCWXM8qubQX4', 2, '', '4130e89c97e7899be4b99fe698afe7899bf09fa494e6b19fe6958f', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5mU6YoksR1NUic5Ho22pTpJfkyprfs0RAyjM8VQ1ZzumBOVUlgriaCBibJVbCuS8ngoYfyqo1fBTQRRvNFMWvFgWglkSIcq6YLNs/0', NULL, '6067776177', '1', 0, 0, 0, 1459242678, 'z4q3', '', 0, NULL, 'weixin', ''),
(230, 'oeYLUvo-F6zRTNqaFJVRKfPa8nC0', 2, '', '626f6266616e', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwATuOJQAIA9RZpM9LOqr4YenEic8EhcllziaeF6gVLfyoQhEIYTjhJ3LzJJPoSw46iayvPtF1Im3kwY1/0', NULL, '3239038519', '1', 0, 0, 0, 1459407783, 'us0x', '', 0, NULL, 'weixin', ''),
(252, 'oeYLUvi5h299WJX3tBS1gSSuvzdI', 2, '', 'e68bbee5bf86', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKyBEYqpOmJiaPicOOnSBdBeKx03bNxq2ggPr33tyHBwptIWrXLT9ichLaITic3VU1NceoFialje69zcjQ/0', NULL, '240571043', '1', 0, 0, 0, 1459843311, '00zz', '15088886666', 0, NULL, 'weixin', '小猪'),
(241, 'oeYLUvnQuRQoJ9vnJgqaP6pI8IuU', 2, '', 'f09f94bb4a2d5474747474f09f94bb', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJvTNXegvWeOUADB7iclSLiaib7O3XgQczgxMVndr6Zr28I2vtKxvXLYwvuBiaP8emW8mzy06ophPoduQ/0', '31353535', '4820548917', '2', 2, 0, 0, 1463562810, 'm48u', '13486092000', 0, 2, 'weixin', '唐佳婕'),
(220, 'oeYLUvpYZu-9nhBQlWgMRmy88aKk', 2, '', 'e5a4a7e883a1e5ad90', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCEElOgC9hVH634s2MZvz2eAQQcsAw5mwvvKzUoAV8oHWwWR4QkC1At4GlHT5lKjeUJxsylHictVEg/0', NULL, '1404742277', '1', 0, 0, 0, 1459337704, '8hs4', '', 0, NULL, 'weixin', ''),
(224, 'oeYLUviUMHUYDKFAMxyl-sKdJIwE', 2, '26', 'e5be98e58fa5e4b98be7a59ee7bda9e79d80e59387e591a2', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARMMzVoMdwbOVwxHEXMJIVjbDwmWXde3jyicaL7ydU9SibwnzmTOEp5fICvRpWXJstSeIyOh89icT5K/0', NULL, '1701767829', '1', 0, 0, 0, 1459342469, 'ar42', '', 0, NULL, 'weixin', ''),
(231, 'oeYLUvl4VQSXcOSDK2SIcrWyUiTU', 2, '', 'e88396e5ad90', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulRQyFPao1mc0lWaZAIpzb8SGC4ibygORYNtDaaA8GCNpjics4Jj3ic6LiaJTI5ZGLw5Bue9rfWvl2D4e/0', NULL, '4478171824', '1', 0, 0, 0, 1459412399, 't8pe', '', 0, NULL, 'weixin', ''),
(234, 'oeYLUviJFLjgP4inFwNTO6K5YrZI', 2, '', '3eefbd9e3c', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO29l3XR8G0cNSKQscQ4G45iba9HcbshSmQljHIytOOkYoEicI5wIvSbNibhyxzPZWygvqric1SfUsceow/0', NULL, '2521343082', '1', 0, 0, 0, 1459430593, '8g3n', '', 0, NULL, 'weixin', ''),
(235, 'oeYLUvvk3eNt2DB_7JmL6wHhGPIA', 2, '', 'e696b0e6a2a6e683b3e69599e882b2e8a281e88081e5b888', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVtADSRS4bKrD1T29UvKSJ0nTJWn6hpFFTicX6YuwgAwSSoJCwoLKHrSBM7wxj856dibiaua7vmxsvXf/0', NULL, '2736479968', '1', 0, 0, 0, 1459444974, 'jrvl', '', 0, NULL, 'weixin', ''),
(245, 'oeYLUvlQl4vLBF-8Op1-AM8CcoKs', 2, '', 'e9a39ee99baae8bf9ee5a4a9e5b084e799bde9b9bf', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAZzyRr6Jic3LuX23hVMMTNUx1264mm0BvSKPH68p7j3a74DjXHLEXgTmHYd5oibzGOKjlcibFsFULRB/0', NULL, '7701933592', '2', 0, 0, 0, 1459523686, 'vkpk', '13905363333', 0, NULL, 'weixin', '红楼梦'),
(258, 'oeYLUvh9PT5AFehBe_qt6EWBUyrE', 2, '', 'e5bca0e69eabe6988e', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8GYaGjWMB853gGS4Eeb8tozSSG2Iic3FO1Q3UFiavLFjLdnW0hBHk3eDcX2jTXYzcgd8HUvHjzfZ2Z4ibp3Xg7swI/0', '2f3a3a292f3a3a292f3a3a29', '5736215823', '1', 2, 0, 0, 1462331030, 'heqk', '13800138000', 0, 1, 'weixin', '张家界'),
(253, 'oeYLUviEWLJEtZcSKFfDdKgWTRGA', 2, '', 'e78e8be8a18de9b98f', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM63Uk02TPErTaPEUzQMVRIDlCaA0PFZiagoT30cqdMVh68saRwbCic361LR0me732jpSWbMW98mk0Ag/0', NULL, '4465433986', '1', 0, 0, 0, 1459855150, 'qwxw', '18505351816', 0, NULL, 'weixin', '王鹏'),
(276, 'oeYLUvoYeiNzpjjUXBAu6p7FqnSM', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'y7n8', NULL, 0, NULL, 'weixin', NULL),
(256, 'oeYLUvjMP2Gz72Kebzr1_9a5ApiQ', 2, '', 'e88bb1e99b84e79a84e9bb8ee6988e', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKmHbNjVwVEs9gLOD9RjLiamr4JYdiaTN2QohRuh5elMOuibJiaO1OYqOqrRCOH6xo3V8Lu8IGo6G1R2Q/0', NULL, '9670203362', '1', 0, 0, 0, 1459922535, 'oaqe', '15211112233', 0, NULL, 'weixin', '微信'),
(262, 'oeYLUvgfXI1ULQcTcQ5p3JevFNH0', 2, '26', 'e7a8bbe88ab1e9a699', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicwBHOib00Bo0cD2qoHUsGrr1rG3R0dFkA9c7ibSMUH0PzKFWWL06Pc2qlia43Vicn98cuFgJorqGCicKiaR8w3Wvq6Qq/0', 'e68ba8e6b2b3', '3584664139', '1', 2, 0, 0, 1463460305, 'jx0b', '15899883942', 0, 2, 'weixin', '欧阳'),
(277, 'oeYLUvsRD6dbM6ipA0gHHs5OH0JY', 1, '25', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'xy7m', NULL, 0, NULL, 'weixin', NULL),
(422, 'oeYLUvuHArRYydc4xXWQrDv79eeo', 2, '', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', '此消息为图片！', '3853483998', '1', 2, 0, 0, 1463562828, 'hkj5', '', 0, 2, 'weixin', ''),
(268, 'oeYLUvgto8C8DVIgQHDC1Z23Cj9c', 2, '', 'e5938ee591a6efbc8ce4b88de99499', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvictib0rjAI1v6M1pYic67WmIUoQXzv1NnPDVSCiblUYoSrQIncOQOvZxicJICXKuPEAq434cxlL4ytPT3/0', 'e68abde5a596', '2563358276', '1', 2, 0, 0, 1463460265, 'm0nl', '18911223344', 0, 1, 'weixin', '测试'),
(269, 'oeYLUvjqsjwaiLshuj71gNFmL2f0', 2, '', 'e79b90e59f8ee5a688e5a688e59c8840e6b581e59f9f', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5dcA0prCxkPthMFqwvZu942hXfQwT6PiauMEk9C8q0EpaMXib998NQGaqVmDuoIeiaia1n8ibtJ9kYrdQ/0', '此消息为图片！', '739791770', '1', 2, 0, 0, 1463579906, 'l0q4', '13377778888', 0, 2, 'weixin', 'Kkkk'),
(298, 'oeYLUvu4L3b-xKYW6OIlpXot_sz0', 2, '', '412020e2999ae3829b20e797b4e7bca0e381ba', 'http://wx.qlogo.cn/mmopen/mRKiabiat96SghTLTGaFnUIIeIibhtIDiaTicxv7r8njxj22IJiaFYfHhdYb3ic1TL42w0xAwkOOM7TjXhTgE7g083zoM1dOmd0sZ3b/0', NULL, '989404843', '1', 0, 0, 0, 1460465015, 'iwwe', '', 0, NULL, 'weixin', ''),
(303, 'oThdJuN9Sw7H20kLwS0I3l2YUAQM', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'znf6', NULL, 0, NULL, 'weixin', NULL),
(311, 'oeYLUvoAW89UbapU6YzqdUPTQD00', 2, '26', 'e88fa9e68f90', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO12f1NibxJwTbTMFdJXrAZHbUpbebuaicWeTmiciccKNQjFfkiaib6vLVXOjqZXYHdesVGyw8y4mDWv4zJicaQicb1T47YS/0', '此消息为图片！', '8033543288', '2', 2, 0, 0, 1463460272, 'fi3b', '', 0, 1, 'weixin', ''),
(340, 'oeYLUvm03uB0gvuw1Oyek-n_zeAg', 2, '26', 'e68891e58fabe8b4bae5bbbae69c8b40', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAiadNUbStLK2Eqia1DvfK8DpHSZMic102kRfA1SpruEao9h8m7s7kRWXSswJOgFZvmkvcKDW7oyHvsw/0', 'e68abde5a596', '8044104736', '1', 2, 0, 0, 1462796190, 'zsz6', '13143021496', 0, 1, 'weixin', '贺建朋'),
(312, 'oeYLUvu-E6KXiULYeKwYtklg0H_Q', 2, '', 'e5b08fe8b4a4', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulVSh2trEVbCMFC0ojKwtyC9V1gFztbVZ7iaCMnkoT9uRjyJt468icaaOlxO1TMrvM0ZytVEffFVU4I/0', NULL, '8742098953', '1', 0, 0, 0, 1460527239, 'rqyf', '', 0, NULL, 'weixin', ''),
(314, 'oeYLUviEofP1dBtt4gEIOKIqxIT0', 2, '', 'e6a087', 'http://wx.qlogo.cn/mmopen/XYrRG5UShDfXGjaZEWRVu5eF90VyvqQ4BicdmlZibMBJKkibmohkfkgb3oUiahqtcbeDRGvo6AANOMw9EFODAJOLiaTJ7BPHCcjxE/0', NULL, '4896630678', '1', 0, 0, 0, 1460532930, '9gv6', '', 0, NULL, 'weixin', ''),
(330, 'oeYLUvnuuJHohlbcO67oMSA0wo2M', 2, '23', 'e580aae6a5b7e6b787', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicDWOBbibNkb7RFNmeKDXiaql8ic4aj6Z6C273Xg9ehCevib7UDUgFuTnZYyecgxeyI7BwnkjdrWODrA2efgeQWibmHX/0', NULL, '1230705460', '1', 0, 0, 0, 1460619932, 'hu4k', '', 0, NULL, 'weixin', ''),
(318, 'oeYLUvqK6U3yRaLMQ5GT1ulHaDvY', 2, '', 'e4bfa1e5b7a2e7bd91e7bb9cefbd9ee6a281e4b89ae6b3a234303038383537373738', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicq4ZYUa9ibxa165AXv1swiaAPKzOvL4MpoNAHOkvhLMbN1OFLVX2GPN9wlfMibb6tZwJyhiaqK7Gk7Bx/0', 'e7adbee588b0', '5369581388', '1', 2, 0, 0, 1463562838, '8sj6', '', 0, 2, 'weixin', ''),
(331, 'oeYLUviZnjdwh8KVTVd-eGNiROBg', 2, '', 'e69d8ee5a89c', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgibGjwxUiceb5vKcIDD9KIYOqytfdPVOtcXNMPsKbibvwudq3FNIlAbM95Ws4AwiaTRdsibEkaP7sZcYsaAxCvGdGBWC/0', 'e59ca8e7babf', '973082360', '2', 2, 0, 0, 1462180916, '7zxe', '', 0, 1, 'weixin', ''),
(332, 'oeYLUvrvqLA0g-vV6kp7tX4L9di4', 2, '', '5269636be7b485', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTu6KVyWCeE4C6VMlMjAl70FItdCIdvSV8zoLgo7pc1fp2TTHOLPNtwIFKU1UYaIBcbdKibrVOc4k/0', 'e8bea3e6a492', '3173966619', '1', 2, 0, 0, 1462610290, '48j3', '', 0, 1, 'weixin', ''),
(334, 'oeYLUvqfZ-9x1KUFsh4j5fB-FPuo', 2, '', 'e5beaee5b09a', 'http://wx.qlogo.cn/mmopen/XYrRG5UShDdjSpeK3WvjzWC5WN9AcZCuIHMrlo8WHB464q16dwgHoyWwXSPykQGwkAUKWc9V9vsGgDPFOQaQVw/0', NULL, '3095107758', '1', 0, 0, 0, 1460644128, '1u16', '', 0, NULL, 'weixin', ''),
(335, 'oeYLUvmn4xOEKBJ7M0_YoFGsb88U', 2, '', '41e78e89e8828ce8bda9e697a0e992a2e59c88e69687e883b8', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEISnA2IqRwzDQiaA0lCFYo5z3BRkLGhkobX4Nqeqg2a5dMic4phttguFwuMPvG03I7icicdWSn7GYmDtA/0', NULL, '8071909311', '2', 0, 0, 0, 1460644665, 'gmu4', '', 0, NULL, 'weixin', ''),
(337, 'oeYLUvuudW3uOspKW8Rb_b5bzPTA', 2, '', 'e69f90e4ba9be696b9e99da2e5be88e58aaae58a9b20f09f92a6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO15zLA20ucLOFkO3YDjqfIazokRAVnRosh27ruDVY1Ze28Mx8hSaqOxFOic5AjAPRP6tcFXRSQ7BOO7EUltZMLlg/0', NULL, '5146688694', '2', 0, 0, 0, 1460804912, 'xrix', '', 0, NULL, 'weixin', ''),
(338, 'oAY6xv0jaHJRL8m-TMI-60-BNWHc', 2, '', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', NULL, '2554213056', '1', 0, 0, 0, 1460897151, 's5df', '', 0, NULL, 'weixin', ''),
(339, 'oAY6xvwaPvLG6u4Vv8ANeut5eGIc', 2, '', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'e69187e4b880e69187', '9833587804', '1', 2, 0, 0, 1463579920, 'uutb', '', 0, 2, 'weixin', ''),
(341, 'oeYLUvrc5UNG7Ekr7tILHbzp5_SA', 2, '', 'e7a38ae4b88de7b4af', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARkPdicib4lFaAbtGytDmkamTE9icMMS7oibKbHp3mibTug4pyX5icL9rcNaB04VPcWouXtxjE9Dn9IF9A/0', 'e69187e4b880e69187', '5573925046', '1', 2, 0, 0, 1462852131, '1v2i', '13221504959', 0, 1, 'weixin', '陶磊磊'),
(342, 'oeYLUvopn2KEAmuY808IEj2Xd6fc', 2, '', 'f09f92afe78e8be68e8ce69f9ce284a2', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELpxOnNUVibZEstIOOWsmEk2QQeb5yzXoLSaujHxLDWiaXqHO3LtJoGMKF2cxfg3HBM8QKjjrt1fYCw/0', NULL, '9141914099', '1', 0, 0, 0, 1461028485, 'x4jx', '15568263389', 0, NULL, 'weixin', '耀庆'),
(343, 'oeYLUvlQRTl39pMURV8xcicYDAZ0', 2, '', '466f72657374', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAccJuvbS5SXwufl7eTYrTvEgI7LdPvV4QInQvlx1ibslhDJxAxWzxa24SXyjILlSDTPFQPUshamDT/0', NULL, '9311914386', '1', 0, 0, 0, 1461028572, 'bevc', '18611112222', 0, NULL, 'weixin', '森林'),
(344, 'oeYLUvkbGAwod9Tci75XiI-d2dY0', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '2hx3', NULL, 0, NULL, 'weixin', NULL),
(346, 'oeYLUvjffvc71wQTkzh179GkjOTc', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '4mgy', NULL, 0, NULL, 'weixin', NULL),
(349, 'oeYLUvisgjN7W6AMJ-5G_OTIYmds', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'lorz', NULL, 0, NULL, 'weixin', NULL),
(449, 'oeYLUvgG3r5PLwINHmNPTEP7TPM0', 2, '', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', NULL, '1199473645', '1', 0, 0, 0, 1462717654, 'wxt5', '', 0, NULL, 'weixin', ''),
(355, 'oeYLUvm5zbd5a_qQC-r1PevE5ovE', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'uh5s', NULL, 0, NULL, 'weixin', NULL),
(357, 'oeYLUvqmWdzd-zE2DHKpAQPOPD6E', 2, '', 'e4b89ce585b4e5ad90', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARN2Uibxcia26YP3wEfAPuFRA7OxibqGUy6qD5HgN6rCzYwEa1I2y3v3jJhF1TFia7aAMOtqlCClVRfz/0', NULL, '1725317656', '1', 0, 0, 0, 1461402078, '0wpk', '13913530832', 0, NULL, 'weixin', '顾振兴'),
(358, 'oeYLUvm5y1Va1fIFMR57YCRJ6mdY', 2, '', '42696e672e202020205a69ee8489', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIXhdqGxwg1l6C2ib1Ssw4uXoF41N5JHh5gY0oRqfiavAUAR9qb0589cZsKwRqtVLnZSyxXmXicv2q8g/0', NULL, '8026650363', '1', 0, 0, 0, 1461550708, '63nl', '18714607005', 0, NULL, 'weixin', '夏冰'),
(361, 'oeYLUvv6NRgHiEiFxdz-kVLwWvIE', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'igih', NULL, 0, NULL, 'weixin', NULL),
(363, 'oeYLUvlR_UJvcjn533I04nVGmZCE', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '5aq9', NULL, 0, NULL, 'weixin', NULL),
(366, 'oeYLUvslZBfNIkynaEzn0dvCRLIQ', 2, '', '437269737469616ef09f90b2', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO3kKNUwaexnn7LVv4LBPsOD7MX8GqhBoWf4823BjRBYIiawnRd8mfLYIN4evwwXOH8E3RVWeEKfrzA/0', 'e68b8de68b8de4b990', '7141601414', '1', 2, 0, 0, 1463616465, 'xc6i', '18669765149', 0, 1, 'weixin', '呃呃呃'),
(367, 'oeYLUvqHq3CtM6zJe4jiFztlntZ8', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'urkt', NULL, 0, NULL, 'weixin', NULL),
(370, 'oeYLUvhNYX_-GlDQp9CYNbwpdhqs', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'soxw', NULL, 0, NULL, 'weixin', NULL),
(372, 'oeYLUvopxUQN4_NWZW87EvjdAn80', 2, '', 'e6b290e8afade6b5aee5a3b0', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLD6ppmHR07yh2qWAozP9770WhuBOiaicibiah8eXQjmqroLPFRSbbicFajwGqj1TTowWuC5ypX17Aiam8TA/0', NULL, '1648405488', '1', 0, 0, 0, 1461739710, 'rb6k', '13255566666', 0, NULL, 'weixin', '你的'),
(375, 'oeYLUvpMUW7iib6vMvhgNGQb_JZQ', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'ysdh', NULL, 0, NULL, 'weixin', NULL),
(377, 'oeYLUvjfgmAwvn79YtXiUaAAMV0U', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'y6nx', NULL, 0, NULL, 'weixin', NULL),
(379, 'oeYLUvjPFdPvalGKLU_E5PWJzoPM', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '34ym', NULL, 0, NULL, 'weixin', NULL),
(381, 'oeYLUvn03pcII1BMqApUOzX07qQg', 2, '', '4d722ee6b1a4', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJkcj9AgMk1DI72kPfHW8pPnkfT2LQztmOUuH8HzblzoXCe0DPoEJpqkKkbLDZIfXzkaKDxBXibZicg/0', 'e68b8de68b8de4b990', '9140902154', '1', 2, 0, 0, 1463305755, '98uz', '11111111111', 0, 1, 'weixin', '111'),
(383, 'oeYLUvlW0ppbnJgy84TffEQC5fck', 2, '', 'e5ad99e586a0e794b7', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIQAGd1jZHI4Lch2EskbM9ZEy5M9n883754qVqfynkVVHtepcOyicSVibHrIxicf1qIDWNG7QVcXv3ww/0', NULL, '2814726243', '1', 0, 0, 0, 1461860000, 'su3l', '13322221111', 0, NULL, 'weixin', '你是我'),
(398, 'oeYLUvm4W8RjuH1bSnhQT79xTm3A', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'dmna', NULL, 0, NULL, 'weixin', NULL),
(384, 'oeYLUvuy5dWOvu95LxsNEDxk9o5E', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '27xb', NULL, 0, NULL, 'weixin', NULL),
(385, 'oeYLUvraGj102kgL5gHXSwtQDUtc', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '27gn', NULL, 0, NULL, 'weixin', NULL),
(423, 'oeYLUvrsy_afyrEkq8UaIFdJ65Hg', 2, '', 'e69f9ae5ad90e5a99ae7a4bc2de69cb1e7a88be9a39e', 'http://wx.qlogo.cn/mmopen/XYrRG5UShDcKEDgqAEFWMGj09meVLVHNrHnAM5yMotBJCQ3s4RMSw8HGVsruJhubUet2s8B94LryvibcrQf6PDicT25fpKLeA8/0', NULL, '4845977110', '1', 0, 0, 0, 1462464051, '52fp', '', 0, NULL, 'weixin', ''),
(394, 'oeYLUvjueQGaaVXBLxcCfJh3r_j4', 2, '', 'e891a3e5bf97e9b98f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO3lWGmAYneYiaQicLspl16Y9pqP42ZlUhpmKm7EK2oibMWol7Q0CWTI0vEEAicuL3QMFcc4SztyKqmRw4zn3Kr6CcUY/0', '此消息为图片！', '6360242345', '1', 1, 124, 0, 1464076903, 'sjws', '', 0, 1, 'weixin', ''),
(392, 'oeYLUvuuzlxkGZPbnhKaZhR5tZvM', 2, '', 'e69d8ee99381e5b08fe5b1b1', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBuleqnEIgktpSta8spf04lK3ulCsXxufNc6PGDd2okUQFqlOeQ7sGXjZ18bJZicaCicczKGDo1aSvfdF/0', NULL, '2590737745', '1', 0, 0, 0, 1462240445, '91n1', '', 0, NULL, 'weixin', ''),
(399, 'oeYLUvqQw4qZ5ngh1CBvwKw3YTHQ', 2, '', '413030e6b187e7be8ee5a99ae7a4bce8aebee8aea1e8bdafe4bbb6e9ab98e7bf94', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMibnnawz2jNwVg7BvIX2edibib9iaHJuhWP1yicDlGahdnjPbYGbvVXoaqyhjHR3qOicen5VRoCMmwpAllFz2uOvQ0Cyu/0', 'e68b8de68b8de4b990', '120946010', '1', 2, 0, 0, 1463401438, 'bhme', '', 0, 1, 'weixin', ''),
(400, 'oeYLUvvIKuBG-KeSgtViPC_IBshI', 2, '', 'e7b4abe889b2e6989fe99ba8', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicn5zjEMByAESJ5mJl5wpM4ic6X79HKnpD6FcwhicDWnw1D1eRSDsglwf0X3eEhCl4kDCib9AMUKBBjn/0', NULL, '4135566730', '1', 0, 0, 0, 1462325572, '0j9t', '', 0, NULL, 'weixin', ''),
(401, 'oeYLUvr4MA4xBNno91ybVtt8NGXY', 2, '', 'e7ad96', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8dpdmzQhuGefWibBALPMibQvyQBl6DfdNhELbQSpjHnZqRXxJrZvmqysTPlaAuyQ848h7lIIia2ACza81ibVgsUC72/0', NULL, '7273252761', '1', 0, 0, 0, 1462326230, 'yab0', '', 0, NULL, 'weixin', ''),
(403, 'oeYLUvm99Yje6Smfra64Cvpp0_Gk', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '1vo6', NULL, 0, NULL, 'weixin', NULL),
(404, 'oeYLUvgp44Ep-zCutTi5vShvb5Cc', 2, '', '77687920206e6f626f64792020666967687473', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELxpfP8iaJFoxEdoPPLJzvqKS5tjVpNapiaztSgyPDlxjdJSLV8fUao8ICECPuicf3QwTUbSZ4ntZakg/0', NULL, '705888005', '1', 0, 0, 0, 1462358364, 'zfk3', '', 0, NULL, 'weixin', ''),
(455, 'oeYLUvvwhxU_2C1l8nRJT1HipqmM', 2, '', 'e289a1e3808228e6b8a9e69f94e383bd6f6f6f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAX9eQaMWLNkuoa2jQSFdqicgM88iaPsJiaosavTP55lnOuxpWrW4jhmxyEwPSs7Tyg1B3Enh5TP7n4T/0', NULL, '6532800910', '2', 0, 0, 0, 1462861382, 'ijqs', '', 0, NULL, 'weixin', ''),
(411, 'oeYLUvuu-GQ7huaCoKY8btuOwot8', 2, '', 'e9a39ee7bf94', '', NULL, '5855977833', '0', 0, 0, 0, 1462412350, 'uhed', '', 0, NULL, 'weixin', ''),
(418, 'oeYLUvqXQ135M4phfiKmaWE3LOA4', 2, '', 'e7a0b4e5a4a9', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4B7wXibb2tT0wLKbm9u3nAlrdP0XMMxunwtYKBLSicjaJx9mvkgrTV67z3zmu4kL6h5RRxElbUe1OiaN86ZyhbNV3sTYy6bicaGkc/0', NULL, '7647574319', '1', 0, 0, 0, 1462440099, 'x5jm', '', 0, NULL, 'weixin', ''),
(424, 'oeYLUvv8d_75IkGIBtX7rXni1pcg', 2, '', '4a6f6e', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVrIDfpWYYxCQScic1sP3a7yAr6v8yFeJttANdbAcMgpmOAvbBKia8S8dmm3ILXx0bNv4VfBJagmibFm/0', 'e5b9b8e8bf90e5a4a7e8bdace79b98', '6269337801', '1', 2, 0, 0, 1463579900, 'i2m0', '', 0, 2, 'weixin', ''),
(436, 'oeYLUvpaa97_iuo-hM2lRv5Pk9-U', 2, '', 'e8b685e5b885e3808ce5b185e6b091e7bd912de6b2b9e794b0e7acace4b880e696b0e5aa92e4bd93e3808d', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB6icibDib9ugna13TkQMQicdVU1dnicJ7qFEXhGpp4acE83ibIiaM7rZVRckJ7nkVicibVddVNLe2Hia8icpZog/0', 'e5a4a7e5aeb6e5a5bd', '5855126920', '1', 2, 0, 0, 1463460270, 'e9kr', '', 0, 1, 'weixin', '');
INSERT INTO `weixin_flag` (`id`, `openid`, `flag`, `vote`, `nickname`, `avatar`, `content`, `fakeid`, `sex`, `status`, `othid`, `cjstatu`, `datetime`, `verify`, `phone`, `shady`, `cjgrade`, `fromtype`, `mingzi`) VALUES
(430, 'oeYLUvt8Zf6uXXfmSLm2p0Smrco8', 2, '', 'e69993e5bea1e5b3b0e5b3a6', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiccomtmoAxHDKgrqFkVvLDBqYp2X3x2YNVv3MlAN088bJ8NeM0uiahDGu08mnaW5OaJqtPKQ5pjibgXia9eLOP24zg/0', NULL, '9834254129', '1', 0, 0, 0, 1462526542, '0t93', '', 0, NULL, 'weixin', ''),
(433, 'oeYLUvvHPIUr4EJ6_mKXFTjzG0Ts', 2, '', 'e7899be7899b', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6mibo9v4AIW9pGCdibeYcZKSrEHPGOGcvRqOkC2g4icTGZzUZfaHa9TbuHymicVajD66MxsYGt3jQSUg/0', 'e68b8de68b8de4b990', '713953063', '1', 2, 0, 0, 1463562831, '2v6v', '', 0, 2, 'weixin', ''),
(438, 'oeYLUvgg4IuOtU7FrPnpWAy8Oqu4', 2, '', '', '', NULL, '9569490242', '', 0, 0, 0, 1462585584, 'k0jd', '', 0, NULL, 'weixin', ''),
(439, 'oeYLUvmNtTMZsY6hopouodjTdBg4', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'yxks', NULL, 0, NULL, 'weixin', NULL),
(443, 'oeYLUvmboFldTAxUslbFf5VwzkOE', 2, '', 'e59b8de782b92de6b48be593a5e593a5', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAXaHUyBH14ggiaX2zxf6K8oVkwqIficODQHvYo6pHNKwNLOrFrbnb0hxerdBQoJ4MibBH1zSicCTIqiaZ/0', 'e8b596e69687e6a0bc', '3008934992', '1', 1, 0, 0, 1463713898, '01xa', '', 0, 1, 'weixin', ''),
(445, 'oeYLUvnEG4PuNrpIGGwnq0NWIpX4', 2, '', 'e5b08fe69da8e5bbbae7ab99', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq6SjmWUbA8jqXx6PdaNt5Rs0RLLupplr5YBVvhnssFC9ibEcuuVQ1NBPAAVqh5TzPj0BvB3aswzQ/0', 'e68891e4bbac', '8791727505', '1', 1, 0, 0, 1464076905, '6vpq', '', 0, 1, 'weixin', ''),
(447, 'oeYLUvgLrLldrqi96vhaZImx9UpI', 2, '', 'f09f8694f09f9189f09f889af09f9297', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4bcweIFyGNUBUSTY7wsfkKxJ8HJ4OtGRt4p9vPRTYMX7TcS76xSaciaVmHjZbDXEpKTB0GblplxWw/0', 'e5bc80e5a78b', '6808193095', '2', 2, 0, 0, 1462852108, 'tkfu', '', 0, 1, 'weixin', ''),
(452, 'oeYLUvnydAy76PUNJIMtnxHt-onQ', 2, '', 'f09f9297e788b1e4bda0e5ae9de8b49de29da4efb88fe4b893e4b89ae584bfe7aba5e69184e5bdb1', 'http://wx.qlogo.cn/mmopen/XYrRG5UShDcKEDgqAEFWMLClK2eC7gA1ueuPjdVhRLBxwrzykJdhHwSvz4YprAicELJcJpDX2H39AZkOTebWGgFib8Mb7Gwj08/0', NULL, '9759240883', '1', 0, 0, 0, 1462719494, 've1j', '', 0, NULL, 'weixin', ''),
(453, 'oeYLUvhZgok5nazHHTm3rcLDasHw', 2, '', 'e7839fe4bb94', 'http://wx.qlogo.cn/mmopen/x9qcTpSsSyNo0TlsxhPibKHDzsHQMbxHmglvWQyfwAWnbJkRE0LT1zOUWhhmEqEOJ8VAS77icsfgaLsnASAqtnBYGbCAXlnY5a/0', NULL, '7050575537', '1', 0, 0, 0, 1462783935, 'mi53', '', 0, NULL, 'weixin', ''),
(454, 'oeYLUvlOU2Z3aG4fAHOm8pTZQZFY', 2, '', 'e69d8ee5b08fe9be99', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTqdTluLvCm1ByQ9ficXY1WnlN6jibic951ChKibPQol0z8dnoVvodicSCYfDGfo0Fx8gtkug4Y5YoBJ7/0', 'e794b7e7949fe5a5b3e7949f', '8577674436', '1', 2, 0, 0, 1462852128, '59pq', '', 0, 1, 'weixin', ''),
(456, 'oeYLUvmOVGWugNhm1Oe-wcujixPQ', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 's7xp', NULL, 0, NULL, 'weixin', NULL),
(457, 'oeYLUvtdsBei0vNLdPhhmkNP3sxA', 2, '', 'e5a2a8e4ba91e4b99d', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7JHoicLOEdl5v6IR9gibnhrqKBfWiaGCoQZicib3PdT0dr1HOTljxVb4rCV1mZaibics0gU02MtjPyMkQlg/0', NULL, '5998939161', '0', 0, 0, 0, 1462955055, '2rb7', '', 0, NULL, 'weixin', ''),
(460, 'oeYLUvlnVd1oygagLTSa7ID1e2GY', 2, '', 'e9989ce696b0e59c88417070', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC7ECib7iayChtiblxR2oW5hluuic1PXVc5iaA2vEFzXibs7p8fD5qdkLwmfu1cPVAI95icz2QRRWibicHA9tQ/0', NULL, '3982447048', '1', 0, 0, 0, 1462958753, '0lzc', '', 0, NULL, 'weixin', ''),
(461, 'oeYLUvie_bTjmy2cvIGooji51btE', 2, '', 'e587afe680a1', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicdsESkGTffxhpEZecUKhDNdLIAKDQbLS3aOAvjOXb2TJXBTY2ORZDZWdcwoLq2kSzZM67kc5StgYfqas3KXF3r/0', NULL, '2010543778', '2', 0, 0, 0, 1463016615, 'icyj', '', 0, NULL, 'weixin', ''),
(467, 'oeYLUvvKNCe3rbMEPq6_caWDLbs0', 2, '', 'e999b3e8b685e69687e38082', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8dpdmzQhuGeWsR9dncuqxCicswagK7y91cSuGQEiaholXVicV0VM7zFa8LGF6EXmzunJ1sEZJbVUPx5kJYxoUOTkZ/0', '此消息为图片！', '5595735654', '1', 2, 0, 0, 1463388652, 'n5fv', '', 0, 1, 'weixin', ''),
(471, 'oeYLUvpOamSUnr87ory0pp5nwGc8', 2, '', 'e5b08fe5a4aae998b32048617272792054616d', 'http://wx.qlogo.cn/mmopen/x9qcTpSsSyNo0TlsxhPibKFlOAm8IibtAm6MY4RegAVgSZoBE1fQIW14x3KXFJKhn9sUDaypic9Sn0HmEneHdGVxxsYpMkbjibRT/0', NULL, '2072618526', '1', 0, 0, 0, 1463035684, 'bf01', '', 0, NULL, 'weixin', ''),
(563, 'oeYLUvuCH_CrgOzpYfUuoX7164tg', 2, '', 'e78bace8a18ce88085e29382efb88f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0F1xRfDvn7dCvhpA4deAlNqibp8cI4zQBTg3HblL9OiaoaOHf1pl3VCzruyMaPXW7N47SibwMQTqZ0BORuicE2iayJb/0', NULL, '8459657748', '1', 0, 0, 0, 1463629965, 'qlj4', '18926017205', 0, NULL, 'weixin', '曾萌'),
(474, 'oeYLUvniqvmaLSt9rkA7fjVEquFA', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'yv49', NULL, 0, NULL, 'weixin', NULL),
(475, 'oeYLUvpv4NYFHyHJcbLqJohOQaRQ', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '6jjz', NULL, 0, NULL, 'weixin', NULL),
(477, 'oeYLUvlDgrsXlRAHbzU1W6tKbn20', 2, '', '4141e7bd91e7ab99e5beaee4bfa1e7a88be5ba8fe5bc80e58f91e4bba3e8bf90e890a5', 'http://wx.qlogo.cn/mmopen/UzJPMZHGtibYskuSgt6zQsryzbyjbxSnmLia9f0NgJpj9xAOBm977LhRWyylsPOmSKufiakrE7SxwcSd2Zq8GWFsXRrWVadqFme/0', 'e68abde5a596', '9178796353', '1', 1, 0, 0, 1463621533, 'faqt', '', 0, 1, 'weixin', ''),
(478, 'oeYLUvkLd-l45MAHjGFfAbH4Otds', 2, '', 'e7a7a6e697b6e6988ee69c88', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYcUQic3oHF7jMCDVnJ1vf413GLaxWaNO9Q9Dic6a8OOs9xYfyZFibnXIvW29gh4EibwFVFXBUxGpmtI/0', NULL, '1289501908', '1', 0, 0, 0, 1463192879, 'milf', '', 0, NULL, 'weixin', ''),
(481, 'oeYLUvlJo-AzaUq7FYxthB7QIYtc', 2, '', '436f7264656c6cf09f9192', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxg8TpyKGAzia99icbe94w6uQfdKzrprHOxUVICkjEg63eAsZzQpZdeoOvhMIwKs9ViaUKLMu8JMBicHFWYibVEke2YLDu/0', NULL, '9636414824', '1', 0, 0, 0, 1463207955, 'dllg', '', 0, NULL, 'weixin', ''),
(584, 'oeYLUvv0oXG22bICl457TFPljjXI', 2, '', 'e8a5bfe58c97e5818fe58c97', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLBRvbbJGtkicHGehgqkNpj3cj4JEtr5rdt688HmWRWJtsibLS248NNggOu8tETcFyjGszia5yictI3VibQ/0', NULL, '1893967775', '1', 0, 0, 0, 1463641874, 'fc1g', '18793394132', 0, NULL, 'weixin', '王成'),
(483, 'oeYLUvhah76OEhkzW1xclZdzt1Dw', 2, '', 'e6909ce789b9', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxg9VwmibXPztWQj4AHfkTjnNK6nPGvnNJoJlf0Lzu0nsZaM02ryAvIGgUAV2NdD4Dyg93QXPTd9zlqP4ok97XX7Pg/0', NULL, '9398589082', '1', 0, 0, 0, 1463230003, '6nbp', '', 0, NULL, 'weixin', ''),
(489, 'oeYLUvuw9fQ3vEyXMmJWNaR1JBes', 2, '', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 'f09f9884', '4875552942', '1', 2, 0, 0, 1463460267, 'i5bc', '', 0, 1, 'weixin', ''),
(492, 'oeYLUvudSLqzXl0hsu_wY-T3kVgc', 2, '', 'e59e9a637269f09f8dac', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvictueiaDRnc3Re7ian6azZ5woMPNg4nU60doZ2qhlZhOKGiaEvG67hGGd74rwsmPAIOQIYmbmubTL0XI/0', NULL, '3826071745', '2', 0, 0, 0, 1463367592, 'pu5p', '', 0, NULL, 'weixin', ''),
(494, 'oeYLUvuZCkA5_gRyhblgIocIYVlI', 2, '', 'e79290e5ad90e38082', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAuAk1NmKsoFric08uiah002ZWJguPXaGgTibp3jxZDEnw1u6HEdiaJvVsSMIibd6Pus3sQiaDOYBCcn7EQ/0', '此消息为图片！', '7457635779', '2', 2, 0, 0, 1463542843, 'wqb9', '', 0, 2, 'weixin', ''),
(496, 'oeYLUvlrCmH8cuLdAxF60lIuLjo4', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'io9r', NULL, 0, NULL, 'weixin', NULL),
(499, 'oeYLUvqcQg9ucUO3RrPRya96_pO8', 2, '', 'e5b08fe7baa2e8a28defbd9ee9be99e899bee88289e4b8b2e5a4a7e999a2', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIMhrEDPS59yo6X6ZvsxoWQI5bMUEEFdJJ6dE7l0ibYUTa8f4uicCQeHuX4dFNVWCdrcBlkEfjAtt2Q/0', NULL, '5824401454', '1', 0, 0, 0, 1463393038, '7hts', '15206554444', 0, NULL, 'weixin', '乔俊春'),
(583, 'oeYLUvr0eevM_PI5kz6Vn767-eEo', 2, '', 'e6a38be5ad90e7bd91e7bb9ce9ab98e7abafe5beaee4bfa1e890a5e994802de4bb98e998b3', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLACFfFfgeBHU3fOzLLhicpibWPevnBI3V2VJIKhcUxonlN0eLCJicCvtXtnCl7ib7CvUpV0c25cGYjMnQ/0', '6d6d', '6034102780', '1', 2, 0, 0, 1463707108, '8abr', '18630322367', 0, NULL, 'weixin', '付阳'),
(501, 'oeYLUvmQGVcoC-cHK4HB4gBVHfxA', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'gb7k', NULL, 0, NULL, 'weixin', NULL),
(503, 'oeYLUvqx-dvzKahXH2_KUQIM1F00', 2, '', 'e58da1e5b883e58588e6a3ae', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDicY2RapDGPzwcmf72qzzroOhTAhdJFu63BpjhwiaCDMbFBhqU4veDdJ6CwYQSfLn2NOWAkODy74Ug/0', 'e5a4a7e8a1b0e593a5', '9443951768', '2', 2, 0, 0, 1463458136, 'z49k', '18989898564', 0, NULL, 'weixin', '宿舍'),
(506, 'oeYLUvlzu-lxTP6oIk_srO1UAODI', 2, '', 'e5bab7e78699', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBuldna3qRzNdZJXrKk2cJX7jwMdsPJ0TRQLk870ibric6bQ6ichYKLFO9X6gpNF9IoU3xxJ26PbEtsN9S/0', 'e5a4a7e78e8b', '5223153167', '1', 2, 0, 0, 1463460263, '7c9t', '13315691236', 0, 1, 'weixin', '打印机'),
(511, 'oeYLUvvsfOamhUFED495gAMXkINc', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '72yj', NULL, 0, NULL, 'weixin', NULL),
(540, 'oeYLUvndHIxD2gpnwoTfetPJ5TGM', 2, '26', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 'e98089e7be8e', '2493402390', '2', 2, 0, 0, 1463563222, '1vej', '18876379633', 0, NULL, 'weixin', '庄诗韵'),
(519, 'oeYLUvgkzQdrE401uBoj8FJTTSYs', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'nzas', NULL, 0, NULL, 'weixin', NULL),
(603, 'oeYLUvsyBeqCeMWOl9RLOsVYDjHI', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, '9quz', NULL, 0, NULL, 'weixin', NULL),
(627, 'oeYLUvidpncM65Z9f0tFj0dTxttk', 1, '23', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'wajo', NULL, 0, NULL, 'weixin', NULL),
(533, 'oeYLUvuk7ut8KW1sLWF1h2ue4AaM', 2, '', 'e69da8e5b091', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAbsVmYfkNFY1BsaoBNziaHjGKbfGhW1V0P8lhaPqtbf58yp3ibTtMmIWH5iaiaaias3WQL3qgMb39v9nStg0QR8ictoy8XN3XY5CibFM/0', NULL, '7277003559', '1', 0, 0, 0, 1463555145, '5kgi', '13542369874', 0, NULL, 'weixin', '11'),
(534, 'oeYLUvuvFcDVc6F5bCApuHzq69tk', 2, '', 'e5b08fe58689e5908ce5ada6e38082', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67hzVtS3pvJyllxPRz7yupiafibHgeyLX7HZASXictlIOvXzF6RxqkuWLq9g9f6vT7NEDQibr4HTdw5Vf/0', NULL, '5007377675', '2', 0, 0, 0, 1463555350, 'k5th', '15234090602', 0, NULL, 'weixin', '张煦冉'),
(602, 'oeYLUviRZotJ4L8lULjSuKbNmBD0', 2, '', 'e69d9ce799bee781b5', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAZoWUM9zvSTjZP4c6lVNkJ3Nic9cDsk6BwVA8DKFcgS4bBibcATKq63Jbsf5KZgER3mphAQ2XWibDZw/0', NULL, '8137802186', '2', 0, 0, 0, 1463880472, 'gkw2', '15237360116', 0, NULL, 'weixin', '杜百灵'),
(561, 'oeYLUvrYV5X5c5jtpJm7NfKDi01M', 2, '26', '2048', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMib9Dm2NZzbUdFL0AMOlGHxfDdtpiaKUJPDoNMz2zfn4dTWQ5cquchhw4kfbQ1uSeBeTB2dicTc45CDgmesqtnQPQ3/0', NULL, '1841161697', '1', 0, 0, 0, 1463630036, 'rpdj', '15766592277', 0, NULL, 'weixin', '黄龙'),
(548, 'oeYLUvj8aPwCP8cr2MRgsR42PIqA', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'esx3', NULL, 0, NULL, 'weixin', NULL),
(555, 'oeYLUvt0EvQ5sb9OZm3ShOWciG7A', 2, '', 'e6b4bbe58aa8e6b4bbe58aa8e590a7', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL6ia4giauHOKCnCyMeEOZjh9OBn5hicloPVmTkf5ypxowsgo79ibr6LKR8GRqkqOHyLVsc35wiccdPicpw/0', 'e79c8be4b88de8a781efbc9f', '3044357677', '1', 2, 0, 0, 1463616337, '7buc', '13755555555', 0, NULL, 'weixin', '滚滚滚'),
(579, 'oeYLUvlhehycNF0-BiSuxdWgndR0', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'fzsl', NULL, 0, NULL, 'weixin', NULL),
(577, 'oeYLUvgQS7po9IwBEXrlp0FvmK5Q', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'nq48', NULL, 0, NULL, 'weixin', NULL),
(544, 'oeYLUvtP_jtRXodTuuyoslO5K7kE', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'vt9c', NULL, 0, NULL, 'weixin', NULL),
(549, 'oeYLUvjuIkvRR5W0x3sMRcXVnLrQ', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'rxnj', NULL, 0, NULL, 'weixin', NULL),
(585, 'oeYLUvp1kpZ1iJvw0YaYA_hMij3M', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'ul1r', NULL, 0, NULL, 'weixin', NULL),
(589, 'oeYLUvuQkmyiBZWbmD_hZOV676MI', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'o0qs', NULL, 0, NULL, 'weixin', NULL),
(566, 'oeYLUvibY6CTkYszes_NVe3fe17s', 2, '', 'e5b08fe6a5bc', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5P3dlOfsnXRic1vLfzJyaSLwGYm99DPdgspZ8DJ62picnTxsUGOibzH5eqPsatQhzD6SwjUqWQqeLJhotnBichOSiaY6OkHTePAiciac/0', NULL, '8734175944', '1', 0, 0, 0, 1463630091, 'r4dg', '18675645045', 0, NULL, 'weixin', '周善群'),
(569, 'oeYLUvp1haFU39K1bwaADgZSOFf8', 2, '', '', '', NULL, '9339707003', '', 0, 0, 0, 1463630635, '7s6c', '15368581314', 0, NULL, 'weixin', '早点发'),
(576, 'oeYLUvtbN51vHQ7j_YL3pmzAm8-8', 2, '', 'e5bdbce5b2b8e88ab1e8b0a2', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARSX5hp9XD0VWV0h1ibve4nOT3wK62QU3hzVKsE1MEFebPFfPJgs9YcaeQRkL7YVNwXvCRsjmj2xy/0', NULL, '9930802174', '2', 0, 0, 0, 1463633534, 'rz8u', '17753206815', 0, NULL, 'weixin', '旧梦'),
(593, 'oeYLUvqGZguTflUOrhuEptlR5X_g', 2, '', 'cb87e5b88ce789b9e69e97', 'http://wx.qlogo.cn/mmopen/0zA9whoWunpNCj0lHQlm9gPQDm92Bs2kE77Bxnicrf3BQlxnGc00icvM8iaNGMfblcmvMs1j2W8IIZjs4k7vZZTC1Lhqe4Lz4cj/0', 'e4b88ae5a299', '4037540486', '1', 2, 0, 0, 1463713357, 'gay8', '13555555555', 0, NULL, 'weixin', '九点多吧'),
(588, 'oeYLUvkZxt_YXPUVxIxkNRCa2sRo', 2, '', '4665656c73206c696b6520696e736f6d6e6961c2ba', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCdR0Mzb9fu0H7WdZ4sgt67UhqZR8ozDtIdWRuyYR0kG77QCG1lCnIZebIwDwibQYuee7ls7ezofAg/0', NULL, '5856251408', '1', 0, 0, 0, 1463712940, 'xnuf', '13137758421', 0, NULL, 'weixin', 'nhjg'),
(595, 'oeYLUvqAvOz7CmF0SX2iuq8PzeDE', 2, '', 'e9ab98e9b98f', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicmJdEm1406aCklAEkwibMwjDPnkoniad0M0A8BW3icSAVUXfMmibV6qu8YW8Vb9iaJHWGVAZx7Y7tPPTP/0', NULL, '5954512248', '1', 0, 0, 0, 1463732356, '2d31', '18888888888', 0, NULL, 'weixin', '高鹏'),
(597, 'oeYLUvkrmeZQa5OKjt4tgvelo8OM', 2, '', 'e7a38a', 'http-3A-2F-2Fwx.qlogo.cn-2Fmmopen-2FUJtz2JI4TM8c8Mqr9SBulVgOyr3vjgibdT9knnlHdB65nRR7PXGxZ32GoHtJl7oTQ6tic8YcvtMwZQHAlibV7LZBIUlUjYosWWq-2F0', 'e794b7e7a59ee5a5b3e7a59e', '6666874787', '1', 2, 0, 0, 1463743738, 'g3mv', '13333333333', 0, NULL, 'weixin', '-E5-'),
(612, 'oeYLUvlohfXiR3sT68Dx4sRm_GbA', 2, '', 'e993ade5a881', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6lyMiaWMQDEoFc0lvRNGicsicrZBlXoIWiaz8fl34y5L0uNIRtIyWItIhia9BaqWT3XohzskojfnKqGSw/0', NULL, '6310562119', '1', 0, 0, 0, 1464069141, 'qpgw', '13497875467', 0, NULL, 'weixin', '123'),
(609, 'oeYLUvjGuA_LjX7ebWntxuVzgZvY', 2, '26', 'e99baa', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIjpnceBKmL2jga2iaFhQTJwKZGzj4Lc4ZtjArYKfjXicE0RWZXnH3HYa5NgWO9ar3TDOvO2zRR0XJDeWafZu7ib6rx5Eic2pvQZq4/0', NULL, '3249086020', '2', 0, 0, 0, 1463986212, 'p7kp', '18638287728', 0, NULL, 'weixin', '张雪'),
(628, 'oeYLUvqZfOqNmA0OXhd6yWzOdFcM', 2, '', 'e5b7a6e4b8895a6564f09f91b9', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAanGgicF0Pbat4ibfaDmVATAonKMF5rNgHzly2MRzcuKEAicSkFcDBVc3v4wOdtbFcFcdL5UFrE90slmRDu97WXLiaPlnTuw8W9L0/0', '6c', '3059260869', '1', 2, 0, 0, 1464076833, 'ai05', '18813492120', 0, NULL, 'weixin', 'l三爷'),
(620, 'oeYLUvllREAAAi1wJ1YaIpsiRPnI', 2, '', '62696c6c', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6JfGI0O9D7CdNdBBY0p8nVqHYfzT0znSBWARIGM2CvxC1s72yDWv8MQAo9wvduU4RBQiciaWUQFmOsTAhRuAoQ8zib1MoQgUMaHA/0', NULL, '4780726832', '1', 0, 0, 0, 1464075757, 'c0d0', '13570591699', 0, NULL, 'weixin', '1357'),
(621, 'oeYLUvulaQecgCsjN6TtIC0ygq-8', 2, '26', 'e78e8be4bfaae99c8f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAavhzzmxdG3zfLVG8iboYNViaL4gv00amo4Fzh0O1RacDAhica5ffqNA3MNcpxWxQ0Kl0bn4gp3wIbe/0', NULL, '6010755353', '2', 0, 0, 0, 1464076032, 'c8p1', '15937176533', 0, NULL, 'weixin', '你好'),
(622, 'oeYLUvmTdQb0lEOBVfprZMo58k7I', 2, '', 'e69ca8e58d8e', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxg9fYvmib6NFyURAH1nBbyoibNCAdzngPWicACUm6an6u2p1qER5vo18LNp3icNOsl0oll2kxM6BZ1kPS04pcXyeOGNic/0', NULL, '9970889064', '1', 0, 0, 0, 1464076174, 'o0jd', '13800138000', 0, NULL, 'weixin', 'mm'),
(626, 'oeYLUvi-pzbIYjkaUdMJYeAZ9h2k', 1, '', NULL, NULL, NULL, '', NULL, 0, 0, 0, NULL, 'i8al', NULL, 0, NULL, 'weixin', NULL),
(625, 'oeYLUvsTiNeFmHJZ7VOpYudEFLGo', 2, '', 'ee849be8b4a5ee9092e7b1bbee849b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCBickY2Uribqeh94wib3286Ko70AwLzZhBOLQFiaNJqyDYicbuJlfd2QcicnZqIy1mOnNfpDRia7IsylVEw/0', NULL, '3214309437', '1', 0, 0, 0, 1464076268, 'e7nh', '15989188574', 0, NULL, 'weixin', '黄浩明');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_paipaile`
--

CREATE TABLE IF NOT EXISTS `weixin_paipaile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `picurl` varchar(255) NOT NULL,
  `voteres` int(11) NOT NULL DEFAULT '0',
  `fromtype` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `weixin_paipaile`
--

INSERT INTO `weixin_paipaile` (`id`, `openid`, `nickname`, `avatar`, `picurl`, `voteres`, `fromtype`) VALUES
(1, 'oeYLUvuQkmyiBZWbmD_hZOV676MI', 'e78e8be59ca3e7a5afe38090e69893e38091', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ7XrmQIyicrK45Zqx8bRgbCYfM18aIOEH4qZKCLvXv41EaGufkkQJSIlbg5QH53y9wqLiblN0Lp76w/0', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxFxFc5iccskUgWJYvQpuOrkT6OhMegsosU8Vft1kiaWaHMw5o2CZUdicRZGad1poEGPDFZpbibibRPib2saDr5pYdZEAgx0.jpg', 2, 'weixin'),
(2, 'oeYLUvkZxt_YXPUVxIxkNRCa2sRo', '4665656c73206c696b6520696e736f6d6e6961c2ba', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCdR0Mzb9fu0H7WdZ4sgt67UhqZR8ozDtIdWRuyYR0kG77QCG1lCnIZebIwDwibQYuee7ls7ezofAg/0', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxO0icw0u4Z714CfiadibBibzhXlMMxmD2iaoyXzKT5IO1B4XxicHhlVCRSeB4v73HicWvribBuic6k0RtTicrdYbAiaIaaNoNgx0.jpg', 0, 'weixin');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_paipaile_config`
--

CREATE TABLE IF NOT EXISTS `weixin_paipaile_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rule` text NOT NULL,
  `pplnum` tinyint(2) NOT NULL,
  `pplvotenum` tinyint(1) NOT NULL,
  `pplvotecannum` tinyint(2) NOT NULL,
  `pplround` int(11) NOT NULL,
  `must_switch` tinyint(1) NOT NULL DEFAULT '1',
  `black_switch` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `weixin_paipaile_config`
--

INSERT INTO `weixin_paipaile_config` (`id`, `rule`, `pplnum`, `pplvotenum`, `pplvotecannum`, `pplround`, `must_switch`, `black_switch`) VALUES
(1, '大屏幕在点击开始游戏后，上传照片后按照提示即可参与投票，投票结束后所有参与游戏的用户将获得抽奖机会哟！赶快参与互动吧~', 2, 2, 10, 19, 1, 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_paipaile_user`
--

CREATE TABLE IF NOT EXISTS `weixin_paipaile_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `fromtype` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `openid` (`openid`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=17 ;

--
-- 转存表中的数据 `weixin_paipaile_user`
--

INSERT INTO `weixin_paipaile_user` (`id`, `openid`, `nickname`, `avatar`, `fromtype`, `status`) VALUES
(1, 'oeYLUvuHArRYydc4xXWQrDv79eeo', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 'weixin', 0),
(2, 'oeYLUvtnb200kPzJ7kvn58VsJhfE', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicuNLOIoBxqv08v9xym0LSX0KWia3ZdzspiaPTPUOLNiahdeVUlYw5Ur8glpxeMLWicLI4NrzURu3KeOT/0', 'weixin', 0),
(3, 'oeYLUvsPPs85_6K3e01jJp3YdGxE', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 'weixin', 0),
(4, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'weixin', 0),
(5, 'oeYLUvtdsBei0vNLdPhhmkNP3sxA', 'e5a2a8e4ba91e4b99d', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7JHoicLOEdl5v6IR9gibnhrqKBfWiaGCoQZicib3PdT0dr1HOTljxVb4rCV1mZaibics0gU02MtjPyMkQlg/0', 'weixin', 0),
(6, 'oeYLUvlnVd1oygagLTSa7ID1e2GY', 'e9989ce696b0e59c88417070', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLC7ECib7iayChtiblxR2oW5hluuic1PXVc5iaA2vEFzXibs7p8fD5qdkLwmfu1cPVAI95icz2QRRWibicHA9tQ/0', 'weixin', 0),
(7, 'oeYLUvhah76OEhkzW1xclZdzt1Dw', 'e6909ce789b9', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxg9VwmibXPztWQj4AHfkTjnNK6nPGvnNJoJlf0Lzu0nsZaM02ryAvIGgUAV2NdD4Dyg93QXPTd9zlqP4ok97XX7Pg/0', 'weixin', 0),
(8, 'oeYLUvuw9fQ3vEyXMmJWNaR1JBes', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 'weixin', 0),
(9, 'oeYLUvjH1LjcmwMajIq5wbpJ4lL8', '686f6c64206661737420746f20666f766572', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicmK23ZVV0f9Ohn4fKhHPxoTdfdEHkckwagibSI7w7m2pyzL7Miak9zLKWKmbkLq1Mnib2ibUgRKqiaYvs/0', 'weixin', 0),
(10, 'oeYLUvsyBeqCeMWOl9RLOsVYDjHI', 'e998bfe9be99', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicg61d0zZGYUcbHjcib4AbCPic4lLWLFWXQAFXeXibWsOwHJRXAZEEkoTplMfUpRFeC3POiaJCibc0tmOX/0', 'weixin', 0),
(11, 'oeYLUvuk7ut8KW1sLWF1h2ue4AaM', 'e69da8e5b091', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAbsVmYfkNFY1BsaoBNziaHjGKbfGhW1V0P8lhaPqtbf58yp3ibTtMmIWH5iaiaaias3WQL3qgMb39v9nStg0QR8ictoy8XN3XY5CibFM/0', 'weixin', 0),
(12, 'oeYLUvp1kpZ1iJvw0YaYA_hMij3M', 'e4ba8ce5b888e58584', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM61D8HX8r0XzGoCTAYiaGvARrzJKiclozmOfib2wVP1LZm66QeHTdaTXZtlJTiaYNdHvTcxXl6fS75NnQ/0', 'weixin', 0),
(13, 'oeYLUvtbN51vHQ7j_YL3pmzAm8-8', 'e5bdbce5b2b8e88ab1e8b0a2', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARSX5hp9XD0VWV0h1ibve4nOT3wK62QU3hzVKsE1MEFebPFfPJgs9YcaeQRkL7YVNwXvCRsjmj2xy/0', 'weixin', 0),
(14, 'oeYLUvuQkmyiBZWbmD_hZOV676MI', 'e78e8be59ca3e7a5afe38090e69893e38091', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ7XrmQIyicrK45Zqx8bRgbCYfM18aIOEH4qZKCLvXv41EaGufkkQJSIlbg5QH53y9wqLiblN0Lp76w/0', 'weixin', 1),
(15, 'oeYLUvkZxt_YXPUVxIxkNRCa2sRo', '4665656c73206c696b6520696e736f6d6e6961c2ba', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCdR0Mzb9fu0H7WdZ4sgt67UhqZR8ozDtIdWRuyYR0kG77QCG1lCnIZebIwDwibQYuee7ls7ezofAg/0', 'weixin', 1),
(16, 'oeYLUvqZfOqNmA0OXhd6yWzOdFcM', 'e5b7a6e4b8895a6564f09f91b9', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAanGgicF0Pbat4ibfaDmVATAonKMF5rNgHzly2MRzcuKEAicSkFcDBVc3v4wOdtbFcFcdL5UFrE90slmRDu97WXLiaPlnTuw8W9L0/0', 'weixin', 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_paipaile_zjuser`
--

CREATE TABLE IF NOT EXISTS `weixin_paipaile_zjuser` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `avatar` varchar(255) NOT NULL,
  `fromtype` varchar(255) NOT NULL,
  `zjtype` tinyint(4) NOT NULL DEFAULT '1',
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `round` int(11) NOT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `voteres` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=42 ;

--
-- 转存表中的数据 `weixin_paipaile_zjuser`
--

INSERT INTO `weixin_paipaile_zjuser` (`id`, `openid`, `nickname`, `avatar`, `fromtype`, `zjtype`, `status`, `round`, `picurl`, `voteres`) VALUES
(1, 'oeYLUvuXsRDlhfQG36pmuX9YdpE4', '613030303031e5a49ae782b9e8a7a6e691b8e5b18fe5ae9ae588b620e98592e5ba97e79bb4e692ad', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCXSR1nibCibaJTT0Bw7QrWeuvgnrNCNgcfbYGJZarJibnSic5HN9oMSHS4aH8v0cSEicwksYq3MTMxqTQ/0', 'weixin', 1, 1, 1, '', 0),
(2, 'oeYLUvpa06jGYs2oYgawmFcIDKlE', 'e69d8ee5ae8fe59bbe', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1ia8Vg8qgN7Wvk7LEf4gVvfbJQL4nc89Kltw0GgcjnqElpyF3AbglVt4zzojACibxAuE9UibfYrz4ce/0', 'weixin', 2, 0, 1, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxARDGNjbR8IT3UiaSNSiaZPRqM5JzI57PCPUFGYibibNtibBszbc70TztiaRoLA8HsfYNia2Ot6enibgJcz3pP8ZvptFO1Ax0.jpg', 1),
(3, 'oeYLUvqNJazdfERlHkqnXOvQS0gY', 'e68ab1e78e89e8978fe5b1b1', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1XeNMnAJRapj0M0eAoMfh4fgSCL1Cd0xQjwLt4qqPrakiaUTibRYZtQoOqHFYWQOLibiaQxzBFI6peRxB3GvWnwzmYF/0', 'weixin', 1, 0, 2, '', 0),
(4, 'oeYLUvklxhGP2OUqMCmRP1qCe7tw', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', 'weixin', 2, 0, 2, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxIbKbFGX2SXbaDMOh3R81ZJMrEWU7DGQVPXu8jIOhgqD39QCgxgWYqcaE56a0KkRbYLJ4ogDvAM4lfNSaoaoI3gx0.jpg', 0),
(5, 'oeYLUvi9Nw39JVWm8t_insyRe-Ww', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', 'weixin', 1, 0, 3, '', 0),
(6, 'oeYLUvi9Nw39JVWm8t_insyRe-Ww', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', 'weixin', 2, 0, 3, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxcszxf1PctZDW1Yicb92r9XKp5Yg0jYUQX72CmsFO3s0ookvicJg3D4XSpzjic3RQLh0kLKeYXzsuDmtZjzrVibRpEgx0.jpg', 0),
(7, 'oeYLUvqNMNOAAhXkxfTeecBQnEKw', 'e5b7a6e58fb3', 'http://wx.qlogo.cn/mmopen/69vgJtoLPwwYEFjmLHt41za0QxJECadsw59w7n1Hxx52v1X04V0kibfZBXxkTzIEYibCSicfu78tc5zcR7wqcZnf6y0uiczrPScT/0', 'weixin', 1, 0, 4, '', 0),
(8, 'oeYLUvi9Nw39JVWm8t_insyRe-Ww', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', 'weixin', 1, 0, 4, '', 0),
(9, 'oeYLUvqNMNOAAhXkxfTeecBQnEKw', 'e5b7a6e58fb3', 'http://wx.qlogo.cn/mmopen/69vgJtoLPwwYEFjmLHt41za0QxJECadsw59w7n1Hxx52v1X04V0kibfZBXxkTzIEYibCSicfu78tc5zcR7wqcZnf6y0uiczrPScT/0', 'weixin', 2, 0, 4, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxECVGZwaGLHZw8kALHb5pbYic9RZsgXlaHpIRic7RuFYBjql98En3kVTFM2nAtNfSmffW6PfDYE8kUzM80qZQ6ib2Ax0.jpg', 2),
(10, 'oeYLUvpS_U3DOHLESF0i3oInSvsY', 'e5b08fe79aaee593a5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcbkJicCGwiarr06F1bJnt9mkZRDMzsBKDHBDW1DXmRfaZFxfRC7r8Wia3F6rWOrenbohwTKZCrK9DL/0', 'weixin', 1, 0, 5, '', 0),
(11, 'oeYLUvpS_U3DOHLESF0i3oInSvsY', 'e5b08fe79aaee593a5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcbkJicCGwiarr06F1bJnt9mkZRDMzsBKDHBDW1DXmRfaZFxfRC7r8Wia3F6rWOrenbohwTKZCrK9DL/0', 'weixin', 2, 0, 5, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxicnOWtpwATLE2nib8oMuO40DfiawT15rAkfSyq9IggtRyOlxwib3Yv5CwOWicpiavxYarE7e9Ug1qAncehkT1revm1ibAx0.jpg', 0),
(12, 'oeYLUvpS_U3DOHLESF0i3oInSvsY', 'e5b08fe79aaee593a5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcbkJicCGwiarr06F1bJnt9mkZRDMzsBKDHBDW1DXmRfaZFxfRC7r8Wia3F6rWOrenbohwTKZCrK9DL/0', 'weixin', 1, 0, 6, '', 0),
(13, 'oeYLUvpS_U3DOHLESF0i3oInSvsY', 'e5b08fe79aaee593a5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcbkJicCGwiarr06F1bJnt9mkZRDMzsBKDHBDW1DXmRfaZFxfRC7r8Wia3F6rWOrenbohwTKZCrK9DL/0', 'weixin', 2, 0, 6, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxicnOWtpwATLE2nib8oMuO40DfiawT15rAkf5wqNMeW2e2v3icmDky3Sz2AZSXOickN0JtYeEr04R9j4IAmBcSU8p16wx0.jpg', 0),
(14, 'oeYLUvrZbDMMyALJr5wpbLtwdK30', 'e6829ff09f88b3efb88f', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIEwia4zVxrW2bNibJficbeysTATiceXT4CvHEyuHgKeQwSJu6o0mVWKZg7gIIfTpU6NoQehdPwhV5cQw/0', 'weixin', 1, 0, 7, '', 0),
(15, 'oeYLUvs54_t1y83Ffk3x2Mfes3xI', 'e68891e4bbace7949fe69da5e5b0b1e698afe5ada4e78bac', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1X8LOUlaS1VmObuIldOkp5J3v5QCRF2CBbgs6Z9sLicuNLuWW94HTCLibGHOia4B3J4Ff2NatUCe7jibQ7XZ3U51ZoZ/0', 'weixin', 2, 0, 7, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxZJ0jDzg9TicYQxQhDSRibrXsEjVTUERzp37gnknvGWFs5oYmwgdKr5ibAibaEdTqp7Xp8P2rmgccT75OmnrxX94Jiawx0.jpg', 1),
(16, 'oeYLUvnQxIXcx5BMXiYo9hv8Gzi0', '6363', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HeVicibF3icWuKHtsUYrdy0rkPvULLOEsMPtNEwD7fWDicYJnmicyBVZOVGBicdQkN6s3ibM2YR9yxqib565/0', 'weixin', 1, 0, 8, '', 0),
(17, 'oeYLUvjB28elvRJ3PXyi1Xbh8ZC4', 'e58d97e998b3e78e89e99b95', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1vH9AYILIjBXia5d6BLu4EPz7O6NoibCPpSFicSgDibuXbJKY391iatjp0cdXqQ6bw799hcQWIFygCVicia/0', 'weixin', 2, 0, 8, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxhh6QWF1T0FuLjjkgjTJo4PcCr9712ojl1xhEULtp6bK9gk741MTgxbppZZfMSVhBbIGlJvZj0eCOwicYVLdxKlgx0.jpg', 0),
(18, 'oeYLUvm03uB0gvuw1Oyek-n_zeAg', 'e68891e58fabe8b4bae5bbbae69c8b40', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAiadNUbStLK2Eqia1DvfK8DpHSZMic102kRfA1SpruEao9h8m7s7kRWXSswJOgFZvmkvcKDW7oyHvsw/0', 'weixin', 1, 0, 9, '', 0),
(19, 'oeYLUvnuuJHohlbcO67oMSA0wo2M', 'e580aae6a5b7e6b787', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicDWOBbibNkb7RFNmeKDXiaql8ic4aj6Z6C273Xg9ehCevib7UDUgFuTnZYyecgxeyI7BwnkjdrWODrA2efgeQWibmHX/0', 'weixin', 2, 0, 9, 'http://cnwpkj-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxx7S6m2tawtgqu2kMDC9a6UpQnPux1c1NJVzalE4ste0qxQl8Uo9icPZCWtBvebftEdxp32pt7NZXzN0uogQaOicAx0.jpg', 0),
(20, 'oeYLUvrc5UNG7Ekr7tILHbzp5_SA', 'e7a38ae4b88de7b4af', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARkPdicib4lFaAbtGytDmkamTE9icMMS7oibKbHp3mibTug4pyX5icL9rcNaB04VPcWouXtxjE9Dn9IF9A/0', 'weixin', 1, 0, 10, '', 0),
(21, 'oeYLUvrc5UNG7Ekr7tILHbzp5_SA', 'e7a38ae4b88de7b4af', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARkPdicib4lFaAbtGytDmkamTE9icMMS7oibKbHp3mibTug4pyX5icL9rcNaB04VPcWouXtxjE9Dn9IF9A/0', 'weixin', 2, 0, 10, 'http://cnwpkj-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxZr4usr2pTrib8ZoxoNZwnZa0nJUTKUH1lQW6OntcpAiaHVmpN396DdRJL4icvNbJeZiaib2WNJDYiccDOeibzz5TK1lWQx0.jpg', 0),
(22, 'oeYLUvjueQGaaVXBLxcCfJh3r_j4', 'e891a3e5bf97e9b98f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO3lWGmAYneYiaQicLspl16Y9pqP42ZlUhpmKm7EK2oibMWol7Q0CWTI0vEEAicuL3QMFcc4SztyKqmRw4zn3Kr6CcUY/0', 'weixin', 1, 0, 11, '', 0),
(23, 'oeYLUvjueQGaaVXBLxcCfJh3r_j4', 'e891a3e5bf97e9b98f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO3lWGmAYneYiaQicLspl16Y9pqP42ZlUhpmKm7EK2oibMWol7Q0CWTI0vEEAicuL3QMFcc4SztyKqmRw4zn3Kr6CcUY/0', 'weixin', 2, 0, 11, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx4orEnYEZibQnm6OPBGnY1W7KLtoqwyibVHkA49aia2sENB5GU2Dibc2K8LN1GDOicCjPonFJ31NTiaBXJqw61hOuVWQQx0.jpg', 1),
(24, 'oeYLUvnEG4PuNrpIGGwnq0NWIpX4', 'e5b08fe69da8e5bbbae7ab99', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq6SjmWUbA8jqXx6PdaNt5Rs0RLLupplr5YBVvhnssFC9ibEcuuVQ1NBPAAVqh5TzPj0BvB3aswzQ/0', 'weixin', 1, 0, 12, '', 0),
(25, 'oeYLUvnEG4PuNrpIGGwnq0NWIpX4', 'e5b08fe69da8e5bbbae7ab99', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq6SjmWUbA8jqXx6PdaNt5Rs0RLLupplr5YBVvhnssFC9ibEcuuVQ1NBPAAVqh5TzPj0BvB3aswzQ/0', 'weixin', 2, 0, 12, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxS81iaIKpoIUl8BoGSZxGaGMvKSM9HKPcQm7fvicNaUNL03U659KQWFibMHib4GCYPE7OsSNYo43zUK6KwCMQTQEtsQx0.jpg', 1),
(26, 'oeYLUvnEG4PuNrpIGGwnq0NWIpX4', 'e5b08fe69da8e5bbbae7ab99', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq6SjmWUbA8jqXx6PdaNt5Rs0RLLupplr5YBVvhnssFC9ibEcuuVQ1NBPAAVqh5TzPj0BvB3aswzQ/0', 'weixin', 1, 0, 13, '', 0),
(27, 'oeYLUvnEG4PuNrpIGGwnq0NWIpX4', 'e5b08fe69da8e5bbbae7ab99', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq6SjmWUbA8jqXx6PdaNt5Rs0RLLupplr5YBVvhnssFC9ibEcuuVQ1NBPAAVqh5TzPj0BvB3aswzQ/0', 'weixin', 2, 0, 13, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxS81iaIKpoIUl8BoGSZxGaGMvKSM9HKPcQok3OgEYNTupxkO0taKMtezkttmf1WIsd8Gx2n8iakGv1qsG1RTUpoowx0.jpg', 1),
(28, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'weixin', 1, 0, 14, '', 0),
(29, 'oeYLUvuHArRYydc4xXWQrDv79eeo', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 'weixin', 2, 0, 14, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNiaIMLOAwRmU5z5N3K76XTrQ1xAgtQEUQbMKLAUlKrzTJLcu1ZKiaicHh6iciammqUSticVbdTGx19c9BkcnbEsMMThgx0.jpg', 1),
(30, 'oeYLUvuHArRYydc4xXWQrDv79eeo', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 'weixin', 1, 0, 15, '', 0),
(31, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'weixin', 1, 0, 15, '', 0),
(32, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'weixin', 2, 0, 15, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNo5yRWTialC25ZrH8Na7ZRJDuytoRB7EmE367HaAdztHic6OpYjH3JRQKnzen6zfcSYSx5JTKcWEfqYrxjx9g6aQx0.jpg', 1),
(33, 'oeYLUvuHArRYydc4xXWQrDv79eeo', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 'weixin', 2, 0, 15, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNiaIMLOAwRmU5z5N3K76XTrQ1xAgtQEUQbMKLAUlKrzTJLcu1ZKiaicHh6iciammqUSticVbdTGx19c9BkcnbEsMMThgx0.jpg', 0),
(34, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'weixin', 1, 0, 16, '', 0),
(35, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'weixin', 2, 0, 16, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNo5yRWTialC25ZrH8Na7ZRJDuytoRB7EmP1TMae6p4G57JA7LopIwpLZ8CrzjWTEWn0Fic3iaHoZXqYgm7n6IacNwx0.jpg', 0),
(36, 'oeYLUvuHArRYydc4xXWQrDv79eeo', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 'weixin', 1, 0, 17, '', 0),
(37, 'oeYLUvuHArRYydc4xXWQrDv79eeo', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 'weixin', 2, 0, 17, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNiaIMLOAwRmU5z5N3K76XTrQ1xAgtQEUQbMKLAUlKrzTJLcu1ZKiaicHh6iciammqUSticVbdTGx19c9BkcnbEsMMThgx0.jpg', 3),
(38, 'oeYLUvgPONBpoIh5cS_-esdMZoxs', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 'weixin', 2, 0, 17, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNo5yRWTialC25ZrH8Na7ZRJDuytoRB7EmP1TMae6p4G57JA7LopIwpLZ8CrzjWTEWn0Fic3iaHoZXqYgm7n6IacNwx0.jpg', 0),
(39, 'oeYLUvuk7ut8KW1sLWF1h2ue4AaM', 'e69da8e5b091', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAbsVmYfkNFY1BsaoBNziaHjGKbfGhW1V0P8lhaPqtbf58yp3ibTtMmIWH5iaiaaias3WQL3qgMb39v9nStg0QR8ictoy8XN3XY5CibFM/0', 'weixin', 1, 0, 18, '', 0),
(40, 'oeYLUvjH1LjcmwMajIq5wbpJ4lL8', '686f6c64206661737420746f20666f766572', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicmK23ZVV0f9Ohn4fKhHPxoTdfdEHkckwagibSI7w7m2pyzL7Miak9zLKWKmbkLq1Mnib2ibUgRKqiaYvs/0', 'weixin', 2, 0, 18, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxUSYUB4j50KSNibCIBZPTAvur90PgWK7YRkzbmgr2TnEic9MO2kUZU4ToibrDl0ZB2YaozZ883GaVtMHNE51PjEaOgx0.jpg', 1),
(41, 'oeYLUvtdsBei0vNLdPhhmkNP3sxA', 'e5a2a8e4ba91e4b99d', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM7JHoicLOEdl5v6IR9gibnhrqKBfWiaGCoQZicib3PdT0dr1HOTljxVb4rCV1mZaibics0gU02MtjPyMkQlg/0', 'weixin', 2, 0, 18, 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxgkGzXdz0cfc5GZ0bTialuiafjOtFgaCluOzwhByCzQjmCc6Zic5WyWcz4BV9yFtkpAWicghE1vmVpBkuHjuLg0UG1Ax0.jpg', 0);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_plugs`
--

CREATE TABLE IF NOT EXISTS `weixin_plugs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `files` varchar(255) NOT NULL,
  `hasfiles` tinyint(1) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '0',
  `switch` tinyint(4) NOT NULL DEFAULT '0',
  `needword` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=12 ;

--
-- 转存表中的数据 `weixin_plugs`
--

INSERT INTO `weixin_plugs` (`id`, `name`, `title`, `description`, `keyword`, `files`, `hasfiles`, `status`, `switch`, `needword`) VALUES
(5, 'ppl', '拍拍乐', '【拍拍乐】参与拍拍乐请回复【~~[keyword]~~】	', '选美', 'ppl.ext', 1, 4, 1, 1),
(7, 'shake', '摇一摇', '【摇一摇】参与摇一摇请回复【~~[keyword]~~】', '摇一摇', 'shake.ext', 1, 0, 1, 1),
(6, 'vote', '投票', '【投票】参与投票请回复【~~[keyword]~~】', '投票', 'vote.ext', 1, 0, 1, 1),
(1, 'cj', '抽奖', '【抽奖】发送消息上墙后将获得抽奖资格，回复【~~[keyword]~~】查看中奖状态', '查询', '', 0, 0, 1, 0),
(3, 'ddp', '对对碰', '【对对碰】发送消息上墙后将获得对对碰抽奖资格', '对对碰', '', 0, 0, 1, 0),
(2, 'qdq', '签到墙', '【签到墙】签到成功，请查看大屏幕！', '签到墙', '', 0, 0, 1, 0),
(8, 'tug', '拔河', '【拔河】参与拔河请回复【~~[keyword]~~】', '拔河', 'tug.ext', 1, 0, 1, 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_shake_toshake`
--

CREATE TABLE IF NOT EXISTS `weixin_shake_toshake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `wecha_id` varchar(255) NOT NULL,
  `point` int(11) NOT NULL,
  `avatar` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `wecha_id` (`wecha_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `weixin_shake_toshake`
--

INSERT INTO `weixin_shake_toshake` (`id`, `phone`, `wecha_id`, `point`, `avatar`) VALUES
(2, '62696c6c', 'oeYLUvllREAAAi1wJ1YaIpsiRPnI', 0, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6JfGI0O9D7CdNdBBY0p8nVqHYfzT0znSBWARIGM2CvxC1s72yDWv8MQAo9wvduU4RBQiciaWUQFmOsTAhRuAoQ8zib1MoQgUMaHA/0'),
(3, 'e69ca8e58d8e', 'oeYLUvmTdQb0lEOBVfprZMo58k7I', 0, 'http://wx.qlogo.cn/mmopen/P2SpGPTCxg9fYvmib6NFyURAH1nBbyoibNCAdzngPWicACUm6an6u2p1qER5vo18LNp3icNOsl0oll2kxM6BZ1kPS04pcXyeOGNic/0'),
(4, 'e6a5bce585b0e68bbee88d92', 'oeYLUvi-pzbIYjkaUdMJYeAZ9h2k', 0, 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwATRib6VDX1n9FRfpicicfkg3HDXjfT4k0diazHSo7z4UsU1ANOarpics7BIleUM4ibjVAko7H1R5jbz0cD/0'),
(6, '4a6f6e', 'oeYLUvv8d_75IkGIBtX7rXni1pcg', 33, 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVrIDfpWYYxCQScic1sP3a7yAr6v8yFeJttANdbAcMgpmOAvbBKia8S8dmm3ILXx0bNv4VfBJagmibFm/0'),
(5, 'ee849be8b4a5ee9092e7b1bbee849b', 'oeYLUvsTiNeFmHJZ7VOpYudEFLGo', 0, 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCBickY2Uribqeh94wib3286Ko70AwLzZhBOLQFiaNJqyDYicbuJlfd2QcicnZqIy1mOnNfpDRia7IsylVEw/0');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_vote`
--

CREATE TABLE IF NOT EXISTS `weixin_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` text NOT NULL,
  `res` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `res` (`res`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `weixin_vote`
--

INSERT INTO `weixin_vote` (`id`, `name`, `res`) VALUES
(24, '微信墙', 1),
(23, '签到墙', 4),
(25, '对对碰', 2),
(26, '摇一摇', 19),
(27, '拍拍乐', 2);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_wall`
--

CREATE TABLE IF NOT EXISTS `weixin_wall` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `messageid` varchar(255) DEFAULT NULL,
  `fakeid` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `content` text,
  `nickname` text,
  `avatar` text,
  `ret` int(11) DEFAULT NULL,
  `fromtype` varchar(255) DEFAULT NULL,
  `image` text,
  `datetime` int(10) DEFAULT NULL,
  `mingzi` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=363 ;

--
-- 转存表中的数据 `weixin_wall`
--

INSERT INTO `weixin_wall` (`id`, `messageid`, `fakeid`, `num`, `content`, `nickname`, `avatar`, `ret`, `fromtype`, `image`, `datetime`, `mingzi`) VALUES
(1, '0', '8029563694', 1, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(2, '0', '3638178223', 2, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(3, '0', '3638178223', 3, 'e68891e8a681e4b8ade5a596', '<img class="ui avatar image" src="http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0">1111', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(4, '0', '234029992', 4, 'e68891e8a681e4b8ade5a596', 'e8b4a2e8b28ce58f8ce585a8', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Wg9WbjUXmw7fq6X7uWBsA8TNHicYtFu8uyvYcFKc9JbeDG6vS1BSEKLkaeHvwEU2dlVo4ml3xlEn2Zv1ktgdmbQ/0', 1, 'weixin', NULL, 1456148297, ''),
(5, '0', '7851059821', 5, 'e68891e8a681e4b8ade5a596', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456148297, ''),
(6, '0', '2754423905', 6, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(7, '0', '2090080059', 7, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(8, '0', '188751159', 8, '2e', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(9, '0', '188751159', 9, 'efbc9fefbc9f', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(10, '0', '188751159', 10, 'efbc9fefbc9fefbc9f', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(11, '0', '188751159', 11, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(12, '0', '188751159', 12, 'e38082e38082e38082e38082', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(13, '0', '8450198487 ', 13, '此消息为图片！', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxeptjRI3b64XXUtiageLxRn0EmM8xfsGyPI0jk1h5t8tsIXxW3RFMUb7OFMkrL6ARcopLzTfyGaR8o45mzFia7ZsQx0.jpg', 1456148297, ''),
(14, '0', '8450198487', 14, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(15, '0', '5982682720', 15, 'e4bda0e59ca8e982a3e9878ce4ba86', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456148297, ''),
(16, '0', '8549434266', 16, 'e68891e8a681e4b8ade5a596', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456148303, ''),
(17, '0', '8549434266', 17, 'e8afb4e8af9de4ba86efbc9fe59388e59388e59388e59388e59388', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456148309, ''),
(18, '0', '6612457731', 18, 'e68891e8a681e4b8ade5a596', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456210514, ''),
(19, '0', '305692340', 19, 'e98080e587ba', 'e8b4a2e8b28ce58f8ce585a8', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Wg9WbjUXmw7fq6X7uWBsA8TNHicYtFu8uyvYcFKc9JbeDG6vS1BSEKLkaeHvwEU2dlVo4ml3xlEn2Zv1ktgdmbQ/0', 1, 'weixin', NULL, 1456219104, ''),
(20, '0', '305692340', 20, 'e98080e587ba', 'e8b4a2e8b28ce58f8ce585a8', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Wg9WbjUXmw7fq6X7uWBsA8TNHicYtFu8uyvYcFKc9JbeDG6vS1BSEKLkaeHvwEU2dlVo4ml3xlEn2Zv1ktgdmbQ/0', 1, 'weixin', NULL, 1456219129, ''),
(21, '0', '305692340', 21, 'e4bda0e5a5bd', 'e8b4a2e8b28ce58f8ce585a8', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Wg9WbjUXmw7fq6X7uWBsA8TNHicYtFu8uyvYcFKc9JbeDG6vS1BSEKLkaeHvwEU2dlVo4ml3xlEn2Zv1ktgdmbQ/0', 1, 'weixin', NULL, 1456219263, ''),
(22, '0', '305692340', 22, 'e4bda0e5a5bd', 'e8b4a2e8b28ce58f8ce585a8', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Wg9WbjUXmw7fq6X7uWBsA8TNHicYtFu8uyvYcFKc9JbeDG6vS1BSEKLkaeHvwEU2dlVo4ml3xlEn2Zv1ktgdmbQ/0', 1, 'weixin', NULL, 1456219273, ''),
(23, '0', '305692340', 23, 'e68891e8a681e4b8ade5a596', NULL, 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Wg9WbjUXmw7fq6X7uWBsA8TNHicYtFu8uyvYcFKc9JbeDG6vS1BSEKLkaeHvwEU2dlVo4ml3xlEn2Zv1ktgdmbQ/0', 1, 'weixin', NULL, 1456219481, '陈镇'),
(24, '0', '305692340', 24, 'e5869c', NULL, 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1Wg9WbjUXmw7fq6X7uWBsA8TNHicYtFu8uyvYcFKc9JbeDG6vS1BSEKLkaeHvwEU2dlVo4ml3xlEn2Zv1ktgdmbQ/0', 1, 'weixin', NULL, 1456219493, '陈镇'),
(25, '0', '6870391502', 25, 'e68891e8a681e4b8ade5a596', NULL, 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456219586, '刘德华'),
(26, '0', '6006632242', 26, 'e68891e79a84e5bf83', NULL, 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6Xy7tMpLXJhb3Kehviaib6tjljic5r16E4c4IRiaagIPzP09Qtj4cQNsbQOLuDbzbJ2xbfcdmC0YU0iada/0', 1, 'weixin', NULL, 1456219731, 'q we'),
(27, '0', '485389480', 27, 'e68891e8a681e4b8ade5a596', NULL, 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456219949, '张学友'),
(28, '0', '4154555830', 28, 'e68891e8a681e4b8ade5a596', NULL, 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456236388, '周杰伦'),
(29, '0', '2087770374', 29, 'e68891e8a681e4b8ade5a596', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456237614, '张学良'),
(30, '0', '2087770374', 30, 'e4bda0e5a5bd', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456238105, '张学良'),
(31, '0', '485389480', 31, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456238129, '张学友'),
(32, '0', '485389480', 32, 'e4bda0e5a5bdee819620', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456238136, '张学友'),
(33, '0', '54345987', 33, 'e68891e8a681e4b8ade5a596', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456240657, '周杰伦'),
(34, '0', '3899208634', 34, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456240686, ''),
(35, '0', '2506363111', 35, 'e68891e8a681e4b8ade5a596', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456240719, '刘德华'),
(36, '0', '3899208634', 36, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456240809, ''),
(37, '0', '5521973047', 37, 'e68891e8a681e4b8ade5a596', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456273902, '陈飞'),
(38, '0', '3528635021', 38, 'e68891e8a681e4b8ade5a596', 'e78e8be6a091e58d8eefbd9ee4bd93e6849fe4ba92e58aa8e789b9e69588e5bdb1e5838fe7a791e699aee6b8b8e6888f', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK8UoAj8W1pWX4eazD67yLKyzXKM4utuFDPQWU1rRoiaSibA6eR3PTDaPqjebF4L1gqCDFBySibvUcYQ/0', 1, 'weixin', NULL, 1456300116, '王'),
(39, '0', '3528635021', 39, 'e68891e8a681e4b8ade5a596', 'e78e8be6a091e58d8eefbd9ee4bd93e6849fe4ba92e58aa8e789b9e69588e5bdb1e5838fe7a791e699aee6b8b8e6888f', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK8UoAj8W1pWX4eazD67yLKyzXKM4utuFDPQWU1rRoiaSibA6eR3PTDaPqjebF4L1gqCDFBySibvUcYQ/0', 1, 'weixin', NULL, 1456300154, '王'),
(40, '0', '5068976939', 40, 'e4b8bae4bb80e4b988e4ba86efbc9f', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456379050, '想约我'),
(41, '0', '5068976939', 41, 'e59388e59388e59388e59388e59388e38082', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456379055, '想约我'),
(42, '0', '5068976939', 42, '20e68b94e6b2b3', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456379085, '想约我'),
(43, '0', '4014401805', 43, 'e6b58be8af95', 'e983ade5a4a7e5a790', 'http://wx.qlogo.cn/mmopen/uI5pczeERTafonTeugNE2AxrlKwUjhhGhj8IjxQHLmCXdRScqE3m97pGLkmhUoT1Ba6eibtZbc9Cyjn0HOTfphLtpG7hod79h/0', 1, 'weixin', NULL, 1456384747, '郭楚碧'),
(44, '0', '4566162490', 44, 'e69187e4b880e69187', 'e68891e4bbace7949fe69da5e5b0b1e698afe5ada4e78bac', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1X8LOUlaS1VmObuIldOkp5J3v5QCRF2CBbgs6Z9sLicuNLuWW94HTCLibGHOia4B3J4Ff2NatUCe7jibQ7XZ3U51ZoZ/0', 1, 'weixin', NULL, 1456446749, '1'),
(45, '0', '4566162490', 45, 'e69187e4b880e69187', 'e68891e4bbace7949fe69da5e5b0b1e698afe5ada4e78bac', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1X8LOUlaS1VmObuIldOkp5J3v5QCRF2CBbgs6Z9sLicuNLuWW94HTCLibGHOia4B3J4Ff2NatUCe7jibQ7XZ3U51ZoZ/0', 1, 'weixin', NULL, 1456446776, '1'),
(46, '0', '4193795519', 46, 'e68abde5a596', '4368616e', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HZ9zabquagNo9hxmqCrOO3HwfgMiafZqNe7PPWe5Opoibb0EeWehwXWYjMwz96arHpYCuGUcmd9ia0y/0', 1, 'weixin', NULL, 1456450147, 'Chan'),
(47, '0', '3903874826', 47, 'e68abde5a596', '436f7264656c6cf09f9192', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VuVGCV6rG25dgaDjB3ImX8dlibSxnMI5wRanEm7RULgy9RK6S8JJpLzMRpAptz2THp7icFG31GJT23JTKFIqursK/0', 1, 'weixin', NULL, 1456450178, '啦啦'),
(48, '0', '4193795519', 48, 'e595a6e595a6e595a6', '4368616e', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HZ9zabquagNo9hxmqCrOO3HwfgMiafZqNe7PPWe5Opoibb0EeWehwXWYjMwz96arHpYCuGUcmd9ia0y/0', 1, 'weixin', NULL, 1456450323, 'Chan'),
(49, '0', '3697866124', 49, 'e68abde5a596', '436f7264656c6cf09f9192', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VuVGCV6rG25dgaDjB3ImX8dlibSxnMI5wRanEm7RULgy9RK6S8JJpLzMRpAptz2THp7icFG31GJT23JTKFIqursK/0', 1, 'weixin', NULL, 1456450428, '哈哈'),
(50, '0', '2616802536', 50, 'e68891e59ca8', '4368616e', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HZ9zabquagNo9hxmqCrOO3HwfgMiafZqNe7PPWe5Opoibb0EeWehwXWYjMwz96arHpYCuGUcmd9ia0y/0', 1, 'weixin', NULL, 1456450431, 'Chan'),
(51, '0', '1193127255', 51, 'e7adbee588b0', '536537456ef09f989d', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfZzIicKFxaMTEtyrbKCAL5EVUib0glkRRSWOkEs1XCaMNxzLdP3alaICxs7vqkoM7bAY4SroMxcR79/0', 1, 'weixin', NULL, 1456450535, '一震'),
(52, '0', '1193127255', 52, 'e4bda0e5a5bd7462e69d83', '536537456ef09f989d', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfZzIicKFxaMTEtyrbKCAL5EVUib0glkRRSWOkEs1XCaMNxzLdP3alaICxs7vqkoM7bAY4SroMxcR79/0', 1, 'weixin', NULL, 1456450686, '一震'),
(53, '0', '8944847666', 53, '31', 'e29c8eefb98f4d63e9b98fe5b09120f09f8ea420202020202020e2808de582b3e5aa92e5bdb1e8a696', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKe3w0VyxiaibFAX6Qjyd528vJqxYrW5E3YMJTjpK9tE7OYAjOJCMiaJ8wtYOpAGyudrtfspUdMZr2Mg/0', 1, 'weixin', NULL, 1456456228, '张鹏'),
(54, '0', '9295594232 ', 54, '此消息为图片！', 'e5bca0e699b6', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQVtyla2ZeVJ6UX6ILHfBPdNnQBxOfDZW3VlUQV4GviahtlZLPxfvibENYdwgyFS6AaDLO2DnzqX3qh/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx5XN0TiaoRwGJwHq4qpAQUaP6rQQvqwawKPmBaOvKIiaJf3WNibpxKd6QmKibib44xEwIVqD48Viaqqia3YvV0PStia7bbQx0.jpg', 1456457164, '张晶'),
(55, '0', '3962595105 ', 55, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5KBTuuvtCo9wCzufwImHqE9ZhuWSzZ7zLQcntO31gSNppOg9t57AWvNQx0.jpg', 1456457326, '杨洁'),
(56, '0', '3962595105 ', 56, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5KBTuuvtCo9wCzufwImHqE9ZhuWSzZ7zLQcntO31gSNppOg9t57AWvNQx0.jpg', 1456457410, '杨洁'),
(57, '0', '3962595105 ', 57, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5KfZfsvZE6XJlGyWksnXkOEX1yjSPMYPZBeI2Rv8rVOSI8SX0bwrgM5Qx0.jpg', 1456457536, '杨洁'),
(58, '0', '9295594232 ', 58, '此消息为图片！', 'e5bca0e699b6', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQVtyla2ZeVJ6UX6ILHfBPdNnQBxOfDZW3VlUQV4GviahtlZLPxfvibENYdwgyFS6AaDLO2DnzqX3qh/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx5XN0TiaoRwGJwHq4qpAQUaP6rQQvqwawKOzBYSqaqCBznJBXYSOuicnDbXRldiakSJwZcwsaWtoBcRJhTwAibmRgoAx0.jpg', 1456457735, '张晶'),
(59, '0', '3962595105 ', 59, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5KYJ7HIVNYzVAg1TKTJmWoqFWF3PYPjtZM9rRicPrxV4urwicSFyPiaLhicAx0.jpg', 1456457739, '杨洁'),
(60, '0', '3962595105 ', 60, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5Krfbibgib4C0stMricVAibPmicvviaWKXibczNFsJb9eyPTZRq53R4ytsDCkEwx0.jpg', 1456457848, '杨洁'),
(61, '0', '3962595105 ', 61, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5KYJ7HIVNYzVAg1TKTJmWoqFWF3PYPjtZM9rRicPrxV4urwicSFyPiaLhicAx0.jpg', 1456458414, '杨洁'),
(62, '0', '3962595105 ', 62, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5KoXfmIfVic00ibic32icSENghxBbnEnKbUhib6oY54ibwlMkjC80QvxCv1yNAx0.jpg', 1456458498, '杨洁'),
(63, '0', '5447320062 ', 63, '此消息为图片！', 'e5bca0e699b6', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQVtyla2ZeVJ6UX6ILHfBPdNnQBxOfDZW3VlUQV4GviahtlZLPxfvibENYdwgyFS6AaDLO2DnzqX3qh/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx5XN0TiaoRwGJwHq4qpAQUaP6rQQvqwawKHaAmfczibnJK869bJY6sW0yl6XfNN0n1O00xphcGmphia9zIgZvcJz7wx0.jpg', 1456458507, '张晶'),
(64, '0', '3962595105 ', 64, '此消息为图片！', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxry6J3cM5N0or3UohVR78DXLHRHKbsx5KgU2URibrr7tJeUMDKfa53ZOGryHoiaepNThY3IliaZ3cBHfAQ3icpvljCgx0.jpg', 1456458565, '杨洁'),
(65, '0', '5447320062 ', 65, '此消息为图片！', 'e5bca0e699b6', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQVtyla2ZeVJ6UX6ILHfBPdNnQBxOfDZW3VlUQV4GviahtlZLPxfvibENYdwgyFS6AaDLO2DnzqX3qh/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx5XN0TiaoRwGJwHq4qpAQUaP6rQQvqwawKYlFJycuq0AaMCIicpB3DZ3HuM66sVwlGkzeyqmptneiaghlRAzwIcsUAx0.jpg', 1456458653, '张晶'),
(66, '0', '8340965023', 66, 'e5a4a7e5aeb6e5a5bd', 'e4bb8ae697a5e5bbbae6b996', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HUrxkgj4PjtLeVDp4fxiaUYRGq46OfBQ8Op5RGgK8829Vp4QBZrMfj3ym5n1jCvSUjN2fCtLnJovb/0', 1, 'weixin', NULL, 1456467271, '小涛'),
(67, '0', '8340965023', 67, 'e68891e8a681e58faae883bde79c8be79c8b', 'e4bb8ae697a5e5bbbae6b996', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HUrxkgj4PjtLeVDp4fxiaUYRGq46OfBQ8Op5RGgK8829Vp4QBZrMfj3ym5n1jCvSUjN2fCtLnJovb/0', 1, 'weixin', NULL, 1456467315, '小涛'),
(68, '0', '8944847666', 68, 'e5a4a7e983bde4bc9a', 'e29c8eefb98f4d63e9b98fe5b09120f09f8ea420202020202020e2808de582b3e5aa92e5bdb1e8a696', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKe3w0VyxiaibFAX6Qjyd528vJqxYrW5E3YMJTjpK9tE7OYAjOJCMiaJ8wtYOpAGyudrtfspUdMZr2Mg/0', 1, 'weixin', NULL, 1456469682, '张鹏'),
(69, '0', '4460296810', 69, 'e59388e59388e59388e595a6e38082e68891e4bbac', 'e889bee28094e6b39be6bba5efbc8ce6b39be6bba5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1iaUuczdqXD3oibvZrdySgrxU7yhc0ssiamwlrSK4JczhW1xqG572xLYglZiaRD34gJDtLiaUqPqVPjzc/0', 1, 'weixin', NULL, 1456469689, '咖喱啊'),
(70, '0', '5558183133', 70, 'e4bda0e5a5bd', 'e4b8b9e69eab', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQCkq1k2TJVoNicShVTusaMmfSPhGccASYjQGMPX2K8twib7pbLWpzZQ1acmf8niaHZWTl7NB8Fp2ULO/0', 1, 'weixin', NULL, 1456469689, '朱'),
(71, '0', '4848544636', 71, '68', 'e58898e790a6', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELUIJSvx8fXjIgrgZlOBMoQaGhDGz7JJmIBhEa52ljxZVc8E65uAhu8ibyOsQUAlbmUiaWrambSFNKA/0', 1, 'weixin', NULL, 1456471012, '刘琦'),
(72, '0', '7682995604', 72, 'e696b0e5b9b4e5a5bdefbd9e', 'f09f8e80f09f9284f09f9285f09f8c9ff09f928bf09f9293e895bee29ca8f09f9298', 'http://wx.qlogo.cn/mmopen/uI5pczeERTbBENy5dslsarWK3hbQT2fgiasz7PqZMla4VlsrAJSjz9QKEvZ7iazxPODo29icYWWiaYSh5OSI2hIZzaGb9ibPtHeXy/0', 1, 'weixin', NULL, 1456471088, '柳蕾'),
(73, '0', '6279298208', 73, '2f3a3a7c', 'e88e8ee88e8e', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL842QqpodqWnRtzzmHEKsvE7WMxFDZmxDL1z6rkib9OtoWcibpM2wGQ854z0gqIHiaUuQj9MGlLct5g/0', 1, 'weixin', NULL, 1456471090, '许小莎'),
(74, '0', '1259657443', 74, '2f3a73686974', '4c59', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYomdeMtjZTdzlrIibrLo0ddiaFtGq8kGAO4dB0L8jCh3wXFRZLCb8Hl686eMX2O7hBrqtDcM6O4oiaBoQ0s5Rzhgu/0', 1, 'weixin', NULL, 1456471101, '刘跃'),
(75, '0', '7682995604', 75, '2f3a2c402d442f3a2c402d442f3a2c402d44', 'f09f8e80f09f9284f09f9285f09f8c9ff09f928bf09f9293e895bee29ca8f09f9298', 'http://wx.qlogo.cn/mmopen/uI5pczeERTbBENy5dslsarWK3hbQT2fgiasz7PqZMla4VlsrAJSjz9QKEvZ7iazxPODo29icYWWiaYSh5OSI2hIZzaGb9ibPtHeXy/0', 1, 'weixin', NULL, 1456471116, '柳蕾'),
(76, '0', '8371151877', 76, 'e69da5e4ba86', '5959264a4a', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6VXbzRN7GOobcnJJL3pk176UIx5h3cfPr0pSDfN0sOyfMRDPnp2mIJark7e4Rsgdicbo2NzjU4bCQ/0', 1, 'weixin', NULL, 1456471149, '杨洁'),
(77, '0', '4848544636 ', 77, '此消息为图片！', 'e58898e790a6', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELUIJSvx8fXjIgrgZlOBMoQaGhDGz7JJmIBhEa52ljxZVc8E65uAhu8ibyOsQUAlbmUiaWrambSFNKA/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxOWScYVs7z3DibEtAok670IIah4YlMiajeOicoex40edicyRc500cXHNVlOHN8rtHNpVwBuERNicvFQSwWgmMELAxf4wx0.jpg', 1456471154, '刘琦'),
(78, '0', '8142853447', 78, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456554328, '陈飞'),
(79, '0', '8142853447', 79, 'e59ca8e5b9b2e5989b', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456554358, '陈飞'),
(80, '0', '5825198497', 80, 'e5beaee5b18fe7a791e68a80e5beaee4bfa1e5a4a7e5b18fe5b995e6bc94e7a4ba', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456555835, '微屏科技'),
(81, '0', '5825198497 ', 81, '此消息为图片！', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNo5yRWTialC1CgrthpxCrlY0Vp9XeDzIcZfgicWjJghovx8XmZ0RPbSSAkpxJIMc7MvS7gNG3fa4lJZ59QqVpib3gx0.jpg', 1456555866, '微屏科技'),
(82, '0', '5825198497', 82, 'e5beaee5b18fe7a791e68a80e5a4a7e5b18fe5b995e6bc94e7a4ba', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456573482, '微屏科技'),
(83, '0', '5825198497 ', 83, '此消息为图片！', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNo5yRWTialC1CgrthpxCrlY0Vp9XeDzIcZfgicWjJghovx8XmZ0RPbSSAkpxJIMc7MvS7gNG3fa4lJZ59QqVpib3gx0.jpg', 1456573506, '微屏科技'),
(84, '0', '830057340 ', 84, '此消息为图片！', 'e998bfe789b9', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1qz2uFY1k12fA48yuA9EqvqYoN2uj2v9uulA2O4FB36h79alIc6Cw5jsw0MqBwDFB8fLxwqr1CPS/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxIBbaGgq7jAHb8yvFpybaUF7w9vPwdJB9Bib0CkPLBqOyDQvw2gWTibysEcgUWpPpvuQyTUA8rLKZlZkj14PHtic7Ax0.jpg', 1456652246, '张特'),
(85, '0', '7587473407', 85, 'e7adbee588b0e4ba86', '46616e6379', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv4PTDBibfjgmkA73eLCdsLEJpZhNZBbXJFfRUmbEU0iczRiaDXL3rpuglE8AqDUUPfYZI6lbGmtYxW2g/0', 1, 'weixin', NULL, 1456713086, '孑然'),
(86, '0', '6174307207', 86, 'e4bda0e5a5bd', 'e88b8fe69f92', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6EZPWO6KsSiboVQcadu8rP7Nd61fJXiccfz7ZYyeBokPrrr74Ib8NrodwticZVQW4hicyHWwz7zESSLQ/0', 1, 'weixin', NULL, 1456713190, '苏柒'),
(87, '0', '7587473407', 87, 'e68b8de68b8de4b990', '46616e6379', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv4PTDBibfjgmkA73eLCdsLEJpZhNZBbXJFfRUmbEU0iczRiaDXL3rpuglE8AqDUUPfYZI6lbGmtYxW2g/0', 1, 'weixin', NULL, 1456713205, '孑然'),
(88, '0', '4637128536', 88, 'e59388e596bd', 'e883a1e88081e5b888', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQTyrPqRaAIn25L5Yicv9V7DibD0kdGzIXXVPVb1ibpcAztevILDEOAaHZgicgOvlSKia3VHn5K7CGJCPW/0', 1, 'weixin', NULL, 1456713581, '胡梦雪'),
(89, '0', '4637128536', 89, 'e59388e596bd', 'e883a1e88081e5b888', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQTyrPqRaAIn25L5Yicv9V7DibD0kdGzIXXVPVb1ibpcAztevILDEOAaHZgicgOvlSKia3VHn5K7CGJCPW/0', 1, 'weixin', NULL, 1456713621, '胡梦雪'),
(90, '0', '6174307207', 90, 'e4bcafe587bde7bd91e7bb9c', 'e88b8fe69f92', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6EZPWO6KsSiboVQcadu8rP7Nd61fJXiccfz7ZYyeBokPrrr74Ib8NrodwticZVQW4hicyHWwz7zESSLQ/0', 1, 'weixin', NULL, 1456714023, '苏柒'),
(91, '0', '4637128536', 91, 'e69d8ee88081e5b888', 'e883a1e88081e5b888', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQTyrPqRaAIn25L5Yicv9V7DibD0kdGzIXXVPVb1ibpcAztevILDEOAaHZgicgOvlSKia3VHn5K7CGJCPW/0', 1, 'weixin', NULL, 1456714212, '胡梦雪'),
(92, '0', '2029915421', 92, 'e68aa2e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456789972, '陈飞'),
(93, '0', '2029915421', 93, '687474703a2f2f7777772e3737376d6f62616e2e636f6d2f507265766965772f33355f32362f', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456791506, '陈飞'),
(94, '0', '7638291352', 94, 'efbc81', 'e6a183e88ab1e88a82f09f8cb8e68aa5e5908de585a5e58fa3f09f8cb8e5ae9de5ae9d', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQHrlCianCQTeYKAESBicicA3mJCwfaAr68uF18uyBYE4nNpM8peqUVLP68MgHKvZAn2bLzKajDf9zhq/0', 1, 'weixin', NULL, 1456804641, '宝宝'),
(95, '0', '8038503546', 95, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838102, '分析'),
(96, '0', '8038503546', 96, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838159, '分析'),
(97, '0', '8038503546', 97, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838185, '分析'),
(98, '0', '8038503546', 98, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838586, '分析'),
(99, '0', '8038503546', 99, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838612, '分析'),
(100, '0', '8038503546', 100, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838688, '分析'),
(101, '0', '8038503546', 101, 'e68aa2e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838702, '分析'),
(102, '0', '8038503546', 102, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456838994, '分析'),
(103, '0', '8038503546', 103, 'e6aca2e8bf8ee585b3e6b3a8', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456839314, '分析'),
(104, '0', '2116666946', 104, 'e59bbee69687', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456879942, '陈飞'),
(105, '0', '5446692239', 105, 'e59bbee69687', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456880091, '张飞'),
(106, '0', '5446692239', 106, 'e59bbee69687', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456880175, '张飞'),
(107, '0', '5446692239', 107, 'e7baa2e58c85', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456880726, '张飞'),
(108, '0', '8491478743', 108, 'e9aa8ce8af81', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456915823, '陈峰'),
(109, '0', '7004742672', 109, 'e7baa2e58c85', 'e5beaee5b18fe7a791e68a80', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQFnfWRT3yEjmhrDkmmOsWlVJxQvPID5I3DNGVMDxJIlHzbpUcdKDt91ZxLsDv1y7UxgWIvtpMYyib/0', 1, 'weixin', NULL, 1456917047, '855'),
(110, '0', '8491478743', 110, 'e7a59ee9a9acee908d20', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456974220, '陈峰'),
(111, '0', '8491478743', 111, 'e59ca8e59097e38082', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456975122, '陈峰'),
(112, '0', '5219071531', 112, 'e4bd93e9aa8ce4b880e6aca1', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456977111, '陈峰'),
(113, '0', '5219071531', 113, 'e4bda0e5a5bde680a7e6849f', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1456977119, '陈峰'),
(114, '0', '5219071531', 114, 'e5b8aee58aa9', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457076876, '陈峰'),
(115, '0', '5219071531', 115, 'e98080e587ba', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457152478, '陈峰'),
(116, '0', '5219071531', 116, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457152548, '陈峰'),
(117, '0', '5945592651', 117, 'e4b88ae5a299', 'e6b885e9a699e69ca8', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5CLp3z6TiabpqhNnaVlhGFZFzZBPWSP9pjibIbKJPopa9Ddl9z65beVZ20Wyev57AKiaE6yeWLqtCiag/0', 1, 'weixin', NULL, 1457152609, '来'),
(118, '0', '8510960927', 118, '6a6a', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457400133, 'jjj'),
(119, '0', '8510960927', 119, 'e98080e587ba', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457400139, 'jjj'),
(120, '0', '8510960927', 120, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457400250, 'jjj'),
(121, '0', '6054764253', 121, '20e7adbee588b0e68f90e7a4ba', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457400339, '陈飞'),
(122, '0', '4313659448', 122, 'e9a39ee69cba', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457402616, '飞机'),
(123, '0', '4313659448', 123, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457403018, '飞机'),
(124, '0', '6935813767', 124, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457403117, '的都'),
(125, '0', '6935813767', 125, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457404656, '的都'),
(126, '0', '8066544196', 126, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457405761, '飞机'),
(127, '0', '8066544196', 127, 'e7be8ee5a5b332', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457405766, '飞机'),
(128, '0', '2487946959', 128, 'e4bda0', '537565e38081735553753375', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6XicSkyXI6NQ1CqWbTdA4VhwTp0M4YX9baGA3PDCJsuiaibZ1iaiaRhCnnBpM1d7VlEfJjh0cibt4yNlWQic/0', 1, 'weixin', NULL, 1457467227, '彭'),
(129, '0', '7160318667', 129, 'e68abde5a596', 'e6988ee69c88', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEK7nEicuNqKNfCAfpfX2ib6YF1FIpcNvtia9Kd5fd561jP8g8Ys0b3bku136oN0pFxkpgatHwTrXice4g/0', 1, 'weixin', NULL, 1457512540, '熊'),
(130, '0', '3781992868', 130, 'e4b88ae5a299', 'e5b08fe882a5', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfbl1W8yUAw5ErmJHMACZ4IOeichUhLBcanfraeSIDibvpiaRkjYDvv6Y58h6ILo94FnibcJKOPKejFfY/0', 1, 'weixin', NULL, 1457675530, 'jack'),
(131, '0', '3781992868 ', 131, '此消息为图片！', 'e5b08fe882a5', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfbl1W8yUAw5ErmJHMACZ4IOeichUhLBcanfraeSIDibvpiaRkjYDvv6Y58h6ILo94FnibcJKOPKejFfY/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxJeZjLXGdnpicrGDVmkY9xic0towf54z5UeFYysNNJ8aic4CWtZzgBiaY39M6LCXaLnJX6trVjPcpdg92psHib55V2SQx0.jpg', 1457675562, 'jack'),
(132, '0', '8889857980', 132, 'e59388e59388', 'e5b195e9b98f', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQPqfDzVibORBZyGDCLUukXCu08sqGKPEW0pXNpiaGH9DQT1ibfQxh5cpicqFkywH3X2hK6IAbthMibegR/0', 1, 'weixin', NULL, 1457703583, '陈'),
(133, '0', '8824334763', 133, 'e69096e4b880e69187', 'e5b08fe7a59ee4bb99', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQZwGQ2emkDwYTn05e5ibIG0Diakn6biaKGUibrRdvCl8BJCE33eiaicuribIAziaxibtFe8N9x7JWyO74quqx/0', 1, 'weixin', NULL, 1457754204, '王豪'),
(138, '0', '9413427717', 138, 'e59ca8e593aae9878ce5958a', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457849416, '陈飞'),
(139, '0', '9413427717', 139, 'e4bda0e59ca8e982a3e9878ce5958a', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457849419, '陈飞'),
(140, '0', '3781992868 ', 140, '此消息为图片！', 'e5b08fe882a5', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYIhXhsrjOCfbl1W8yUAw5ErmJHMACZ4IOeichUhLBcanfraeSIDibvpiaRkjYDvv6Y58h6ILo94FnibcJKOPKejFfY/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxJeZjLXGdnp9RHDb8ibicnlBU931nOkIiacJTrTTRVBo5t8EXMQ9nh12qWIb6iclKtzSSQFc4W0HAPDYzHJVNaoRkMQx0.jpg', 1457917202, 'jack'),
(137, '0', '9413427717', 137, 'e691b8e691b8', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQGBpQVtYp6pbhcYravmfibma8cuM5O3Gjb1CdLkzx3BiakEk9rRLBvlQA0ldBVmX10gFBFl7aSExum/0', 1, 'weixin', NULL, 1457849378, '陈飞'),
(136, '0', '7493624479', 136, 'e593a6e593a6', 'e6bbb4e6bbb4e59392', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQeS4EmicxxdJ2ian9RMWdLOTovwoXF87VaC03oART8RRJtUicZ1ze8UpTTmAezWpaZibdP9njAc8ia4wz/0', 1, 'weixin', NULL, 1457845304, '杨翟'),
(141, '0', '2028624409', 141, 'e5a4a7e5aeb6e5a5bd', 'e69d8ee5ae8fe59bbe', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1ia8Vg8qgN7Wvk7LEf4gVvfbJQL4nc89Kltw0GgcjnqElpyF3AbglVt4zzojACibxAuE9UibfYrz4ce/0', 1, 'weixin', NULL, 1457965126, '李宏图'),
(142, '0', '6597287669', 142, 'e4bda0e5a5bd', 'e68ab1e78e89e8978fe5b1b1', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1XeNMnAJRapj0M0eAoMfh4fgSCL1Cd0xQjwLt4qqPrakiaUTibRYZtQoOqHFYWQOLibiaQxzBFI6peRxB3GvWnwzmYF/0', 1, 'weixin', NULL, 1457991626, '罗总'),
(143, '0', '8889857980', 143, '20e68b94e6b2b3', 'e5b195e9b98f', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQPqfDzVibORBZyGDCLUukXCu08sqGKPEW0pXNpiaGH9DQT1ibfQxh5cpicqFkywH3X2hK6IAbthMibegR/0', 1, 'weixin', NULL, 1458006052, '陈'),
(144, '0', '8889857980', 144, '20e68b94e6b2b3', 'e5b195e9b98f', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1VnRCiaTMX5gQPqfDzVibORBZyGDCLUukXCu08sqGKPEW0pXNpiaGH9DQT1ibfQxh5cpicqFkywH3X2hK6IAbthMibegR/0', 1, 'weixin', NULL, 1458006065, '陈'),
(145, '0', '6516736231', 145, 'e4bda0e5a5bd', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', 1, 'weixin', NULL, 1458089974, '高翔'),
(146, '0', '6516736231 ', 146, '此消息为图片！', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxIbKbFGX2SXbaDMOh3R81ZJMrEWU7DGQVIJsyVBDtg93l5CeeDg9YN1k3d64e9nD838XB9TIfice3tG7ll6ib1KUwx0.jpg', 1458089986, '高翔'),
(147, '0', '6516736231', 147, 'e59388e59388e59388', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', 1, 'weixin', NULL, 1458090000, '高翔'),
(148, '0', '6516736231', 148, 'e7898ce785a7', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', 1, 'weixin', NULL, 1458090170, '高翔'),
(149, '0', '6516736231', 149, 'e68b8de785a7', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', 1, 'weixin', NULL, 1458090173, '高翔'),
(150, '0', '6516736231 ', 150, '此消息为图片！', 'e9ab98e7bf94f09f8f85', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ3BfOH78HXLiaeWickfoRk1P5UGQFlC51WTaBuSCY9icJ1EY7c06E9HWjVlAgznic6K3XHLKNXVp6lUg/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxIbKbFGX2SXbaDMOh3R81ZJMrEWU7DGQVIJsyVBDtg93l5CeeDg9YN1k3d64e9nD838XB9TIfice3tG7ll6ib1KUwx0.jpg', 1458090182, '高翔'),
(151, '0', '2184478331', 151, 'e4bda0e5a5bd', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', 1, 'weixin', NULL, 1458135804, 'Dai'),
(152, '0', '2184478331', 152, 'e4bda0e5a5bd', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', 1, 'weixin', NULL, 1458135914, 'Dai'),
(153, '0', '2184478331', 153, 'e5a4a7e5aeb6e5a5bd', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', 1, 'weixin', NULL, 1458135923, 'Dai'),
(154, '0', '2184478331 ', 154, '此消息为图片！', '446169', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Sl68uU1dyH6X1gazb2o0ukjm5VkVGia9vQcJoJZD7Keicl2nrUAEZzywphab2SXz57yA30oGXdibOB2HIOhbPYevl1/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxcszxf1PctZDW1Yicb92r9XKp5Yg0jYUQX72CmsFO3s0ookvicJg3D4XSpzjic3RQLh0kLKeYXzsuDmtZjzrVibRpEgx0.jpg', 1458136311, 'Dai'),
(155, '0', '4909849180', 155, 'e68891e79a84e5bf83', 'e5a48fe5a4a9e79a84e9a38e', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1WNLCaNliazSrQ4XLhRqTEysCO9TicSDyyuHJJHmeFw9fXJOtsaPibm39EXyHz9ZLGpSdHic3C4ArC9zw/0', 1, 'weixin', NULL, 1458177338, '东哥'),
(156, '0', '4909849180', 156, 'e5bc80e59cbae5af86e7a081', 'e5a48fe5a4a9e79a84e9a38e', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1WNLCaNliazSrQ4XLhRqTEysCO9TicSDyyuHJJHmeFw9fXJOtsaPibm39EXyHz9ZLGpSdHic3C4ArC9zw/0', 1, 'weixin', NULL, 1458177376, '东哥'),
(157, '0', '1386712275', 157, '31', 'e8b7afe58589', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJRNZibD4BdfQprcuFpjQ8o0ddiaUSX5eq2rYF81qGHNJbicpFmYWlj0P5g3zoFAXSbh86UYtiarTNCbg/0', 1, 'weixin', NULL, 1458202109, '老路'),
(158, '0', '6488476372', 158, '2f3a3a292f3a3a292f3a3a292f3a3a292f3a3a29', 'e5bca0e890b1e4b8bd', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1UdA5AHepjkkkYWM8bLDI0q8IsEeqjJaicVTOY6sqKs1ibU8ia3gWGBKb5W1NNgOicHnZeVSl32FODgQwnSmXJnnKNI/0', 1, 'weixin', NULL, 1458202577, '张小姐'),
(159, '0', '2958089863', 159, '31', '4b617965', 'http://wx.qlogo.cn/mmopen/uI5pczeERTZYNusGpibqnaMhHxwPWaq9vJhUq2hZpGQRETc8pxJc8Iegn3qNtgtgPZZr0uCjBNv7jX40z62sodCiboInhQB9iap/0', 1, 'weixin', NULL, 1458202583, 'kaye'),
(160, '0', '2958089863', 160, '77656978696e', '4b617965', 'http://wx.qlogo.cn/mmopen/uI5pczeERTZYNusGpibqnaMhHxwPWaq9vJhUq2hZpGQRETc8pxJc8Iegn3qNtgtgPZZr0uCjBNv7jX40z62sodCiboInhQB9iap/0', 1, 'weixin', NULL, 1458202606, 'kaye'),
(161, '0', '6488476372 ', 161, '此消息为图片！', 'e5bca0e890b1e4b8bd', 'http://wx.qlogo.cn/mmopen/YxMQ0Iz0W1UdA5AHepjkkkYWM8bLDI0q8IsEeqjJaicVTOY6sqKs1ibU8ia3gWGBKb5W1NNgOicHnZeVSl32FODgQwnSmXJnnKNI/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxTCzBJz8Sf34o4qHj5gYdIjFtVP6iaAXJ6av2vNynF2I4ribfNpCkaMHVbZtftaypQZkMHp6tq6dgCd0va7XvDN8wx0.jpg', 1458203461, '张小姐'),
(162, '0', '3150161489', 162, '6a6868', 'e7aba5e5b78d', 'http://wx.qlogo.cn/mmopen/A62278ykN40OAWKL4hCepfj1kblqrRzc5mcqAOn6PuGaEJgOgQ1t2nt0s1hdfibCMaEwgnP3O13A0uOXeLibp9D1icReEmA0fGn/0', 1, 'weixin', NULL, 1458206083, 'tong'),
(165, '0', '8357274436 ', 165, '此消息为图片！', 'e5b08fe79aaee593a5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcbkJicCGwiarr06F1bJnt9mkZRDMzsBKDHBDW1DXmRfaZFxfRC7r8Wia3F6rWOrenbohwTKZCrK9DL/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxicnOWtpwATLE2nib8oMuO40DfiawT15rAkfDXuuFd1M0ZvMnteajsiakWUrLT7lw676jpJL5cr3CsGQNqT0reFnfiaQx0.jpg', 1458270127, ''),
(170, '0', '2959110826', 170, 'e4b88ae5a299', 'e680aae59296', 'http://wx.qlogo.cn/mmopen/uI5pczeERTZ1lUpIQlIy73q40bzCicSLwiaDsfNcNIdMLicSjJficwrqt9sG9GU7iaTWXMG8dLpQPZF3q7DN4lTrBng/0', 1, 'weixin', NULL, 1458980781, ''),
(164, '0', '8357274436', 164, 'e5beaee4bfa1', 'e5b08fe79aaee593a5', 'http://wx.qlogo.cn/mmopen/3pRobhCI8Skpa4iahquu5HcbkJicCGwiarr06F1bJnt9mkZRDMzsBKDHBDW1DXmRfaZFxfRC7r8Wia3F6rWOrenbohwTKZCrK9DL/0', 1, 'weixin', NULL, 1458270008, ''),
(168, '0', '2983932642', 168, 'e68abde5a596', '41e6bcabe6ada5e4ba91e7abaf41efbc88e5a79ae78e89e5bcbaefbc89', 'http://wx.qlogo.cn/mmopen/uI5pczeERTbrr9iccZGPaiaNO9pMDyOGiaoz3pwX6Ylib04t3jvIX55VbDLfhePiaibxxPqETDdT8bL6Kr2iazchY6JlQ/0', 1, 'weixin', NULL, 1458913629, ''),
(169, '0', '4661504177', 169, 'e6b58be8af95', 'e5bdaa', 'http://wx.qlogo.cn/mmopen/nnPYsicXP1K3W7vYlcpgAL492cZaG33caSXhO6sIWqgcic4RuiaZ4v4nJoVPvz5PILdg5sMpYSWGURg4xoYABNc1cmeTicxQSrzq/0', 1, 'weixin', NULL, 1458980678, ''),
(167, '0', '6741979840', 167, '31', 'e5b881e88194e585a8e79083e280a2e59586e5ada6e999a2', 'http://wx.qlogo.cn/mmopen/uI5pczeERTYomdeMtjZTd4BbPdGTUoaPGspD2VAI97wOm0vdibIx4AyiaPwgoHN4RwMGz284X8YtPQYHaZ02ofC93e91as4nQJ/0', 1, 'weixin', NULL, 1458713982, ''),
(171, '0', '7588104509', 171, 'e4b88ae5a299', 'e58d97e998b3e78e89e99b95', 'http://wx.qlogo.cn/mmopen/3pRobhCI8SlicgfnYgRqV1vH9AYILIjBXia5d6BLu4EPz7O6NoibCPpSFicSgDibuXbJKY391iatjp0cdXqQ6bw799hcQWIFygCVicia/0', 1, 'weixin', NULL, 1459074969, ''),
(172, '0', '951187543', 172, '7777', '53616c76657265303030', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5KJNcs7e07YzMD1LQLUlLKv1N2BRQQZwbibE44Wut78DicXebpt5zeShOEvkjZLKIURUULOGcptHTewTwYXcMHQbP6dU3eAjHfc/0', 1, 'weixin', NULL, 1459135386, ''),
(173, '0', '951187543', 173, 'e4b88ae5a2990a', '53616c76657265303030', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5KJNcs7e07YzMD1LQLUlLKv1N2BRQQZwbibE44Wut78DicXebpt5zeShOEvkjZLKIURUULOGcptHTewTwYXcMHQbP6dU3eAjHfc/0', 1, 'weixin', NULL, 1459135412, ''),
(174, '0', '951187543', 174, '28e0b991cb99e29da5cb99e0b99129e6868be8afb4e8af9de590bbe68891', '53616c76657265303030', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5KJNcs7e07YzMD1LQLUlLKv1N2BRQQZwbibE44Wut78DicXebpt5zeShOEvkjZLKIURUULOGcptHTewTwYXcMHQbP6dU3eAjHfc/0', 1, 'weixin', NULL, 1459135434, ''),
(175, '0', '951187543', 175, 'e68abde5a596', '53616c76657265303030', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5KJNcs7e07YzMD1LQLUlLKv1N2BRQQZwbibE44Wut78DicXebpt5zeShOEvkjZLKIURUULOGcptHTewTwYXcMHQbP6dU3eAjHfc/0', 1, 'weixin', NULL, 1459135481, ''),
(176, '0', '951187543', 176, 'e9878de7bdae0a', '53616c76657265303030', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5KJNcs7e07YzMD1LQLUlLKv1N2BRQQZwbibE44Wut78DicXebpt5zeShOEvkjZLKIURUULOGcptHTewTwYXcMHQbP6dU3eAjHfc/0', 1, 'weixin', NULL, 1459135524, ''),
(177, '0', '282895763', 177, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/icagLyLBIpv6QiahlHeBsGQW8ZCE97cOoDDNZfvVexETdyOLrooXWgiaEiaMIkBpIXzOtKWDjuDJTqDKktLwibgU85NFLeqDtgriaq/0', 1, 'weixin', NULL, 1459304081, ''),
(178, '0', '4927141130', 178, 'e68abde5a596', 'e68bbee5bf86', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaELtzBgVwjuohgfX5BiaUMibfibPbUYta0W5MfzD0fSkibI2SEhUwiaScFIBPHdevWqVXUKr4U3yEicVOBZA/0', 1, 'weixin', NULL, 1459329838, ''),
(179, '0', '5030020301', 179, 'e59388e59388e59388e59388e59388', 'f09f94bb4a2d5474747474f09f94bb', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEImQS5BC2f53uYOiblVUaRqdHgKqMiaSGWnJTgKVYoHhmxfVB8wKrXLxbEqzMezMHDwBEAZ9fp0QLcg/0', 1, 'weixin', NULL, 1459336972, ''),
(180, '0', '5030020301', 180, 'efbc9fe598bfe598bf', 'f09f94bb4a2d5474747474f09f94bb', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEImQS5BC2f53uYOiblVUaRqdHgKqMiaSGWnJTgKVYoHhmxfVB8wKrXLxbEqzMezMHDwBEAZ9fp0QLcg/0', 1, 'weixin', NULL, 1459337349, ''),
(181, '0', '8598528428', 181, '2f3a3a24', 'e5a4a7e883a1e5ad90', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCEElOgC9hVH634s2MZvz2eAQQcsAw5mwvvKzUoAV8oHWwWR4QkC1At4GlHT5lKjeUJxsylHictVEg/0', 1, 'weixin', NULL, 1459337435, ''),
(182, '0', '8598528428', 182, '2f3a3a42', 'e5a4a7e883a1e5ad90', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCEElOgC9hVH634s2MZvz2eAQQcsAw5mwvvKzUoAV8oHWwWR4QkC1At4GlHT5lKjeUJxsylHictVEg/0', 1, 'weixin', NULL, 1459337474, ''),
(183, '0', '8598528428', 183, '313233', 'e5a4a7e883a1e5ad90', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCEElOgC9hVH634s2MZvz2eAQQcsAw5mwvvKzUoAV8oHWwWR4QkC1At4GlHT5lKjeUJxsylHictVEg/0', 1, 'weixin', NULL, 1459337495, ''),
(184, '0', '5030020301', 184, '313233', 'f09f94bb4a2d5474747474f09f94bb', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEImQS5BC2f53uYOiblVUaRqdHgKqMiaSGWnJTgKVYoHhmxfVB8wKrXLxbEqzMezMHDwBEAZ9fp0QLcg/0', 1, 'weixin', NULL, 1459337506, ''),
(185, '0', '7395823212', 185, 'e6b4bbe58aa8', '626f6266616e', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwATuOJQAIA9RZpM9LOqr4YenEic8EhcllziaeF6gVLfyoQhEIYTjhJ3LzJJPoSw46iayvPtF1Im3kwY1/0', 1, 'weixin', NULL, 1459407648, ''),
(186, '0', '7395823212', 186, 'e4b88ae5a299', '626f6266616e', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwATuOJQAIA9RZpM9LOqr4YenEic8EhcllziaeF6gVLfyoQhEIYTjhJ3LzJJPoSw46iayvPtF1Im3kwY1/0', 1, 'weixin', NULL, 1459407760, ''),
(187, '0', '5030020301', 187, '313233', 'f09f94bb4a2d5474747474f09f94bb', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEImQS5BC2f53uYOiblVUaRqdHgKqMiaSGWnJTgKVYoHhmxfVB8wKrXLxbEqzMezMHDwBEAZ9fp0QLcg/0', 1, 'weixin', NULL, 1459498039, ''),
(188, '0', '4820548917', 188, '31353535', 'f09f94bb4a2d5474747474f09f94bb', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJvTNXegvWeOUADB7iclSLiaib7O3XgQczgxMVndr6Zr28I2vtKxvXLYwvuBiaP8emW8mzy06ophPoduQ/0', 1, 'weixin', NULL, 1459498248, '唐佳婕'),
(189, '0', '3485987552', 189, 'e598bbe598bb0a', 'e6a2a6e5b7a5e58e82e5a99ae5ba8620e6b4aa', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI5AslLbam8xXhsHubhU2bt0iaJw6SpeDwd2HRianz7GibiaicDssuaqIySxZwJJQPLUuGicXsPstLhg7QQ/0', 1, 'weixin', NULL, 1459500628, '好的'),
(190, '0', '3485987552', 190, 'e69da5e4ba86', 'e6a2a6e5b7a5e58e82e5a99ae5ba8620e6b4aa', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI5AslLbam8xXhsHubhU2bt0iaJw6SpeDwd2HRianz7GibiaicDssuaqIySxZwJJQPLUuGicXsPstLhg7QQ/0', 1, 'weixin', NULL, 1459500646, '好的'),
(195, '0', '9791187026', 195, 'e69187e4b880e69187', 'e68bbee5bf86', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKyBEYqpOmJiaPicOOnSBdBeKx03bNxq2ggPr33tyHBwptIWrXLT9ichLaITic3VU1NceoFialje69zcjQ/0', 1, 'weixin', NULL, 1459568714, ''),
(196, '0', '9791187026', 196, 'e69187e4b880e69187', 'e68bbee5bf86', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEKyBEYqpOmJiaPicOOnSBdBeKx03bNxq2ggPr33tyHBwptIWrXLT9ichLaITic3VU1NceoFialje69zcjQ/0', 1, 'weixin', NULL, 1459568714, ''),
(197, '0', '7373269928', 197, 'e4bda0e5a6b9e5958a', 'e59ca3e793a6e4bca6e4b881e79a84e78eabe791b0f09f8cb9', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAfUokLPyZtEy7Q0ibS3eFd1XPQUvAkPVCVNF4RbQKnWWpzhKibiaGhGBcVx75A1BqgMib2m6icZfag0Aic/0', 1, 'weixin', NULL, 1459830975, '拼爹');
INSERT INTO `weixin_wall` (`id`, `messageid`, `fakeid`, `num`, `content`, `nickname`, `avatar`, `ret`, `fromtype`, `image`, `datetime`, `mingzi`) VALUES
(193, '0', '3485987552', 193, 'e4bda0e78c9c', 'e6a2a6e5b7a5e58e82e5a99ae5ba8620e6b4aa', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEI5AslLbam8xXhsHubhU2bt0iaJw6SpeDwd2HRianz7GibiaicDssuaqIySxZwJJQPLUuGicXsPstLhg7QQ/0', 1, 'weixin', NULL, 1459500691, '好的'),
(194, '0', '9820484859', 194, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1459566909, '飞哥'),
(198, '0', '259131863', 198, 'e4bda0e8bf98e5a5bde590a7', 'e9bb84e69f8fe587af', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicnfjQCdo1ibjdgD60gibJV0RPaV7GsV266WNfaImJmpS8wrh0gaB6d2td5GHmLekj31P6ztdQsibdgu/0', 1, 'weixin', NULL, 1459922110, '黄鑫'),
(199, '0', '5736215823', 199, '2f3a3a292f3a3a292f3a3a29', 'e5bca0e69eabe6988e', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8GYaGjWMB853gGS4Eeb8tozSSG2Iic3FO1Q3UFiavLFjLdnW0hBHk3eDcX2jTXYzcgd8HUvHjzfZ2Z4ibp3Xg7swI/0', 1, 'weixin', NULL, 1459996189, '张家界'),
(200, '0', '3584664139 ', 200, '此消息为图片！', 'e7a8bbe88ab1e9a699', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicwBHOib00Bo0cD2qoHUsGrr1rG3R0dFkA9c7ibSMUH0PzKFWWL06Pc2qlia43Vicn98cuFgJorqGCicKiaR8w3Wvq6Qq/0', 1, 'weixin', 'http://adnweixin-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxMtMfquHHyY6so1qDODib6XCc9Dpicd8o4YjL0lUu5OfeWp3R1pMgMbKffeb6RMb5peapS0gbiakHrxDs9djJjaaBQx0.jpg', 1460011244, '欧阳'),
(201, '0', '3584664139', 201, 'e68ba8e6b2b3', 'e7a8bbe88ab1e9a699', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicwBHOib00Bo0cD2qoHUsGrr1rG3R0dFkA9c7ibSMUH0PzKFWWL06Pc2qlia43Vicn98cuFgJorqGCicKiaR8w3Wvq6Qq/0', 1, 'weixin', NULL, 1460011706, '欧阳'),
(202, '0', '4013929994', 202, '64616f64616f', 'e9a9ace4bd93e992a2', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgicB8CCQo0DBWHmOfY0XpTq6V1UibXtUXMb90tBQvRfUDRa6fwNLlMKpHJjDxInPQKYexicBb77yia8H6QNfk91plqp/0', 1, 'weixin', NULL, 1460079748, 'daod'),
(203, '0', '3460311324', 203, 'e5a5bd', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', NULL, 1460090121, '杨磊'),
(204, '0', '2563358276', 204, 'e68abde5a596', 'e5938ee591a6efbc8ce4b88de99499', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvictib0rjAI1v6M1pYic67WmIUoQXzv1NnPDVSCiblUYoSrQIncOQOvZxicJICXKuPEAq434cxlL4ytPT3/0', 1, 'weixin', NULL, 1460199222, '测试'),
(205, '0', '739791770 ', 205, '此消息为图片！', 'e79b90e59f8ee5a688e5a688e59c8840e6b581e59f9f', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5dcA0prCxkPthMFqwvZu942hXfQwT6PiauMEk9C8q0EpaMXib998NQGaqVmDuoIeiaia1n8ibtJ9kYrdQ/0', 1, 'weixin', 'http://adnweixin-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxEibBgVfnQLcVOh80tOr7blsA68GicSwXppgKtvot1gyxCz9zv5XibcRcfh3ar02MXKSsASicHQ7NLZDicW42ma3kiblQx0.jpg', 1460257304, 'Kkkk'),
(206, '0', '5501517159', 206, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1460295973, '陈飞'),
(207, '0', '895751147', 207, '3631383839', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1460431564, '陈飞'),
(208, '0', '895751147', 208, 'e5beaee4bfa1e5a299', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1460431778, '陈飞'),
(209, '0', '8942465947', 209, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1460472249, ''),
(210, '0', '8942465947', 210, 'e5beaee4bfa1e5a299', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1460516224, ''),
(211, '0', '8033543288', 211, 'e68abde5a596', 'e88fa9e68f90', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO12f1NibxJwTbTMFdJXrAZHbUpbebuaicWeTmiciccKNQjFfkiaib6vLVXOjqZXYHdesVGyw8y4mDWv4zJicaQicb1T47YS/0', 1, 'weixin', NULL, 1460524985, ''),
(212, '0', '8033543288 ', 212, '此消息为图片！', 'e88fa9e68f90', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO12f1NibxJwTbTMFdJXrAZHbUpbebuaicWeTmiciccKNQjFfkiaib6vLVXOjqZXYHdesVGyw8y4mDWv4zJicaQicb1T47YS/0', 1, 'weixin', 'http://cnwpkj-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx19Fj0qBtRTOJia30hicZX6B312ot42qFp9WbMdXKsL9kp6H0FovwzcMtM1uWN8lVtByricauica3SeV0hk8JfMln2wx0.jpg', 1460525132, ''),
(213, '0', '652972856', 213, 'e69187e4b880e69187', 'e4bfa1e5b7a2e7bd91e7bb9cefbd9ee6a281e4b89ae6b3a234303038383537373738', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicq4ZYUa9ibxa165AXv1swiaAPKzOvL4MpoNAHOkvhLMbN1OFLVX2GPN9wlfMibb6tZwJyhiaqK7Gk7Bx/0', 1, 'weixin', NULL, 1460611218, ''),
(214, '0', '1176517095', 214, 'e7adbee588b0', 'e4bfa1e5b7a2e7bd91e7bb9cefbd9ee6a281e4b89ae6b3a234303038383537373738', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicq4ZYUa9ibxa165AXv1swiaAPKzOvL4MpoNAHOkvhLMbN1OFLVX2GPN9wlfMibb6tZwJyhiaqK7Gk7Bx/0', 1, 'weixin', NULL, 1460611367, ''),
(215, '0', '9687374749', 215, 'e68abde5a596', 'e580aae6a5b7e6b787', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicDWOBbibNkb7RFNmeKDXiaql8ic4aj6Z6C273Xg9ehCevib7UDUgFuTnZYyecgxeyI7BwnkjdrWODrA2efgeQWibmHX/0', 1, 'weixin', NULL, 1460618245, ''),
(216, '0', '9687374749', 216, 'e7adbee588b0', 'e580aae6a5b7e6b787', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicDWOBbibNkb7RFNmeKDXiaql8ic4aj6Z6C273Xg9ehCevib7UDUgFuTnZYyecgxeyI7BwnkjdrWODrA2efgeQWibmHX/0', 1, 'weixin', NULL, 1460618259, ''),
(217, '0', '1556290574', 217, '6473', 'e580aae6a5b7e6b787', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicDWOBbibNkb7RFNmeKDXiaql8ic4aj6Z6C273Xg9ehCevib7UDUgFuTnZYyecgxeyI7BwnkjdrWODrA2efgeQWibmHX/0', 1, 'weixin', NULL, 1460619236, ''),
(218, '0', '1999796405', 218, '67', 'e580aae6a5b7e6b787', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMicDWOBbibNkb7RFNmeKDXiaql8ic4aj6Z6C273Xg9ehCevib7UDUgFuTnZYyecgxeyI7BwnkjdrWODrA2efgeQWibmHX/0', 1, 'weixin', NULL, 1460619499, ''),
(219, '0', '973082360', 219, 'e59ca8e7babf', 'e69d8ee5a89c', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgibGjwxUiceb5vKcIDD9KIYOqytfdPVOtcXNMPsKbibvwudq3FNIlAbM95Ws4AwiaTRdsibEkaP7sZcYsaAxCvGdGBWC/0', 1, 'weixin', NULL, 1460620983, ''),
(220, '0', '3173966619', 220, 'e8bea3e6a492', '5269636be7b485', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTu6KVyWCeE4C6VMlMjAl70FItdCIdvSV8zoLgo7pc1fp2TTHOLPNtwIFKU1UYaIBcbdKibrVOc4k/0', 1, 'weixin', NULL, 1460621138, ''),
(221, '0', '868905513', 221, 'e4bda0e5a5bd', 'e8b4a2e8b28ce58f8ce585a8', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiccomtmoAxHDIqeLHEuQFl31rnKqvkcK4IPu12gRZydBUwibMr5kwys5bupqgKlGrOPzStPj3yELXLpV0VX0LkeQ/0', 1, 'weixin', NULL, 1460681327, ''),
(222, '0', '9833587804', 222, 'e69187e4b880e69187', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 1, 'weixin', NULL, 1460897687, ''),
(223, '0', '9833587804', 223, 'e69187e4b880e69187', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 1, 'weixin', NULL, 1460897687, ''),
(224, '0', '9833587804', 224, 'e69187e4b880e69187', 'e5be88e5a4a7e5be88e5a4a7', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicvn8rPeNLHCgys1MAcX3Cd3ZPRZ3QfIHmBGF5RVMnicr3zByjkvnUvE1LVMA3DdlibNyRnFPuowZPs/0', 1, 'weixin', NULL, 1460897687, ''),
(225, '0', '8044104736', 225, 'e68abde5a596', 'e68891e58fabe8b4bae5bbbae69c8b40', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAiadNUbStLK2Eqia1DvfK8DpHSZMic102kRfA1SpruEao9h8m7s7kRWXSswJOgFZvmkvcKDW7oyHvsw/0', 1, 'weixin', NULL, 1460953421, '贺建朋'),
(226, '0', '5573925046', 226, 'e69187e4b880e69187', 'e7a38ae4b88de7b4af', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwARkPdicib4lFaAbtGytDmkamTE9icMMS7oibKbHp3mibTug4pyX5icL9rcNaB04VPcWouXtxjE9Dn9IF9A/0', 1, 'weixin', NULL, 1460973690, '陶磊磊'),
(227, '0', '6552881055', 227, 'e69187e4b880e69187', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1461291091, '沉默'),
(228, '0', '208779568', 228, 'e5868de8a781efbc8c', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1461292123, '美女'),
(229, '0', '7701939859', 229, 'e8a7a3e694bee5869be796afe78b82', 'e6b1aae6b48b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCGFq9ia8FuOJMo0d9lLz8yMSzdwj5atC8fiaB8mibbHObfgjKAyX1Fic2h4Cuexd2aic9y6Zj9cgicibMQw/0', 1, 'weixin', NULL, 1461322739, '汪利华'),
(230, '0', '7701939859', 230, 'e5bfabe782b9e5bfabe782b9e5bc80', 'e6b1aae6b48b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCGFq9ia8FuOJMo0d9lLz8yMSzdwj5atC8fiaB8mibbHObfgjKAyX1Fic2h4Cuexd2aic9y6Zj9cgicibMQw/0', 1, 'weixin', NULL, 1461322757, '汪利华'),
(231, '0', '6803570063', 231, '313131', '686f6c64206661737420746f20666f7265766572', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicmK23ZVV0f9Ohn4fKhHPxoTdfdEHkckwaia65MibtPibTiaPOTvMCr9HeD7ariaL3wibPk0VAdzF7lLiag7/0', 1, 'weixin', NULL, 1461322758, '陈材'),
(232, '0', '7701939859', 232, 'e688bfe997b4e79c8be58f8de9a688', 'e6b1aae6b48b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCGFq9ia8FuOJMo0d9lLz8yMSzdwj5atC8fiaB8mibbHObfgjKAyX1Fic2h4Cuexd2aic9y6Zj9cgicibMQw/0', 1, 'weixin', NULL, 1461322759, '汪利华'),
(233, '0', '7701939859', 233, 'e5bfabe79c8be58f8de9a688', 'e6b1aae6b48b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCGFq9ia8FuOJMo0d9lLz8yMSzdwj5atC8fiaB8mibbHObfgjKAyX1Fic2h4Cuexd2aic9y6Zj9cgicibMQw/0', 1, 'weixin', NULL, 1461322771, '汪利华'),
(234, '0', '6803570063 ', 234, '此消息为图片！', '686f6c64206661737420746f20666f7265766572', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2UvicmK23ZVV0f9Ohn4fKhHPxoTdfdEHkckwaia65MibtPibTiaPOTvMCr9HeD7ariaL3wibPk0VAdzF7lLiag7/0', 1, 'weixin', '/img/pic/httpxxxmmbiz.qpic.cnxmmbizxUSYUB4j50KRibXjcicrqalvhnu4ga9MrnFYekuEM2Tfib0NGgsibTPUfNibSrrA1ZO0RRdPCZhujoEnRCBJb5ICSxGgx0.jpg', 1461322800, '陈材'),
(235, '0', '7701939859 ', 235, '此消息为图片！', 'e6b1aae6b48b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLCGFq9ia8FuOJMo0d9lLz8yMSzdwj5atC8fiaB8mibbHObfgjKAyX1Fic2h4Cuexd2aic9y6Zj9cgicibMQw/0', 1, 'weixin', '/img/pic/httpxxxmmbiz.qpic.cnxmmbizxcZ10u78iaDoMlHicozSSZNyZtVLEHDBb8r4V4B1O255dxSBAH3RlkyOEtaibYle6gGIFFbwMEoF7IkG2d7l4m9Fzwx0.jpg', 1461322817, '汪利华'),
(236, '0', '9215062538', 236, 'e9a5bfe4ba86', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1461560978, '陈肖雄'),
(237, '0', '9215062538 ', 237, '此消息为图片！', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', '/img/pic/httpxxxmmbiz.qpic.cnxmmbizxux7icvZJO2GyicsHuIBE7QUgIMDKBe0tT2tJGhsGqLZx7CUeBHFHjyDYWY74LDic9tArQLmibY1AeK97cWVM187lTwx0.jpg', 1461561035, '陈肖雄'),
(238, '0', '9215062538', 238, 'e697a9e7949fe8b4b5e5ad90', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1461561610, '陈肖雄'),
(239, '0', '9215062538', 239, 'e79fa5e98193e4b8aae5b181', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1461561710, '陈肖雄'),
(240, '0', '9215062538', 240, 'e88d89', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1461561799, '陈肖雄'),
(241, '0', '4632355721', 241, 'e68b8de68b8de4b990', 'e887b3e5b08ae5ae9df09f91bd', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulSAI3AoNCZdSL4fmsW2e9hRh8ib6b2lqlibP0AKW9lsB0kOkl17wckqXWFTFb6clxM9cMquNmw881P/0', 1, 'weixin', NULL, 1461576747, '兔兔'),
(242, '0', '4632355721', 242, 'e59e83e59cbee8a7a3e586b3e4ba86', 'e887b3e5b08ae5ae9df09f91bd', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulSAI3AoNCZdSL4fmsW2e9hRh8ib6b2lqlibP0AKW9lsB0kOkl17wckqXWFTFb6clxM9cMquNmw881P/0', 1, 'weixin', NULL, 1461576766, '兔兔'),
(243, '0', '7141601414', 243, 'e68b8de68b8de4b990', '437269737469616ef09f90b2', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO3kKNUwaexnn7LVv4LBPsOD7MX8GqhBoWf4823BjRBYIiawnRd8mfLYIN4evwwXOH8E3RVWeEKfrzA/0', 1, 'weixin', NULL, 1461642180, '呃呃呃'),
(244, '0', '6991442195', 244, 'e5a4a7e5aeb6e5a5bd', 'e5bca0e6b189e5b3b0efbd9ee5beaee4bfa1e890a5e99480e69599e7bb83', 'http://wx.qlogo.cn/mmopen/XYrRG5UShDcKEDgqAEFWMOgCfMFtCz2mb18cKQic4QpZqIcqgwxqCtmibh7WrZkXw4oI8NtPQLHsiaGISAQsibPloBjvt0ufc0Qx/0', 1, 'weixin', NULL, 1461676659, '你好'),
(245, '0', '6991442195', 245, '313936313030373133', 'e5bca0e6b189e5b3b0efbd9ee5beaee4bfa1e890a5e99480e69599e7bb83', 'http://wx.qlogo.cn/mmopen/XYrRG5UShDcKEDgqAEFWMOgCfMFtCz2mb18cKQic4QpZqIcqgwxqCtmibh7WrZkXw4oI8NtPQLHsiaGISAQsibPloBjvt0ufc0Qx/0', 1, 'weixin', NULL, 1461676720, '你好'),
(246, '0', '9140902154', 246, 'e68b8de68b8de4b990', '4d722ee6b1a4', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJkcj9AgMk1DI72kPfHW8pPnkfT2LQztmOUuH8HzblzoXCe0DPoEJpqkKkbLDZIfXzkaKDxBXibZicg/0', 1, 'weixin', NULL, 1461853156, '111'),
(247, '0', '436456963', 247, 'e59ca8e4b88de59ca8', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1461854741, '陈飞'),
(248, '0', '436456963', 248, 'e68b8de68b8de4b990', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1461944751, '陈飞'),
(249, '0', '5377590592', 249, 'e68b8de68b8de4b990', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1462063871, ''),
(250, '0', '5377590592', 250, 'e5beaee4bfa1', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1462065229, ''),
(251, '0', '5377590592', 251, '77656e6c', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1462065246, ''),
(252, '0', '3146363037', 252, 'e4b88ae5a299', 'e69f9ae5ad90e5a99ae7a4bc2de69cb1e7a88be9a39e', 'http://wx.qlogo.cn/mmopen/XYrRG5UShDcKEDgqAEFWMGj09meVLVHNrHnAM5yMotBJCQ3s4RMSw8HGVsruJhubUet2s8B94LryvibcrQf6PDicT25fpKLeA8/0', 1, 'weixin', NULL, 1462180569, ''),
(253, '0', '4089864401', 253, 'e68891', 'e69d8ee99381e5b08fe5b1b1', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBuleqnEIgktpSta8spf04lK3ulCsXxufNc6PGDd2okUQFqlOeQ7sGXjZ18bJZicaCicczKGDo1aSvfdF/0', 1, 'weixin', NULL, 1462239704, ''),
(254, '0', '4089864401 ', 254, '此消息为图片！', 'e69d8ee99381e5b08fe5b1b1', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBuleqnEIgktpSta8spf04lK3ulCsXxufNc6PGDd2okUQFqlOeQ7sGXjZ18bJZicaCicczKGDo1aSvfdF/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx89J82NRLfm2cflFIfgYeDhsTXkewOhnBmGNBorjibGbWlzRUbibLMGPRdQTjBzSAmnpHPjJwg8eyHAmJBPEpCXOwx0.jpg', 1462239765, ''),
(255, '0', '6360242345', 255, 'e593a6e593a6', 'e891a3e5bf97e9b98f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO3lWGmAYneYiaQicLspl16Y9pqP42ZlUhpmKm7EK2oibMWol7Q0CWTI0vEEAicuL3QMFcc4SztyKqmRw4zn3Kr6CcUY/0', 1, 'weixin', NULL, 1462245304, ''),
(256, '0', '6360242345 ', 256, '此消息为图片！', 'e891a3e5bf97e9b98f', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO3lWGmAYneYiaQicLspl16Y9pqP42ZlUhpmKm7EK2oibMWol7Q0CWTI0vEEAicuL3QMFcc4SztyKqmRw4zn3Kr6CcUY/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx4orEnYEZibQnm6OPBGnY1W7KLtoqwyibVHcVflV17bFYYnlWkibCAcOCPD4Yib4icC9RbQC2k6gf2nCnXlf4sw0Fk1gx0.jpg', 1462245333, ''),
(257, '0', '120946010', 257, 'e7be8ee5a5b3', '413030e6b187e7be8ee5a99ae7a4bce8aebee8aea1e8bdafe4bbb6e9ab98e7bf94', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMibnnawz2jNwVg7BvIX2edibib9iaHJuhWP1yicDlGahdnjPbYGbvVXoaqyhjHR3qOicen5VRoCMmwpAllFz2uOvQ0Cyu/0', 1, 'weixin', NULL, 1462262995, ''),
(258, '0', '120946010', 258, 'e6b182e4b88ae5a299', '413030e6b187e7be8ee5a99ae7a4bce8aebee8aea1e8bdafe4bbb6e9ab98e7bf94', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMibnnawz2jNwVg7BvIX2edibib9iaHJuhWP1yicDlGahdnjPbYGbvVXoaqyhjHR3qOicen5VRoCMmwpAllFz2uOvQ0Cyu/0', 1, 'weixin', NULL, 1462263027, ''),
(259, '0', '120946010', 259, 'e5a4a7e6ada6e6b189', '413030e6b187e7be8ee5a99ae7a4bce8aebee8aea1e8bdafe4bbb6e9ab98e7bf94', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMibnnawz2jNwVg7BvIX2edibib9iaHJuhWP1yicDlGahdnjPbYGbvVXoaqyhjHR3qOicen5VRoCMmwpAllFz2uOvQ0Cyu/0', 1, 'weixin', NULL, 1462263057, ''),
(260, '0', '120946010', 260, 'e59388e59388e59388', '413030e6b187e7be8ee5a99ae7a4bce8aebee8aea1e8bdafe4bbb6e9ab98e7bf94', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMibnnawz2jNwVg7BvIX2edibib9iaHJuhWP1yicDlGahdnjPbYGbvVXoaqyhjHR3qOicen5VRoCMmwpAllFz2uOvQ0Cyu/0', 1, 'weixin', NULL, 1462263069, ''),
(261, '0', '120946010', 261, 'e68b8de68b8de4b990', '413030e6b187e7be8ee5a99ae7a4bce8aebee8aea1e8bdafe4bbb6e9ab98e7bf94', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TMibnnawz2jNwVg7BvIX2edibib9iaHJuhWP1yicDlGahdnjPbYGbvVXoaqyhjHR3qOicen5VRoCMmwpAllFz2uOvQ0Cyu/0', 1, 'weixin', NULL, 1462263153, ''),
(262, '0', '3513481864', 262, 'e5a5bde5958a', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', NULL, 1462448928, ''),
(263, '0', '3513481864', 263, 'e68b8de68b8de4b990', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', NULL, 1462448988, ''),
(264, '0', '1992596362', 264, 'e68b8de68b8de4b990', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1462450262, ''),
(265, '0', '1992596362', 265, 'e68b8de68b8de4b990', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1462450269, ''),
(266, '0', '4956820291', 266, 'e68b8de68b8de4b990', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1462450461, ''),
(267, '0', '3853483998', 267, 'e4b88ae5a299', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', NULL, 1462450600, ''),
(268, '0', '3853483998', 268, 'e68890e8afad', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', NULL, 1462450633, ''),
(269, '0', '3853483998', 269, 'e79c8be59bbee78c9ce68890e8afad', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', NULL, 1462450649, ''),
(270, '0', '3853483998', 270, 'e5afb9e5afb9e7a2b0', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', NULL, 1462450663, ''),
(271, '0', '5377590592 ', 271, '此消息为图片！', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxux7icvZJO2GxcJxyVsZlfdEnxSgZA8c7cicdVlQg1EaDU1YJ5jAgkFyl5edR8tPbdfPicdSODYSdP3ibHtHK90ZTRQx0.jpg', 1462504105, ''),
(272, '0', '5377590592', 272, 'e68b8de68b8de4b990', '415fe68891e5bf83e9a39ee689ac', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO2ZkzwufRk67peRMs2SOPJZ15iall86QXuP8tmvVOE14XyBtS5jpLtMiblc2wNtSxT2qBibQ09tqpCHTcaHDuRbEbf/0', 1, 'weixin', NULL, 1462504118, ''),
(273, '0', '6269337801 ', 273, '此消息为图片！', '4a6f6e', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVrIDfpWYYxCQScic1sP3a7yAr6v8yFeJttANdbAcMgpmOAvbBKia8S8dmm3ILXx0bNv4VfBJagmibFm/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxJMHKOOGicBKRcDVvlAcwxnvhvuia0AYaQlxaIicGb1Td36V2NFjNvO4v3ZF8XToGj8vyUAWGUbHFibtCem6mRzKQegx0.jpg', 1462518794, ''),
(274, '0', '4221775196', 274, 'e68b8de68b8de4b990', 'e7899be7899b', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6mibo9v4AIW9pGCdibeYcZKSrEHPGOGcvRqOkC2g4icTGZzUZfaHa9TbuHymicVajD66MxsYGt3jQSUg/0', 1, 'weixin', NULL, 1462526563, ''),
(275, '0', '713953063', 275, 'e5a5bde8b1aae8b1aa', 'e7899be7899b', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6mibo9v4AIW9pGCdibeYcZKSrEHPGOGcvRqOkC2g4icTGZzUZfaHa9TbuHymicVajD66MxsYGt3jQSUg/0', 1, 'weixin', NULL, 1462526670, ''),
(276, '0', '713953063', 276, 'e68b8de68b8de4b990', 'e7899be7899b', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6mibo9v4AIW9pGCdibeYcZKSrEHPGOGcvRqOkC2g4icTGZzUZfaHa9TbuHymicVajD66MxsYGt3jQSUg/0', 1, 'weixin', NULL, 1462526777, ''),
(277, '0', '713953063 ', 277, '此消息为图片！', 'e7899be7899b', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6mibo9v4AIW9pGCdibeYcZKSrEHPGOGcvRqOkC2g4icTGZzUZfaHa9TbuHymicVajD66MxsYGt3jQSUg/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxSgvyVSSzamAbwrzO05UrA6cXDQNBG0CtwZ9g6RWhU7FIcjlSiaPjzlXAM50T7raWctwoNibEEj5icOqsgS57QnRGAx0.jpg', 1462526806, ''),
(278, '0', '713953063', 278, 'e68b8de68b8de4b990', 'e7899be7899b', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM6mibo9v4AIW9pGCdibeYcZKSrEHPGOGcvRqOkC2g4icTGZzUZfaHa9TbuHymicVajD66MxsYGt3jQSUg/0', 1, 'weixin', NULL, 1462526822, ''),
(279, '0', '5855126920', 279, 'e68b8de68b8de4b990', 'e8b685e5b885e3808ce5b185e6b091e7bd912de6b2b9e794b0e7acace4b880e696b0e5aa92e4bd93e3808d', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB6icibDib9ugna13TkQMQicdVU1dnicJ7qFEXhGpp4acE83ibIiaM7rZVRckJ7nkVicibVddVNLe2Hia8icpZog/0', 1, 'weixin', NULL, 1462527614, ''),
(280, '0', '5855126920', 280, 'e68891e69da5e4ba86', 'e8b685e5b885e3808ce5b185e6b091e7bd912de6b2b9e794b0e7acace4b880e696b0e5aa92e4bd93e3808d', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB6icibDib9ugna13TkQMQicdVU1dnicJ7qFEXhGpp4acE83ibIiaM7rZVRckJ7nkVicibVddVNLe2Hia8icpZog/0', 1, 'weixin', NULL, 1462527629, ''),
(281, '0', '5855126920', 281, 'e5a4a7e5aeb6e5a5bd', 'e8b685e5b885e3808ce5b185e6b091e7bd912de6b2b9e794b0e7acace4b880e696b0e5aa92e4bd93e3808d', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLB6icibDib9ugna13TkQMQicdVU1dnicJ7qFEXhGpp4acE83ibIiaM7rZVRckJ7nkVicibVddVNLe2Hia8icpZog/0', 1, 'weixin', NULL, 1462527635, ''),
(282, '0', '3008934992', 282, 'e5a4a7e5aeb6e5a5bd', 'e59b8de782b92de6b48be593a5e593a5', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAXaHUyBH14ggiaX2zxf6K8oVkwqIficODQHvYo6pHNKwNLOrFrbnb0hxerdBQoJ4MibBH1zSicCTIqiaZ/0', 1, 'weixin', NULL, 1462601803, ''),
(283, '0', '3008934992', 283, 'e8b596e69687e6a0bc', 'e59b8de782b92de6b48be593a5e593a5', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAXaHUyBH14ggiaX2zxf6K8oVkwqIficODQHvYo6pHNKwNLOrFrbnb0hxerdBQoJ4MibBH1zSicCTIqiaZ/0', 1, 'weixin', NULL, 1462601882, ''),
(284, '0', '8791727505', 284, 'e4bda0e5a5bd', 'e5b08fe69da8e5bbbae7ab99', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq6SjmWUbA8jqXx6PdaNt5Rs0RLLupplr5YBVvhnssFC9ibEcuuVQ1NBPAAVqh5TzPj0BvB3aswzQ/0', 1, 'weixin', NULL, 1462609454, ''),
(285, '0', '8791727505', 285, 'e68891e4bbac', 'e5b08fe69da8e5bbbae7ab99', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDq6SjmWUbA8jqXx6PdaNt5Rs0RLLupplr5YBVvhnssFC9ibEcuuVQ1NBPAAVqh5TzPj0BvB3aswzQ/0', 1, 'weixin', NULL, 1462610610, ''),
(286, '0', '4956820291', 286, 'e68b8de68b8de4b990', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1462621920, ''),
(287, '0', '4956820291', 287, 'e68b8de68b8de4b990', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1462622335, ''),
(288, '0', '6808193095', 288, 'e5bc80e5a78b', 'f09f8694f09f9189f09f889af09f9297', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM4bcweIFyGNUBUSTY7wsfkKxJ8HJ4OtGRt4p9vPRTYMX7TcS76xSaciaVmHjZbDXEpKTB0GblplxWw/0', 1, 'weixin', NULL, 1462701154, ''),
(289, '0', '3853483998 ', 289, '此消息为图片！', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNiaIMLOAwRmU5z5N3K76XTrQ1xAgtQEUQbMKLAUlKrzTJLcu1ZKiaicHh6iciammqUSticVbdTGx19c9BkcnbEsMMThgx0.jpg', 1462706127, ''),
(290, '0', '3853483998 ', 290, '此消息为图片！', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNiaIMLOAwRmU5z5N3K76XTrQ1xAgtQEUQbMKLAUlKrzTJLcu1ZKiaicHh6iciammqUSticVbdTGx19c9BkcnbEsMMThgx0.jpg', 1462706356, ''),
(291, '0', '3853483998 ', 291, '此消息为图片！', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNiaIMLOAwRmU5z5N3K76XTrQ1xAgtQEUQbMKLAUlKrzTJLcu1ZKiaicHh6iciammqUSticVbdTGx19c9BkcnbEsMMThgx0.jpg', 1462706377, ''),
(292, '0', '8577674436', 292, 'e99b86e59088', 'e69d8ee5b08fe9be99', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTqdTluLvCm1ByQ9ficXY1WnlN6jibic951ChKibPQol0z8dnoVvodicSCYfDGfo0Fx8gtkug4Y5YoBJ7/0', 1, 'weixin', NULL, 1462795940, ''),
(293, '0', '8577674436', 293, 'e59388e59388e59388', 'e69d8ee5b08fe9be99', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTqdTluLvCm1ByQ9ficXY1WnlN6jibic951ChKibPQol0z8dnoVvodicSCYfDGfo0Fx8gtkug4Y5YoBJ7/0', 1, 'weixin', NULL, 1462795979, ''),
(294, '0', '8577674436 ', 294, '此消息为图片！', 'e69d8ee5b08fe9be99', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTqdTluLvCm1ByQ9ficXY1WnlN6jibic951ChKibPQol0z8dnoVvodicSCYfDGfo0Fx8gtkug4Y5YoBJ7/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx9yT9v00JcVbLRzpFNyC2O6XLv0ZIX160k0Oa3sVYH07MAibBKwLWvjT1oeBib68vib87SPnxpcx7SEicdnqib2DlbLgx0.jpg', 1462796044, ''),
(295, '0', '8577674436', 295, 'e5a5bde5a5bd', 'e69d8ee5b08fe9be99', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTqdTluLvCm1ByQ9ficXY1WnlN6jibic951ChKibPQol0z8dnoVvodicSCYfDGfo0Fx8gtkug4Y5YoBJ7/0', 1, 'weixin', NULL, 1462796105, ''),
(296, '0', '8577674436', 296, 'e794b7e7949fe5a5b3e7949f', 'e69d8ee5b08fe9be99', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBulTqdTluLvCm1ByQ9ficXY1WnlN6jibic951ChKibPQol0z8dnoVvodicSCYfDGfo0Fx8gtkug4Y5YoBJ7/0', 1, 'weixin', NULL, 1462796395, ''),
(297, '0', '3853483998 ', 297, '此消息为图片！', 'e69da8e7a38a', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJNwgC40weic1X2YWdKFKqHEaAMlIXoQlNjsRAf3HD8jcC2Hw5EBkVBtrQzjKAYVWbR0vDKjzBP2rQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxNiaIMLOAwRmUPlqriaALXTCibjD0O0ibGAicEl0CUibPyzdAWo9PLP5kBibUsJvHTqht1PD7wiaF3eLia7O8FUsp0KEhV6Qx0.jpg', 1462955674, ''),
(298, '0', '4683229999', 298, '20e59388e59388e59388', 'e999b3e8b685e69687e38082', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8dpdmzQhuGeWsR9dncuqxCicswagK7y91cSuGQEiaholXVicV0VM7zFa8LGF6EXmzunJ1sEZJbVUPx5kJYxoUOTkZ/0', 1, 'weixin', NULL, 1463032950, ''),
(299, '0', '3111388541', 299, '68656c6c6f', 'e5b08fe5a4aae998b32048617272792054616d', 'http://wx.qlogo.cn/mmopen/x9qcTpSsSyNo0TlsxhPibKFlOAm8IibtAm6MY4RegAVgSZoBE1fQIW14x3KXFJKhn9sUDaypic9Sn0HmEneHdGVxxsYpMkbjibRT/0', 1, 'weixin', NULL, 1463035519, ''),
(300, '0', '3111388541 ', 300, '此消息为图片！', 'e5b08fe5a4aae998b32048617272792054616d', 'http://wx.qlogo.cn/mmopen/x9qcTpSsSyNo0TlsxhPibKFlOAm8IibtAm6MY4RegAVgSZoBE1fQIW14x3KXFJKhn9sUDaypic9Sn0HmEneHdGVxxsYpMkbjibRT/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxYZ8gs3hpiaBjjCM5fXbw3ZbtWibPxH8iaZ6NiacPawMXjJ28GTAhfBcCjGgaU3WicTwibWyLnPowkSHtMgUhpIIFtJkgx0.jpg', 1463035535, ''),
(301, '0', '5595735654 ', 301, '此消息为图片！', 'e999b3e8b685e69687e38082', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8dpdmzQhuGeWsR9dncuqxCicswagK7y91cSuGQEiaholXVicV0VM7zFa8LGF6EXmzunJ1sEZJbVUPx5kJYxoUOTkZ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxeFpTgdfwYTRE5pVClcC3fAicaAR2YXiaWia92Qt20H3swAsiaswwwSjAtoZZoZ7SXMgfGExj21yk81icmHx4Ovg9RBgx0.jpg', 1463035568, ''),
(302, '0', '6774114172', 302, 'e59388', 'e69c89e4ba9be98689', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVia8pNMviboL5Kk74XiauIvuykRgsSjqK4m8iaBEqfOa7cjRE3ibQCIUHriaVf3Uj7VERibfTL2Y5icXvFKq/0', 1, 'weixin', NULL, 1463102954, ''),
(303, '0', '6774114172', 303, 'e59388', 'e69c89e4ba9be98689', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVia8pNMviboL5Kk74XiauIvuykRgsSjqK4m8iaBEqfOa7cjRE3ibQCIUHriaVf3Uj7VERibfTL2Y5icXvFKq/0', 1, 'weixin', NULL, 1463102955, ''),
(304, '0', '9178796353', 304, 'e59388', '4141e7bd91e7ab99e5beaee4bfa1e7a88be5ba8fe5bc80e58f91e4bba3e8bf90e890a5', 'http://wx.qlogo.cn/mmopen/UzJPMZHGtibYskuSgt6zQsryzbyjbxSnmLia9f0NgJpj9xAOBm977LhRWyylsPOmSKufiakrE7SxwcSd2Zq8GWFsXRrWVadqFme/0', 1, 'weixin', NULL, 1463122009, ''),
(305, '0', '9178796353', 305, 'e68abde5a596', '4141e7bd91e7ab99e5beaee4bfa1e7a88be5ba8fe5bc80e58f91e4bba3e8bf90e890a5', 'http://wx.qlogo.cn/mmopen/UzJPMZHGtibYskuSgt6zQsryzbyjbxSnmLia9f0NgJpj9xAOBm977LhRWyylsPOmSKufiakrE7SxwcSd2Zq8GWFsXRrWVadqFme/0', 1, 'weixin', NULL, 1463122119, ''),
(306, '0', '6939039501', 306, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1463285780, ''),
(307, '0', '4875552942', 307, 'e298baefb88f', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 1, 'weixin', NULL, 1463306151, ''),
(308, '0', '4875552942', 308, 'f09f9883', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 1, 'weixin', NULL, 1463306172, ''),
(309, '0', '4875552942', 309, 'e4bda0e5a5bd', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 1, 'weixin', NULL, 1463306183, ''),
(310, '0', '4875552942', 310, 'f09f9884', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 1, 'weixin', NULL, 1463306238, ''),
(311, '0', '7457635779', 311, 'e4bda0e5a5bd', 'e79290e5ad90e38082', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAuAk1NmKsoFric08uiah002ZWJguPXaGgTibp3jxZDEnw1u6HEdiaJvVsSMIibd6Pus3sQiaDOYBCcn7EQ/0', 1, 'weixin', NULL, 1463371290, ''),
(312, '0', '7457635779', 312, '686579', 'e79290e5ad90e38082', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAuAk1NmKsoFric08uiah002ZWJguPXaGgTibp3jxZDEnw1u6HEdiaJvVsSMIibd6Pus3sQiaDOYBCcn7EQ/0', 1, 'weixin', NULL, 1463371304, ''),
(313, '0', '7457635779 ', 313, '此消息为图片！', 'e79290e5ad90e38082', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAuAk1NmKsoFric08uiah002ZWJguPXaGgTibp3jxZDEnw1u6HEdiaJvVsSMIibd6Pus3sQiaDOYBCcn7EQ/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxUJfmURUNp4ibBd2o3xpE92gNfM58JS0IArK1B9AViby7uCsaUPtKTSvdv7L05kaGosohpEicB417zjZaD3Cicmnn9wx0.jpg', 1463371319, ''),
(314, '0', '3655458391', 314, 'e5beaee5b18fe7a791e68a80e5beaee4bfa1e5a299e6bc94e7a4ba', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1463379074, ''),
(315, '0', '3655458391 ', 315, '此消息为图片！', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxeptjRI3b64WeU3wxVqQFZTqSDAngmlDhwySyRCMz7DbnSXbwYgunbvdQ3eIJib46R6aOrUhTOBibdAoCmrww10yAx0.jpg', 1463379094, ''),
(316, '0', '3655458391', 316, 'e5beaee5b18fe7a791e68a80e6b798e5ae9de5ba97207171333733383338353330', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1463379130, ''),
(317, '0', '1842848744', 317, 'e5a4a7e78e8b', 'e5bab7e78699', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBuldna3qRzNdZJXrKk2cJX7jwMdsPJ0TRQLk870ibric6bQ6ichYKLFO9X6gpNF9IoU3xxJ26PbEtsN9S/0', 1, 'weixin', NULL, 1463459769, '大王'),
(318, '0', '5223153167', 318, 'e5a4a7e78e8b', 'e5bab7e78699', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBuldna3qRzNdZJXrKk2cJX7jwMdsPJ0TRQLk870ibric6bQ6ichYKLFO9X6gpNF9IoU3xxJ26PbEtsN9S/0', 1, 'weixin', NULL, 1463460224, '打印机'),
(319, '0', '5223153167 ', 319, '此消息为图片！', 'e5bab7e78699', 'http://wx.qlogo.cn/mmopen/UJtz2JI4TM8c8Mqr9SBuldna3qRzNdZJXrKk2cJX7jwMdsPJ0TRQLk870ibric6bQ6ichYKLFO9X6gpNF9IoU3xxJ26PbEtsN9S/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizxcOm8Rcx9HQsn3ib4MtFRG1pOxEVOMCCjMMAPoa8hy1AbmjP2qBNxu0L9j4ofpdxcdQzT0T2d7VY5OHjhibkqkcygx0.jpg', 1463460494, '打印机'),
(320, '0', '3978894255', 320, 'e59388e596bdefbc81', '46694669e4b88de59083e7b396', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIia47UeNLmdofQxFAIT7yiaLQoWZfJ9b8EkyZFNm4EO8MkswHaj5FNLUs6ic1ajclCE2FcPUgo62kfw/0', 1, 'weixin', NULL, 1463477557, 'fenn'),
(321, '0', '3978894255', 321, 'e59388e596bd', '46694669e4b88de59083e7b396', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIia47UeNLmdofQxFAIT7yiaLQoWZfJ9b8EkyZFNm4EO8MkswHaj5FNLUs6ic1ajclCE2FcPUgo62kfw/0', 1, 'weixin', NULL, 1463478822, 'fenn'),
(322, '0', '3978894255', 322, 'e5a4a7e5aeb6e5a5bdefbc81', '46694669e4b88de59083e7b396', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIia47UeNLmdofQxFAIT7yiaLQoWZfJ9b8EkyZFNm4EO8MkswHaj5FNLUs6ic1ajclCE2FcPUgo62kfw/0', 1, 'weixin', NULL, 1463478828, 'fenn'),
(323, '0', '3978894255', 323, 'e68891e59ca8e78eb0e59cba', '46694669e4b88de59083e7b396', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEIia47UeNLmdofQxFAIT7yiaLQoWZfJ9b8EkyZFNm4EO8MkswHaj5FNLUs6ic1ajclCE2FcPUgo62kfw/0', 1, 'weixin', NULL, 1463478838, 'fenn'),
(324, '0', '4875552942', 324, 'e68ba8e6b2b3', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 1, 'weixin', NULL, 1463499211, ''),
(325, '0', '4875552942 ', 325, '此消息为图片！', '4130e5889be6848fe0bf93e9a490e19ebce9a5aee19ebce7b3bbe7bb9fe19ebce0bc85f09f8f85', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWAmKKpakUoOK0H13SKd6tOYrfpX7NiccGZbAbNibED03sAzcsPn2N7JrJaavYwricticcVq9PXDqEYc/0', 1, 'weixin', 'http://wwapi-img.stor.sinaapp.com/httpxxxmmbiz.qpic.cnxmmbizx9ibD5anQ3LPFoVLHicIrnWO9Lwib7Kvw6cDAOswOVQo8MeziciacMiaXGUP0oom14qEOzZEBJHCXtTVLibGfzMgA0B02gx0.jpg', 1463503880, ''),
(326, '0', '4022127435', 326, 'e6b8b8e6888f', 'e998bfe9be99', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicg61d0zZGYUcbHjcib4AbCPic4lLWLFWXQAFXeXibWsOwHJRXAZEEkoTplMfUpRFeC3POiaJCibc0tmOX/0', 1, 'weixin', NULL, 1463542241, '薛向龙'),
(327, '0', '4022127435', 327, 'e4bb80e4b988e697b6e58099', 'e998bfe9be99', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicg61d0zZGYUcbHjcib4AbCPic4lLWLFWXQAFXeXibWsOwHJRXAZEEkoTplMfUpRFeC3POiaJCibc0tmOX/0', 1, 'weixin', NULL, 1463542312, '薛向龙'),
(328, '0', '4022127435', 328, 'e8bf99e4b8aae8bf99e4b8aae698afe8818ae4bb80e4b988e79a84', 'e998bfe9be99', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiboe9kAS2Uvicg61d0zZGYUcbHjcib4AbCPic4lLWLFWXQAFXeXibWsOwHJRXAZEEkoTplMfUpRFeC3POiaJCibc0tmOX/0', 1, 'weixin', NULL, 1463542393, '薛向龙'),
(329, '0', '9433161011', 329, 'e98089e7be8e', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463561812, '庄诗韵'),
(330, '0', '9433161011', 330, 'e595a6e595a6e595a6e595a6', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463561977, '庄诗韵'),
(331, '0', '9433161011', 331, 'e7be8ee6a2a6e68890e79c9f', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463562037, '庄诗韵'),
(332, '0', '9433161011', 332, 'e68abde5a596', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463562187, '庄诗韵'),
(333, '0', '2493402390', 333, 'e595a6e595a6e595a6', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463563310, '庄诗韵'),
(334, '0', '9074112767', 334, 'e4ba86', '526f62696e20f09f928b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDuoJVatElZOIDibznkyYicy34yqc85W9IJ4BJf8erPP6r5PU7hLtHJKTLJCylXYOHc3ibvSicic4QPaDA/0', 1, 'weixin', NULL, 1463563311, '郑斌'),
(335, '0', '2493402390', 335, 'e7be8ee5a5b3', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463563323, '庄诗韵'),
(336, '0', '2493402390', 336, 'e8a1b0e593a5', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463563330, '庄诗韵'),
(337, '0', '9074112767', 337, 'e69bb9', '526f62696e20f09f928b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDuoJVatElZOIDibznkyYicy34yqc85W9IJ4BJf8erPP6r5PU7hLtHJKTLJCylXYOHc3ibvSicic4QPaDA/0', 1, 'weixin', NULL, 1463563341, '郑斌'),
(338, '0', '9443951768', 338, 'e5a4a7e8a1b0e593a5', 'e58da1e5b883e58588e6a3ae', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLDicY2RapDGPzwcmf72qzzroOhTAhdJFu63BpjhwiaCDMbFBhqU4veDdJ6CwYQSfLn2NOWAkODy74Ug/0', 1, 'weixin', NULL, 1463579502, '宿舍'),
(339, '0', '2493402390', 339, 'e5a4a7e5b885e593a5', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463579505, '庄诗韵'),
(340, '0', '2493402390', 340, 'e98089e7be8e', 'e5baa6', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAYPt27fd4TYrJ0IYWljazMIog9b2EiamK9gVS844k5nibcITFdZsH3FecbUiaTjbQuFF3icuT9oF0eOK/0', 1, 'weixin', NULL, 1463579740, '庄诗韵'),
(341, '0', '3044357677', 341, 'e79c8be4b88de8a781efbc9f', 'e6b4bbe58aa8e6b4bbe58aa8e590a7', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEL6ia4giauHOKCnCyMeEOZjh9OBn5hicloPVmTkf5ypxowsgo79ibr6LKR8GRqkqOHyLVsc35wiccdPicpw/0', 1, 'weixin', NULL, 1463616402, '滚滚滚'),
(342, '0', '3805559017', 342, 'e59183e59183e59183', 'e4ba8ce5b888e58584', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM61D8HX8r0XzGoCTAYiaGvARrzJKiclozmOfib2wVP1LZm66QeHTdaTXZtlJTiaYNdHvTcxXl6fS75NnQ/0', 1, 'weixin', NULL, 1463616437, '默默'),
(343, '0', '3805559017', 343, 'e68b94e6b2b3', 'e4ba8ce5b888e58584', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM61D8HX8r0XzGoCTAYiaGvARrzJKiclozmOfib2wVP1LZm66QeHTdaTXZtlJTiaYNdHvTcxXl6fS75NnQ/0', 1, 'weixin', NULL, 1463616493, '默默'),
(344, '0', '3805559017', 344, 'e98089e7be8e', 'e4ba8ce5b888e58584', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM61D8HX8r0XzGoCTAYiaGvARrzJKiclozmOfib2wVP1LZm66QeHTdaTXZtlJTiaYNdHvTcxXl6fS75NnQ/0', 1, 'weixin', NULL, 1463616611, '默默'),
(345, '0', '3731721123', 345, '2f3a3a292f3a3a292f3a3a29', '57616e674875616e', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWicayptYLFabI18T7646AhykS58fhnLSzJTkA2Hibo0qoXxAnfSZaibxQSUsTx6iagHoF5tR6ZbWX3l/0', 1, 'weixin', NULL, 1463632346, '啊啊'),
(346, '0', '6612157177', 346, '6e6e6e', 'e6a38be5ad90e7bd91e7bb9ce9ab98e7abafe5beaee4bfa1e890a5e994802de4bb98e998b3', 'http-3A-2F-2Fwx.qlogo.cn-2Fmmopen-2FajNVdqHZLLACFfFfgeBHU3fOzLLhicpibWPevnBI3V2VJIKhcUxonlN0eLCJicCvtXtnCl7ib7CvUpV0c25cGYjMnQ-2F0', 1, 'weixin', NULL, 1463640037, '-E4-'),
(347, '0', '6034102780', 347, '6d6d', 'e6a38be5ad90e7bd91e7bb9ce9ab98e7abafe5beaee4bfa1e890a5e994802de4bb98e998b3', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLACFfFfgeBHU3fOzLLhicpibWPevnBI3V2VJIKhcUxonlN0eLCJicCvtXtnCl7ib7CvUpV0c25cGYjMnQ/0', 1, 'weixin', NULL, 1463707118, '付阳'),
(348, '0', '6453803964', 348, '6768', 'e78e8be59ca3e7a5afe38090e69893e38091', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ7XrmQIyicrK45Zqx8bRgbCYfM18aIOEH4qZKCLvXv41EaGufkkQJSIlbg5QH53y9wqLiblN0Lp76w/0', 1, 'weixin', NULL, 1463712370, '王胜楠'),
(349, '0', '6453803964', 349, 'e8a784e58899', 'e78e8be59ca3e7a5afe38090e69893e38091', 'http://wx.qlogo.cn/mmopen/PiajxSqBRaEJ7XrmQIyicrK45Zqx8bRgbCYfM18aIOEH4qZKCLvXv41EaGufkkQJSIlbg5QH53y9wqLiblN0Lp76w/0', 1, 'weixin', NULL, 1463712861, '王胜楠'),
(350, '0', '4037540486', 350, 'e4b88ae5a299', 'cb87e5b88ce789b9e69e97', 'http://wx.qlogo.cn/mmopen/0zA9whoWunpNCj0lHQlm9gPQDm92Bs2kE77Bxnicrf3BQlxnGc00icvM8iaNGMfblcmvMs1j2W8IIZjs4k7vZZTC1Lhqe4Lz4cj/0', 1, 'weixin', NULL, 1463713396, '九点多吧'),
(351, '0', '6666874787', 351, 'e68abde5a596', 'e7a38a', 'http-3A-2F-2Fwx.qlogo.cn-2Fmmopen-2FUJtz2JI4TM8c8Mqr9SBulVgOyr3vjgibdT9knnlHdB65nRR7PXGxZ32GoHtJl7oTQ6tic8YcvtMwZQHAlibV7LZBIUlUjYosWWq-2F0', 1, 'weixin', NULL, 1463807765, '-E5-'),
(352, '0', '6666874787', 352, 'e68b8de68b8de4b990', 'e7a38a', 'http-3A-2F-2Fwx.qlogo.cn-2Fmmopen-2FUJtz2JI4TM8c8Mqr9SBulVgOyr3vjgibdT9knnlHdB65nRR7PXGxZ32GoHtJl7oTQ6tic8YcvtMwZQHAlibV7LZBIUlUjYosWWq-2F0', 1, 'weixin', NULL, 1463810547, '-E5-'),
(353, '0', '6666874787', 353, 'e794b7e7a59ee5a5b3e7a59e', 'e7a38a', 'http-3A-2F-2Fwx.qlogo.cn-2Fmmopen-2FUJtz2JI4TM8c8Mqr9SBulVgOyr3vjgibdT9knnlHdB65nRR7PXGxZ32GoHtJl7oTQ6tic8YcvtMwZQHAlibV7LZBIUlUjYosWWq-2F0', 1, 'weixin', NULL, 1463810568, '-E5-'),
(354, '0', '780764806', 354, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1463832870, '陈峰'),
(355, '0', '7304946406', 355, '74', 'e7909b', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAP0AZee7l8IlMTjgVob34fZadc9biaW1wMNtGeftYckiaItIhDRXAOkNvHlK7hD5qTLjQeqjcAH13Q/0', 1, 'weixin', NULL, 1463985710, '琛琛'),
(356, '0', '7074272489', 356, '687474703a2f2f636e77706b6a2e6170706c696e7a692e636f6d2f6170692f73712e706870', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1463987649, '你好'),
(357, '0', '7990418405', 357, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1464004695, '张飞'),
(358, '0', '7990418405', 358, 'e4bda0e5a5bd', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1464004698, '张飞'),
(359, '0', '7990418405', 359, 'e59ca8e4b88de59ca8', 'e59392e59392e6bbb4', 'http://wx.qlogo.cn/mmopen/MqIydKd3zO0Kkz249AUwAWQlSRuHMYIia769f7V6mPiaOP2zlktyyHicVS9hRUw6OVa5CtbgvVUNxl4qQSagjSRickwa8BAoCUxD/0', 1, 'weixin', NULL, 1464004702, '张飞'),
(360, '0', '6269337801', 360, 'e5a4a7e8bdace79b98', '4a6f6e', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVrIDfpWYYxCQScic1sP3a7yAr6v8yFeJttANdbAcMgpmOAvbBKia8S8dmm3ILXx0bNv4VfBJagmibFm/0', 1, 'weixin', NULL, 1464076809, ''),
(361, '0', '6269337801', 361, 'e5b9b8e8bf90e5a4a7e8bdace79b98', '4a6f6e', 'http://wx.qlogo.cn/mmopen/P2SpGPTCxgiblj0rbJNPgVrIDfpWYYxCQScic1sP3a7yAr6v8yFeJttANdbAcMgpmOAvbBKia8S8dmm3ILXx0bNv4VfBJagmibFm/0', 1, 'weixin', NULL, 1464076820, ''),
(362, '0', '3059260869', 362, '6c', 'e5b7a6e4b8895a6564f09f91b9', 'http://wx.qlogo.cn/mmopen/ajNVdqHZLLAanGgicF0Pbat4ibfaDmVATAonKMF5rNgHzly2MRzcuKEAicSkFcDBVc3v4wOdtbFcFcdL5UFrE90slmRDu97WXLiaPlnTuw8W9L0/0', 1, 'weixin', NULL, 1464076843, 'l三爷');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_wall_config`
--

CREATE TABLE IF NOT EXISTS `weixin_wall_config` (
  `huati` text NOT NULL,
  `huanying1` text NOT NULL,
  `huanying2` text NOT NULL,
  `success` text NOT NULL,
  `endtail` text NOT NULL,
  `acttitle` text NOT NULL,
  `isopen` int(1) NOT NULL,
  `endshake` int(11) NOT NULL,
  `show_num` int(11) NOT NULL,
  `shenghe` int(11) NOT NULL,
  `cjreplay` tinyint(4) NOT NULL DEFAULT '0',
  `timeinterval` int(3) NOT NULL,
  `shakeopen` tinyint(4) NOT NULL DEFAULT '1',
  `shakekeyword` varchar(255) NOT NULL,
  `voteopen` tinyint(4) NOT NULL DEFAULT '1',
  `votekeyword` varchar(255) NOT NULL,
  `votetitle` text NOT NULL,
  `votefresht` tinyint(4) NOT NULL,
  `fusionopen` tinyint(4) NOT NULL DEFAULT '0',
  `fusionkeyword` varchar(255) NOT NULL,
  `fusionurl` varchar(255) NOT NULL,
  `fusiontoken` varchar(255) NOT NULL,
  `circulation` tinyint(1) NOT NULL DEFAULT '0',
  `refreshtime` tinyint(2) NOT NULL,
  `voteshowway` tinyint(1) DEFAULT '1',
  `votecannum` varchar(255) DEFAULT '1',
  `black_word` text,
  `cj_switch` tinyint(1) NOT NULL DEFAULT '0',
  `ddp_switch` tinyint(1) NOT NULL DEFAULT '0',
  `weibo_switch` tinyint(1) NOT NULL DEFAULT '0',
  `weixin_switch` tinyint(1) NOT NULL DEFAULT '0',
  `web_root` varchar(255) NOT NULL,
  `screenpaw` varchar(255) NOT NULL,
  `shady_switch` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_wall_config`
--

INSERT INTO `weixin_wall_config` (`huati`, `huanying1`, `huanying2`, `success`, `endtail`, `acttitle`, `isopen`, `endshake`, `show_num`, `shenghe`, `cjreplay`, `timeinterval`, `shakeopen`, `shakekeyword`, `voteopen`, `votekeyword`, `votetitle`, `votefresht`, `fusionopen`, `fusionkeyword`, `fusionurl`, `fusiontoken`, `circulation`, `refreshtime`, `voteshowway`, `votecannum`, `black_word`, `cj_switch`, `ddp_switch`, `weibo_switch`, `weixin_switch`, `web_root`, `screenpaw`, `shady_switch`) VALUES
('', '微屏科技豪华版测试地址', '联系QQ：373838530', '你已经成功发送，等待审核通过即可上墙了', '回复【重置】重新获取信息，回复【帮助】查看帮助信息！', '微屏科技狂欢夜', 2, 100, 8, 0, 0, 5, 1, '摇一摇', 1, '投票', '你最喜欢微信墙的哪个功能？', 5, 0, '微信墙', 'http://www.cnzyxh.com/api.php?id=3', 'Ugo11aBgoXZt7AZ6b4776Sn1HbOooBgW', 0, 3, 3, '1', '操,sb,傻逼,艹,日你妈,干你妹,老子,bitch,婊子,你妹啊,超你妈,麻痹,傻逼,屌,鸡巴,JB,狗逼,', 1, 1, 0, 1, 'http://wwapi.applinzi.com', 'weiping', 1);

-- --------------------------------------------------------

--
-- 表的结构 `weixin_wall_num`
--

CREATE TABLE IF NOT EXISTS `weixin_wall_num` (
  `num` int(11) NOT NULL,
  `lastmessageid` varchar(255) NOT NULL,
  PRIMARY KEY (`num`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_wall_num`
--

INSERT INTO `weixin_wall_num` (`num`, `lastmessageid`) VALUES
(363, '0');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_weibo_config`
--

CREATE TABLE IF NOT EXISTS `weixin_weibo_config` (
  `id` int(11) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `access_token` varchar(255) NOT NULL,
  `folllow` tinyint(1) NOT NULL DEFAULT '1',
  `mention` tinyint(1) NOT NULL DEFAULT '0',
  `letter` tinyint(1) NOT NULL DEFAULT '1',
  `erweima` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `weixin_weibo_config`
--


-- --------------------------------------------------------

--
-- 表的结构 `weixin_weixin_config`
--

CREATE TABLE IF NOT EXISTS `weixin_weixin_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) NOT NULL,
  `dianplu_wxh` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `erweima` varchar(255) NOT NULL,
  `bgimg` varchar(255) NOT NULL COMMENT '背景图',
  `logo` varchar(255) NOT NULL COMMENT 'LOGO图',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `weixin_weixin_config`
--

INSERT INTO `weixin_weixin_config` (`id`, `nickname`, `dianplu_wxh`, `username`, `password`, `erweima`, `bgimg`, `logo`) VALUES
(1, '微屏科技', 'CNWPKJ', '扫描二维码，立即参与现场互动', 'xxxxxxxxxxx', 'http://wwapi-img.stor.sinaapp.com/weixin-majpg', 'http://wwapi-img.stor.sinaapp.com/bgimg-picjpg', 'http://wwapi-img.stor.sinaapp.com/logo-picjpg');

-- --------------------------------------------------------

--
-- 表的结构 `weixin_zjlist`
--

CREATE TABLE IF NOT EXISTS `weixin_zjlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wecha_id` varchar(255) NOT NULL,
  `fromplug` varchar(255) NOT NULL,
  `info` text NOT NULL,
  `status` int(1) NOT NULL,
  `sncode` varchar(10) NOT NULL,
  `zjdatetime` int(10) NOT NULL,
  `fjdatetime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=85597 ;

--
-- 转存表中的数据 `weixin_zjlist`
--

