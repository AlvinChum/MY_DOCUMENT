-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016-06-01 17:24:33
-- 服务器版本: 5.1.73
-- PHP 版本: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `weixindaqiang`
--

-- --------------------------------------------------------

--
-- 表的结构 `wx_admin_auth`
--

CREATE TABLE IF NOT EXISTS `wx_admin_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '对应的活动openid，0为所有权限',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `wx_admin_auth`
--

INSERT INTO `wx_admin_auth` (`id`, `huodong_openid`, `user_id`) VALUES
(12, '753a52e736cf2019352d2a6ff2138783', 10),
(11, '8310f87332120d904eb9bbb6d2d633a6', 10);

-- --------------------------------------------------------

--
-- 表的结构 `wx_admin_user`
--

CREATE TABLE IF NOT EXISTS `wx_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login_time` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1' COMMENT '1为普通用户，99为超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11 ;

--
-- 转存表中的数据 `wx_admin_user`
--

INSERT INTO `wx_admin_user` (`id`, `user`, `password`, `last_login_time`, `last_login_ip`, `num`, `role`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2016-04-28 09:35:14', '::1', 13, 99),
(2, 'test', '21232f297a57a5a743894a0e4a801fc3', NULL, NULL, NULL, 1),
(10, '微信大墙', 'e10adc3949ba59abbe56e057f20f883e', '2016-04-27 17:53:43', '::1', 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_award`
--

CREATE TABLE IF NOT EXISTS `wx_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '活动唯一标示',
  `title` varchar(255) NOT NULL COMMENT '打赏项目的名称',
  `imgurl` varchar(255) NOT NULL COMMENT '打赏项目的封面图片url',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `wx_award`
--

INSERT INTO `wx_award` (`id`, `huodong_openid`, `title`, `imgurl`, `c_time`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', '互动消息墙', 'https://ss2.baidu.com/6ONYsjip0QIZ8tyhnq/it/u=3706555796,1550133346&fm=58', 1),
(2, '753a52e736cf2019352d2a6ff2138783', '拼手气抢红包', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2671142056,57308166&fm=82&s=DC98BEF2D6315596E495E67B0300C05E&w=121&h=81&img.JPEG', 2),
(3, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(4, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖2', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(5, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖3', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(6, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖4', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(7, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖5', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(8, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖6', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(9, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖7', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(10, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖8', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(11, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖9', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3),
(12, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖10', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', 3);

-- --------------------------------------------------------

--
-- 表的结构 `wx_boardcast`
--

CREATE TABLE IF NOT EXISTS `wx_boardcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wx_config`
--

CREATE TABLE IF NOT EXISTS `wx_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=7 ;

--
-- 转存表中的数据 `wx_config`
--

INSERT INTO `wx_config` (`id`, `name`, `data`) VALUES
(1, 'mob_server', 'http://weixinmob.gzaojun.com'),
(2, 'api_server', 'http://weixinapi.gzaojun.com'),
(3, 'web_server', 'http://weixinweb.gzaojun.com'),
(4, 'back_server', 'http://weixinback.gzaojun.com'),
(5, 'img_server', 'http://weixinimgcdn.b0.upaiyun.com'),
(6, 'server_ip', '123.59.43.119');

-- --------------------------------------------------------

--
-- 表的结构 `wx_dazhuanpan`
--

CREATE TABLE IF NOT EXISTS `wx_dazhuanpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '大转盘主题',
  `award` text NOT NULL COMMENT '奖品名称，用‘，’分开',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1关闭2开启',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `wx_dazhuanpan`
--

INSERT INTO `wx_dazhuanpan` (`id`, `huodong_openid`, `name`, `award`, `status`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', '大转盘测试', '谢谢参与,谢谢参与,谢谢参与,IPhone,谢谢参与,谢谢参与,谢谢参与,谢谢参与,谢谢参与,10元', 2);

-- --------------------------------------------------------

--
-- 表的结构 `wx_dazhuanpan_temp`
--

CREATE TABLE IF NOT EXISTS `wx_dazhuanpan_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dazhuanpan_id` int(11) NOT NULL,
  `unicode` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1未使用2已使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `wx_dazhuanpan_temp`
--

INSERT INTO `wx_dazhuanpan_temp` (`id`, `dazhuanpan_id`, `unicode`, `status`) VALUES
(1, 1, '50d798627a64dc4e0510d8dec9bed8d3', 2),
(2, 1, '0a728b5034ab10101944c2972dc1c7ec', 2),
(3, 1, 'f947522d5e780cc79d18dee23b7e0216', 1),
(4, 1, 'd8fd58fd4a6d3cd3a27b339f93600f95', 1),
(5, 1, '3521cf2bc9770db1c514a49caeccc0c9', 1),
(6, 1, 'd2bf76630a45a6d024a328bd92f3f801', 1),
(7, 1, '37552dbf60b9e3b46902d5fa3044ab28', 1),
(8, 1, '7730638bc5c2b1d561d8aefcb67dd92d', 1),
(9, 1, 'e09418e521115667563617383fa32f5a', 1),
(10, 1, '73e00a6b2a1c2d35cd7783a3278ecb61', 1),
(11, 1, 'da9e48ece73baefad20e0881ffb495f3', 1),
(12, 1, '381d6128c37ce29cad2cad07b280d536', 2),
(13, 1, 'b5622f94f236d9f2602aa390461dabb1', 2),
(14, 1, '828fb03eb50e6b971a865e36d847cc58', 2),
(15, 1, '3c2c0f42a975f8644b74580804ade2d4', 1),
(16, 1, '5be4dc9a2513499aa8d36a42ce2dfc7f', 2),
(17, 1, '2a5f5e05fd91f2692ee44567ea8d9c38', 2),
(18, 1, 'f4a491d6b542c8d9a108cfca5779a5d5', 1),
(19, 1, '99d7241e8561f8f65e9560c9bdd97990', 1),
(20, 1, '63f8a871ce1a5e6ff9ac4565fde58d39', 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_function`
--

CREATE TABLE IF NOT EXISTS `wx_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '功能名称',
  `function` varchar(255) DEFAULT NULL COMMENT '对应的功能注释',
  `default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为非默认，1为默认',
  `class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=15 ;

--
-- 转存表中的数据 `wx_function`
--

INSERT INTO `wx_function` (`id`, `name`, `function`, `default`, `class`, `color`) VALUES
(1, 'dq', '大墙', 1, 'shangqiang', NULL),
(2, 'cj', '摇奖', 0, 'yaojiang', '#EE9A59'),
(3, 'ddp', '对对碰', 0, 'duiduipeng', '#FB5184'),
(4, 'tm', '弹幕', 0, 'danmu', '#F0C30F'),
(5, 'xydzp', '大转盘', 0, 'dazhuanpan', '#3AA2C0'),
(6, 'xys', '许愿树', 0, 'xuyuanshu', ' #A8C42F'),
(7, 'qdq', '签到墙', 0, 'qiandaoqiang', '#884949'),
(8, '3dqdq', '3D签到墙', 0, '3dqiandaoqiang', '#044A42'),
(9, 'yyy', '摇一摇', 0, 'yaoyiyao', '#377FD8'),
(10, 'yhb', '摇红包', 0, 'yaohongbao', '#C73B3B'),
(11, 'jbzs', '嘉宾展示', 0, 'jiabinzhanshi', '#34495E'),
(12, 'ewm', '二维码', 0, 'erweima', NULL),
(13, 'tp', '投票', 0, 'toupiao', '#D6C0DF'),
(14, 'ds', '打赏', 0, 'dashang', '#37B6B4');

-- --------------------------------------------------------

--
-- 表的结构 `wx_huodong`
--

CREATE TABLE IF NOT EXISTS `wx_huodong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL COMMENT '活动对应唯一的id（32位字符串）',
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `zhubandanwei` varchar(255) DEFAULT NULL COMMENT '主办单位',
  `theme` varchar(255) DEFAULT NULL COMMENT '活动主题',
  `time_limit` int(11) NOT NULL DEFAULT '0' COMMENT '参与时间的显示，0为无限制',
  `people_limit` int(11) NOT NULL DEFAULT '0' COMMENT '人数的最大值,0为无限制',
  `logo_url` varchar(255) NOT NULL COMMENT '活动的LOGO',
  `qr_code` varchar(255) NOT NULL COMMENT '二维码对应的url',
  `gzh_appid` varchar(255) DEFAULT NULL COMMENT '公众号对应的appid',
  `gzh_app_secret` varchar(255) DEFAULT NULL COMMENT '公众号的sec',
  `gzh_callback_url` varchar(255) DEFAULT NULL COMMENT '公众号的回调url',
  `c_time` int(11) NOT NULL COMMENT '活动创建时间',
  `function_group` varchar(255) NOT NULL COMMENT '开启的功能列表',
  `default_function` varchar(255) NOT NULL COMMENT '默认的功能',
  `switch` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为活动开启，0为活动关闭',
  `check` tinyint(4) NOT NULL DEFAULT '1' COMMENT '留言1为关闭审核自动上墙，2为开启审核',
  `vote_limit` int(11) NOT NULL DEFAULT '0' COMMENT '每人每个活动有多少票,默认0为无限制',
  `yaojiang_num` int(11) DEFAULT '0' COMMENT '参加摇奖的人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wx_huodong`
--

INSERT INTO `wx_huodong` (`id`, `openid`, `name`, `zhubandanwei`, `theme`, `time_limit`, `people_limit`, `logo_url`, `qr_code`, `gzh_appid`, `gzh_app_secret`, `gzh_callback_url`, `c_time`, `function_group`, `default_function`, `switch`, `check`, `vote_limit`, `yaojiang_num`) VALUES
(1, '8310f87332120d904eb9bbb6d2d633a6', '微博之夜', NULL, NULL, 1464692400, 1, 'www.baj.com', 'www.daf.com', 'sdj23234d2', '', 'http://weixinweb.gzaojun.com/Home/Oauth/get_oauth', 1461580593, '2,3,4,9,10,11,12,13,14', '1', 1, 1, 0, NULL),
(2, '753a52e736cf2019352d2a6ff2138783', '微信大墙', '傲骏', '微信大墙测试', 0, 0, 'www.baj.com', 'www.daf.com', 'wx6668a266b6ecdf30', 'e6e7ad19556f9b9d427026d513022432', 'http://weixinmob.gzaojun.com/Home/Oauth/get_oauth', 1461829310, '2,3,4,5,6,7,8,9,10,11,12,13,14', '1', 1, 1, 2, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `wx_jiabin`
--

CREATE TABLE IF NOT EXISTS `wx_jiabin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `jiabin_name` varchar(255) NOT NULL COMMENT '嘉宾的名字',
  `jiabin_img` varchar(255) NOT NULL COMMENT '嘉宾的头像url',
  `short` varchar(255) DEFAULT NULL COMMENT '嘉宾头衔',
  `long` varchar(255) NOT NULL COMMENT '嘉宾简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- 转存表中的数据 `wx_jiabin`
--

INSERT INTO `wx_jiabin` (`id`, `huodong_openid`, `jiabin_name`, `jiabin_img`, `short`, `long`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', '马云', 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1464619432&di=22aea29bd1d58f2a930e74859389e583&src=http://www.cnr.cn/jingji/gs/201305/W020130511631480027123.jpg', '阿里巴巴与四十大盗', ' 阿里巴巴集团主要创始人，现担任阿里巴巴集团董事局主席、日本软银董事、TNC（大自然保护协会）中国理事会主席兼全球董事会成员、华谊兄弟董事、生命科学突破奖基金会董事'),
(2, '753a52e736cf2019352d2a6ff2138783', '马化腾', 'http://f.hiphotos.baidu.com/baike/w%3D268%3Bg%3D0/sign=3a59720eb18f8c54e3d3c22902124ac8/060828381f30e9242d9128d149086e061d95f71d.jpg', '腾讯公司控股董事会主席', '综合排名全球第45位，财务表现排名第2位——在本次《哈佛商业评论·全球最佳CEO》的排行榜中，腾讯董事会主席兼首席执行官马化腾成为中国内地惟一上榜的企业家');

-- --------------------------------------------------------

--
-- 表的结构 `wx_message`
--

CREATE TABLE IF NOT EXISTS `wx_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL COMMENT '用户id',
  `user_nickname` varchar(255) NOT NULL COMMENT '用户昵称',
  `user_headimgurl` varchar(255) NOT NULL COMMENT '用户头像',
  `c_time` int(11) NOT NULL COMMENT '发表时间',
  `msg_type` varchar(11) DEFAULT NULL COMMENT '消息类型，pic为图片，text为文字',
  `text` varchar(255) DEFAULT NULL COMMENT '文字消息',
  `imgurl` varchar(255) DEFAULT NULL COMMENT '图片url',
  `state` tinyint(255) DEFAULT '2' COMMENT '1为已上墙2为未上墙',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=93 ;

--
-- 转存表中的数据 `wx_message`
--

INSERT INTO `wx_message` (`id`, `huodong_openid`, `user_openid`, `user_nickname`, `user_headimgurl`, `c_time`, `msg_type`, `text`, `imgurl`, `state`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1461840301, 'text', 'hello world', NULL, 1),
(2, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1461840419, 'text', 'hello world', NULL, 2),
(3, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1461840478, 'text', 'hello world', NULL, 1),
(16, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264449, 'text', 'hello worlds', NULL, 1),
(17, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264464, 'text', 'hello worlds', NULL, 1),
(18, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264517, 'text', 'hello worlds', NULL, 2),
(19, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264679, 'text', 'hello worlds', NULL, 2),
(20, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264716, 'text', 'hello worlds', NULL, 2),
(21, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264775, 'text', 'hello worlds', NULL, 1),
(22, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264807, 'pic', NULL, 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1),
(23, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264822, 'pic', NULL, 'http://www.liantu.com/images/2013/case/2.jpg', 1),
(24, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462264856, 'pic', NULL, 'http://www.liantu.com/images/2013/case/2.jpg', 1),
(25, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462265075, 'pic', NULL, 'http://www.liantu.com/images/2013/case/2.jpg', 1),
(26, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 1462265084, 'text', 'hello worlds', NULL, 1),
(27, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464147872, 'text', '123', NULL, 1),
(28, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464147957, 'text', 'heiheiehi', NULL, 1),
(29, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464148140, 'text', 'saf', NULL, 1),
(30, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464155407, 'text', 'baby', NULL, 1),
(31, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464155508, 'text', 'text', NULL, 1),
(32, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464156176, 'text', 'caosaf', NULL, 1),
(33, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464156325, 'text', 'boy', NULL, 1),
(34, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464157590, 'text', 'sad', NULL, 1),
(35, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464157758, 'text', 'dfas', NULL, 1),
(36, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464158181, 'text', '打', NULL, 1),
(37, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464158301, 'text', 'cham', NULL, 1),
(38, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464158317, 'text', 'fire', NULL, 1),
(39, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464158439, 'text', 'we', NULL, 1),
(40, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464158442, 'text', 'on', NULL, 1),
(41, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464158446, 'text', 'fire', NULL, 1),
(42, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464161131, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/57455367c7049.gif', 1),
(43, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464161208, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/574553b7c75ef.jpg', 1),
(44, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464161262, 'text', '哈哈', NULL, 1),
(45, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464161600, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/5745554064578.jpg', 1),
(46, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464163093, 'text', 'as', NULL, 1),
(47, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464164236, 'text', 'sd', NULL, 1),
(48, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464165473, 'text', '哈哈', NULL, 1),
(49, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464165825, 'text', '噶', NULL, 1),
(50, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464165880, 'text', 'en', NULL, 1),
(51, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166539, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/5745688b33517.jpg', 1),
(52, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166579, 'text', '？', NULL, 1),
(53, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166620, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/574568dba48bc.jpg', 1),
(54, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166784, 'text', '哈哈', NULL, 1),
(55, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166809, 'text', '？', NULL, 1),
(56, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166822, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/574569a57eeaf.jpg', 1),
(57, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166931, 'text', '航海家好', NULL, 1),
(58, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166942, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/57456a1ddc9a9.jpg', 1),
(59, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464166999, 'text', '哈哈哈', NULL, 1),
(60, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167004, 'text', '？', NULL, 1),
(61, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', 1464167096, 'text', 'vghhh', NULL, 1),
(62, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', 1464167101, 'text', '哈哈哈哈', NULL, 1),
(63, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', 1464167108, 'text', '刚刚好豪豪', NULL, 1),
(64, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167194, 'text', '嗨', NULL, 1),
(65, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167207, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/57456b272c0f4.jpg', 1),
(66, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167215, 'text', '听', NULL, 1),
(67, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167218, 'text', '日', NULL, 1),
(68, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167488, 'text', '1', NULL, 1),
(69, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167489, 'text', '2', NULL, 1),
(70, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167490, 'text', '3', NULL, 1),
(71, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167492, 'text', '4', NULL, 1),
(72, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167493, 'text', '5', NULL, 1),
(73, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167504, 'text', '6', NULL, 1),
(74, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167506, 'text', '7', NULL, 1),
(75, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464167508, 'text', '8', NULL, 1),
(76, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464168528, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/5745704fb7006.jpg', 1),
(77, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464168857, 'text', '1', NULL, 1),
(78, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464168942, 'text', '2', NULL, 1),
(79, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464225543, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-26/57464f063be55.jpg', 1),
(80, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464225608, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-26/57464f46b56ca.png', 1),
(81, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464225661, 'text', '唔知', NULL, 1),
(82, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464225702, 'text', 'wt', NULL, 1),
(83, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464225810, 'text', 'sda', NULL, 1),
(84, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464225914, 'pic', NULL, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-26/57465076c66cc.jpg', 1),
(85, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464229522, 'text', '噶', NULL, 1),
(86, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464229550, 'text', '哈哈哈哈哈哈哈哈', NULL, 1),
(87, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464229646, 'text', '丽丽', NULL, 1),
(88, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464230315, 'text', '4', NULL, 1),
(89, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464230401, 'text', 'Assss', NULL, 1),
(90, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464250956, 'text', '哈哈', NULL, 1),
(91, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464256514, 'text', '弹幕测试', NULL, 1),
(92, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', 1464256643, 'text', '十分需要这个机油', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_program`
--

CREATE TABLE IF NOT EXISTS `wx_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '对应活动的openid',
  `program_name` varchar(255) NOT NULL COMMENT '节目名',
  `program_len` varchar(255) NOT NULL COMMENT '节目长度，单位小时',
  `start_time` varchar(255) NOT NULL COMMENT '开始时间',
  `end_time` varchar(255) NOT NULL COMMENT '结束时间',
  `sort` int(11) NOT NULL COMMENT '节目排序',
  `c_time` int(11) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=24 ;

--
-- 转存表中的数据 `wx_program`
--

INSERT INTO `wx_program` (`id`, `huodong_openid`, `program_name`, `program_len`, `start_time`, `end_time`, `sort`, `c_time`) VALUES
(17, '753a52e736cf2019352d2a6ff2138783', '揭幕', '1', '10:00', '11:00', 1, 1461648859),
(18, '753a52e736cf2019352d2a6ff2138783', '节目1', '1', '11:00', '12：00', 2, 1461648881),
(19, '753a52e736cf2019352d2a6ff2138783', '节目2', '2', '14:00', '16:00', 3, 1461648903),
(21, '393ba5cc4db2a2b65fdd92efcee69275', '1', '1', '1', '1', 1, 1461649351),
(22, '393ba5cc4db2a2b65fdd92efcee69275', '2', '2', '2', '2', 2, 1461649368);

-- --------------------------------------------------------

--
-- 表的结构 `wx_qiandao`
--

CREATE TABLE IF NOT EXISTS `wx_qiandao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '活动唯一id',
  `user_openid` varchar(255) NOT NULL COMMENT '用户唯一id',
  `nickname` varchar(255) NOT NULL COMMENT '用户昵称',
  `sex` tinyint(4) NOT NULL COMMENT '1男2女0未知',
  `headimgurl` varchar(255) NOT NULL COMMENT '头像',
  `phone` varchar(255) NOT NULL COMMENT '手机号',
  `name` varchar(255) NOT NULL COMMENT '用户签到界面输入的姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=313 ;

--
-- 转存表中的数据 `wx_qiandao`
--

INSERT INTO `wx_qiandao` (`id`, `huodong_openid`, `user_openid`, `nickname`, `sex`, `headimgurl`, `phone`, `name`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 1, 'www.baidu.com', '1591576219', 'chumchipang'),
(17, '753a52e736cf2019352d2a6ff2138783', '501', 'test5', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', ''),
(18, '753a52e736cf2019352d2a6ff2138783', '419', 'test6', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', ''),
(10, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 1, 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '18589221964', ''),
(11, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 1, 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', '13390633695', ''),
(12, '753a52e736cf2019352d2a6ff2138783', '367', 'test0', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '0', ''),
(13, '753a52e736cf2019352d2a6ff2138783', '339', 'test1', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', ''),
(14, '753a52e736cf2019352d2a6ff2138783', '895', 'test2', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', ''),
(15, '753a52e736cf2019352d2a6ff2138783', '142', 'test3', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', ''),
(16, '753a52e736cf2019352d2a6ff2138783', '483', 'test4', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', ''),
(19, '753a52e736cf2019352d2a6ff2138783', '457', 'test7', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', ''),
(20, '753a52e736cf2019352d2a6ff2138783', '93', 'test8', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', ''),
(21, '753a52e736cf2019352d2a6ff2138783', '310', 'test9', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', ''),
(22, '753a52e736cf2019352d2a6ff2138783', '885', 'test10', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', ''),
(23, '753a52e736cf2019352d2a6ff2138783', '824', 'test11', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', ''),
(24, '753a52e736cf2019352d2a6ff2138783', '326', 'test12', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', ''),
(25, '753a52e736cf2019352d2a6ff2138783', '640', 'test13', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', ''),
(26, '753a52e736cf2019352d2a6ff2138783', '363', 'test14', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', ''),
(27, '753a52e736cf2019352d2a6ff2138783', '299', 'test15', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', ''),
(28, '753a52e736cf2019352d2a6ff2138783', '825', 'test16', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', ''),
(29, '753a52e736cf2019352d2a6ff2138783', '914', 'test17', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', ''),
(30, '753a52e736cf2019352d2a6ff2138783', '594', 'test18', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', ''),
(31, '753a52e736cf2019352d2a6ff2138783', '352', 'test19', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', ''),
(32, '753a52e736cf2019352d2a6ff2138783', '753', 'test20', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', ''),
(33, '753a52e736cf2019352d2a6ff2138783', '867', 'test21', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', ''),
(34, '753a52e736cf2019352d2a6ff2138783', '928', 'test22', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', ''),
(35, '753a52e736cf2019352d2a6ff2138783', '505', 'test23', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', ''),
(36, '753a52e736cf2019352d2a6ff2138783', '269', 'test24', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', ''),
(37, '753a52e736cf2019352d2a6ff2138783', '162', 'test25', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', ''),
(38, '753a52e736cf2019352d2a6ff2138783', '972', 'test26', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', ''),
(39, '753a52e736cf2019352d2a6ff2138783', '43', 'test27', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', ''),
(40, '753a52e736cf2019352d2a6ff2138783', '981', 'test28', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', ''),
(41, '753a52e736cf2019352d2a6ff2138783', '341', 'test29', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', ''),
(42, '753a52e736cf2019352d2a6ff2138783', '461', 'test30', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', ''),
(43, '753a52e736cf2019352d2a6ff2138783', '332', 'test31', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', ''),
(44, '753a52e736cf2019352d2a6ff2138783', '859', 'test32', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', ''),
(45, '753a52e736cf2019352d2a6ff2138783', '628', 'test33', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', ''),
(46, '753a52e736cf2019352d2a6ff2138783', '843', 'test34', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', ''),
(47, '753a52e736cf2019352d2a6ff2138783', '232', 'test35', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', ''),
(48, '753a52e736cf2019352d2a6ff2138783', '119', 'test36', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', ''),
(49, '753a52e736cf2019352d2a6ff2138783', '71', 'test37', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', ''),
(50, '753a52e736cf2019352d2a6ff2138783', '91', 'test38', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', ''),
(51, '753a52e736cf2019352d2a6ff2138783', '90', 'test39', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', ''),
(52, '753a52e736cf2019352d2a6ff2138783', '576', 'test40', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', ''),
(53, '753a52e736cf2019352d2a6ff2138783', '522', 'test41', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', ''),
(54, '753a52e736cf2019352d2a6ff2138783', '218', 'test42', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', ''),
(55, '753a52e736cf2019352d2a6ff2138783', '842', 'test43', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', ''),
(56, '753a52e736cf2019352d2a6ff2138783', '972', 'test44', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', ''),
(57, '753a52e736cf2019352d2a6ff2138783', '977', 'test45', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', ''),
(58, '753a52e736cf2019352d2a6ff2138783', '36', 'test46', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', ''),
(59, '753a52e736cf2019352d2a6ff2138783', '703', 'test47', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', ''),
(60, '753a52e736cf2019352d2a6ff2138783', '759', 'test48', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', ''),
(61, '753a52e736cf2019352d2a6ff2138783', '744', 'test49', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', ''),
(62, '753a52e736cf2019352d2a6ff2138783', '603', 'test50', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', ''),
(63, '753a52e736cf2019352d2a6ff2138783', '943', 'test51', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', ''),
(64, '753a52e736cf2019352d2a6ff2138783', '864', 'test52', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', ''),
(65, '753a52e736cf2019352d2a6ff2138783', '958', 'test53', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', ''),
(66, '753a52e736cf2019352d2a6ff2138783', '919', 'test54', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', ''),
(67, '753a52e736cf2019352d2a6ff2138783', '274', 'test55', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', ''),
(68, '753a52e736cf2019352d2a6ff2138783', '915', 'test56', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', ''),
(69, '753a52e736cf2019352d2a6ff2138783', '949', 'test57', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', ''),
(70, '753a52e736cf2019352d2a6ff2138783', '318', 'test58', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', ''),
(71, '753a52e736cf2019352d2a6ff2138783', '312', 'test59', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', ''),
(72, '753a52e736cf2019352d2a6ff2138783', '442', 'test60', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', ''),
(73, '753a52e736cf2019352d2a6ff2138783', '944', 'test61', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', ''),
(74, '753a52e736cf2019352d2a6ff2138783', '85', 'test62', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', ''),
(75, '753a52e736cf2019352d2a6ff2138783', '646', 'test63', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', ''),
(76, '753a52e736cf2019352d2a6ff2138783', '537', 'test64', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', ''),
(77, '753a52e736cf2019352d2a6ff2138783', '616', 'test65', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', ''),
(78, '753a52e736cf2019352d2a6ff2138783', '801', 'test66', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', ''),
(79, '753a52e736cf2019352d2a6ff2138783', '996', 'test67', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', ''),
(80, '753a52e736cf2019352d2a6ff2138783', '493', 'test68', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', ''),
(81, '753a52e736cf2019352d2a6ff2138783', '972', 'test69', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', ''),
(82, '753a52e736cf2019352d2a6ff2138783', '899', 'test70', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', ''),
(83, '753a52e736cf2019352d2a6ff2138783', '964', 'test71', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', ''),
(84, '753a52e736cf2019352d2a6ff2138783', '906', 'test72', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', ''),
(85, '753a52e736cf2019352d2a6ff2138783', '98', 'test73', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', ''),
(86, '753a52e736cf2019352d2a6ff2138783', '932', 'test74', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', ''),
(87, '753a52e736cf2019352d2a6ff2138783', '881', 'test75', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', ''),
(88, '753a52e736cf2019352d2a6ff2138783', '753', 'test76', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', ''),
(89, '753a52e736cf2019352d2a6ff2138783', '233', 'test77', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', ''),
(90, '753a52e736cf2019352d2a6ff2138783', '77', 'test78', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', ''),
(91, '753a52e736cf2019352d2a6ff2138783', '241', 'test79', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', ''),
(92, '753a52e736cf2019352d2a6ff2138783', '920', 'test80', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', ''),
(93, '753a52e736cf2019352d2a6ff2138783', '695', 'test81', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', ''),
(94, '753a52e736cf2019352d2a6ff2138783', '336', 'test82', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', ''),
(95, '753a52e736cf2019352d2a6ff2138783', '244', 'test83', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', ''),
(96, '753a52e736cf2019352d2a6ff2138783', '725', 'test84', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', ''),
(97, '753a52e736cf2019352d2a6ff2138783', '148', 'test85', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', ''),
(98, '753a52e736cf2019352d2a6ff2138783', '981', 'test86', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', ''),
(99, '753a52e736cf2019352d2a6ff2138783', '913', 'test87', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', ''),
(100, '753a52e736cf2019352d2a6ff2138783', '888', 'test88', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', ''),
(101, '753a52e736cf2019352d2a6ff2138783', '712', 'test89', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', ''),
(102, '753a52e736cf2019352d2a6ff2138783', '696', 'test90', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', ''),
(103, '753a52e736cf2019352d2a6ff2138783', '324', 'test91', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', ''),
(104, '753a52e736cf2019352d2a6ff2138783', '486', 'test92', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', ''),
(105, '753a52e736cf2019352d2a6ff2138783', '423', 'test93', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', ''),
(106, '753a52e736cf2019352d2a6ff2138783', '946', 'test94', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', ''),
(107, '753a52e736cf2019352d2a6ff2138783', '410', 'test95', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', ''),
(108, '753a52e736cf2019352d2a6ff2138783', '358', 'test96', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', ''),
(109, '753a52e736cf2019352d2a6ff2138783', '524', 'test97', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', ''),
(110, '753a52e736cf2019352d2a6ff2138783', '71', 'test98', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', ''),
(111, '753a52e736cf2019352d2a6ff2138783', '879', 'test99', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', ''),
(112, '753a52e736cf2019352d2a6ff2138783', '869', 'test0', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '0', ''),
(113, '753a52e736cf2019352d2a6ff2138783', '315', 'test1', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', ''),
(114, '753a52e736cf2019352d2a6ff2138783', '449', 'test2', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', ''),
(115, '753a52e736cf2019352d2a6ff2138783', '273', 'test3', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', ''),
(116, '753a52e736cf2019352d2a6ff2138783', '399', 'test4', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', ''),
(117, '753a52e736cf2019352d2a6ff2138783', '432', 'test5', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', ''),
(118, '753a52e736cf2019352d2a6ff2138783', '267', 'test6', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', ''),
(119, '753a52e736cf2019352d2a6ff2138783', '73', 'test7', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', ''),
(120, '753a52e736cf2019352d2a6ff2138783', '645', 'test8', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', ''),
(121, '753a52e736cf2019352d2a6ff2138783', '639', 'test9', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', ''),
(122, '753a52e736cf2019352d2a6ff2138783', '391', 'test10', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', ''),
(123, '753a52e736cf2019352d2a6ff2138783', '97', 'test11', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', ''),
(124, '753a52e736cf2019352d2a6ff2138783', '472', 'test12', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', ''),
(125, '753a52e736cf2019352d2a6ff2138783', '255', 'test13', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', ''),
(126, '753a52e736cf2019352d2a6ff2138783', '393', 'test14', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', ''),
(127, '753a52e736cf2019352d2a6ff2138783', '423', 'test15', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', ''),
(128, '753a52e736cf2019352d2a6ff2138783', '606', 'test16', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', ''),
(129, '753a52e736cf2019352d2a6ff2138783', '659', 'test17', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', ''),
(130, '753a52e736cf2019352d2a6ff2138783', '26', 'test18', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', ''),
(131, '753a52e736cf2019352d2a6ff2138783', '929', 'test19', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', ''),
(132, '753a52e736cf2019352d2a6ff2138783', '765', 'test20', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', ''),
(133, '753a52e736cf2019352d2a6ff2138783', '861', 'test21', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', ''),
(134, '753a52e736cf2019352d2a6ff2138783', '390', 'test22', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', ''),
(135, '753a52e736cf2019352d2a6ff2138783', '352', 'test23', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', ''),
(136, '753a52e736cf2019352d2a6ff2138783', '490', 'test24', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', ''),
(137, '753a52e736cf2019352d2a6ff2138783', '158', 'test25', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', ''),
(138, '753a52e736cf2019352d2a6ff2138783', '65', 'test26', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', ''),
(139, '753a52e736cf2019352d2a6ff2138783', '664', 'test27', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', ''),
(140, '753a52e736cf2019352d2a6ff2138783', '199', 'test28', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', ''),
(141, '753a52e736cf2019352d2a6ff2138783', '382', 'test29', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', ''),
(142, '753a52e736cf2019352d2a6ff2138783', '715', 'test30', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', ''),
(143, '753a52e736cf2019352d2a6ff2138783', '326', 'test31', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', ''),
(144, '753a52e736cf2019352d2a6ff2138783', '969', 'test32', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', ''),
(145, '753a52e736cf2019352d2a6ff2138783', '253', 'test33', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', ''),
(146, '753a52e736cf2019352d2a6ff2138783', '664', 'test34', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', ''),
(147, '753a52e736cf2019352d2a6ff2138783', '854', 'test35', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', ''),
(148, '753a52e736cf2019352d2a6ff2138783', '529', 'test36', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', ''),
(149, '753a52e736cf2019352d2a6ff2138783', '312', 'test37', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', ''),
(150, '753a52e736cf2019352d2a6ff2138783', '932', 'test38', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', ''),
(151, '753a52e736cf2019352d2a6ff2138783', '253', 'test39', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', ''),
(152, '753a52e736cf2019352d2a6ff2138783', '967', 'test40', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', ''),
(153, '753a52e736cf2019352d2a6ff2138783', '958', 'test41', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', ''),
(154, '753a52e736cf2019352d2a6ff2138783', '250', 'test42', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', ''),
(155, '753a52e736cf2019352d2a6ff2138783', '779', 'test43', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', ''),
(156, '753a52e736cf2019352d2a6ff2138783', '670', 'test44', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', ''),
(157, '753a52e736cf2019352d2a6ff2138783', '74', 'test45', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', ''),
(158, '753a52e736cf2019352d2a6ff2138783', '529', 'test46', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', ''),
(159, '753a52e736cf2019352d2a6ff2138783', '549', 'test47', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', ''),
(160, '753a52e736cf2019352d2a6ff2138783', '966', 'test48', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', ''),
(161, '753a52e736cf2019352d2a6ff2138783', '745', 'test49', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', ''),
(162, '753a52e736cf2019352d2a6ff2138783', '320', 'test50', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', ''),
(163, '753a52e736cf2019352d2a6ff2138783', '503', 'test51', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', ''),
(164, '753a52e736cf2019352d2a6ff2138783', '2', 'test52', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', ''),
(165, '753a52e736cf2019352d2a6ff2138783', '580', 'test53', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', ''),
(166, '753a52e736cf2019352d2a6ff2138783', '719', 'test54', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', ''),
(167, '753a52e736cf2019352d2a6ff2138783', '197', 'test55', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', ''),
(168, '753a52e736cf2019352d2a6ff2138783', '321', 'test56', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', ''),
(169, '753a52e736cf2019352d2a6ff2138783', '111', 'test57', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', ''),
(170, '753a52e736cf2019352d2a6ff2138783', '262', 'test58', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', ''),
(171, '753a52e736cf2019352d2a6ff2138783', '944', 'test59', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', ''),
(172, '753a52e736cf2019352d2a6ff2138783', '681', 'test60', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', ''),
(173, '753a52e736cf2019352d2a6ff2138783', '798', 'test61', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', ''),
(174, '753a52e736cf2019352d2a6ff2138783', '267', 'test62', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', ''),
(175, '753a52e736cf2019352d2a6ff2138783', '808', 'test63', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', ''),
(176, '753a52e736cf2019352d2a6ff2138783', '573', 'test64', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', ''),
(177, '753a52e736cf2019352d2a6ff2138783', '131', 'test65', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', ''),
(178, '753a52e736cf2019352d2a6ff2138783', '167', 'test66', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', ''),
(179, '753a52e736cf2019352d2a6ff2138783', '928', 'test67', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', ''),
(180, '753a52e736cf2019352d2a6ff2138783', '961', 'test68', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', ''),
(181, '753a52e736cf2019352d2a6ff2138783', '307', 'test69', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', ''),
(182, '753a52e736cf2019352d2a6ff2138783', '291', 'test70', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', ''),
(183, '753a52e736cf2019352d2a6ff2138783', '693', 'test71', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', ''),
(184, '753a52e736cf2019352d2a6ff2138783', '759', 'test72', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', ''),
(185, '753a52e736cf2019352d2a6ff2138783', '30', 'test73', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', ''),
(186, '753a52e736cf2019352d2a6ff2138783', '635', 'test74', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', ''),
(187, '753a52e736cf2019352d2a6ff2138783', '259', 'test75', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', ''),
(188, '753a52e736cf2019352d2a6ff2138783', '497', 'test76', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', ''),
(189, '753a52e736cf2019352d2a6ff2138783', '868', 'test77', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', ''),
(190, '753a52e736cf2019352d2a6ff2138783', '81', 'test78', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', ''),
(191, '753a52e736cf2019352d2a6ff2138783', '912', 'test79', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', ''),
(192, '753a52e736cf2019352d2a6ff2138783', '730', 'test80', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', ''),
(193, '753a52e736cf2019352d2a6ff2138783', '742', 'test81', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', ''),
(194, '753a52e736cf2019352d2a6ff2138783', '597', 'test82', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', ''),
(195, '753a52e736cf2019352d2a6ff2138783', '774', 'test83', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', ''),
(196, '753a52e736cf2019352d2a6ff2138783', '659', 'test84', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', ''),
(197, '753a52e736cf2019352d2a6ff2138783', '978', 'test85', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', ''),
(198, '753a52e736cf2019352d2a6ff2138783', '907', 'test86', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', ''),
(199, '753a52e736cf2019352d2a6ff2138783', '348', 'test87', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', ''),
(200, '753a52e736cf2019352d2a6ff2138783', '460', 'test88', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', ''),
(201, '753a52e736cf2019352d2a6ff2138783', '473', 'test89', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', ''),
(202, '753a52e736cf2019352d2a6ff2138783', '121', 'test90', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', ''),
(203, '753a52e736cf2019352d2a6ff2138783', '414', 'test91', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', ''),
(204, '753a52e736cf2019352d2a6ff2138783', '849', 'test92', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', ''),
(205, '753a52e736cf2019352d2a6ff2138783', '441', 'test93', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', ''),
(206, '753a52e736cf2019352d2a6ff2138783', '838', 'test94', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', ''),
(207, '753a52e736cf2019352d2a6ff2138783', '763', 'test95', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', ''),
(208, '753a52e736cf2019352d2a6ff2138783', '355', 'test96', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', ''),
(209, '753a52e736cf2019352d2a6ff2138783', '262', 'test97', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', ''),
(210, '753a52e736cf2019352d2a6ff2138783', '224', 'test98', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', ''),
(211, '753a52e736cf2019352d2a6ff2138783', '280', 'test99', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', ''),
(212, '753a52e736cf2019352d2a6ff2138783', '501', 'test0', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '0', ''),
(213, '753a52e736cf2019352d2a6ff2138783', '115', 'test1', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', ''),
(214, '753a52e736cf2019352d2a6ff2138783', '585', 'test2', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', ''),
(215, '753a52e736cf2019352d2a6ff2138783', '712', 'test3', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', ''),
(216, '753a52e736cf2019352d2a6ff2138783', '917', 'test4', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', ''),
(217, '753a52e736cf2019352d2a6ff2138783', '634', 'test5', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', ''),
(218, '753a52e736cf2019352d2a6ff2138783', '206', 'test6', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', ''),
(219, '753a52e736cf2019352d2a6ff2138783', '756', 'test7', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', ''),
(220, '753a52e736cf2019352d2a6ff2138783', '438', 'test8', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', ''),
(221, '753a52e736cf2019352d2a6ff2138783', '692', 'test9', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', ''),
(222, '753a52e736cf2019352d2a6ff2138783', '100', 'test10', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', ''),
(223, '753a52e736cf2019352d2a6ff2138783', '918', 'test11', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', ''),
(224, '753a52e736cf2019352d2a6ff2138783', '16', 'test12', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', ''),
(225, '753a52e736cf2019352d2a6ff2138783', '740', 'test13', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', ''),
(226, '753a52e736cf2019352d2a6ff2138783', '842', 'test14', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', ''),
(227, '753a52e736cf2019352d2a6ff2138783', '444', 'test15', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', ''),
(228, '753a52e736cf2019352d2a6ff2138783', '978', 'test16', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', ''),
(229, '753a52e736cf2019352d2a6ff2138783', '97', 'test17', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', ''),
(230, '753a52e736cf2019352d2a6ff2138783', '600', 'test18', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', ''),
(231, '753a52e736cf2019352d2a6ff2138783', '801', 'test19', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', ''),
(232, '753a52e736cf2019352d2a6ff2138783', '768', 'test20', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', ''),
(233, '753a52e736cf2019352d2a6ff2138783', '797', 'test21', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', ''),
(234, '753a52e736cf2019352d2a6ff2138783', '33', 'test22', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', ''),
(235, '753a52e736cf2019352d2a6ff2138783', '642', 'test23', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', ''),
(236, '753a52e736cf2019352d2a6ff2138783', '630', 'test24', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', ''),
(237, '753a52e736cf2019352d2a6ff2138783', '809', 'test25', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', ''),
(238, '753a52e736cf2019352d2a6ff2138783', '411', 'test26', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', ''),
(239, '753a52e736cf2019352d2a6ff2138783', '376', 'test27', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', ''),
(240, '753a52e736cf2019352d2a6ff2138783', '778', 'test28', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', ''),
(241, '753a52e736cf2019352d2a6ff2138783', '76', 'test29', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', ''),
(242, '753a52e736cf2019352d2a6ff2138783', '452', 'test30', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', ''),
(243, '753a52e736cf2019352d2a6ff2138783', '821', 'test31', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', ''),
(244, '753a52e736cf2019352d2a6ff2138783', '537', 'test32', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', ''),
(245, '753a52e736cf2019352d2a6ff2138783', '909', 'test33', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', ''),
(246, '753a52e736cf2019352d2a6ff2138783', '384', 'test34', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', ''),
(247, '753a52e736cf2019352d2a6ff2138783', '460', 'test35', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', ''),
(248, '753a52e736cf2019352d2a6ff2138783', '938', 'test36', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', ''),
(249, '753a52e736cf2019352d2a6ff2138783', '229', 'test37', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', ''),
(250, '753a52e736cf2019352d2a6ff2138783', '713', 'test38', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', ''),
(251, '753a52e736cf2019352d2a6ff2138783', '785', 'test39', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', ''),
(252, '753a52e736cf2019352d2a6ff2138783', '297', 'test40', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', ''),
(253, '753a52e736cf2019352d2a6ff2138783', '139', 'test41', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', ''),
(254, '753a52e736cf2019352d2a6ff2138783', '220', 'test42', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', ''),
(255, '753a52e736cf2019352d2a6ff2138783', '237', 'test43', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', ''),
(256, '753a52e736cf2019352d2a6ff2138783', '251', 'test44', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', ''),
(257, '753a52e736cf2019352d2a6ff2138783', '354', 'test45', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', ''),
(258, '753a52e736cf2019352d2a6ff2138783', '673', 'test46', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', ''),
(259, '753a52e736cf2019352d2a6ff2138783', '237', 'test47', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', ''),
(260, '753a52e736cf2019352d2a6ff2138783', '771', 'test48', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', ''),
(261, '753a52e736cf2019352d2a6ff2138783', '964', 'test49', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', ''),
(262, '753a52e736cf2019352d2a6ff2138783', '765', 'test50', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', ''),
(263, '753a52e736cf2019352d2a6ff2138783', '816', 'test51', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', ''),
(264, '753a52e736cf2019352d2a6ff2138783', '639', 'test52', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', ''),
(265, '753a52e736cf2019352d2a6ff2138783', '52', 'test53', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', ''),
(266, '753a52e736cf2019352d2a6ff2138783', '754', 'test54', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', ''),
(267, '753a52e736cf2019352d2a6ff2138783', '336', 'test55', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', ''),
(268, '753a52e736cf2019352d2a6ff2138783', '895', 'test56', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', ''),
(269, '753a52e736cf2019352d2a6ff2138783', '639', 'test57', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', ''),
(270, '753a52e736cf2019352d2a6ff2138783', '339', 'test58', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', ''),
(271, '753a52e736cf2019352d2a6ff2138783', '798', 'test59', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', ''),
(272, '753a52e736cf2019352d2a6ff2138783', '757', 'test60', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', ''),
(273, '753a52e736cf2019352d2a6ff2138783', '494', 'test61', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', ''),
(274, '753a52e736cf2019352d2a6ff2138783', '247', 'test62', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', ''),
(275, '753a52e736cf2019352d2a6ff2138783', '263', 'test63', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', ''),
(276, '753a52e736cf2019352d2a6ff2138783', '496', 'test64', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', ''),
(277, '753a52e736cf2019352d2a6ff2138783', '266', 'test65', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', ''),
(278, '753a52e736cf2019352d2a6ff2138783', '38', 'test66', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', ''),
(279, '753a52e736cf2019352d2a6ff2138783', '837', 'test67', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', ''),
(280, '753a52e736cf2019352d2a6ff2138783', '803', 'test68', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', ''),
(281, '753a52e736cf2019352d2a6ff2138783', '480', 'test69', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', ''),
(282, '753a52e736cf2019352d2a6ff2138783', '630', 'test70', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', ''),
(283, '753a52e736cf2019352d2a6ff2138783', '784', 'test71', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', ''),
(284, '753a52e736cf2019352d2a6ff2138783', '100', 'test72', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', ''),
(285, '753a52e736cf2019352d2a6ff2138783', '860', 'test73', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', ''),
(286, '753a52e736cf2019352d2a6ff2138783', '49', 'test74', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', ''),
(287, '753a52e736cf2019352d2a6ff2138783', '202', 'test75', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', ''),
(288, '753a52e736cf2019352d2a6ff2138783', '335', 'test76', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', ''),
(289, '753a52e736cf2019352d2a6ff2138783', '507', 'test77', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', ''),
(290, '753a52e736cf2019352d2a6ff2138783', '881', 'test78', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', ''),
(291, '753a52e736cf2019352d2a6ff2138783', '812', 'test79', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', ''),
(292, '753a52e736cf2019352d2a6ff2138783', '745', 'test80', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', ''),
(293, '753a52e736cf2019352d2a6ff2138783', '412', 'test81', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', ''),
(294, '753a52e736cf2019352d2a6ff2138783', '965', 'test82', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', ''),
(295, '753a52e736cf2019352d2a6ff2138783', '338', 'test83', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', ''),
(296, '753a52e736cf2019352d2a6ff2138783', '81', 'test84', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', ''),
(297, '753a52e736cf2019352d2a6ff2138783', '823', 'test85', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', ''),
(298, '753a52e736cf2019352d2a6ff2138783', '786', 'test86', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', ''),
(299, '753a52e736cf2019352d2a6ff2138783', '968', 'test87', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', ''),
(300, '753a52e736cf2019352d2a6ff2138783', '802', 'test88', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', ''),
(301, '753a52e736cf2019352d2a6ff2138783', '947', 'test89', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', ''),
(302, '753a52e736cf2019352d2a6ff2138783', '97', 'test90', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', ''),
(303, '753a52e736cf2019352d2a6ff2138783', '432', 'test91', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', ''),
(304, '753a52e736cf2019352d2a6ff2138783', '748', 'test92', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', ''),
(305, '753a52e736cf2019352d2a6ff2138783', '500', 'test93', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', ''),
(306, '753a52e736cf2019352d2a6ff2138783', '255', 'test94', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', ''),
(307, '753a52e736cf2019352d2a6ff2138783', '145', 'test95', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', ''),
(308, '753a52e736cf2019352d2a6ff2138783', '772', 'test96', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', ''),
(309, '753a52e736cf2019352d2a6ff2138783', '594', 'test97', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', ''),
(310, '753a52e736cf2019352d2a6ff2138783', '781', 'test98', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', ''),
(311, '753a52e736cf2019352d2a6ff2138783', '973', 'test99', 1, 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', ''),
(312, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwkdbT7WPdXuvKjpR0x5_VIU', '开心一族', 0, 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OP6v78OA2ka0X1iamuDJuPYZnY4IP60odbGdibZKp5xY9hbll9shzuupJO2mUurkeD27ibl5ibGjDHKjC1fIkT4BNFY/0', '13066398765', '');

-- --------------------------------------------------------

--
-- 表的结构 `wx_qianghongbao_round`
--

CREATE TABLE IF NOT EXISTS `wx_qianghongbao_round` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `status` int(255) NOT NULL DEFAULT '1' COMMENT '1为开启2为关闭',
  `c_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `wx_qianghongbao_round`
--

INSERT INTO `wx_qianghongbao_round` (`id`, `huodong_openid`, `status`, `c_time`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', 2, 1464516338),
(2, '753a52e736cf2019352d2a6ff2138783', 2, 1464516347),
(3, '753a52e736cf2019352d2a6ff2138783', 2, 1464533750),
(4, '753a52e736cf2019352d2a6ff2138783', 2, 1464535074),
(5, '753a52e736cf2019352d2a6ff2138783', 2, 1464535966),
(6, '753a52e736cf2019352d2a6ff2138783', 2, 1464536275),
(7, '753a52e736cf2019352d2a6ff2138783', 2, 1464536459),
(8, '753a52e736cf2019352d2a6ff2138783', 2, 1464536671),
(9, '753a52e736cf2019352d2a6ff2138783', 2, 1464536688),
(10, '753a52e736cf2019352d2a6ff2138783', 2, 1464539133),
(11, '753a52e736cf2019352d2a6ff2138783', 2, 1464539311),
(12, '753a52e736cf2019352d2a6ff2138783', 2, 1464539404),
(13, '753a52e736cf2019352d2a6ff2138783', 2, 1464539423),
(14, '753a52e736cf2019352d2a6ff2138783', 2, 1464539541),
(15, '753a52e736cf2019352d2a6ff2138783', 2, 1464539565);

-- --------------------------------------------------------

--
-- 表的结构 `wx_shake`
--

CREATE TABLE IF NOT EXISTS `wx_shake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) DEFAULT NULL,
  `max_shake` int(11) NOT NULL COMMENT '每人最大摇动次数',
  `max_shake_time` int(11) NOT NULL COMMENT '单位秒，活动持续时间',
  `down_count` int(11) NOT NULL DEFAULT '5' COMMENT '开始倒计时事件，单位秒',
  `show_award` int(11) NOT NULL COMMENT '显示中奖人数，最大9',
  `join_num` int(11) NOT NULL DEFAULT '0' COMMENT '参加摇一摇的人数设置，0为无限制',
  `black_num` int(11) NOT NULL DEFAULT '0' COMMENT '设置前几名用户无法参加以后的活动',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为关闭2为开启未进行，3进行中，4已结束',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  `l_time` int(11) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `wx_shake`
--

INSERT INTO `wx_shake` (`id`, `huodong_openid`, `max_shake`, `max_shake_time`, `down_count`, `show_award`, `join_num`, `black_num`, `status`, `c_time`, `l_time`) VALUES
(28, '753a52e736cf2019352d2a6ff2138783', 100, 20, 0, 5, 0, 0, 4, 213, 1464511274),
(29, '753a52e736cf2019352d2a6ff2138783', 100, 20, 0, 5, 0, 0, 4, 213, 1464511520),
(30, '753a52e736cf2019352d2a6ff2138783', 100, 20, 0, 5, 0, 0, 4, 213, 1464511685),
(31, '753a52e736cf2019352d2a6ff2138783', 100, 20, 0, 5, 0, 0, 4, 213, 1464512578),
(32, '753a52e736cf2019352d2a6ff2138783', 100, 20, 0, 5, 0, 0, 4, 213, 1464512654),
(33, '753a52e736cf2019352d2a6ff2138783', 100, 20, 0, 5, 0, 0, 1, 213, 1464511685);

-- --------------------------------------------------------

--
-- 表的结构 `wx_te`
--

CREATE TABLE IF NOT EXISTS `wx_te` (
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- 转存表中的数据 `wx_te`
--

INSERT INTO `wx_te` (`status`) VALUES
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok'),
('ok');

-- --------------------------------------------------------

--
-- 表的结构 `wx_user`
--

CREATE TABLE IF NOT EXISTS `wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL COMMENT '用户唯一标示',
  `nickname` varchar(255) NOT NULL COMMENT '昵称',
  `sex` tinyint(4) NOT NULL COMMENT '1为男性，2为女性，0为未知',
  `provice` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `headimgurl` varchar(255) DEFAULT NULL COMMENT '头像',
  `privilege` varchar(255) DEFAULT NULL COMMENT '用户特权信息',
  `unionid` varchar(255) DEFAULT NULL,
  `huodong_openid` varchar(255) NOT NULL COMMENT '对应活动的id',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为正常用户，2为拉黑用户',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=265 ;

--
-- 转存表中的数据 `wx_user`
--

INSERT INTO `wx_user` (`id`, `openid`, `nickname`, `sex`, `provice`, `city`, `country`, `headimgurl`, `privilege`, `unionid`, `huodong_openid`, `status`) VALUES
(1, '1', '覃志鹏', 1, 'gd', 'gz', 'cn', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1', '1', '753a52e736cf2019352d2a6ff2138783', 1),
(2, 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 1, NULL, '广州', '中国', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '[]', NULL, '753a52e736cf2019352d2a6ff2138783', 1),
(3, 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 1, NULL, '', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', '[]', NULL, '753a52e736cf2019352d2a6ff2138783', 1),
(4, 'user_openid1', 'nickname1', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', '1', '753a52e736cf2019352d2a6ff2138783', 1),
(5, 'user_openid2', 'nickname2', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', '2', '753a52e736cf2019352d2a6ff2138783', 1),
(6, 'user_openid3', 'nickname3', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', '3', '753a52e736cf2019352d2a6ff2138783', 1),
(7, 'user_openid4', 'nickname4', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', '4', '753a52e736cf2019352d2a6ff2138783', 1),
(8, 'user_openid5', 'nickname5', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', '5', '753a52e736cf2019352d2a6ff2138783', 1),
(9, 'user_openid6', 'nickname6', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', '6', '753a52e736cf2019352d2a6ff2138783', 1),
(10, 'user_openid7', 'nickname7', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', '7', '753a52e736cf2019352d2a6ff2138783', 1),
(11, 'user_openid8', 'nickname8', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', '8', '753a52e736cf2019352d2a6ff2138783', 1),
(12, 'user_openid9', 'nickname9', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', '9', '753a52e736cf2019352d2a6ff2138783', 1),
(13, 'user_openid10', 'nickname10', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', '10', '753a52e736cf2019352d2a6ff2138783', 1),
(14, 'user_openid11', 'nickname11', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', '11', '753a52e736cf2019352d2a6ff2138783', 1),
(15, 'user_openid12', 'nickname12', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', '12', '753a52e736cf2019352d2a6ff2138783', 1),
(16, 'user_openid13', 'nickname13', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', '13', '753a52e736cf2019352d2a6ff2138783', 1),
(17, 'user_openid14', 'nickname14', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', '14', '753a52e736cf2019352d2a6ff2138783', 1),
(18, 'user_openid15', 'nickname15', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', '15', '753a52e736cf2019352d2a6ff2138783', 1),
(19, 'user_openid16', 'nickname16', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', '16', '753a52e736cf2019352d2a6ff2138783', 1),
(20, 'user_openid17', 'nickname17', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', '17', '753a52e736cf2019352d2a6ff2138783', 1),
(21, 'user_openid18', 'nickname18', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', '18', '753a52e736cf2019352d2a6ff2138783', 1),
(22, 'user_openid19', 'nickname19', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', '19', '753a52e736cf2019352d2a6ff2138783', 1),
(23, 'user_openid20', 'nickname20', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', '20', '753a52e736cf2019352d2a6ff2138783', 1),
(24, 'user_openid21', 'nickname21', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', '21', '753a52e736cf2019352d2a6ff2138783', 1),
(25, 'user_openid22', 'nickname22', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', '22', '753a52e736cf2019352d2a6ff2138783', 1),
(26, 'user_openid23', 'nickname23', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', '23', '753a52e736cf2019352d2a6ff2138783', 1),
(27, 'user_openid24', 'nickname24', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', '24', '753a52e736cf2019352d2a6ff2138783', 1),
(28, 'user_openid25', 'nickname25', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', '25', '753a52e736cf2019352d2a6ff2138783', 1),
(29, 'user_openid26', 'nickname26', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', '26', '753a52e736cf2019352d2a6ff2138783', 1),
(30, 'user_openid27', 'nickname27', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', '27', '753a52e736cf2019352d2a6ff2138783', 1),
(31, 'user_openid28', 'nickname28', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', '28', '753a52e736cf2019352d2a6ff2138783', 1),
(32, 'user_openid29', 'nickname29', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', '29', '753a52e736cf2019352d2a6ff2138783', 1),
(33, 'user_openid30', 'nickname30', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', '30', '753a52e736cf2019352d2a6ff2138783', 1),
(34, 'user_openid31', 'nickname31', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', '31', '753a52e736cf2019352d2a6ff2138783', 1),
(35, 'user_openid32', 'nickname32', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', '32', '753a52e736cf2019352d2a6ff2138783', 1),
(36, 'user_openid33', 'nickname33', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', '33', '753a52e736cf2019352d2a6ff2138783', 1),
(37, 'user_openid34', 'nickname34', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', '34', '753a52e736cf2019352d2a6ff2138783', 1),
(38, 'user_openid35', 'nickname35', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', '35', '753a52e736cf2019352d2a6ff2138783', 1),
(39, 'user_openid36', 'nickname36', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', '36', '753a52e736cf2019352d2a6ff2138783', 1),
(40, 'user_openid37', 'nickname37', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', '37', '753a52e736cf2019352d2a6ff2138783', 1),
(41, 'user_openid38', 'nickname38', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', '38', '753a52e736cf2019352d2a6ff2138783', 1),
(42, 'user_openid39', 'nickname39', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', '39', '753a52e736cf2019352d2a6ff2138783', 1),
(43, 'user_openid40', 'nickname40', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', '40', '753a52e736cf2019352d2a6ff2138783', 1),
(44, 'user_openid41', 'nickname41', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', '41', '753a52e736cf2019352d2a6ff2138783', 1),
(45, 'user_openid42', 'nickname42', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', '42', '753a52e736cf2019352d2a6ff2138783', 1),
(46, 'user_openid43', 'nickname43', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', '43', '753a52e736cf2019352d2a6ff2138783', 1),
(47, 'user_openid44', 'nickname44', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', '44', '753a52e736cf2019352d2a6ff2138783', 1),
(48, 'user_openid45', 'nickname45', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', '45', '753a52e736cf2019352d2a6ff2138783', 1),
(49, 'user_openid46', 'nickname46', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', '46', '753a52e736cf2019352d2a6ff2138783', 1),
(50, 'user_openid47', 'nickname47', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', '47', '753a52e736cf2019352d2a6ff2138783', 1),
(51, 'user_openid48', 'nickname48', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', '48', '753a52e736cf2019352d2a6ff2138783', 1),
(52, 'user_openid49', 'nickname49', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', '49', '753a52e736cf2019352d2a6ff2138783', 1),
(53, 'user_openid50', 'nickname50', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', '50', '753a52e736cf2019352d2a6ff2138783', 1),
(54, 'user_openid1', 'nickname1', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', '1', '753a52e736cf2019352d2a6ff2138783', 1),
(55, 'user_openid2', 'nickname2', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', '2', '753a52e736cf2019352d2a6ff2138783', 1),
(56, 'user_openid3', 'nickname3', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', '3', '753a52e736cf2019352d2a6ff2138783', 1),
(57, 'user_openid4', 'nickname4', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', '4', '753a52e736cf2019352d2a6ff2138783', 1),
(58, 'user_openid5', 'nickname5', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', '5', '753a52e736cf2019352d2a6ff2138783', 1),
(59, 'user_openid6', 'nickname6', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', '6', '753a52e736cf2019352d2a6ff2138783', 1),
(60, 'user_openid7', 'nickname7', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', '7', '753a52e736cf2019352d2a6ff2138783', 1),
(61, 'user_openid8', 'nickname8', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', '8', '753a52e736cf2019352d2a6ff2138783', 1),
(62, 'user_openid9', 'nickname9', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', '9', '753a52e736cf2019352d2a6ff2138783', 1),
(63, 'user_openid10', 'nickname10', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', '10', '753a52e736cf2019352d2a6ff2138783', 1),
(64, 'user_openid11', 'nickname11', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', '11', '753a52e736cf2019352d2a6ff2138783', 1),
(65, 'user_openid12', 'nickname12', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', '12', '753a52e736cf2019352d2a6ff2138783', 1),
(66, 'user_openid13', 'nickname13', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', '13', '753a52e736cf2019352d2a6ff2138783', 1),
(67, 'user_openid14', 'nickname14', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', '14', '753a52e736cf2019352d2a6ff2138783', 1),
(68, 'user_openid15', 'nickname15', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', '15', '753a52e736cf2019352d2a6ff2138783', 1),
(69, 'user_openid16', 'nickname16', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', '16', '753a52e736cf2019352d2a6ff2138783', 1),
(70, 'user_openid17', 'nickname17', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', '17', '753a52e736cf2019352d2a6ff2138783', 1),
(71, 'user_openid18', 'nickname18', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', '18', '753a52e736cf2019352d2a6ff2138783', 1),
(72, 'user_openid19', 'nickname19', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', '19', '753a52e736cf2019352d2a6ff2138783', 1),
(73, 'user_openid20', 'nickname20', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', '20', '753a52e736cf2019352d2a6ff2138783', 1),
(74, 'user_openid21', 'nickname21', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', '21', '753a52e736cf2019352d2a6ff2138783', 1),
(75, 'user_openid22', 'nickname22', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', '22', '753a52e736cf2019352d2a6ff2138783', 1),
(76, 'user_openid23', 'nickname23', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', '23', '753a52e736cf2019352d2a6ff2138783', 1),
(77, 'user_openid24', 'nickname24', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', '24', '753a52e736cf2019352d2a6ff2138783', 1),
(78, 'user_openid25', 'nickname25', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', '25', '753a52e736cf2019352d2a6ff2138783', 1),
(79, 'user_openid26', 'nickname26', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', '26', '753a52e736cf2019352d2a6ff2138783', 1),
(80, 'user_openid27', 'nickname27', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', '27', '753a52e736cf2019352d2a6ff2138783', 1),
(81, 'user_openid28', 'nickname28', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', '28', '753a52e736cf2019352d2a6ff2138783', 1),
(82, 'user_openid29', 'nickname29', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', '29', '753a52e736cf2019352d2a6ff2138783', 1),
(83, 'user_openid30', 'nickname30', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', '30', '753a52e736cf2019352d2a6ff2138783', 1),
(84, 'user_openid31', 'nickname31', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', '31', '753a52e736cf2019352d2a6ff2138783', 1),
(85, 'user_openid32', 'nickname32', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', '32', '753a52e736cf2019352d2a6ff2138783', 1),
(86, 'user_openid33', 'nickname33', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', '33', '753a52e736cf2019352d2a6ff2138783', 1),
(87, 'user_openid34', 'nickname34', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', '34', '753a52e736cf2019352d2a6ff2138783', 1),
(88, 'user_openid35', 'nickname35', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', '35', '753a52e736cf2019352d2a6ff2138783', 1),
(89, 'user_openid36', 'nickname36', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', '36', '753a52e736cf2019352d2a6ff2138783', 1),
(90, 'user_openid37', 'nickname37', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', '37', '753a52e736cf2019352d2a6ff2138783', 1),
(91, 'user_openid38', 'nickname38', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', '38', '753a52e736cf2019352d2a6ff2138783', 1),
(92, 'user_openid39', 'nickname39', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', '39', '753a52e736cf2019352d2a6ff2138783', 1),
(93, 'user_openid40', 'nickname40', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', '40', '753a52e736cf2019352d2a6ff2138783', 1),
(94, 'user_openid41', 'nickname41', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', '41', '753a52e736cf2019352d2a6ff2138783', 1),
(95, 'user_openid42', 'nickname42', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', '42', '753a52e736cf2019352d2a6ff2138783', 1),
(96, 'user_openid43', 'nickname43', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', '43', '753a52e736cf2019352d2a6ff2138783', 1),
(97, 'user_openid44', 'nickname44', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', '44', '753a52e736cf2019352d2a6ff2138783', 1),
(98, 'user_openid45', 'nickname45', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', '45', '753a52e736cf2019352d2a6ff2138783', 1),
(99, 'user_openid46', 'nickname46', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', '46', '753a52e736cf2019352d2a6ff2138783', 1),
(100, 'user_openid47', 'nickname47', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', '47', '753a52e736cf2019352d2a6ff2138783', 1),
(101, 'user_openid48', 'nickname48', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', '48', '753a52e736cf2019352d2a6ff2138783', 1),
(102, 'user_openid49', 'nickname49', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', '49', '753a52e736cf2019352d2a6ff2138783', 1),
(103, 'user_openid50', 'nickname50', 1, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', '50', '753a52e736cf2019352d2a6ff2138783', 1),
(104, 'user_openid51', 'lady51', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', '51', '753a52e736cf2019352d2a6ff2138783', 1),
(105, 'user_openid52', 'lady52', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', '52', '753a52e736cf2019352d2a6ff2138783', 1),
(106, 'user_openid53', 'lady53', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', '53', '753a52e736cf2019352d2a6ff2138783', 1),
(107, 'user_openid54', 'lady54', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', '54', '753a52e736cf2019352d2a6ff2138783', 1),
(108, 'user_openid55', 'lady55', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', '55', '753a52e736cf2019352d2a6ff2138783', 1),
(109, 'user_openid56', 'lady56', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', '56', '753a52e736cf2019352d2a6ff2138783', 1),
(110, 'user_openid57', 'lady57', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', '57', '753a52e736cf2019352d2a6ff2138783', 1),
(111, 'user_openid58', 'lady58', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', '58', '753a52e736cf2019352d2a6ff2138783', 1),
(112, 'user_openid59', 'lady59', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', '59', '753a52e736cf2019352d2a6ff2138783', 1),
(113, 'user_openid60', 'lady60', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', '60', '753a52e736cf2019352d2a6ff2138783', 1),
(114, 'user_openid61', 'lady61', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', '61', '753a52e736cf2019352d2a6ff2138783', 1),
(115, 'user_openid62', 'lady62', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', '62', '753a52e736cf2019352d2a6ff2138783', 1),
(116, 'user_openid63', 'lady63', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', '63', '753a52e736cf2019352d2a6ff2138783', 1),
(117, 'user_openid64', 'lady64', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', '64', '753a52e736cf2019352d2a6ff2138783', 1),
(118, 'user_openid65', 'lady65', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', '65', '753a52e736cf2019352d2a6ff2138783', 1),
(119, 'user_openid66', 'lady66', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', '66', '753a52e736cf2019352d2a6ff2138783', 1),
(120, 'user_openid67', 'lady67', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', '67', '753a52e736cf2019352d2a6ff2138783', 1),
(121, 'user_openid68', 'lady68', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', '68', '753a52e736cf2019352d2a6ff2138783', 1),
(122, 'user_openid69', 'lady69', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', '69', '753a52e736cf2019352d2a6ff2138783', 1),
(123, 'user_openid70', 'lady70', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', '70', '753a52e736cf2019352d2a6ff2138783', 1),
(124, 'user_openid71', 'lady71', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', '71', '753a52e736cf2019352d2a6ff2138783', 1),
(125, 'user_openid72', 'lady72', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', '72', '753a52e736cf2019352d2a6ff2138783', 1),
(126, 'user_openid73', 'lady73', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', '73', '753a52e736cf2019352d2a6ff2138783', 1),
(127, 'user_openid74', 'lady74', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', '74', '753a52e736cf2019352d2a6ff2138783', 1),
(128, 'user_openid75', 'lady75', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', '75', '753a52e736cf2019352d2a6ff2138783', 1),
(129, 'user_openid76', 'lady76', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', '76', '753a52e736cf2019352d2a6ff2138783', 1),
(130, 'user_openid77', 'lady77', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', '77', '753a52e736cf2019352d2a6ff2138783', 1),
(131, 'user_openid78', 'lady78', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', '78', '753a52e736cf2019352d2a6ff2138783', 1),
(132, 'user_openid79', 'lady79', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', '79', '753a52e736cf2019352d2a6ff2138783', 1),
(133, 'user_openid80', 'lady80', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', '80', '753a52e736cf2019352d2a6ff2138783', 1),
(134, 'user_openid81', 'lady81', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', '81', '753a52e736cf2019352d2a6ff2138783', 1),
(135, 'user_openid82', 'lady82', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', '82', '753a52e736cf2019352d2a6ff2138783', 1),
(136, 'user_openid83', 'lady83', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', '83', '753a52e736cf2019352d2a6ff2138783', 1),
(137, 'user_openid84', 'lady84', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', '84', '753a52e736cf2019352d2a6ff2138783', 1),
(138, 'user_openid85', 'lady85', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', '85', '753a52e736cf2019352d2a6ff2138783', 1),
(139, 'user_openid86', 'lady86', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', '86', '753a52e736cf2019352d2a6ff2138783', 1),
(140, 'user_openid87', 'lady87', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', '87', '753a52e736cf2019352d2a6ff2138783', 1),
(141, 'user_openid88', 'lady88', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', '88', '753a52e736cf2019352d2a6ff2138783', 1),
(142, 'user_openid89', 'lady89', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', '89', '753a52e736cf2019352d2a6ff2138783', 1),
(143, 'user_openid90', 'lady90', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', '90', '753a52e736cf2019352d2a6ff2138783', 1),
(144, 'user_openid91', 'lady91', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', '91', '753a52e736cf2019352d2a6ff2138783', 1),
(145, 'user_openid92', 'lady92', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', '92', '753a52e736cf2019352d2a6ff2138783', 1),
(146, 'user_openid93', 'lady93', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', '93', '753a52e736cf2019352d2a6ff2138783', 1),
(147, 'user_openid94', 'lady94', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', '94', '753a52e736cf2019352d2a6ff2138783', 1),
(148, 'user_openid95', 'lady95', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', '95', '753a52e736cf2019352d2a6ff2138783', 1),
(149, 'user_openid96', 'lady96', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', '96', '753a52e736cf2019352d2a6ff2138783', 1),
(150, 'user_openid97', 'lady97', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', '97', '753a52e736cf2019352d2a6ff2138783', 1),
(151, 'user_openid98', 'lady98', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', '98', '753a52e736cf2019352d2a6ff2138783', 1),
(152, 'user_openid99', 'lady99', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', '99', '753a52e736cf2019352d2a6ff2138783', 1),
(153, 'user_openid100', 'lady100', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '100', '100', '753a52e736cf2019352d2a6ff2138783', 1),
(154, 'user_openid51', 'lady51', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', '51', '753a52e736cf2019352d2a6ff2138783', 1),
(155, 'user_openid52', 'lady52', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', '52', '753a52e736cf2019352d2a6ff2138783', 1),
(156, 'user_openid53', 'lady53', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', '53', '753a52e736cf2019352d2a6ff2138783', 1),
(157, 'user_openid54', 'lady54', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', '54', '753a52e736cf2019352d2a6ff2138783', 1),
(158, 'user_openid55', 'lady55', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', '55', '753a52e736cf2019352d2a6ff2138783', 1),
(159, 'user_openid56', 'lady56', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', '56', '753a52e736cf2019352d2a6ff2138783', 1),
(160, 'user_openid57', 'lady57', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', '57', '753a52e736cf2019352d2a6ff2138783', 1),
(161, 'user_openid58', 'lady58', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', '58', '753a52e736cf2019352d2a6ff2138783', 1),
(162, 'user_openid59', 'lady59', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', '59', '753a52e736cf2019352d2a6ff2138783', 1),
(163, 'user_openid60', 'lady60', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', '60', '753a52e736cf2019352d2a6ff2138783', 1),
(164, 'user_openid61', 'lady61', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', '61', '753a52e736cf2019352d2a6ff2138783', 1),
(165, 'user_openid62', 'lady62', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', '62', '753a52e736cf2019352d2a6ff2138783', 1),
(166, 'user_openid63', 'lady63', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', '63', '753a52e736cf2019352d2a6ff2138783', 1),
(167, 'user_openid64', 'lady64', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', '64', '753a52e736cf2019352d2a6ff2138783', 1),
(168, 'user_openid65', 'lady65', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', '65', '753a52e736cf2019352d2a6ff2138783', 1),
(169, 'user_openid66', 'lady66', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', '66', '753a52e736cf2019352d2a6ff2138783', 1),
(170, 'user_openid67', 'lady67', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', '67', '753a52e736cf2019352d2a6ff2138783', 1),
(171, 'user_openid68', 'lady68', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', '68', '753a52e736cf2019352d2a6ff2138783', 1),
(172, 'user_openid69', 'lady69', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', '69', '753a52e736cf2019352d2a6ff2138783', 1),
(173, 'user_openid70', 'lady70', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', '70', '753a52e736cf2019352d2a6ff2138783', 1),
(174, 'user_openid71', 'lady71', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', '71', '753a52e736cf2019352d2a6ff2138783', 1),
(175, 'user_openid72', 'lady72', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', '72', '753a52e736cf2019352d2a6ff2138783', 1),
(176, 'user_openid73', 'lady73', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', '73', '753a52e736cf2019352d2a6ff2138783', 1),
(177, 'user_openid74', 'lady74', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', '74', '753a52e736cf2019352d2a6ff2138783', 1),
(178, 'user_openid75', 'lady75', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', '75', '753a52e736cf2019352d2a6ff2138783', 1),
(179, 'user_openid76', 'lady76', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', '76', '753a52e736cf2019352d2a6ff2138783', 1),
(180, 'user_openid77', 'lady77', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', '77', '753a52e736cf2019352d2a6ff2138783', 1),
(181, 'user_openid78', 'lady78', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', '78', '753a52e736cf2019352d2a6ff2138783', 1),
(182, 'user_openid79', 'lady79', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', '79', '753a52e736cf2019352d2a6ff2138783', 1),
(183, 'user_openid80', 'lady80', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', '80', '753a52e736cf2019352d2a6ff2138783', 1),
(184, 'user_openid81', 'lady81', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', '81', '753a52e736cf2019352d2a6ff2138783', 1),
(185, 'user_openid82', 'lady82', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', '82', '753a52e736cf2019352d2a6ff2138783', 1),
(186, 'user_openid83', 'lady83', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', '83', '753a52e736cf2019352d2a6ff2138783', 1),
(187, 'user_openid84', 'lady84', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', '84', '753a52e736cf2019352d2a6ff2138783', 1),
(188, 'user_openid85', 'lady85', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', '85', '753a52e736cf2019352d2a6ff2138783', 1),
(189, 'user_openid86', 'lady86', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', '86', '753a52e736cf2019352d2a6ff2138783', 1),
(190, 'user_openid87', 'lady87', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', '87', '753a52e736cf2019352d2a6ff2138783', 1),
(191, 'user_openid88', 'lady88', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', '88', '753a52e736cf2019352d2a6ff2138783', 1),
(192, 'user_openid89', 'lady89', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', '89', '753a52e736cf2019352d2a6ff2138783', 1),
(193, 'user_openid90', 'lady90', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', '90', '753a52e736cf2019352d2a6ff2138783', 1),
(194, 'user_openid91', 'lady91', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', '91', '753a52e736cf2019352d2a6ff2138783', 1),
(195, 'user_openid92', 'lady92', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', '92', '753a52e736cf2019352d2a6ff2138783', 1),
(196, 'user_openid93', 'lady93', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', '93', '753a52e736cf2019352d2a6ff2138783', 1),
(197, 'user_openid94', 'lady94', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', '94', '753a52e736cf2019352d2a6ff2138783', 1),
(198, 'user_openid95', 'lady95', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', '95', '753a52e736cf2019352d2a6ff2138783', 1),
(199, 'user_openid96', 'lady96', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', '96', '753a52e736cf2019352d2a6ff2138783', 1),
(200, 'user_openid97', 'lady97', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', '97', '753a52e736cf2019352d2a6ff2138783', 1),
(201, 'user_openid98', 'lady98', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', '98', '753a52e736cf2019352d2a6ff2138783', 1),
(202, 'user_openid99', 'lady99', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', '99', '753a52e736cf2019352d2a6ff2138783', 1),
(203, 'user_openid100', 'lady100', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '100', '100', '753a52e736cf2019352d2a6ff2138783', 1),
(204, 'user_openid101', 'lady101', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '101', '101', '753a52e736cf2019352d2a6ff2138783', 1),
(205, 'user_openid102', 'lady102', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '102', '102', '753a52e736cf2019352d2a6ff2138783', 1),
(206, 'user_openid103', 'lady103', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '103', '103', '753a52e736cf2019352d2a6ff2138783', 1),
(207, 'user_openid104', 'lady104', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '104', '104', '753a52e736cf2019352d2a6ff2138783', 1),
(208, 'user_openid105', 'lady105', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '105', '105', '753a52e736cf2019352d2a6ff2138783', 1),
(209, 'user_openid106', 'lady106', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '106', '106', '753a52e736cf2019352d2a6ff2138783', 1),
(210, 'user_openid107', 'lady107', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '107', '107', '753a52e736cf2019352d2a6ff2138783', 1),
(211, 'user_openid108', 'lady108', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '108', '108', '753a52e736cf2019352d2a6ff2138783', 1),
(212, 'user_openid109', 'lady109', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '109', '109', '753a52e736cf2019352d2a6ff2138783', 1),
(213, 'user_openid110', 'lady110', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '110', '110', '753a52e736cf2019352d2a6ff2138783', 1),
(214, 'user_openid111', 'lady111', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '111', '111', '753a52e736cf2019352d2a6ff2138783', 1),
(215, 'user_openid112', 'lady112', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '112', '112', '753a52e736cf2019352d2a6ff2138783', 1),
(216, 'user_openid113', 'lady113', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '113', '113', '753a52e736cf2019352d2a6ff2138783', 1),
(217, 'user_openid114', 'lady114', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '114', '114', '753a52e736cf2019352d2a6ff2138783', 1),
(218, 'user_openid115', 'lady115', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '115', '115', '753a52e736cf2019352d2a6ff2138783', 1),
(219, 'user_openid116', 'lady116', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '116', '116', '753a52e736cf2019352d2a6ff2138783', 1),
(220, 'user_openid117', 'lady117', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '117', '117', '753a52e736cf2019352d2a6ff2138783', 1),
(221, 'user_openid118', 'lady118', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '118', '118', '753a52e736cf2019352d2a6ff2138783', 1),
(222, 'user_openid119', 'lady119', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '119', '119', '753a52e736cf2019352d2a6ff2138783', 1),
(223, 'user_openid120', 'lady120', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '120', '120', '753a52e736cf2019352d2a6ff2138783', 1),
(224, 'user_openid121', 'lady121', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '121', '121', '753a52e736cf2019352d2a6ff2138783', 1),
(225, 'user_openid122', 'lady122', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '122', '122', '753a52e736cf2019352d2a6ff2138783', 1),
(226, 'user_openid123', 'lady123', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '123', '123', '753a52e736cf2019352d2a6ff2138783', 1),
(227, 'user_openid124', 'lady124', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '124', '124', '753a52e736cf2019352d2a6ff2138783', 1),
(228, 'user_openid125', 'lady125', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '125', '125', '753a52e736cf2019352d2a6ff2138783', 1),
(229, 'user_openid126', 'lady126', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '126', '126', '753a52e736cf2019352d2a6ff2138783', 1),
(230, 'user_openid127', 'lady127', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '127', '127', '753a52e736cf2019352d2a6ff2138783', 1),
(231, 'user_openid128', 'lady128', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '128', '128', '753a52e736cf2019352d2a6ff2138783', 1),
(232, 'user_openid129', 'lady129', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '129', '129', '753a52e736cf2019352d2a6ff2138783', 1),
(233, 'user_openid130', 'lady130', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '130', '130', '753a52e736cf2019352d2a6ff2138783', 1),
(234, 'user_openid101', 'lady101', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '101', '101', '753a52e736cf2019352d2a6ff2138783', 1),
(235, 'user_openid102', 'lady102', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '102', '102', '753a52e736cf2019352d2a6ff2138783', 1),
(236, 'user_openid103', 'lady103', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '103', '103', '753a52e736cf2019352d2a6ff2138783', 1),
(237, 'user_openid104', 'lady104', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '104', '104', '753a52e736cf2019352d2a6ff2138783', 1),
(238, 'user_openid105', 'lady105', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '105', '105', '753a52e736cf2019352d2a6ff2138783', 1),
(239, 'user_openid106', 'lady106', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '106', '106', '753a52e736cf2019352d2a6ff2138783', 1),
(240, 'user_openid107', 'lady107', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '107', '107', '753a52e736cf2019352d2a6ff2138783', 1),
(241, 'user_openid108', 'lady108', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '108', '108', '753a52e736cf2019352d2a6ff2138783', 1),
(242, 'user_openid109', 'lady109', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '109', '109', '753a52e736cf2019352d2a6ff2138783', 1),
(243, 'user_openid110', 'lady110', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '110', '110', '753a52e736cf2019352d2a6ff2138783', 1),
(244, 'user_openid111', 'lady111', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '111', '111', '753a52e736cf2019352d2a6ff2138783', 1),
(245, 'user_openid112', 'lady112', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '112', '112', '753a52e736cf2019352d2a6ff2138783', 1),
(246, 'user_openid113', 'lady113', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '113', '113', '753a52e736cf2019352d2a6ff2138783', 1),
(247, 'user_openid114', 'lady114', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '114', '114', '753a52e736cf2019352d2a6ff2138783', 1),
(248, 'user_openid115', 'lady115', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '115', '115', '753a52e736cf2019352d2a6ff2138783', 1),
(249, 'user_openid116', 'lady116', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '116', '116', '753a52e736cf2019352d2a6ff2138783', 1),
(250, 'user_openid117', 'lady117', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '117', '117', '753a52e736cf2019352d2a6ff2138783', 1),
(251, 'user_openid118', 'lady118', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '118', '118', '753a52e736cf2019352d2a6ff2138783', 1),
(252, 'user_openid119', 'lady119', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '119', '119', '753a52e736cf2019352d2a6ff2138783', 1),
(253, 'user_openid120', 'lady120', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '120', '120', '753a52e736cf2019352d2a6ff2138783', 1),
(254, 'user_openid121', 'lady121', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '121', '121', '753a52e736cf2019352d2a6ff2138783', 1),
(255, 'user_openid122', 'lady122', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '122', '122', '753a52e736cf2019352d2a6ff2138783', 1),
(256, 'user_openid123', 'lady123', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '123', '123', '753a52e736cf2019352d2a6ff2138783', 1),
(257, 'user_openid124', 'lady124', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '124', '124', '753a52e736cf2019352d2a6ff2138783', 1),
(258, 'user_openid125', 'lady125', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '125', '125', '753a52e736cf2019352d2a6ff2138783', 1),
(259, 'user_openid126', 'lady126', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '126', '126', '753a52e736cf2019352d2a6ff2138783', 1),
(260, 'user_openid127', 'lady127', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '127', '127', '753a52e736cf2019352d2a6ff2138783', 1),
(261, 'user_openid128', 'lady128', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '128', '128', '753a52e736cf2019352d2a6ff2138783', 1),
(262, 'user_openid129', 'lady129', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '129', '129', '753a52e736cf2019352d2a6ff2138783', 1),
(263, 'user_openid130', 'lady130', 2, '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '130', '130', '753a52e736cf2019352d2a6ff2138783', 1),
(264, 'oi0qPwkdbT7WPdXuvKjpR0x5_VIU', '开心一族', 0, NULL, '', '中国', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OP6v78OA2ka0X1iamuDJuPYZnY4IP60odbGdibZKp5xY9hbll9shzuupJO2mUurkeD27ibl5ibGjDHKjC1fIkT4BNFY/0', '[]', NULL, '753a52e736cf2019352d2a6ff2138783', 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_user_award`
--

CREATE TABLE IF NOT EXISTS `wx_user_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '活动唯一标识',
  `user_openid` varchar(255) NOT NULL COMMENT '用户唯一标识',
  `dsid` int(11) NOT NULL COMMENT '打赏项目的对应id',
  `money` decimal(10,2) NOT NULL COMMENT '打赏的金额单位元',
  `u_time` int(11) NOT NULL COMMENT '打赏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=21 ;

--
-- 转存表中的数据 `wx_user_award`
--

INSERT INTO `wx_user_award` (`id`, `huodong_openid`, `user_openid`, `dsid`, `money`, `u_time`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '1.00', 1464767623),
(2, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '1.00', 1464767667),
(3, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '1.00', 1464767671),
(4, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '0.00', 1464767786),
(5, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '1.00', 1464768162),
(6, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '1.00', 1464768219),
(7, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '0.00', 1464768233),
(8, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '0.01', 1464768347),
(9, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '0.01', 1464768348),
(10, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 3, '0.01', 1464768444),
(11, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '0.01', 1464770695),
(12, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '0.01', 1464770697),
(13, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '0.01', 1464770707),
(14, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '0.01', 1464770723),
(15, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '0.01', 1464770755),
(16, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '0.01', 1464770938),
(17, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '0.01', 1464771267),
(18, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 4, '0.01', 1464772721),
(19, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 5, '0.02', 1464772849),
(20, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 5, '0.01', 1464772913);

-- --------------------------------------------------------

--
-- 表的结构 `wx_user_dazhuanpan`
--

CREATE TABLE IF NOT EXISTS `wx_user_dazhuanpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `d_id` int(11) NOT NULL COMMENT '大转盘的id',
  `award` varchar(255) NOT NULL COMMENT '奖品名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为未兑现2为正在申请3为已兑现4为已取消',
  `c_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wx_user_dazhuanpan`
--

INSERT INTO `wx_user_dazhuanpan` (`id`, `huodong_openid`, `user_openid`, `d_id`, `award`, `status`, `c_time`) VALUES
(3, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '10元', 1, 1464596603),
(2, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '10元', 1, 1464596537);

-- --------------------------------------------------------

--
-- 表的结构 `wx_user_qianghongbao`
--

CREATE TABLE IF NOT EXISTS `wx_user_qianghongbao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `round_id` int(11) NOT NULL COMMENT '对应的qianghongbao_round的id',
  `money` decimal(10,2) NOT NULL COMMENT '随机的钱',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为未发钱2为已申请提现3为成功提现4为失败提现',
  `c_time` int(11) NOT NULL,
  `l_time` int(11) DEFAULT NULL COMMENT '提现的钱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=62 ;

--
-- 转存表中的数据 `wx_user_qianghongbao`
--

INSERT INTO `wx_user_qianghongbao` (`id`, `huodong_openid`, `user_openid`, `round_id`, `money`, `status`, `c_time`, `l_time`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 6, '1.00', 1, 1464536277, NULL),
(2, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 6, '9.00', 1, 1464536278, NULL),
(3, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 6, '10.00', 1, 1464536280, NULL),
(4, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 6, '1.00', 1, 1464536282, NULL),
(5, '753a52e736cf2019352d2a6ff2138783', 'user_openid1', 9, '5.00', 1, 1464536689, NULL),
(6, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 9, '3.00', 1, 1464536692, NULL),
(7, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 9, '8.00', 1, 1464536693, NULL),
(8, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 9, '1.00', 1, 1464536694, NULL),
(9, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 9, '8.00', 1, 1464536695, NULL),
(10, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 9, '1.00', 1, 1464536698, NULL),
(11, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 9, '2.00', 1, 1464536700, NULL),
(12, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 9, '2.00', 1, 1464536701, NULL),
(13, '753a52e736cf2019352d2a6ff2138783', 'user_openid2', 9, '4.00', 1, 1464536706, NULL),
(14, '753a52e736cf2019352d2a6ff2138783', 'user_openid1', 9, '2.00', 1, 1464536707, NULL),
(15, '753a52e736cf2019352d2a6ff2138783', 'user_openid1', 10, '5.00', 1, 1464539135, NULL),
(16, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '1.00', 1, 1464539143, NULL),
(17, '753a52e736cf2019352d2a6ff2138783', 'user_openid1', 10, '3.00', 1, 1464539144, NULL),
(18, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '2.00', 1, 1464539145, NULL),
(19, '753a52e736cf2019352d2a6ff2138783', 'user_openid3', 10, '8.00', 1, 1464539147, NULL),
(20, '753a52e736cf2019352d2a6ff2138783', 'user_openid2', 10, '6.00', 1, 1464539151, NULL),
(21, '753a52e736cf2019352d2a6ff2138783', 'user_openid1', 10, '10.00', 1, 1464539158, NULL),
(22, '753a52e736cf2019352d2a6ff2138783', 'user_openid2', 10, '3.00', 1, 1464539160, NULL),
(23, '753a52e736cf2019352d2a6ff2138783', 'user_openid4', 10, '2.00', 1, 1464539162, NULL),
(24, '753a52e736cf2019352d2a6ff2138783', 'user_openid5', 10, '1.00', 1, 1464539166, NULL),
(25, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '7.00', 1, 1464539169, NULL),
(26, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '6.00', 1, 1464539171, NULL),
(27, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '4.00', 1, 1464539172, NULL),
(28, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '10.00', 1, 1464539175, NULL),
(29, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '5.00', 1, 1464539177, NULL),
(30, '753a52e736cf2019352d2a6ff2138783', 'user_openid6', 10, '3.00', 1, 1464539179, NULL),
(31, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '7.00', 1, 1464539181, NULL),
(32, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '8.00', 1, 1464539182, NULL),
(33, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '2.00', 1, 1464539183, NULL),
(34, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '7.00', 1, 1464539184, NULL),
(35, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '5.00', 1, 1464539186, NULL),
(36, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '5.00', 1, 1464539190, NULL),
(37, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '4.00', 1, 1464539193, NULL),
(38, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '4.00', 1, 1464539195, NULL),
(39, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 10, '4.00', 1, 1464539196, NULL),
(40, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 11, '6.00', 1, 1464539313, NULL),
(41, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 11, '10.00', 1, 1464539314, NULL),
(42, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 11, '9.00', 1, 1464539315, NULL),
(43, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 11, '3.00', 1, 1464539317, NULL),
(44, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 11, '5.00', 1, 1464539319, NULL),
(45, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 11, '7.00', 1, 1464539321, NULL),
(46, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 12, '1.00', 1, 1464539405, NULL),
(47, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 12, '6.00', 1, 1464539406, NULL),
(48, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 12, '2.00', 1, 1464539409, NULL),
(49, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 13, '9.00', 1, 1464539424, NULL),
(50, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 13, '6.00', 1, 1464539425, NULL),
(51, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 13, '8.00', 1, 1464539427, NULL),
(52, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 13, '2.00', 1, 1464539428, NULL),
(53, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 13, '2.00', 1, 1464539429, NULL),
(54, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 14, '7.00', 1, 1464539545, NULL),
(55, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 14, '9.00', 1, 1464539548, NULL),
(56, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 14, '2.00', 1, 1464539549, NULL),
(57, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 14, '5.00', 1, 1464539550, NULL),
(58, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 15, '8.00', 1, 1464539566, NULL),
(59, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 15, '7.00', 1, 1464539567, NULL),
(60, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 15, '1.00', 1, 1464539569, NULL),
(61, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 15, '4.00', 1, 1464539570, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `wx_user_shake`
--

CREATE TABLE IF NOT EXISTS `wx_user_shake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `shake_id` int(11) NOT NULL COMMENT '摇一摇活动的id',
  `user_id` int(11) NOT NULL,
  `shake_count` int(11) NOT NULL COMMENT '摇动总次数',
  `ranking` int(11) NOT NULL COMMENT '排名',
  `c_time` int(11) NOT NULL COMMENT '参与时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `wx_user_shake`
--

INSERT INTO `wx_user_shake` (`id`, `huodong_openid`, `shake_id`, `user_id`, `shake_count`, `ranking`, `c_time`) VALUES
(1, '753', 27, 2, 16, 1, 1464510109),
(2, '753', 27, 2, 0, 1, 1464510109),
(3, '753', 28, 2, 12, 1, 1464511260),
(4, '753', 28, 264, 7, 2, 1464511273),
(5, '753', 29, 264, 6, 1, 1464511513),
(6, '753', 29, 2, 3, 2, 1464511504),
(7, '753', 30, 2, 14, 1, 1464511684),
(8, '753a52e736cf2019352d2a6ff2138783', 31, 2, 24, 1, 1464512562),
(9, '753a52e736cf2019352d2a6ff2138783', 32, 2, 16, 1, 1464512653);

-- --------------------------------------------------------

--
-- 表的结构 `wx_user_shake_blacklist`
--

CREATE TABLE IF NOT EXISTS `wx_user_shake_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `huodong_openid` varchar(255) NOT NULL,
  `shake_id` int(11) NOT NULL COMMENT '哪轮摇一摇被拉黑',
  `c_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1被拉黑，2取消拉黑',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `wx_user_vote`
--

CREATE TABLE IF NOT EXISTS `wx_user_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `tpid` int(11) NOT NULL COMMENT '投票项目的id',
  `c_time` int(11) NOT NULL COMMENT '投票时间s',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=28 ;

--
-- 转存表中的数据 `wx_user_vote`
--

INSERT INTO `wx_user_vote` (`id`, `huodong_openid`, `user_openid`, `tpid`, `c_time`) VALUES
(27, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 1464334255),
(26, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 3, 1464334252);

-- --------------------------------------------------------

--
-- 表的结构 `wx_vote`
--

CREATE TABLE IF NOT EXISTS `wx_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '投票项目标题',
  `imgurl` varchar(255) NOT NULL COMMENT '投票项目的封面图',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '该投票的票数',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wx_vote`
--

INSERT INTO `wx_vote` (`id`, `huodong_openid`, `title`, `imgurl`, `num`, `c_time`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', '个性签到墙', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 10, 1),
(2, '753a52e736cf2019352d2a6ff2138783', '打赏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 9, 2),
(3, '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', 4, 3);

-- --------------------------------------------------------

--
-- 表的结构 `wx_wish`
--

CREATE TABLE IF NOT EXISTS `wx_wish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `wish_id` int(11) DEFAULT NULL COMMENT '许愿设置的id',
  `text` varchar(255) NOT NULL COMMENT '文本',
  `utime` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1已上墙2未上墙',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=34 ;

--
-- 转存表中的数据 `wx_wish`
--

INSERT INTO `wx_wish` (`id`, `huodong_openid`, `user_openid`, `wish_id`, `text`, `utime`, `state`) VALUES
(1, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654004, 2),
(2, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654064, 2),
(3, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654340, 2),
(4, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654367, 2),
(5, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654405, 2),
(6, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654485, 2),
(7, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654530, 2),
(8, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654546, 2),
(9, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654612, 2),
(10, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654818, 2),
(11, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654820, 2),
(12, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463654970, 2),
(13, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463655209, 2),
(14, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463655272, 2),
(15, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463655848, 2),
(16, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463656669, 2),
(17, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463656765, 2),
(18, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463724332, 2),
(19, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao', 1463724453, 2),
(20, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'nihao222', 1463724728, 2),
(21, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'ceshishis', 1464601982, 2),
(22, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'haha', 1464602314, 1),
(23, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, 'heheh', 1464602332, 1),
(24, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '张学友', 1464602443, 1),
(25, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '非洲', 1464602513, 1),
(26, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '无线', 1464603539, 1),
(27, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '真的可以去', 1464603569, 1),
(28, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 1, '哈哈哈', 1464603575, 1),
(29, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '哈哈啊', 1464623112, 1),
(30, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 2, '？？', 1464623129, 1),
(31, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 3, '哈哈哈这个', 1464623370, 1),
(32, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 3, 'Test', 1464623378, 1),
(33, '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', 3, '速度的', 1464623393, 1);

-- --------------------------------------------------------

--
-- 表的结构 `wx_wish_config`
--

CREATE TABLE IF NOT EXISTS `wx_wish_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `wish_name` varchar(255) NOT NULL COMMENT '许愿的主题',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为关闭二为开启',
  `wish_check` int(11) DEFAULT '1' COMMENT '愿望树1为关闭审核自动上墙，2为开启审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `wx_wish_config`
--

INSERT INTO `wx_wish_config` (`id`, `huodong_openid`, `wish_name`, `status`, `wish_check`) VALUES
(3, '753a52e736cf2019352d2a6ff2138783', '快来许愿2', 2, 1);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
