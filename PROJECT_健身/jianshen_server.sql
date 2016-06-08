-- phpMyAdmin SQL Dump
-- version 4.0.10.10
-- http://www.phpmyadmin.net
--
-- 主机: 127.0.0.1
-- 生成日期: 2016-05-24 10:33:28
-- 服务器版本: 5.1.73
-- PHP 版本: 5.6.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- 数据库: `jianshen`
--

-- --------------------------------------------------------

--
-- 表的结构 `js_admin_user`
--

CREATE TABLE IF NOT EXISTS `js_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `last_login_time` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `js_admin_user`
--

INSERT INTO `js_admin_user` (`id`, `user`, `password`, `name`, `last_login_time`, `last_login_ip`, `num`, `role`) VALUES
(1, 'admin', 'e10adc3949ba59abbe56e057f20f883e', '管理员', '2016-05-24 10:25:10', '119.130.99.149', 43, '99'),
(3, '18589221964', 'e10adc3949ba59abbe56e057f20f883e', '覃志鹏', NULL, NULL, NULL, NULL),
(4, '13570721122', 'e10adc3949ba59abbe56e057f20f883e', '王冠', NULL, NULL, NULL, NULL),
(5, 'WingHo', '25d55ad283aa400af464c76d713c07ad', 'WingHo', NULL, NULL, NULL, NULL),
(6, 'Ares', '25d55ad283aa400af464c76d713c07ad', 'Ares', '2016-05-22 10:00:27', '58.63.82.222', 5, NULL),
(7, 'Emily', '1fb5d7da9191c7fb675d4bd0d4975fd4', 'Emily', NULL, NULL, NULL, NULL),
(8, 'Lena', '25d55ad283aa400af464c76d713c07ad', 'Lena', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `js_award`
--

CREATE TABLE IF NOT EXISTS `js_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `js_config`
--

CREATE TABLE IF NOT EXISTS `js_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

--
-- 转存表中的数据 `js_config`
--

INSERT INTO `js_config` (`id`, `name`, `data`) VALUES
(1, 'wx_app_id', 'wx6668a266b6ecdf30'),
(2, 'wx_app_sec', 'fsdafadfa'),
(3, 'wx_redirect_url', 'http://weixinweb.gzaojun.com/Home/Oauth/get_oauth');

-- --------------------------------------------------------

--
-- 表的结构 `js_coupon`
--

CREATE TABLE IF NOT EXISTS `js_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `text1` varchar(255) DEFAULT NULL,
  `text2` varchar(255) DEFAULT NULL,
  `text3` varchar(255) DEFAULT NULL,
  `money_limit` decimal(11,2) DEFAULT NULL COMMENT '使用门槛',
  `money` decimal(11,2) DEFAULT NULL COMMENT '面额',
  `status` tinyint(4) DEFAULT '1' COMMENT '1为未使用，2已使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `js_coupon`
--

INSERT INTO `js_coupon` (`id`, `user_id`, `text1`, `text2`, `text3`, `money_limit`, `money`, `status`) VALUES
(1, 1, '30减2', NULL, NULL, '30.00', NULL, 1);

-- --------------------------------------------------------

--
-- 表的结构 `js_feedback`
--

CREATE TABLE IF NOT EXISTS `js_feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `c_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `js_movement`
--

CREATE TABLE IF NOT EXISTS `js_movement` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '锻炼计划的名称',
  `img` varchar(255) NOT NULL COMMENT '图片url',
  `text` varchar(255) DEFAULT NULL COMMENT '计划的文本信息',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '计划类型：1为主训练2为辅助训练',
  `area` varchar(255) DEFAULT NULL COMMENT '锻炼对应的身体部分',
  `area_id` int(11) DEFAULT NULL COMMENT '区域的id',
  `total_shift` varchar(255) DEFAULT NULL COMMENT '总位移',
  `x_b_a` varchar(255) DEFAULT NULL COMMENT 'x轴开始角度',
  `y_b_a` varchar(255) DEFAULT NULL COMMENT 'y轴开始角度',
  `z_b_a` varchar(255) DEFAULT NULL COMMENT 'z的开始角度',
  `x_e_a` varchar(255) DEFAULT NULL COMMENT 'x轴的终止角度',
  `y_e_a` varchar(255) DEFAULT NULL COMMENT 'y轴的终止角度',
  `z_e_a` varchar(255) DEFAULT NULL,
  `check_shift` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否需要判断距离传感器 1为是2为否 ',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=43 ;

--
-- 转存表中的数据 `js_movement`
--

INSERT INTO `js_movement` (`id`, `name`, `img`, `text`, `type`, `area`, `area_id`, `total_shift`, `x_b_a`, `y_b_a`, `z_b_a`, `x_e_a`, `y_e_a`, `z_e_a`, `check_shift`) VALUES
(1, '坐姿卧推', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741aa6567939.gif!345', '坐姿卧推', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(2, '史密斯卧推 (平）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741aad9e3193.gif!345', '史密斯卧推 (平）', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(3, '史密斯卧推 (上）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ab43cc88e.gif!345', '史密斯卧推 (上）', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(4, '史密斯卧推 (下）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ab8c8a606.gif!345', '', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(5, '杠铃卧推 (平）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741abe8c9599.gif!345', '杠铃卧推 (平）', 1, '胸部', 9, '0.5', '', '', '', '', '', '', 2),
(6, '杠铃卧推 (上）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ac1883758.gif!345', '杠铃卧推 (上）', 1, '胸部', 9, '0.5', '', '', '', '', '', '', 2),
(7, '杠铃卧推 (下）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ac625531c.gif!345', '杠铃卧推 (下）', 1, '胸部', 9, '0.5', '', '', '', '', '', '', 2),
(8, '哑铃卧推(上）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741acab00ba2.gif!345', '哑铃卧推(上）', 1, '胸部', 9, '0.5', '', '', '', '', '', '', 2),
(9, '哑铃卧推 (平）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741acd10a1ac.gif!345', '哑铃卧推 (平）', 1, '胸部', 9, '0.5', '', '', '', '', '', '', 2),
(10, '哑铃卧推 (下）', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ad0f8c89d.gif!345', '哑铃卧推 (下）', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(11, '仰卧飞鸟', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ad38c3a39.gif!345', '仰卧飞鸟', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(12, '蝶机夹胸', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ad77d8d1d.gif!345', '蝶机夹胸', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(13, '仰卧起坐', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ad975118f.gif!345', '', 1, '腹肌', 3, '0.3', '', '', '0', '', '', '50', 2),
(14, '卷腹', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741ae08ea4c0.gif!345', '', 1, '腹肌', 3, '0.4', '', '', '0', '', '', '30', 2),
(15, '仰卧抬腿', '', '', 1, '腹肌', 3, '0.5', '', '', '0', '', '', '60', 2),
(16, '垂直举腿', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741aecda2eab.gif!345', '', 1, '腹肌', 3, '0.4', '', '', '60', '', '', '85', 2),
(17, '拉力器夹胸', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741adc60b1a1.gif!345', '拉力器夹胸', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(18, '胸肌臂屈伸', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741aefa17e1d.gif!345', '胸肌臂屈伸', 1, '胸部', 9, '0.4', '', '', '', '', '', '', 2),
(19, '悬垂提臀抬腿', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741af57d0eda.gif!345', '', 1, '腹肌', 3, '0.2', '', '', '', '', '', '', 2),
(20, '仰卧屈臂上拉', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741af2783ecd.gif!345', '仰卧屈臂上拉', 1, '胸部', 9, '0.3', '', '', '', '', '', '', 2),
(21, '俯卧撑', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741af53e928a.gif!345', '俯卧撑', 1, '胸部', 9, '0.3', '', '', '', '', '', '', 2),
(22, '仰卧直腿两头起', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741af986e362.gif!345', '', 1, '腹肌', 3, '0.2', '', '', '0', '', '', '45', 2),
(23, '引体向上', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741afcc52806.gif!345', '引体向上', 1, '背部', 1, '0.3', '', '', '', '', '', '', 2),
(24, '直立杠铃弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b0a733e06.gif!345', '', 1, '二头肌', 2, '0.6', '', '', '', '', '', '', 2),
(25, '交替哑铃弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b0fd3cd0d.gif!345', '', 1, '二头肌', 2, '0.6', '60', '95', '', '-60', '-70', '', 2),
(26, '坐姿颈后下拉', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b3efbd4fb.gif!345', '', 1, '背部', 1, '0.3', '', '', '', '', '', '', 2),
(27, '斜托杠铃弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b16ba3042.gif!345', '', 1, '二头肌', 2, '0.3', '', '', '', '', '', '', 2),
(28, '斜托哑铃弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b22fd46a2.gif!345', '', 1, '二头肌', 2, '0.4', '', '', '', '', '', '', 2),
(29, '俯卧上斜弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b1e8ed4aa.gif!345', '', 1, '二头肌', 2, '0.4', '', '', '', '', '', '', 2),
(30, '俯卧上斜弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b25c3e327.gif!345', '', 1, '二头肌', 2, '0.4', '', '', '', '', '', '', 2),
(31, '哑铃集中弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b27ba9aa1.gif!345', '', 1, '二头肌', 2, '0.4', '', '', '', '', '', '', 2),
(32, '反握引体向上', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b2c810184.gif!345', '', 1, '二头肌', 2, '0.3', '', '', '', '', '', '', 2),
(33, '拉力器弯举', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b2f9b7468.gif!345', '', 1, '二头肌', 2, '0.3', '', '', '', '', '', '', 2),
(34, '单臂哑铃划船', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b3f4bf2e8.gif!345', '', 1, '背部', 1, '0.3', '', '', '', '', '', '', 2),
(35, '杠铃俯身划船', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b443646f7.gif!345', '', 1, '背部', 1, '0.5', '', '', '', '', '', '', 2),
(36, 'T杠俯身划船', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b4757f029.gif!345', '', 1, '背部', 1, '0.3', '', '', '', '', '', '', 2),
(37, '坐姿划船', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b49c5ba42.gif!345', '', 1, '背部', 1, '0.4', '', '', '', '', '', '', 2),
(38, '负重耸肩', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b4c837297.gif!345', '', 1, '背部', 1, '0.05', '', '', '', '', '', '', 2),
(39, '背屈伸', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b5089b280.gif!345', '', 1, '背部', 1, '0.4', '', '', '', '', '', '', 2),
(40, '屈退硬拉', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b533c16e4.gif!345', '', 1, '背部', 1, '0.3', '', '', '', '', '', '', 2),
(41, '站姿直臂下拉', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/5741b568757ee.gif!345', '站姿直臂下拉', 1, '背部', 1, '0.4', '', '', '', '', '', '', 2);

-- --------------------------------------------------------

--
-- 表的结构 `js_movement_area`
--

CREATE TABLE IF NOT EXISTS `js_movement_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL COMMENT '区域的名称',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=10 ;

--
-- 转存表中的数据 `js_movement_area`
--

INSERT INTO `js_movement_area` (`id`, `name`) VALUES
(1, '背部'),
(2, '二头肌'),
(3, '腹肌'),
(4, '肩部'),
(5, '前臂'),
(6, '三头肌'),
(7, '腿部'),
(8, '小腿'),
(9, '胸部');

-- --------------------------------------------------------

--
-- 表的结构 `js_shop`
--

CREATE TABLE IF NOT EXISTS `js_shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '健身店名',
  `lng` varchar(255) NOT NULL COMMENT '健身点所在经度',
  `lat` varchar(255) NOT NULL COMMENT '纬度',
  `geohash` varchar(255) NOT NULL COMMENT 'geohash值',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `js_shop`
--

INSERT INTO `js_shop` (`id`, `name`, `lng`, `lat`, `geohash`) VALUES
(1, '海珠长堤', '113.2616191014', '23.114035258', 'ws0e3rf'),
(2, '白云测试', '113.2588222680', '23.2000256682', 'ws0ecr2');

-- --------------------------------------------------------

--
-- 表的结构 `js_smscode`
--

CREATE TABLE IF NOT EXISTS `js_smscode` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) NOT NULL,
  `smscode` varchar(255) DEFAULT NULL,
  `utime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=13 ;

--
-- 转存表中的数据 `js_smscode`
--

INSERT INTO `js_smscode` (`id`, `phone`, `smscode`, `utime`) VALUES
(1, '15521288256', '123456', 1463928737),
(2, '13802901101', '', 0),
(3, '15820244317', '', 0),
(4, '13112798087', '123456', 1463938726),
(5, '13570586010', '', 0),
(6, '15623456879', '', 0),
(7, '13535548625', '', 0),
(8, '15018863985', '', 0),
(9, '18122288778', '123456', 1463989648),
(10, '15902076981', '', 0),
(11, '13450203857', '', 0),
(12, '15632456589', '', 0);

-- --------------------------------------------------------

--
-- 表的结构 `js_user`
--

CREATE TABLE IF NOT EXISTS `js_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_phone` varchar(255) DEFAULT NULL COMMENT '用户手机，登录用',
  `user_password` varchar(255) DEFAULT NULL COMMENT '用户密码',
  `sec` varchar(255) DEFAULT NULL COMMENT '用户安全码',
  `wx_openid` varchar(255) DEFAULT NULL COMMENT '用户微信openid',
  `nickname` varchar(255) NOT NULL COMMENT '用户昵称，默认为手机号',
  `img` varchar(255) NOT NULL COMMENT '头像url，默认app的logo地址',
  `address` varchar(255) NOT NULL DEFAULT '广东广州' COMMENT '用户地址',
  `sex` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为男，，2为女',
  `height` varchar(255) DEFAULT NULL COMMENT '身高',
  `weight` varchar(255) DEFAULT NULL COMMENT '体重',
  `bf` varchar(255) DEFAULT NULL COMMENT '体脂率',
  `target` varchar(255) DEFAULT NULL COMMENT '健身目标：1增肌，2健身，3塑形，4其他',
  `physical` varchar(255) DEFAULT NULL COMMENT '身体状况：1关节炎2韧带拉伤3贫血4健康5低血糖6心脏病',
  `experience` tinyint(4) DEFAULT NULL COMMENT '1有健身经验2没有',
  `qrurl` varchar(255) DEFAULT NULL COMMENT '二维码url地址',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱地址',
  `signature` varchar(255) DEFAULT NULL COMMENT '个性签名',
  `location` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1不在健身房范围内2在范围内',
  `money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `integral` int(11) NOT NULL DEFAULT '0' COMMENT '用户积分',
  `push1` tinyint(4) NOT NULL DEFAULT '1' COMMENT '无力推送1开启2关闭',
  `push2` tinyint(4) NOT NULL DEFAULT '1' COMMENT '进入健身房推送',
  `push3` tinyint(4) NOT NULL DEFAULT '1' COMMENT '练完推送',
  `push4` tinyint(4) NOT NULL DEFAULT '1' COMMENT '计划推送',
  `last_login_time` int(11) DEFAULT NULL COMMENT '上次登录时间',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  `status` tinyint(255) NOT NULL DEFAULT '1' COMMENT '1为正常用户，2为非法用户',
  `using_card_id` int(255) DEFAULT NULL COMMENT '正在使用的会员卡',
  `expendtype` tinyint(4) DEFAULT NULL COMMENT '1，月卡先消耗，2,次卡先消耗',
  `plan_post` tinyint(4) NOT NULL DEFAULT '2' COMMENT '1没有发起请求，2存在发起请求',
  `check_login` int(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=325 ;

--
-- 转存表中的数据 `js_user`
--

INSERT INTO `js_user` (`id`, `user_phone`, `user_password`, `sec`, `wx_openid`, `nickname`, `img`, `address`, `sex`, `height`, `weight`, `bf`, `target`, `physical`, `experience`, `qrurl`, `email`, `signature`, `location`, `money`, `integral`, `push1`, `push2`, `push3`, `push4`, `last_login_time`, `c_time`, `status`, `using_card_id`, `expendtype`, `plan_post`, `check_login`) VALUES
(1, '18589221966', 'e10adc3949ba59abbe56e057f20f883e', '4dc9a17b6c9670c0', 'abcd', '鹏鹏', 'http://uc.douyutv.com/upload/avatar/026/69/04/34_avatar_middle.jpg?rltime', '广东广州', 1, '160', '50', '16 ~ 19%', '3', '4', NULL, 'http://uc.douyutv.com/upload/avatar/026/69/04/34_avatar_middle.jpg?rltime', 'qtanzhipeng', '哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈', 1, '0.00', 0, 1, 1, 1, 1, 1463833099, 1, 1, 7, 1, 1, 2),
(2, '12345678901', '6c44e5cd17f0019c64b042e4a745412a', '6000477ef23cd445', 'afas', '牛逼的家伙', 'http://bmegimgcdn.b0.upaiyun.com/phone/02980dde4e40967326fe98b152e563ef.jpg', '香港  九龙', 2, '160', '50', '13-15%', '健康', '塑形', NULL, 'http://uc.douyutv.com/upload/avatar/026/69/04/34_avatar_middle.jpg?rltime', '在啊N家', '你好啊。', 1, '0.00', 0, 1, 1, 2, 1, 1463661680, 0, 1, NULL, NULL, 1, 1),
(9, '13533883956', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13533883956', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '184', '70', '35 ~ 40%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463834109, 1463570384, 1, NULL, NULL, 2, 2),
(3, '13143374880', 'e10adc3949ba59abbe56e057f20f883e', '797addc8fb918d8b', NULL, '13143374880', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/ffb57c7d-3c7b-4e34-bb4d-9ebb985a6371.jpg', '广东广州', 1, '160', '50', '13-15%', '健康', '塑形', NULL, NULL, '你好', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464054725, 1463537597, 1, NULL, NULL, 1, 2),
(4, '12345678910', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '陌陌', 'http://bmegimgcdn.b0.upaiyun.com/phone/0b73f0032e2c42948dc1bde26cc9085f.jpg', '吉林  白山', 1, '159', '50', '5 ~ 7%', '3', '4', NULL, NULL, NULL, '默默', 1, '0.00', 0, 1, 1, 1, 1, 1463652896, 132456, 1, NULL, NULL, 1, 1),
(5, '13666666666', '670b14728ad9902aecba32e22fa4f6bd', '0105ba35f0a1896c', NULL, '13666666666', 'http://bmegimgcdn.b0.upaiyun.com/phone/352060fa3cd3440d9c1e6f3e9af2eb19.jpg', '广东广州', 1, '159', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464053910, 1463558819, 1, NULL, NULL, 1, 2),
(6, '13888888888', 'e10adc3949ba59abbe56e057f20f883e', '1d04994bcba6588c', NULL, '13888888888', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463558955, 1463558955, 1, NULL, NULL, 1, 1),
(7, '13777777777', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13777777777', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 2, '166', '48', '21 ~ 23%', '2', '2', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463653428, 1463559560, 1, NULL, NULL, 1, 1),
(8, '13555555555', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13555555555', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463559802, 1463559802, 1, NULL, NULL, 1, 1),
(13, '13434336497', 'e10adc3949ba59abbe56e057f20f883e', '97416cbc60962913', NULL, '13434336497', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839483, 1463639764, 1, NULL, NULL, 2, 2),
(10, '16523457895', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '16523457895', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463618120, 1463618120, 1, NULL, NULL, 1, 1),
(11, '13245627845', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13245627845', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '18-20%', '塑形', '低血糖', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463619724, 1463619724, 1, NULL, NULL, 1, 1),
(12, '13245236785', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13245236785', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '24-26%', '健康', '低血糖', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463620081, 1463620081, 1, NULL, NULL, 1, 1),
(14, '13000000000', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13000000000', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463639839, 1463639839, 1, NULL, NULL, 1, 1),
(219, '18802003003', 'a6af70b1a22a578bc295299fc5a681de', 'bf09a50629eb2cdd', NULL, '小', 'http://bmegimgcdn.b0.upaiyun.com/phone/d2a79ffdb3eb1d8a34d501de05ccb106.jpg', '广东广州', 2, '168', '59', '27 ~ 29%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843908, 1463728012, 1, NULL, NULL, 2, 2),
(15, '16888888888', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '16888888888', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463651220, 1463651220, 1, NULL, NULL, 1, 1),
(16, '13695804523', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13695804523', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '13-15%', '健康', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463661502, 1463661502, 1, NULL, NULL, 1, 1),
(17, '13809774594', 'e10adc3949ba59abbe56e057f20f883e', '58e799b2aaf6fc39', NULL, '13809774594', 'http://bmegimgcdn.b0.upaiyun.com/phone/a16de31a4e7c3c7ccd63e994d5449623.jpg', '广东广州', 1, '176', '68', '16 ~ 19%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841707, 1463708568, 1, NULL, NULL, 1, 2),
(18, '13760755085', '16da8ef58305e01ebf4ae2e5358e3688', 'cfb25f62f6dec8e4', NULL, 'Gap', 'http://bmegimgcdn.b0.upaiyun.com/phone/cb9010b488a10c0052a004bc99f8b12c.jpg', '广东广州', 1, '175', '65', '16 ~ 19%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463880535, 1463709059, 1, NULL, NULL, 2, 2),
(19, '18188803143', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18188803143', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463709139, 1, NULL, NULL, 1, 1),
(20, '18711182747', 'e10adc3949ba59abbe56e057f20f883e', '971dc8690566b8b2', NULL, '18711182747', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '15-17%', '其他', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 2, 2, 2, 2, 1463709272, 1463709272, 1, NULL, NULL, 1, 1),
(21, '13268133735', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13268133735', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463709351, 1, NULL, NULL, 1, 1),
(23, '15915762518', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15915762518', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463710332, 1, NULL, NULL, 1, 1),
(24, '13929555202', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13929555202', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463710350, 1, NULL, NULL, 2, 1),
(25, '15521288256', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15521288256', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463710405, 1, NULL, NULL, 2, 1),
(26, '13411160885', 'e10adc3949ba59abbe56e057f20f883e', '5aa145923f88722e', NULL, '13411160885', '', '广东广州', 1, '170', '85', '20-24%', '健身', '健康', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463894198, 1463710469, 1, NULL, NULL, 2, 2),
(27, '13632388994', 'dd6d4830fd0b33153b675761652ed5f3', 'd5656ee731714eb5', NULL, '13632388994', 'http://bmegimgcdn.b0.upaiyun.com/phone/2a85f459cb4a1fcdedac2ad81f1811df.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845092, 1463710516, 1, NULL, NULL, 2, 1),
(28, '13631301572', 'e10adc3949ba59abbe56e057f20f883e', '2b9b688435806a17', NULL, 'MIHO', 'http://bmegimgcdn.b0.upaiyun.com/phone/2c8465da7060546b624cc31ecb03b271.jpg', '广东广州', 2, '168', '53', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839871, 1463710561, 1, NULL, NULL, 2, 2),
(29, '13719151834', 'e10adc3949ba59abbe56e057f20f883e', '4b9c15d850b93865', NULL, '13719151834', '', '广东广州', 2, '163', '70', '36 ~ 40%', '4', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463893867, 1463710622, 1, NULL, NULL, 2, 2),
(30, '13802526371', 'ad7cea43a487d37062cc0fe39cbb76ee', '0ed762ac9fe8bc52', NULL, '13802526371', '', '广东广州', 2, '160', '47', '21 ~ 23%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463893419, 1463710673, 1, NULL, NULL, 2, 2),
(31, '18818888897', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18818888897', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463710740, 1, NULL, NULL, 2, 1),
(32, '18665559828', '95b722835cc2b2c059e5fab5121dfd31', '213d3a7b82f79163', NULL, '18665559828', 'http://bmegimgcdn.b0.upaiyun.com/phone/842db098cb2b47dbca398ecd2bb2b34b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463749573, 1463710822, 1, NULL, NULL, 2, 1),
(33, '13826283833', 'aab40d8fbbabcff83bb58f80fdf6fb8a', 'a2c7f964a9ed1a17', NULL, '13826283833', '', '广东广州', 1, '170', '70', '13 ~ 15%', '1', '2', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842478, 1463710861, 1, NULL, NULL, 2, 2),
(34, '15099953145', 'e10adc3949ba59abbe56e057f20f883e', '4ccac811c304d2fc', NULL, '15099953145', 'http://bmegimgcdn.b0.upaiyun.com/phone/5e82b1bd1a07e931836f277d855e08ba.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845449, 1463710895, 1, NULL, NULL, 2, 1),
(35, '18211472355', 'e10adc3949ba59abbe56e057f20f883e', 'a8bdc32a7ebb2a56', NULL, '18211472355', '', '广东广州', 1, '183', '65', '13 ~ 15%', '2', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463982531, 1463710932, 1, NULL, NULL, 2, 2),
(36, '15820288880', '6ad4ae668dcc43cb1f1b7163209a2b14', '4679668e7bdd0b78', NULL, '15820288880', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/118bb00f-c066-4ed1-9ce4-8b00f07ec176.jpg', '广东广州', 2, '164', '55', '27-29%', '塑形', '健康', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843631, 1463710985, 1, NULL, NULL, 2, 2),
(37, '13719160491', 'e10adc3949ba59abbe56e057f20f883e', '46eb45b249711d0b', NULL, '13719160491', 'http://bmegimgcdn.b0.upaiyun.com/phone/57871f32af0ef5bf72256f261c16b61f.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '接近神噶男人', 1, '0.00', 0, 1, 1, 1, 1, 1463751033, 1463711013, 1, NULL, NULL, 2, 1),
(38, '13602407700', '2fc3740cfe2bb024311009bb8697fa15', '8aeeb230b80f5e1b', NULL, 'RY', 'http://bmegimgcdn.b0.upaiyun.com/phone/71267e748fc4057532a157461aa04cad.jpg', '广东广州', 2, '161', '64', '27 ~ 29%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843640, 1463711078, 1, NULL, NULL, 2, 2),
(39, '13903055367', '2ad79ef6eed0a0e8e5e5f8eb93ced614', '34ad313bf82636d7', NULL, 'YokoLuk', 'http://bmegimgcdn.b0.upaiyun.com/phone/ae196d8271f228decca6ab421812fcb3.jpg', '广东广州', 2, '160', '56', '27 ~ 29%', '3', '1', NULL, NULL, 'yokoluk@163.com', '大頭大頭，下雨不愁', 1, '0.00', 0, 1, 1, 1, 1, 1463839810, 1463711121, 1, NULL, NULL, 2, 2),
(40, '13686937671', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13686937671', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463711208, 1463711175, 1, NULL, NULL, 2, 1),
(41, '13544343112', 'e10adc3949ba59abbe56e057f20f883e', 'd9a8ec2cdc24be85', NULL, '13544343112', 'http://bmegimgcdn.b0.upaiyun.com/phone/bcad166037560192b1cf4a01a5720ffa.jpg', '广东广州', 1, '175', '70', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463837607, 1463711450, 1, NULL, NULL, 2, 2),
(42, '18922199750', 'e10adc3949ba59abbe56e057f20f883e', '4ca7a87543c249d7', NULL, 'L²', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/d458c437-16a1-4ba7-af85-0c9bcea74203.jpg', '广东广州', 2, '158', '49', '25-30%', '塑形', '健康', NULL, NULL, '18922199750@189.cn', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463916414, 1463711700, 1, NULL, NULL, 2, 2),
(43, '18922199780', 'e10adc3949ba59abbe56e057f20f883e', '76f20d3deb4f81a0', NULL, '18922199780', 'http://bmegimgcdn.b0.upaiyun.com/phone/c23389d46d9c6b4687ae99c2dbe70f9a.jpg', '广东广州', 1, '177', '71', '16-19%', '健康', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463909367, 1463711808, 1, NULL, NULL, 2, 2),
(44, '15915762517', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15915762517', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463712804, 1, NULL, NULL, 2, 1),
(45, '18888888888', 'e10adc3949ba59abbe56e057f20f883e', '2586d8bd1059b569', NULL, '18888888888', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463713990, 1463713990, 1, NULL, NULL, 2, 1),
(46, '13999999999', 'e10adc3949ba59abbe56e057f20f883e', '7e4de8b779350418', NULL, '13999999999', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463714066, 1463714066, 1, NULL, NULL, 2, 1),
(47, '13966666666', 'e10adc3949ba59abbe56e057f20f883e', '8fa09fba05418079', NULL, '13966666666', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463714242, 1463714242, 1, NULL, NULL, 2, 1),
(48, '15914318119', '9c82b154f40ed75850b9524c7699a8f8', '740b1c83723dcd90', NULL, '15914318119', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/2754a266-2d28-4c51-919f-9df3a8fd39df.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463750324, 1463714458, 1, NULL, NULL, 2, 1),
(49, '15913143396', 'e10adc3949ba59abbe56e057f20f883e', 'd8769ba4dbe96b95', NULL, 'sherry', 'http://bmegimgcdn.b0.upaiyun.com/phone/e4a889611c6619e295b8607d45e316e7.jpg', '广东广州', 2, '163', '55', '18 ~ 20%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843522, 1463714497, 1, NULL, NULL, 2, 2),
(50, '15626436221', 'e10adc3949ba59abbe56e057f20f883e', '18f2e3ce7ae35e65', NULL, '毛毛', 'http://bmegimgcdn.b0.upaiyun.com/phone/383229d6a46536a205b74af5607dc06a.jpg', '广东广州', 2, '161', '80', '36 ~ 40%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843789, 1463714545, 1, NULL, NULL, 2, 2),
(51, '18666088370', 'e10adc3949ba59abbe56e057f20f883e', '1de1c8d23bc3f53d', NULL, '18666088370', 'http://bmegimgcdn.b0.upaiyun.com/phone/caee7b6081f276ddcc26678403036c83.jpg', '广东广州', 2, '158', '45', '24 ~ 26%', '3', '5', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842717, 1463714588, 1, NULL, NULL, 2, 2),
(52, '13503053695', '5b417dbd8b3e8350a3ee701921966823', '616a391167b31b6c', NULL, '13503053695', '', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463750893, 1463714629, 1, NULL, NULL, 2, 1),
(53, '13929599406', '2f3b33d1f7dcf648b93ac5d1d02c0714', '93798eaa5eb0752b', NULL, 'xixi_Hong', 'http://bmegimgcdn.b0.upaiyun.com/phone/de387c6468c52481f30eb73abfbe396d.jpg', '广东广州', 1, '165', '54', '13 ~ 15%', '4', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840255, 1463714663, 1, NULL, NULL, 2, 2),
(54, '15521073951', 'e10adc3949ba59abbe56e057f20f883e', '194da88003373a66', NULL, '15521073951', 'http://bmegimgcdn.b0.upaiyun.com/phone/1671d7657a54e12794df878f5c9638d0.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463742861, 1463714718, 1, NULL, NULL, 2, 1),
(55, '13825571999', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13825571999', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463714749, 1, NULL, NULL, 2, 1),
(56, '18022324861', 'cf4de04262ddbb8436d4ae5da3271143', '37231d09bb3c3b66', NULL, '麦再思', 'http://bmegimgcdn.b0.upaiyun.com/phone/da51a1b7b7120a4810aac54e609110b9.jpg', '广东广州', 1, '175', '90', '25 ~ 30%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463882707, 1463714794, 1, NULL, NULL, 2, 2),
(57, '13763349037', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13763349037', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463714827, 1, NULL, NULL, 2, 1),
(58, '13926253920', 'ae316ffae36b237c113c739cd77d2e23', 'c11e67d3548d1fe9', NULL, '13926253920', '', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463752811, 1463714862, 1, NULL, NULL, 2, 1),
(59, '18502024219', 'e10adc3949ba59abbe56e057f20f883e', '55d70c7d896db5a4', NULL, '秋大發', 'http://bmegimgcdn.b0.upaiyun.com/phone/05bcb1befe71379183a7218b4a34c4a4.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463745491, 1463714901, 1, NULL, NULL, 2, 1),
(60, '15017532535', 'e10adc3949ba59abbe56e057f20f883e', '6beb838c2cb28d79', NULL, '15017532535', 'http://bmegimgcdn.b0.upaiyun.com/phone/0c7488213508f3d0cd5824ed1afe24a0.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463912105, 1463714936, 1, NULL, NULL, 2, 1),
(61, '13750094894', 'e10adc3949ba59abbe56e057f20f883e', '849946988b075c92', NULL, 'Y', 'http://bmegimgcdn.b0.upaiyun.com/phone/8afe9e3b7fd471a3c8e2ced3d7d8e30b.jpg', '广东广州', 1, '178', '77', '16 ~ 19%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464001244, 1463714960, 1, NULL, NULL, 2, 2),
(62, '13533836872', 'e807f1fcf82d132f9bb018ca6738a19f', '23e979add0fb4e03', NULL, 'yang', '', '广东广州', 1, '172', '90', '35 ~ 40%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842751, 1463714992, 1, NULL, NULL, 2, 2),
(63, '13416368544', 'e10adc3949ba59abbe56e057f20f883e', 'fc169519af194111', NULL, '占爷', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/838428bb-10fd-4ebc-b03b-fd09b0385dd4.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'angelchim@163.com', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842507, 1463715077, 1, NULL, NULL, 2, 1),
(64, '13802767731', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13802767731', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715103, 1, NULL, NULL, 2, 1),
(65, '13802792303', '8af0631dba1e47c54a0fc5c6bc6ccfe0', '395d7fddcb00898a', NULL, '13802792303', 'http://bmegimgcdn.b0.upaiyun.com/phone/6d7bfdfb1736ec2a2aa27a27468a0fff.jpg', '广东广州', 2, '173', '57', '24 ~ 26%', '4', '3', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463850347, 1463715213, 1, NULL, NULL, 2, 2),
(66, '13450218864', 'e10adc3949ba59abbe56e057f20f883e', '5db735c906d7a5f9', NULL, '13450218864', 'http://bmegimgcdn.b0.upaiyun.com/phone/a3b616507e036460d80c5670b8c568ac.jpg', '广东广州', 2, '160', '51', '10 ~ 12%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840953, 1463715313, 1, NULL, NULL, 2, 2),
(67, '18520106634', 'cdf3ff9f00be58a137148979147cc105', 'b625a28cad935dd0', NULL, '新貴無雙', 'http://bmegimgcdn.b0.upaiyun.com/phone/ad2e2028633b868e3f1eb0988287c3d5.jpg', '广东广州', 1, '184', '75', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463893972, 1463715340, 1, NULL, NULL, 2, 2),
(68, '13522222222', 'e10adc3949ba59abbe56e057f20f883e', 'e4b44432ac2e0116', NULL, '13522222222', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463715377, 1463715377, 1, NULL, NULL, 2, 1),
(69, '13570586010', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13570586010', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715387, 1, NULL, NULL, 2, 1),
(70, '13922170173', 'e10adc3949ba59abbe56e057f20f883e', '18805c2897e33c06', NULL, '13922170173', 'http://bmegimgcdn.b0.upaiyun.com/phone/bf2caf502191d5ec113a491aee6c0761.jpg', '广东广州', 1, '176', '70', '16 ~ 19%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463847057, 1463715408, 1, NULL, NULL, 2, 2),
(71, '13900000000', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13900000000', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463716374, 1463715500, 1, NULL, NULL, 2, 1),
(72, '13763389048', '5461dbf39a2d2dd0bc75404f67473656', '373c586fdf529918', NULL, '13763389048', '', '广东广州', 2, '160', '45', '21 ~ 23%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842288, 1463715521, 1, NULL, NULL, 2, 2),
(73, '13242890530', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13242890530', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715563, 1, NULL, NULL, 2, 1),
(74, '13068890488', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13068890488', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715609, 1, NULL, NULL, 2, 1),
(75, '18676577133', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18676577133', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715680, 1, NULL, NULL, 2, 1),
(76, '13933333333', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13933333333', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463716229, 1463715688, 1, NULL, NULL, 2, 1),
(77, '13265104633', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13265104633', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715710, 1, NULL, NULL, 2, 1),
(78, '15920147492', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15920147492', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715739, 1, NULL, NULL, 2, 1),
(79, '15920371642', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15920371642', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463715781, 1, NULL, NULL, 2, 1),
(80, '18665684155', 'e10adc3949ba59abbe56e057f20f883e', 'aa2f54fa5b4c603f', NULL, 'PBMMK', 'http://bmegimgcdn.b0.upaiyun.com/phone/96538195505719848538e507169a8b5a.jpg', '广东广州', 2, '160', '51', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845503, 1463715831, 1, NULL, NULL, 2, 2),
(81, '15622357825', 'c8877e79ef7f2e41e743a81d012c351f', 'd8af720b1fdcf940', NULL, 'Wang元元', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/75924f26-bf7b-4fdd-bd3c-918a35d9c67e.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463825369, 1463715877, 1, NULL, NULL, 2, 1),
(82, '18588872787', '4226fb0c9f07bfc267bceb4411b7fa03', 'cd58c7db62e30e6a', NULL, 'RaniSin', '', '广东广州', 2, '160', '47', '21 ~ 23%', '3', '3', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464001601, 1463715901, 1, NULL, NULL, 2, 2),
(83, '18666097640', 'ac493a582721f9acf2b8f4202e2442f8', '28bf1284aa38d502', NULL, '18666097640', '', '广东广州', 1, '192', '94', '13 ~ 15%', '2', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463846507, 1463715930, 1, NULL, NULL, 2, 2),
(84, '13724883103', '65a131a577b94a6e615251f911eb4b8a', '4ebfb45b635d34b2', NULL, 'lllli', 'http://bmegimgcdn.b0.upaiyun.com/phone/0d505d2a0ac96bdbcec48c830ed53c4d.jpg', '广东广州', 2, '168', '56', '21 ~ 23%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842266, 1463715964, 1, NULL, NULL, 2, 2),
(85, '13944444444', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13944444444', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463715983, 1463715983, 1, NULL, NULL, 2, 1),
(86, '18613155240', '46d6d4a8b334f7812c3ac85cb8c021e8', 'ca569b319e96a8da', NULL, 'Macy', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/5ce1cde3-68c8-49b3-a9ec-51fd1359b82c.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842779, 1463715994, 1, NULL, NULL, 2, 1),
(87, '13955555555', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13955555555', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463716082, 1463716082, 1, NULL, NULL, 2, 1),
(88, '15913156374', 'ab9a471790021e9c6c848aeac7d3ef96', 'd62576c9946f86fd', NULL, '15913156374', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/d023df8c-c668-4d10-b757-a525f49fa968.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463869387, 1463716095, 1, NULL, NULL, 2, 1),
(89, '18820774294', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18820774294', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716125, 1, NULL, NULL, 2, 1),
(90, '18688391111', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18688391111', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716154, 1, NULL, NULL, 2, 1),
(91, '18816799061', 'e10adc3949ba59abbe56e057f20f883e', 'f729200369a4d475', NULL, '18816799061', 'http://bmegimgcdn.b0.upaiyun.com/phone/f2359be322418d1f8764c478e7985ff2.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463747739, 1463716191, 1, NULL, NULL, 2, 1),
(92, '13332806765', 'ebf5da52f667eb08612dfba77a88f7e6', '83ec5087b24b0c10', NULL, 'Marc', 'http://bmegimgcdn.b0.upaiyun.com/phone/4e004a097f0e01ee5d384cde3ac29312.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464011307, 1463716265, 1, NULL, NULL, 2, 1),
(93, '13977777777', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13977777777', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463716271, 1463716271, 1, NULL, NULL, 2, 1),
(94, '18818847400', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18818847400', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716291, 1, NULL, NULL, 2, 1),
(95, '13650920823', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13650920823', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716339, 1, NULL, NULL, 2, 1),
(96, '13560344991', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13560344991', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716368, 1, NULL, NULL, 2, 1),
(97, '13927897418', '04907fa843392cd62968cfd8385ee82d', '2cb4aa41174ee58d', NULL, '漫漫iris', 'http://bmegimgcdn.b0.upaiyun.com/phone/7ed6ccf5adee28ee4bb93b392827c8e0.jpg', '广东广州', 2, '158', '44', '10 ~ 12%', '3', '3', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463850749, 1463716399, 1, NULL, NULL, 2, 2),
(98, '13700000000', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13700000000', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463716408, 1463716408, 1, NULL, NULL, 2, 1),
(99, '18718882688', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18718882688', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716427, 1, NULL, NULL, 2, 1),
(100, '15920430657', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15920430657', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716462, 1, NULL, NULL, 2, 1),
(101, '13928869441', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13928869441', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716491, 1, NULL, NULL, 2, 1),
(102, '13229990985', '04a3b7f063720b77903e585f6edd4145', 'a72cfcd2139c1524', NULL, 'Simyui Lee', 'http://bmegimgcdn.b0.upaiyun.com/phone/f75002c2557d1ee3d4a653bca71711c3.jpg', '广东广州', 2, '163', '51', '27 ~ 29%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463850273, 1463716519, 1, NULL, NULL, 2, 2),
(103, '15622132035', '590907251904d51090a65dc26d46594b', '01147b01ea957aaf', NULL, '15622132035', '', '广东广州', 1, '183', '70', '16 ~ 19%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463996032, 1463716550, 1, NULL, NULL, 1, 2),
(104, '18925080117', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18925080117', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716572, 1, NULL, NULL, 2, 1),
(105, '13560431510', 'ab55143a4b2210b38320e9089071b8ce', '1dfe98f7d40ec9a1', NULL, '13560431510', '', '广东广州', 2, '156', '50', '30 ~ 35%', '3', '6', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463846702, 1463716612, 1, NULL, NULL, 2, 2),
(106, '18588610889', 'e10adc3949ba59abbe56e057f20f883e', '30bc5d3505af722f', NULL, '18588610889', 'http://bmegimgcdn.b0.upaiyun.com/phone/2c628d89898984a7f05d8325adbd9bd4.jpg', '广东广州', 2, '160', '50', '10 ~ 12%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843020, 1463716636, 1, NULL, NULL, 2, 2),
(107, '13265555510', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13265555510', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716664, 1, NULL, NULL, 2, 1),
(108, '1380977459413610280720', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13610280720', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716692, 1, NULL, NULL, 2, 1),
(109, '13926800084', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13926800084', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716719, 1, NULL, NULL, 2, 1),
(110, '15902037458', 'b4fb6a75c069a0bbf0f86a284f497db5', 'bbf145cd0c8afd18', NULL, '15902037458', '', '广东广州', 2, '164', '58', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463884887, 1463716747, 1, NULL, NULL, 2, 2),
(111, '13599999999', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13599999999', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463716762, 1463716762, 1, NULL, NULL, 2, 1),
(112, '18666025340', 'ca34f669ae367c87f0e75dcae0f61ee5', 'b97b4c719f693831', NULL, '白赖仁', 'http://bmegimgcdn.b0.upaiyun.com/phone/c61ca257f9a495675788825f04f92523.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463744233, 1463716771, 1, NULL, NULL, 2, 1),
(264, '18569511633', 'e10adc3949ba59abbe56e057f20f883e', 'c116d7eff80a71ac', NULL, '18569511633', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463734761, 1463734761, 1, NULL, NULL, 2, 1),
(113, '13560160023', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13560160023', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463716865, 1, NULL, NULL, 2, 1),
(114, '13112798087', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13112798087', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463722611, 1, NULL, NULL, 2, 1),
(115, '15622505563', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15622505563', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463722645, 1, NULL, NULL, 2, 1),
(116, '13631311369', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13631311369', '', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463891082, 1463722676, 1, NULL, NULL, 2, 1),
(117, '15521057301', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15521057301', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463722703, 1, NULL, NULL, 2, 1),
(118, 'admin13802901101', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13802901101', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463722756, 1, NULL, NULL, 2, 1),
(119, '13570959518', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13570959518', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463722782, 1, NULL, NULL, 2, 1),
(120, '15521096906', '0cf21ce35322d2e56d745e319b933470', '9897e68512bc9a37', NULL, 'eva', 'http://bmegimgcdn.b0.upaiyun.com/phone/f0b27192558fbf1bb23155983e294b00.jpg', '广东广州', 2, '157', '45', '18 ~ 20%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841702, 1463722811, 1, NULL, NULL, 2, 2),
(121, '13632383728', '6a77fd2271610a0f5d1e9e7802fd3dfd', 'fef2a5bdf2b7eea4', NULL, '13632383728', 'http://bmegimgcdn.b0.upaiyun.com/phone/ada04abeeaf2f01945edbae71abd5780.jpg', '广东广州', 2, '163', '62', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463846041, 1463722982, 1, NULL, NULL, 2, 2),
(122, '13631305214', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13631305214', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723007, 1, NULL, NULL, 2, 1),
(123, '15915787780', 'e10adc3949ba59abbe56e057f20f883e', '5e61341112bb4906', NULL, '15915787780', 'http://bmegimgcdn.b0.upaiyun.com/phone/eccd2a908863fa84140908924fc20935.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463912653, 1463723111, 1, NULL, NULL, 2, 1),
(124, '15915705445', 'd3786ec2413a8cd9413bfcb24be95a73', 'e0bc420c958acf52', NULL, '15915705445', 'http://bmegimgcdn.b0.upaiyun.com/phone/d5f33b29833cc7c5aee454b70bbe6185.jpg', '广东广州', 1, '164', '60', '20 ~ 24%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840629, 1463723222, 1, NULL, NULL, 2, 2),
(125, '18026331271', 'e10adc3949ba59abbe56e057f20f883e', 'd180f943c23a3afa', NULL, '18026331271', 'http://bmegimgcdn.b0.upaiyun.com/phone/019e43fd82cf6d65af4722daa25fb63b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463742433, 1463723248, 1, NULL, NULL, 2, 1),
(126, '18588888042', '328f4e8fa7eef9c1d66f8476b916e77e', '9fb00f9920d4703c', NULL, 'kimi', 'http://bmegimgcdn.b0.upaiyun.com/phone/5d13bcaef689c31b2c9593b457fe7b5c.jpg', '广东广州', 1, '185', '90', '35 ~ 40%', '4', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463856878, 1463723275, 1, NULL, NULL, 2, 2),
(127, '15918899663', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15918899663', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723308, 1, NULL, NULL, 2, 1),
(128, '15915937688', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15915937688', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723337, 1, NULL, NULL, 2, 1),
(129, '18666016883', '85a7f622d022bac15b36689f735b13cb', '361948f6b3bf4c01', NULL, '18666016883', '', '广东广州', 1, '185', '96', '20 ~ 24%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463886791, 1463723370, 1, NULL, NULL, 2, 2),
(130, '1376013316139838', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13316139838', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723397, 1, NULL, NULL, 2, 1),
(131, '13922262625', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13922262625', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723421, 1, NULL, NULL, 2, 1),
(132, 'admin13750026867', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13750026867', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723451, 1, NULL, NULL, 2, 1),
(133, '13922751977', '642a567c24257969ebe54b50facd7d9e', 'a3018959f0035b41', NULL, 'Joe', 'http://bmegimgcdn.b0.upaiyun.com/phone/e6ecb964bb09db4008d0aa24a05139a5.jpg', '广东广州', 1, '185', '75', '16 ~ 19%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841216, 1463723478, 1, NULL, NULL, 2, 2),
(134, '18664783957', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18664783957', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723512, 1, NULL, NULL, 2, 1),
(135, '13826031862', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13826031862', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723537, 1, NULL, NULL, 2, 1),
(136, '15521024911', '258e5402bc26c4d78c55d7cf04d89d77', 'd654a59ef1e03e4e', NULL, '15521024911', '', '广东广州', 2, '157', '47', '13 ~ 15%', '3', '4', NULL, NULL, '476077137@qq.com', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840193, 1463723571, 1, NULL, NULL, 2, 2),
(137, '13560076163', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13560076163', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723599, 1, NULL, NULL, 2, 1),
(138, '15820698557', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15820698557', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723629, 1, NULL, NULL, 2, 1),
(139, '15011786624', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15011786624', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723654, 1, NULL, NULL, 2, 1),
(140, '15913145610', 'e10adc3949ba59abbe56e057f20f883e', 'df6a2137e515ca8f', NULL, '15913145610', 'http://bmegimgcdn.b0.upaiyun.com/phone/7283782e77aabad788e3e230aa42dd84.jpg', '广东广州', 2, '167', '59', '24 ~ 26%', '1', '3', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839687, 1463723682, 1, NULL, NULL, 2, 2),
(141, '18680228020', 'e10adc3949ba59abbe56e057f20f883e', 'f58bbd6863617eed', NULL, '18680228020', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/7aa79ae9-1277-4aed-92a7-a3bc506c6f0a.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464052836, 1463723708, 1, NULL, NULL, 2, 1),
(142, 'admin13249622220', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13249622220', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723757, 1, NULL, NULL, 2, 1),
(143, '13826285205', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13826285205', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723789, 1, NULL, NULL, 2, 1),
(144, '13560128443', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13560128443', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723826, 1, NULL, NULL, 2, 1),
(145, '18998818243', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18998818243', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463723993, 1, NULL, NULL, 2, 1),
(147, '13570233908', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13570233908', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724052, 1, NULL, NULL, 2, 1),
(148, '13202007820', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13202007820', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724090, 1, NULL, NULL, 2, 1),
(149, '18027302260', 'e10adc3949ba59abbe56e057f20f883e', 'da023c0824e30f14', NULL, '18027302260', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845383, 1463724124, 1, NULL, NULL, 2, 1),
(150, '18926210003', '6cda13209764b6494fece0bd58613756', '7e0ee74af5056194', NULL, '18926210003', 'http://bmegimgcdn.b0.upaiyun.com/phone/e4d88237fe956d5f09ddbf1220c66906.jpg', '广东广州', 1, '165', '68', '1 ~ 4%', '3', '4', NULL, NULL, '825518902@qq.com', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464007305, 1463724153, 1, NULL, NULL, 2, 2),
(151, '13631488648', 'e10adc3949ba59abbe56e057f20f883e', '39b0d3631ebcb23c', NULL, '13631488648', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/e114b74a-408f-43d9-a861-e70585079d81.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463911521, 1463724188, 1, NULL, NULL, 2, 1),
(152, '13570231210', 'e10adc3949ba59abbe56e057f20f883e', '2e4e3446d7e63bfd', NULL, '13570231210', '', '广东广州', 2, '156', '51', '27 ~ 29%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463981004, 1463724213, 1, NULL, NULL, 2, 2),
(153, '13828432924', 'e10adc3949ba59abbe56e057f20f883e', '1ffd761ba656554d', NULL, '13828432924', 'http://bmegimgcdn.b0.upaiyun.com/phone/ef64597d2b97520bb3cabc5673274117.jpg', '广东广州', 1, '174', '52', '16 ~ 19%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463911131, 1463724236, 1, NULL, NULL, 2, 2),
(154, 'admin15920145226', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15920145226', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724286, 1, NULL, NULL, 2, 1),
(155, '13022008959', '934b967fc4537f00475b28bb4e5a1f8b', '4ce6fc5b76100d71', NULL, '13022008959', '', '广东广州', 2, '161', '49', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841398, 1463724318, 1, NULL, NULL, 2, 2),
(156, '18826284198', 'e10adc3949ba59abbe56e057f20f883e', '5f3f59d874a2f321', NULL, '18826284198', 'http://bmegimgcdn.b0.upaiyun.com/phone/a8b856fd730c9587d8778bf70ff73bd2.jpg', '广东广州', 1, '180', '63', '1 ~ 4%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463891695, 1463724365, 1, NULL, NULL, 2, 2),
(157, '13808863972', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13808863972', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724392, 1, NULL, NULL, 2, 1),
(158, '13533286214', 'aac95964fc847a13f358823d0b5b93fb', 'e5265622e0f7e46c', NULL, 'lailai来了', 'http://bmegimgcdn.b0.upaiyun.com/phone/b83edd52c0ba4d415cd79a935b15f0a9.jpg', '广东广州', 2, '166', '52', '21 ~ 23%', '3', '3', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463998191, 1463724428, 1, NULL, NULL, 2, 2),
(159, '18688865421', '49558beeef99254c68e68c5aec477dd2', '390a61688e7b560f', NULL, '18688865421', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463825161, 1463724459, 1, NULL, NULL, 2, 1),
(160, '13751784346', 'e10adc3949ba59abbe56e057f20f883e', '84d0e31b76684e1b', NULL, '13751784346', 'http://bmegimgcdn.b0.upaiyun.com/phone/fbb53382b0e17ea5cb2f724d5fd4cecf.jpg', '广东广州', 2, '170', '55', '10 ~ 12%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840082, 1463724522, 1, NULL, NULL, 2, 2),
(161, '18666010777', 'e10adc3949ba59abbe56e057f20f883e', '409627343661a30a', NULL, 'Jacob Leung ', 'http://bmegimgcdn.b0.upaiyun.com/phone/521c6baf0507892f04236782ffde728b.jpg', '广东广州', 1, '173', '60', '25 ~ 30%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839914, 1463724550, 1, NULL, NULL, 2, 2),
(162, '18620889437', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18620889437', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724574, 1, NULL, NULL, 2, 1),
(163, '13725189070', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13725189070', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724603, 1, NULL, NULL, 2, 1),
(164, '18824186483', 'e10adc3949ba59abbe56e057f20f883e', '2c51efa33d111d96', NULL, '18824186483', 'http://bmegimgcdn.b0.upaiyun.com/phone/5dcacb7cb575962023abe142cef1dbc6.jpg', '广东广州', 2, '160', '50', '18 ~ 20%', '3', '4', NULL, NULL, NULL, 'gym now', 1, '0.00', 0, 1, 1, 1, 1, 1463870443, 1463724635, 1, NULL, NULL, 2, 2),
(165, '18825118065', '47f5afb94576c8579bae4c7ab27dcd75', '523b9381a538a268', NULL, 'Rimi-Z ', 'http://bmegimgcdn.b0.upaiyun.com/phone/fbbfe5448db4aba4e62a056f471cbdd0.jpg', '广东广州', 2, '158', '48', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841881, 1463724661, 1, NULL, NULL, 2, 2),
(166, '13763383440', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13763383440', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724692, 1, NULL, NULL, 2, 1),
(167, '13660193373', 'e10adc3949ba59abbe56e057f20f883e', '87363a0e1088aa9d', NULL, '13660193373', '', '广东广州', 2, '168', '52', '21 ~ 23%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839996, 1463724718, 1, NULL, NULL, 2, 2),
(169, '13642667864', 'e39425c5052ca234a9f5da4b6a9dceb7', '347deb3f1d3edff0', NULL, 'HEY!JACK', 'http://bmegimgcdn.b0.upaiyun.com/phone/29ae916fd2a2b4c55afec819604732f3.jpg', '广东广州', 1, '173', '53', '16 ~ 19%', '1', '4', NULL, NULL, NULL, 'be stronger', 1, '0.00', 0, 1, 1, 1, 1, 1463839988, 1463724795, 1, NULL, NULL, 2, 2),
(170, '18613111831', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18613111831', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724914, 1, NULL, NULL, 2, 1),
(171, '15820260527', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15820260527', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463724967, 1, NULL, NULL, 2, 1),
(172, '18818905200', 'e10adc3949ba59abbe56e057f20f883e', 'bac71fb7570fd82d', NULL, '18818905200', 'http://bmegimgcdn.b0.upaiyun.com/phone/7b8774e900f335ad8d2a9a95cd47b892.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463744165, 1463725049, 1, NULL, NULL, 2, 1),
(173, '13928858871', '21218cca77804d2ba1922c33e0151105', 'c9d0b6aa2ed1ce1c', NULL, '13928858871', 'http://bmegimgcdn.b0.upaiyun.com/phone/fec2ef039d47c07127f9807b9bebafca.jpg', '广东广州', 1, '183', '83', '20 ~ 24%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463851803, 1463725074, 1, NULL, NULL, 2, 2),
(174, '13925070306', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13925070306', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463725095, 1, NULL, NULL, 2, 1),
(175, '13719178236', '6b2244ecf5881e4aa6d4235d16be7b48', 'de2a6fa85bcf6c42', NULL, '13719178236', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/9be2089e-2a59-4966-bec0-b1f8adcd525e.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'keep my dreams', 1, '0.00', 0, 1, 1, 1, 1, 1463746561, 1463725219, 1, NULL, NULL, 2, 1),
(176, '13510345421', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13510345421', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463725244, 1, NULL, NULL, 2, 1),
(177, '13798101036', 'e10adc3949ba59abbe56e057f20f883e', 'c795fba11135f9f6', NULL, '13798101036', '', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463752402, 1463725290, 1, NULL, NULL, 2, 1),
(178, '15989240898', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15989240898', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463725327, 1, NULL, NULL, 2, 1);
INSERT INTO `js_user` (`id`, `user_phone`, `user_password`, `sec`, `wx_openid`, `nickname`, `img`, `address`, `sex`, `height`, `weight`, `bf`, `target`, `physical`, `experience`, `qrurl`, `email`, `signature`, `location`, `money`, `integral`, `push1`, `push2`, `push3`, `push4`, `last_login_time`, `c_time`, `status`, `using_card_id`, `expendtype`, `plan_post`, `check_login`) VALUES
(179, '18988840243', 'e10adc3949ba59abbe56e057f20f883e', 'fc52b43a37194230', NULL, '18988840243', 'http://bmegimgcdn.b0.upaiyun.com/phone/7979320b1710e7ceb2bff3053bec97ce.jpg', '广东广州', 2, '160', '56', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464007237, 1463725352, 1, NULL, NULL, 2, 2),
(180, '18688852593', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18688852593', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463725377, 1, NULL, NULL, 2, 1),
(181, '13760686023', 'e10adc3949ba59abbe56e057f20f883e', '7998b025b31f52df', NULL, '13760686023', 'http://bmegimgcdn.b0.upaiyun.com/phone/b3278f12d897ad2175e5afb52b9ea6c7.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463753724, 1463725414, 1, NULL, NULL, 2, 1),
(182, '13926123140', 'c33367701511b4f6020ec61ded352059', 'bb10d7c5bb10b27c', NULL, '阿鱼', 'http://bmegimgcdn.b0.upaiyun.com/phone/36f5c8e859635408daf7da0b8af2ae88.jpg', '广东广州', 2, '160', '70', '36 ~ 40%', '3', '4', NULL, NULL, NULL, '一直在减肥的路上散步～～', 1, '0.00', 0, 1, 1, 1, 1, 1463998608, 1463725445, 1, NULL, NULL, 2, 2),
(183, '13570246906', 'df537f7887f4df08e9c970ce49e2da15', '0bc6ace2e4762700', NULL, '13570246906', '', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463748815, 1463725474, 1, NULL, NULL, 2, 1),
(184, '13288807179', 'face73d8d6e68b7e05d346920036d490', '7be7ace8ecc57882', NULL, '梁二牛', '', '广东广州', 1, '183', '65', '16 ~ 19%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463894132, 1463725499, 1, NULL, NULL, 2, 2),
(185, '15602203336', '53637773162e2d9fbbc3593101f83451', '7a7670526e7fcf37', NULL, 'Lemon''''', 'http://bmegimgcdn.b0.upaiyun.com/phone/047edd33e5ddc211f0283f8ab6b71512.jpg', '广东广州', 2, '168', '57', '24 ~ 26%', '3', '4', NULL, NULL, NULL, '专注', 1, '0.00', 0, 1, 1, 1, 1, 1463841690, 1463726053, 1, NULL, NULL, 2, 2),
(186, '18988832112', 'b77ba56088bd5e36f36ba7b6144862cc', 'b2b0bb26bf22c77d', NULL, '18988832112', 'http://bmegimgcdn.b0.upaiyun.com/phone/4e0eec8018b820498cfa871c8b39dc59.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463753366, 1463726135, 1, NULL, NULL, 2, 1),
(187, '13725252501', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13725252501', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463726159, 1, NULL, NULL, 2, 1),
(188, '13510273238', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13510273238', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463726336, 1, NULL, NULL, 2, 1),
(189, '15975618747', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15975618747', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463726362, 1, NULL, NULL, 2, 1),
(190, '15902076981', '2be1e77bb1a9a5673400997e09315cca', '0c96804c9862d985', NULL, '蓝牙', 'http://bmegimgcdn.b0.upaiyun.com/phone/ca878f9e466c9256374a324047c178af.jpg', '广东广州', 2, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, '看不见你的笑我怎么吃得饱？', 1, '0.00', 0, 1, 1, 1, 1, 1463991955, 1463726390, 1, NULL, NULL, 2, 2),
(191, '13556112173', 'e10adc3949ba59abbe56e057f20f883e', '1ab486a1e4dfc8c5', NULL, '13556112173', 'http://bmegimgcdn.b0.upaiyun.com/phone/937bc704a2091196881444dc308dcc5c.jpg', '广东广州', 2, '159', '50', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840400, 1463726426, 1, NULL, NULL, 2, 2),
(192, '13570448068', 'e675befae4da4a3eddde985fe23754b4', '341bbc42afb0fbba', NULL, '13570448068', 'http://bmegimgcdn.b0.upaiyun.com/phone/65ef3c5ec5c08cb95c2612874b4cd47c.jpg', '广东广州', 2, '168', '54', '21 ~ 23%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464001432, 1463726457, 1, NULL, NULL, 2, 2),
(193, '13450203857', 'e10adc3949ba59abbe56e057f20f883e', '080f2e0b08055d73', NULL, '13450203857', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464001806, 1463726515, 1, NULL, NULL, 2, 1),
(194, '13580300342', 'e10adc3949ba59abbe56e057f20f883e', 'ebe9001c22f27558', NULL, '13580300342', 'http://bmegimgcdn.b0.upaiyun.com/phone/75c61b9b708300390c8602e8e763cee7.jpg', '广东广州', 2, '167', '65', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845651, 1463726539, 1, NULL, NULL, 2, 2),
(195, '13798119445', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13798119445', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463726564, 1, NULL, NULL, 2, 1),
(196, '13829771777', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13829771777', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463726608, 1, NULL, NULL, 2, 1),
(197, '18922189790', 'e10adc3949ba59abbe56e057f20f883e', '1d8427b00f05bfc2', NULL, 'Richard', 'http://bmegimgcdn.b0.upaiyun.com/phone/9a8ae1c91e5a828a31017b7908b7ff5c.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463908900, 1463726652, 1, NULL, NULL, 2, 2),
(198, '13500066219', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13500066219', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463726681, 1, NULL, NULL, 2, 1),
(199, '18620024924', '8f24c6918b30f549edc431156c600086', '5fec32af527856dd', NULL, 'Lucas', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463848279, 1463726770, 1, NULL, NULL, 2, 1),
(200, '18520999542', 'e10adc3949ba59abbe56e057f20f883e', 'db1a8099dadb2b71', NULL, '18520999542', '', '广东广州', 2, '160', '53', '36 ~ 40%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839885, 1463726795, 1, NULL, NULL, 2, 2),
(201, '13719469294', '629fb6eb538b898dc95bae5572d5fba6', 'd9aa761941f8b641', NULL, 'viggochan', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/48af657a-2294-4c03-b48e-b5a30c0cdbf4.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463746770, 1463726820, 1, NULL, NULL, 2, 1),
(202, '15889965173', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15889965173', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463726848, 1, 0, NULL, 2, 1),
(203, '13798194385', 'f120c69bc50f64acbc14e9b01c59b0f2', '196d67f6ff735b31', NULL, 'sunny', 'http://bmegimgcdn.b0.upaiyun.com/phone/b48d0eaa64dc69a049dcee7b4fb68ca8.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463844589, 1463727002, 1, NULL, NULL, 2, 1),
(204, '13802983080', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13802983080', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463727062, 1, NULL, NULL, 2, 1),
(205, '18825162315', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18825162315', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463727090, 1, NULL, NULL, 2, 1),
(206, '15626125806', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '庆庆子', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/bdcfaecc-e1fc-4f83-8fdd-c3ea1b4e81ec.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463742951, 1463727119, 1, NULL, NULL, 2, 1),
(207, '18620167967', 'bdc9f1656e864506fc9345cbdcbc5152', 'ee35e18a11511066', NULL, '18620167967', 'http://bmegimgcdn.b0.upaiyun.com/phone/93a893f20cf07bd29e5d8db0eff2f401.jpg', '广东广州', 1, '174', '64', '13 ~ 15%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840796, 1463727173, 1, NULL, NULL, 2, 2),
(208, '13672430192', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13672430192', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463727220, 1, NULL, NULL, 2, 1),
(209, '13570473434', 'dda71ab772a5875bc9392594564f6051', '7db2301ad23f2a0d', NULL, '13570473434', 'http://bmegimgcdn.b0.upaiyun.com/phone/56a88a3ead89e5761bcfb54c94423212.jpg', '广东广州', 2, '162', '63', '21 ~ 23%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463846815, 1463727260, 1, NULL, NULL, 2, 2),
(210, '18666094028', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18666094028', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463727453, 1, NULL, NULL, 2, 1),
(211, '13924123400', 'e10adc3949ba59abbe56e057f20f883e', '06dd4192d41fba2f', NULL, '13924123400', '', '广东广州', 1, '174', '60', '8 ~ 10%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463892876, 1463727484, 1, NULL, NULL, 2, 2),
(212, '13802923332', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13802923332', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463727513, 1, NULL, NULL, 2, 1),
(213, '13025179148', 'e10adc3949ba59abbe56e057f20f883e', 'dfba5edaa0eaa376', NULL, '13025179148', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463747681, 1463727541, 1, NULL, NULL, 2, 1),
(214, '15999950599', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15999950599', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463727567, 1, NULL, NULL, 2, 1),
(215, '18988840748', 'e10adc3949ba59abbe56e057f20f883e', 'fbd1c5ed18c6021e', NULL, '18988840748', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463747958, 1463727594, 1, NULL, NULL, 2, 1),
(216, '13725364969', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13725364969', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463727629, 1, NULL, NULL, 2, 1),
(217, '18928802789', 'e10adc3949ba59abbe56e057f20f883e', '3ce4e601c6ba7949', NULL, '18928802789', 'http://bmegimgcdn.b0.upaiyun.com/phone/35eeb6daf6751fed76648e4439d80829.jpg', '广东广州', 2, '160', '52', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842490, 1463727668, 1, NULL, NULL, 2, 2),
(218, '15217222364', 'e10adc3949ba59abbe56e057f20f883e', '39edd36be713dbc3', NULL, '15217222364', '', '广东广州', 2, '162', '54', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841479, 1463727718, 1, NULL, NULL, 2, 2),
(220, '13124969867', '800352d21884c11c0ad2e9e16b73380e', '30414199d5e73613', NULL, 'Jm✨', 'http://bmegimgcdn.b0.upaiyun.com/phone/468b3a9ef013dc8f26d647b150c22e56.jpg', '广东广州', 2, '173', '55', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839258, 1463728041, 1, NULL, NULL, 2, 2),
(221, '15999928672', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15999928672', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728067, 1, NULL, NULL, 2, 1),
(222, '13682233364', '873397ad4b9fcc2dc4b2778e0fc24ea9', '0b214160fef35065', NULL, '13682233364', 'http://bmegimgcdn.b0.upaiyun.com/phone/88152a923ac24235b210e374a595b11d.jpg', '广东广州', 1, '171', '75', '25 ~ 30%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463850087, 1463728096, 1, NULL, NULL, 2, 2),
(223, '13539825541', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13539825541', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728125, 1, NULL, NULL, 2, 1),
(224, '13826162322', '95ef28fc2b0ccda0bfe7b9f5c3b6117b', 'a528aa2cf5115519', NULL, '叁条贰', '', '广东广州', 1, '175', '77', '25 ~ 30%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841163, 1463728169, 1, NULL, NULL, 2, 2),
(225, '18679502023', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18679502023', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728433, 1, NULL, NULL, 2, 1),
(226, '15975588381', 'e10adc3949ba59abbe56e057f20f883e', '051c55f253602423', NULL, '15975588381', '', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463764401, 1463728444, 1, NULL, NULL, 2, 1),
(227, '13710303202', '4a8e3c4277eb449cf5bf08c6a4b585fc', '86b783af3ae1f324', NULL, 'EmilyChow', 'http://bmegimgcdn.b0.upaiyun.com/phone/7611dddaa4eafba3b52818f92c0855d6.jpg', '广东广州', 2, '161', '60', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845210, 1463728501, 1, NULL, NULL, 2, 2),
(228, '15820365472', 'b2dde3af443f5230734108524db889ab', 'a1abc5b988064fe8', NULL, '15820365472', 'http://bmegimgcdn.b0.upaiyun.com/phone/0decf455d9f6f2b042d5e3f7956aa155.jpg', '广东广州', 1, '159', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463909175, 1463728528, 1, NULL, NULL, 2, 2),
(229, '13632220100', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13632220100', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728589, 1, NULL, NULL, 2, 1),
(230, '18802092322', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18802092322', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728626, 1, NULL, NULL, 2, 1),
(231, '13247211045', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13247211045', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728670, 1, NULL, NULL, 2, 1),
(232, '15013227109', '5c625e4536b0043cd528af4318ce12b9', '4048c738280cce68', NULL, '15013227109', 'http://bmegimgcdn.b0.upaiyun.com/phone/9b5ad5ff8857af313b61c911b201bfc4.jpg', '广东广州', 1, '182', '67', '25 ~ 30%', '2', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845857, 1463728698, 1, NULL, NULL, 2, 2),
(233, '13710505668', 'e10adc3949ba59abbe56e057f20f883e', '8e85009f629b6a22', NULL, '13710505668', '', '广东广州', 2, '158', '55', '36 ~ 40%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839356, 1463728737, 1, NULL, NULL, 2, 2),
(234, '15902063541', 'e10adc3949ba59abbe56e057f20f883e', 'f7f98d5818ee5bcb', NULL, '15902063541', 'http://bmegimgcdn.b0.upaiyun.com/phone/b356f659893ce096b7bdf8caab0a3f75.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464049041, 1463728760, 1, NULL, NULL, 2, 1),
(235, '13352828950', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13352828950', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728788, 1, NULL, NULL, 2, 1),
(236, '18316610688', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18316610688', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728809, 1, NULL, NULL, 2, 1),
(237, '15915895921', 'edb37a0fb821aed518b70ffefcd9bcdf', '9a02677f5d9f38b9', NULL, '15915895921', 'http://bmegimgcdn.b0.upaiyun.com/phone/0e536fa7be7b1b9055c71d1f4c97d140.jpg', '广东广州', 2, '165', '54', '18 ~ 20%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463847144, 1463728837, 1, NULL, NULL, 2, 2),
(238, '15625066508', '22d0aa7c949ff20245b079a80b9be101', 'f1bc37a1c48106d6', NULL, '15625066508', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/fc5abfae-2fe1-4075-a283-f316e3897954.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463752725, 1463728862, 1, NULL, NULL, 2, 1),
(239, '13711498096', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13711498096', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728899, 1, NULL, NULL, 2, 1),
(240, '15914369176', 'e10adc3949ba59abbe56e057f20f883e', 'dbc60da6cddb85ff', NULL, '15914369176', 'http://bmegimgcdn.b0.upaiyun.com/phone/1f57be94e53685980075effcd6db4161.jpg', '广东广州', 1, '178', '126', '16 ~ 19%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843931, 1463728939, 1, NULL, NULL, 2, 2),
(242, '13760816457', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13760816457', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463728993, 1, NULL, NULL, 2, 1),
(243, '13726897600', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13726897600', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463729018, 1, NULL, NULL, 2, 1),
(244, '18665688466', '77923b92bb25bdcea8d9cda6ae750b8a', '3c30536d04b7b106', NULL, 'Andy Tong', 'http://bmegimgcdn.b0.upaiyun.com/phone/4b4466b820b16c4562f8b82c18fc3cb4.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '7164856@qq.com', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463743743, 1463729041, 1, NULL, NULL, 2, 1),
(245, '13631390333', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13631390333', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463729068, 1, NULL, NULL, 2, 1),
(246, '13922201266', '266efa12cefc1dea6dcf709a62684bf0', '3862b4ba2b72ab07', NULL, 'bc', 'http://bmegimgcdn.b0.upaiyun.com/phone/f5d272874eec6a770dee43b44b44320a.jpg', '广东广州', 1, '167', '68', '25 ~ 30%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843249, 1463729089, 1, NULL, NULL, 2, 2),
(247, '13826001638', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '13826001638', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463729113, 1, NULL, NULL, 2, 1),
(248, '18001107660', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18001107660', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463729142, 1, NULL, NULL, 2, 1),
(249, '15820244317', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '15820244317', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463729173, 1, NULL, NULL, 2, 1),
(250, '18819222195', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18819222195', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463729208, 1, NULL, NULL, 2, 1),
(251, '13570028218', '20f478caaac7111b0cf921faa421b35c', '7c359d1b9c8fe256', NULL, 'sulvia', 'http://bmegimgcdn.b0.upaiyun.com/phone/9443b06b03154eafacf7d00d9f24e984.jpg', '广东广州', 2, '156', '48', '27 ~ 29%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841236, 1463729242, 1, NULL, NULL, 2, 2),
(252, '18620213012', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '18620213012', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463729267, 1, NULL, NULL, 2, 1),
(253, '13430235105', 'e10adc3949ba59abbe56e057f20f883e', '0f76cd252be270f1', NULL, '13430235105', '', '广东广州', 1, '172', '50', '16 ~ 19%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840652, 1463729350, 1, NULL, NULL, 2, 2),
(254, '13826108373', 'ef3470f6c27fdc777e9bde95cf8e5d87', '553b49456283b10d', NULL, '陈家驹', 'http://bmegimgcdn.b0.upaiyun.com/phone/ff020d1d7dd7f4da3ef295cbfbdb7fac.jpg', '广东广州', 1, '163', '55', '16 ~ 19%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840482, 1463729382, 1, NULL, NULL, 2, 2),
(255, '15521018826', 'e10adc3949ba59abbe56e057f20f883e', '0933f34c1881fae2', NULL, '小白', 'http://bmegimgcdn.b0.upaiyun.com/phone/e3ea673d54d8744a5bfccb4e1e481f37.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463748784, 1463729426, 1, NULL, NULL, 2, 1),
(256, '13851332566', 'e10adc3949ba59abbe56e057f20f883e', '0f82755450e31ecd', NULL, '小顾哥哥', 'http://bmegimgcdn.b0.upaiyun.com/phone/871002895d7f967205ed12094bdbd7d7.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463760531, 1463729447, 1, NULL, NULL, 2, 1),
(257, '13570098038', 'e10adc3949ba59abbe56e057f20f883e', 'f621d77785c4e4b1', NULL, '13570098038', 'http://bmegimgcdn.b0.upaiyun.com/phone/571b97ad52097075e4626e146c20c14a.jpg', '广东广州', 1, '178', '91', '25 ~ 30%', '2', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842775, 1463729473, 1, NULL, NULL, 2, 2),
(258, '18312419702', 'e10adc3949ba59abbe56e057f20f883e', '5b279b4a39a93ca3', NULL, 'Ricki', 'http://bmegimgcdn.b0.upaiyun.com/phone/18164d302f3486849c97696eaaacdb8c.jpg', '广东广州', 1, '162', '61', '20 ~ 24%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843905, 1463729531, 1, NULL, NULL, 2, 2),
(259, '15989069150', 'e10adc3949ba59abbe56e057f20f883e', 'a8ce093260692fc8', NULL, '15989069150', 'http://bmegimgcdn.b0.upaiyun.com/phone/c542e1955452424c0086ee5c55c39024.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463881444, 1463729565, 1, NULL, NULL, 2, 1),
(260, '13602223203', '999c34fdb21629de3213c4f364817680', '75b28a56d85b1d8f', NULL, '13602223203', 'http://bmegimgcdn.b0.upaiyun.com/phone/51fb281d56f09dcbe6f4677c8f0335bb.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463749147, 1463729623, 1, NULL, NULL, 2, 1),
(261, '15913180338', '7f655780a4ddef2ddbf7b4b15c002058', '9cbd5773f2568461', NULL, '李花倫CML', 'http://bmegimgcdn.b0.upaiyun.com/phone/d860e507d260784b98a6735598827983.jpg', '广东广州', 1, '180', '63', '16 ~ 19%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463851618, 1463729730, 1, NULL, NULL, 2, 2),
(262, '18569511632', '64e2176b65a5d22b9592de56534b91bd', 'e73572136261020b', NULL, '18569511632', 'http://bmegimgcdn.b0.upaiyun.com/phone/304d9754ae3dad0df668df90f56d94cf.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463744089, 1463732853, 1, NULL, NULL, 1, 1),
(265, '13655555555', 'e10adc3949ba59abbe56e057f20f883e', '92b6cc404e605a7c', NULL, '13655555555', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463734898, 1463734898, 1, NULL, NULL, 2, 1),
(266, '13902407568', 'e10adc3949ba59abbe56e057f20f883e', '5968650d04744940', NULL, '13902407568', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '35 ~ 40%', '3', '5', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463740818, 1463740818, 1, NULL, NULL, 2, 1),
(267, '15632458945', 'e10adc3949ba59abbe56e057f20f883e', 'be865b6a965a5b17', NULL, '15632458945', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/76472bee-cd57-43b2-ad5c-a303a6a589a6.jpg', '广东广州', 1, '160', '50', '13-15%', '健康', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463811164, 1463810567, 1, NULL, NULL, 2, 1),
(268, '13455555555', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13455555555', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463813805, 1463813805, 1, NULL, NULL, 2, 1),
(269, '13908625548', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13908625548', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463814519, 1463814519, 1, NULL, NULL, 2, 1),
(270, '13265487546', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13265487546', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '13-15%', '健康', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463814825, 1463814825, 1, NULL, NULL, 2, 1),
(271, '18666001262', 'cc5f4e7803cc157189f1214e0da0f246', '34cb5604cf1a96e6', NULL, 'Nic', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463849113, 1463818748, 1, NULL, NULL, 2, 1),
(272, '18999999999', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463822042, 1, NULL, NULL, 2, 1),
(276, '1343436497', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '', '', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463833265, 1, NULL, NULL, 2, 1),
(298, '13562458975', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13562458975', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/12c374a3-b8b7-4aa6-a4fc-8c73f97f8e48.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463844548, 1463844548, 1, NULL, NULL, 2, 1),
(273, '13678998812', 'e10adc3949ba59abbe56e057f20f883e', 'b813413de894a087', NULL, 'Ares', '', '广东广州', 1, '160', '66', '16-19%', '健康', '健康', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841291, 1463829161, 1, NULL, NULL, 2, 2),
(274, '13245678945', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13245678945', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/e9cb3fac-c8cc-4214-ad00-8db54e4b69ad.jpg', '广东广州', 1, '160', '50', '13-15%', '健康', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463830153, 1463829853, 1, NULL, NULL, 2, 2),
(275, '13456789645', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13456789645', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '13-15%', '健康', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463830230, 1463830197, 1, NULL, NULL, 2, 2),
(277, '18286623755', 'e10adc3949ba59abbe56e057f20f883e', '53a39b78045bcd19', NULL, '', 'http://bmegimgcdn.b0.upaiyun.com/phone/58461042df06d520726eff9e7a4971a9.jpg', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, '近距离', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464056927, 1463833607, 1, NULL, NULL, 1, 2),
(293, '13925061357', 'dc483e80a7a0bd9ef71d8cf973673924', '5e7b6fa9209a6b38', NULL, 'Jinrui', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/44255248-f6ba-40c9-b372-a94c03eaf30e.jpg', '广东广州', 1, '176', '70', '16 ~ 19%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463893629, 1463841871, 1, NULL, NULL, 2, 2),
(278, '13828443130', 'e085ffd0bdfb40a0062b6001b7085d01', 'f9929cbf79cb9840', NULL, 'Hyfen.Liu', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/f4a39af3-85a3-412a-a07f-2c0376de69ca.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463936900, 1463839568, 1, NULL, NULL, 2, 1),
(279, '13249622220', 'e10adc3949ba59abbe56e057f20f883e', '05aa7c881bc68519', NULL, 'Adelexu', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463839858, 1463839858, 1, NULL, NULL, 2, 1),
(280, '13560251136', 'ab7d73e88aa003340989e3ccacf0d2ff', '92eab9222846c1a7', NULL, 'mango_0', 'http://bmegimgcdn.b0.upaiyun.com/phone/1f30f85733b224c3402cdc0e60de28a7.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'wechat：516868143', 1, '0.00', 0, 1, 1, 1, 1, 1463839928, 1463839928, 1, NULL, NULL, 2, 1),
(281, '15918538894', 'dd2d3a10ec85d3a88bb783771d8c0c1e', '41aea76583c52c9a', NULL, '15918538894', 'http://bmegimgcdn.b0.upaiyun.com/phone/0d871e16e10cd4296a53e76a0c035895.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840837, 1463840385, 1, NULL, NULL, 2, 1),
(282, '15918886981', 'd014c4e042691a1711a9a07cbb322a94', '', NULL, '15918886981', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '170', '55', '16-19%', '增肌', '健康', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841468, 1463840406, 1, NULL, NULL, 2, 2),
(283, '15920145226', 'bf31360b1f7bc538cfdb37b1b1c6a7f2', '5fba9e24ee73fb4d', NULL, 'JAN', 'http://bmegimgcdn.b0.upaiyun.com/phone/2ac6ed411cc5e486724ef8144d2a0f83.jpg', '广东广州', 2, '165', '44', '21 ~ 23%', '3', '3', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842530, 1463840456, 1, NULL, NULL, 2, 2),
(284, '61415781007', 'f43754155f4f31c02d853e1993645b29', '06ccf90e0cced964', NULL, 'Flora', 'http://bmegimgcdn.b0.upaiyun.com/phone/41e5f8d1e39bbb06168165d033e4f92b.jpg', '广东广州', 2, '160', '46', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463864414, 1463840554, 1, NULL, NULL, 2, 2),
(285, '15989144257', '8834b979eb8ab6fdc9978cbfd9e820d6', '81fe76948a6862ac', NULL, '娟子。', 'http://bmegimgcdn.b0.upaiyun.com/phone/a71e862015da4f552681950592af5ef6.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840720, 1463840720, 1, NULL, NULL, 2, 1),
(286, '13427589113', 'e10adc3949ba59abbe56e057f20f883e', 'a03e3b4b21fbc288', NULL, 'Anniee', 'http://bmegimgcdn.b0.upaiyun.com/phone/f321792bff229322b2e999e7361fae1f.jpg', '广东广州', 2, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463909004, 1463840783, 1, NULL, NULL, 2, 2),
(290, '13763386048', '5461dbf39a2d2dd0bc75404f67473656', '', NULL, '13763386048', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841453, 1463841453, 1, NULL, NULL, 2, 1),
(287, '18002274422', '308c6ab9a075d57dd00e6cc3b5eb8975', 'd99b7b3c8c6ad32f', NULL, '18002274422', 'http://bmegimgcdn.b0.upaiyun.com/phone/7a4da5148ec5c7fbd000ff4b0201769e.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840903, 1463840903, 1, NULL, NULL, 2, 1),
(288, '13660584812', 'd8422b2eaabb1827722a0356e4b59508', 'ce29de723fbda8af', NULL, '13660584812', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 2, '163', '56', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840909, 1463840909, 1, NULL, NULL, 2, 2),
(289, '13316139838', 'dcf6cd42456b1cbbd6bf3385e34b6e6c', 'ae35fcd54f7279e1', NULL, '13316139838', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/67daec39-25af-404f-9f5a-9d3e27346700.jpg', '广东广州', 2, '155', '43', '10-12%', '塑形', '低血糖', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463840941, 1463840941, 1, NULL, NULL, 2, 2),
(291, '15602221770', '653641365336afbfa0a44ddb68fd3155', 'ad6d64741a9a8478', NULL, '         ·  EMILY', 'http://bmegimgcdn.b0.upaiyun.com/phone/520ab2c6643b77e432ac2af692b8d16a.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841605, 1463841605, 1, NULL, NULL, 2, 1),
(292, '13824414069', '46d6d4a8b334f7812c3ac85cb8c021e8', '3e54359153b1a0b4', NULL, 'M', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/c4157eaf-d1e6-4f76-8243-eb741a3ab06a.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463841663, 1463841663, 1, NULL, NULL, 2, 1),
(294, '15902021016', 'e39d2fe707970dd42987764cdd9b56b2', 'c247d4c60306d6ea', NULL, '许阿牛', 'http://bmegimgcdn.b0.upaiyun.com/phone/25d00414a0c9e2475dc1f56c420fb48a.jpg', '广东广州', 2, '159', '53', '27 ~ 29%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842067, 1463842067, 1, NULL, NULL, 2, 2),
(295, '18925080774', '536b374349f4b98eb83bc5cc7ad0aee3', '5f460bab60235cd3', NULL, 'carmen', 'http://bmegimgcdn.b0.upaiyun.com/phone/e40de163c96f7ac75ff0cb27e9207f93.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463842624, 1463842624, 1, NULL, NULL, 2, 1),
(296, '13711118220', 'b90f4fad85323a3b6360eded5b533bf4', '2e8328acb696cd39', NULL, 'vivi', 'http://bmegimgcdn.b0.upaiyun.com/phone/ad56053ac74d29337bd14a58fd73f10b.jpg', '广东广州', 2, '167', '58', '30 ~ 35%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843889, 1463843330, 1, NULL, NULL, 2, 2),
(297, '13450254347', 'b7bd66a5452294b8200fd0011230b8d3', '236e9a455ee7078c', NULL, 'Gavin.sin', 'http://bmegimgcdn.b0.upaiyun.com/phone/6233a6a29a2baec0231e222c29cdb360.jpg', '广东广州', 1, '172', '58', '11 ~ 12%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463843923, 1463843923, 1, NULL, NULL, 2, 2),
(299, '13247311045', 'e10adc3949ba59abbe56e057f20f883e', '99b2f66c1886f9c7', NULL, '13247311045', 'http://bmegimgcdn.b0.upaiyun.com/phone/ead33b5fbdd8c4e8917cf5c05e9fa216.jpg', '广东广州', 1, '176', '56', '16 ~ 19%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463845825, 1463845825, 1, NULL, NULL, 2, 2),
(300, '13533370612', 'f348fc426665645258aea04f63bcf60e', '30126c9d665be3bc', NULL, 'Tiffin_Leung', 'http://bmegimgcdn.b0.upaiyun.com/phone/26ae5afacd143d90037fd11e2726bc0d.jpg', '广东广州', 1, '160', '73', '20 ~ 24%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463847215, 1463847215, 1, NULL, NULL, 2, 2),
(301, '13760698190', 'f14d98b3b226bc3523823238ea3f4ced', '82f38d1afdd8e94d', NULL, '13760698190', 'http://bmegimgcdn.b0.upaiyun.com/phone/b0218c961b2ab1a78f502937d154e766.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463852504, 1463852504, 1, NULL, NULL, 2, 1),
(302, '18688454133', '43c3d41394421861af2afe1d9e0c14f9', '9a87ad11deb1b10f', NULL, '李永辉', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/6eaee580-f42e-434f-82ed-23413582e7cd.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1240321786@qq.com', NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463868501, 1463868501, 1, NULL, NULL, 2, 1),
(303, '18027367199', 'dc8b9e37d8bc342117f32b8453378090', '202a19b976484507', NULL, 'MalegeBee', 'http://bmegimgcdn.b0.upaiyun.com/phone/caff6211e824cf072ac491ef0915db46.jpg', '广东广州', 2, '153', '42', '27 ~ 29%', '4', '3', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463881114, 1463881114, 1, NULL, NULL, 2, 2),
(304, '18206660666', 'd912c5068972aa38a2340caaf9109ac1', '7374309b7a1ad1b5', NULL, '小玟coco', 'http://bmegimgcdn.b0.upaiyun.com/phone/f804a35cebc0ea411964dc82d11ca7a6.jpg', '广东广州', 2, '168', '63', '24 ~ 26%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463883226, 1463883141, 1, NULL, NULL, 2, 2),
(305, '13926049936', '96e79218965eb72c92a549dd5a330112', 'cf86e9e24f2d39b7', NULL, '卓林Iris', 'http://bmegimgcdn.b0.upaiyun.com/phone/e21b14c12e297883a6e1300b0c45cf0e.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463892431, 1463892431, 1, NULL, NULL, 2, 1),
(306, '13580533394', '56ba052a807a05981fb9613bf6e6b882', '75ad39ba869740a7', NULL, '13580533394', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463894002, 1463894002, 1, NULL, NULL, 2, 1),
(307, '13610280720', 'e10adc3949ba59abbe56e057f20f883e', '444ce9ceed641659', NULL, '13610280720', 'http://bmegimgcdn.b0.upaiyun.com/phone/3b43f22ebcb612780b314624cee56799.jpg', '广东广州', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463898741, 1463898741, 1, NULL, NULL, 2, 1),
(308, '18022312122', 'aa47f8215c6f30a0dcdb2a36a9f4168e', '36bffdfe1bfad3eb', NULL, 'KK 桑', 'http://bmegimgcdn.b0.upaiyun.com/phone/843d78b05ad8be88f25bc93d5fa4ff31.jpg', '广东广州', 1, '180', '92', '25 ~ 30%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463905358, 1463905358, 1, NULL, NULL, 2, 2),
(309, '13533683345', '2acb4fa662af0dbd31dd4fe2939bd464', '94f20d56bf3c81d5', NULL, 'Tommy', 'http://bmegimgcdn.b0.upaiyun.com/phone/0cfb6901644704bb08949583532fe2bd.jpg', '广东广州', 1, '185', '70', '13 ~ 15%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463906397, 1463906397, 1, NULL, NULL, 2, 2),
(310, '13450350909', 'e10adc3949ba59abbe56e057f20f883e', '0d9ab511f4fc62e3', NULL, '13450350909', 'http://bmegimgcdn.b0.upaiyun.com/phone/6913c12c58039d0b6c1edfbf4460109e.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463906640, 1463906640, 1, NULL, NULL, 2, 1),
(311, '12345678911', 'e10adc3949ba59abbe56e057f20f883e', '570042bc9850630c', NULL, '测试1', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 1, '159', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463917266, 1463909040, 1, NULL, NULL, 2, 2),
(312, '12345678912', 'e10adc3949ba59abbe56e057f20f883e', '0c6b8741d319348f', NULL, '测试2', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463919096, 1463909121, 1, NULL, NULL, 2, 2),
(313, '12345678913', 'e10adc3949ba59abbe56e057f20f883e', 'bea81b9c34c0660b', NULL, '测试3', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 2, '166', '50', '27 ~ 29%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463919111, 1463909176, 1, NULL, NULL, 2, 2),
(314, '12345678914', 'e10adc3949ba59abbe56e057f20f883e', '43e151241d551dd7', NULL, '测试4', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 1, '160', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463919101, 1463909220, 1, NULL, NULL, 2, 2),
(315, '12345678915', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '测试5', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463909285, 1, NULL, NULL, 2, 1),
(316, '12345678916', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '测试6', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463909323, 1, NULL, NULL, 2, 1),
(317, '12345678917', 'e10adc3949ba59abbe56e057f20f883e', NULL, NULL, '测试7', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, NULL, 1463909345, 1, NULL, NULL, 2, 1),
(318, '12345678918', 'e10adc3949ba59abbe56e057f20f883e', 'de7d7ab06df60713', NULL, '测试8', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-22/57417a97eb598.jpg!345', '广东广州', 1, '158', '50', '1 ~ 4%', '3', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463917434, 1463909368, 1, NULL, NULL, 2, 2),
(319, '13316249282', 'e10adc3949ba59abbe56e057f20f883e', 'bc6512dfaa97886e', NULL, '13316249282', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463912946, 1463912946, 1, NULL, NULL, 2, 1),
(320, '13802901101', 'e10adc3949ba59abbe56e057f20f883e', 'f8b6447e2a72a039', NULL, '13802901101', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '167', '65', '20 ~ 24%', '1', '4', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463929314, 1463929314, 1, NULL, NULL, 2, 2),
(321, '15623456879', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '15623456879', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, '160', '50', '13-15%', '健康', '塑形', NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463984407, 1463984208, 1, NULL, NULL, 2, 2),
(322, '13535548625', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '13535548625', 'http://bmegimgcdn.b0.upaiyun.com/aojunwz/94cf6c60-a696-4907-96c8-59b34ab0a4fb.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463985435, 1463985435, 1, NULL, NULL, 2, 1),
(323, '15018863985', '0f3e84acb19dff22f695f31dbe3e972a', '', NULL, '15018863985', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1463985926, 1463985926, 1, NULL, NULL, 2, 1),
(324, '15632456589', 'e10adc3949ba59abbe56e057f20f883e', '', NULL, '15632456589', 'http://7xqk7j.com1.z0.glb.clouddn.com/apicloud/70a6120dff978b3805196c9e6ae5751b.jpg', '广东广州', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '0.00', 0, 1, 1, 1, 1, 1464001853, 1464001853, 1, NULL, NULL, 2, 1);

-- --------------------------------------------------------

--
-- 表的结构 `js_user_checkpoint`
--

CREATE TABLE IF NOT EXISTS `js_user_checkpoint` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gym_id` int(11) NOT NULL COMMENT '健身房的id',
  `check_time` int(11) NOT NULL COMMENT '签到的时间',
  `utime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

--
-- 转存表中的数据 `js_user_checkpoint`
--

INSERT INTO `js_user_checkpoint` (`id`, `user_id`, `gym_id`, `check_time`, `utime`) VALUES
(1, 175, 1, 20160522, 1463931851);

-- --------------------------------------------------------

--
-- 表的结构 `js_user_membercard`
--

CREATE TABLE IF NOT EXISTS `js_user_membercard` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `shop_id` varchar(11) DEFAULT NULL COMMENT '该卡所适用的健身点，0为全店适用,炸开为数组',
  `card_type` int(11) NOT NULL DEFAULT '1' COMMENT '1为次卡，2为季卡,3为年卡，4为体验卡',
  `remaintime` int(11) DEFAULT NULL COMMENT '剩余次数',
  `effect_time` int(11) DEFAULT NULL COMMENT '生效日期，用于月卡',
  `effect_day` int(11) DEFAULT NULL COMMENT '月卡的有效天数',
  `last_time` int(11) DEFAULT NULL COMMENT '失效日期',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  `status` int(255) DEFAULT '2' COMMENT '1未激活，2正在使用，3失效',
  `bonus_day` int(11) DEFAULT NULL COMMENT '1没有奖励，2已经奖励3个月，3已经惩罚3个月，4已经变成所有门店',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=251 ;

--
-- 转存表中的数据 `js_user_membercard`
--

INSERT INTO `js_user_membercard` (`id`, `user_id`, `shop_id`, `card_type`, `remaintime`, `effect_time`, `effect_day`, `last_time`, `c_time`, `status`, `bonus_day`) VALUES
(1, 1, '1,2', 4, NULL, NULL, NULL, NULL, 1462865560, 3, NULL),
(2, 1, '0', 2, 50, 1462865560, 180, NULL, 1462865560, 3, NULL),
(3, 4, '0', 1, 50, 1463137286, 365, 1463137286, 1462865560, 1, NULL),
(4, 1, '0', 3, 0, 1452614400, 275, 1476374400, 1462865560, 1, 3),
(5, 1, '1,2', 1, 10, NULL, NULL, NULL, 1463219819, 3, NULL),
(6, 4, '0', 3, 0, 1463219854, 365, 1494755854, 1463219854, 1, NULL),
(7, 2, '0', 3, 0, 1463382105, 365, 1494918105, 1463382105, 2, NULL),
(8, 2, '0', 1, 40, 1463395306, NULL, NULL, 1463395306, 2, NULL),
(9, 17, '1', 3, 0, 1463708617, 365, 1495244617, 1463708617, 2, NULL),
(10, 18, '1', 3, 0, 1463709089, 365, 1495245089, 1463709089, 2, NULL),
(11, 19, '1', 3, 0, 1463709158, 365, 1495245158, 1463709158, 2, NULL),
(12, 21, '2', 3, 0, 1463709371, 365, 1495245371, 1463709371, 2, NULL),
(13, 24, '1', 3, 0, 1463710372, 365, 1495246372, 1463710372, 2, NULL),
(14, 25, '1', 3, 0, 1463710440, 365, 1495246440, 1463710440, 2, NULL),
(15, 26, '1', 3, 0, 1463710483, 365, 1495246483, 1463710483, 2, NULL),
(16, 27, '1', 3, 0, 1463710529, 365, 1495246529, 1463710529, 2, NULL),
(17, 28, '1', 3, 0, 1463710585, 365, 1495246585, 1463710585, 2, NULL),
(18, 29, '1', 3, 0, 1463710640, 365, 1495246640, 1463710640, 2, NULL),
(19, 30, '1', 3, 0, 1463710705, 365, 1495246705, 1463710705, 2, NULL),
(20, 31, '0', 3, 0, 1463710755, 365, 1495246755, 1463710755, 2, NULL),
(21, 32, '0', 3, 0, 1463710836, 365, 1495246836, 1463710836, 2, NULL),
(22, 33, '0', 3, 0, 1463710872, 365, 1495246872, 1463710872, 2, NULL),
(23, 34, '0', 3, 0, 1463710907, 365, 1495246907, 1463710907, 2, NULL),
(24, 35, '0', 3, 0, 1463710959, 365, 1495246959, 1463710959, 2, NULL),
(25, 36, '0', 3, 0, 1463710995, 365, 1495246995, 1463710995, 2, NULL),
(26, 37, '0', 3, 0, 1463711031, 365, 1495247031, 1463711031, 2, NULL),
(27, 38, '0', 3, 0, 1463711092, 365, 1495247092, 1463711092, 2, NULL),
(28, 39, '0', 3, 0, 1463711134, 365, 1495247134, 1463711134, 2, NULL),
(29, 40, '0', 3, 0, 1463711229, 365, 1495247229, 1463711229, 2, NULL),
(30, 41, '0', 3, 0, 1463711470, 365, 1495247470, 1463711470, 2, NULL),
(31, 42, '0', 3, 365, 1463711720, 365, 1495247720, 1463711720, 2, NULL),
(32, 43, '0', 3, 0, 1463711839, 365, 1495247839, 1463711839, 2, NULL),
(33, 48, '0', 3, 0, 1463714480, 365, 1495250480, 1463714480, 2, NULL),
(34, 49, '0', 3, 0, 1463714512, 365, 1495250512, 1463714512, 2, NULL),
(35, 50, '0', 3, 0, 1463714552, 365, 1495250552, 1463714552, 2, NULL),
(36, 51, '0', 3, 0, 1463714602, 365, 1495250602, 1463714602, 2, NULL),
(37, 52, '0', 3, 0, 1463714641, 365, 1495250641, 1463714641, 2, NULL),
(38, 53, '0', 3, 0, 1463714673, 365, 1495250673, 1463714673, 2, NULL),
(39, 54, '1', 3, 0, 1463714734, 365, 1495250734, 1463714734, 2, NULL),
(40, 55, '1', 3, 0, 1463714769, 365, 1495250769, 1463714769, 2, NULL),
(41, 56, '1', 3, 0, 1463714811, 365, 1495250811, 1463714811, 2, NULL),
(42, 57, '1', 3, 0, 1463714841, 365, 1495250841, 1463714841, 2, NULL),
(43, 58, '1', 3, 0, 1463714883, 365, 1495250883, 1463714883, 2, NULL),
(44, 59, '1', 3, 0, 1463714918, 365, 1495250918, 1463714918, 2, NULL),
(45, 60, '1', 3, 0, 1463714945, 365, 1495250945, 1463714945, 2, NULL),
(46, 61, '1', 3, 0, 1463714973, 365, 1495250973, 1463714973, 2, NULL),
(47, 62, '1', 3, 0, 1463715010, 365, 1495251010, 1463715010, 2, NULL),
(48, 63, '1', 3, 0, 1463715088, 365, 1495251088, 1463715088, 2, NULL),
(49, 64, '1', 3, 0, 1463715136, 365, 1495251136, 1463715136, 2, NULL),
(50, 65, '1', 3, 0, 1463715238, 365, 1495251238, 1463715238, 2, NULL),
(51, 66, '1', 3, 0, 1463715324, 365, 1495251324, 1463715324, 2, NULL),
(52, 67, '1', 3, 0, 1463715365, 365, 1495251365, 1463715365, 2, NULL),
(53, 69, '1', 3, 0, 1463715395, 365, 1495251395, 1463715395, 2, NULL),
(54, 70, '1', 3, 0, 1463715435, 365, 1495251435, 1463715435, 2, NULL),
(55, 72, '1', 3, 0, 1463715533, 365, 1495251533, 1463715533, 2, NULL),
(56, 73, '1', 3, 0, 1463715574, 365, 1495251574, 1463715574, 2, NULL),
(57, 74, '1', 3, 0, 1463715619, 365, 1495251619, 1463715619, 2, NULL),
(58, 75, '1', 3, 0, 1463715692, 365, 1495251692, 1463715692, 2, NULL),
(59, 77, '1', 3, 0, 1463715720, 365, 1495251720, 1463715720, 2, NULL),
(60, 78, '1', 3, 0, 1463715752, 365, 1495251752, 1463715752, 2, NULL),
(61, 79, '1', 3, 0, 1463715799, 365, 1495251799, 1463715799, 2, NULL),
(62, 80, '1', 3, 0, 1463715842, 365, 1495251842, 1463715842, 2, NULL),
(63, 81, '1', 3, 0, 1463715886, 365, 1495251886, 1463715886, 2, NULL),
(64, 82, '1', 3, 0, 1463715911, 365, 1495251911, 1463715911, 2, NULL),
(65, 83, '1', 3, 0, 1463715940, 365, 1495251940, 1463715940, 2, NULL),
(66, 84, '1', 3, 0, 1463715977, 365, 1495251977, 1463715977, 2, NULL),
(67, 86, '1', 3, 0, 1463716009, 365, 1495252009, 1463716009, 2, NULL),
(68, 88, '1', 3, 0, 1463716104, 365, 1495252104, 1463716104, 2, NULL),
(69, 89, '1', 3, 0, 1463716139, 365, 1495252139, 1463716139, 2, NULL),
(70, 90, '1', 3, 0, 1463716164, 365, 1495252164, 1463716164, 2, NULL),
(71, 91, '1', 3, 0, 1463716206, 365, 1495252206, 1463716206, 2, NULL),
(72, 92, '1', 3, 0, 1463716274, 365, 1495252274, 1463716274, 2, NULL),
(73, 94, '1', 3, 0, 1463716300, 365, 1495252300, 1463716300, 2, NULL),
(74, 93, '1', 3, 0, 1463716311, 365, 1495252311, 1463716311, 2, NULL),
(75, 95, '1', 3, 0, 1463716353, 365, 1495252353, 1463716353, 2, NULL),
(76, 96, '1', 3, 0, 1463716378, 365, 1495252378, 1463716378, 2, NULL),
(77, 97, '1', 3, 0, 1463716409, 365, 1495252409, 1463716409, 2, NULL),
(78, 99, '1', 3, 0, 1463716435, 365, 1495252435, 1463716435, 2, NULL),
(79, 100, '1', 3, 0, 1463716473, 365, 1495252473, 1463716473, 2, NULL),
(80, 101, '1', 3, 0, 1463716504, 365, 1495252504, 1463716504, 2, NULL),
(81, 102, '1', 3, 0, 1463716530, 365, 1495252530, 1463716530, 2, NULL),
(82, 103, '1', 3, 0, 1463716559, 365, 1495252559, 1463716559, 2, NULL),
(83, 104, '1', 3, 0, 1463716585, 365, 1495252585, 1463716585, 2, NULL),
(84, 105, '1', 3, 0, 1463716622, 365, 1495252622, 1463716622, 2, NULL),
(85, 106, '1', 3, 0, 1463716647, 365, 1495252647, 1463716647, 2, NULL),
(86, 107, '1', 3, 0, 1463716676, 365, 1495252676, 1463716676, 2, NULL),
(87, 108, '1', 3, 0, 1463716704, 365, 1495252704, 1463716704, 2, NULL),
(88, 109, '1', 3, 0, 1463716730, 365, 1495252730, 1463716730, 2, NULL),
(89, 110, '1', 3, 0, 1463716756, 365, 1495252756, 1463716756, 2, NULL),
(90, 111, '1', 3, 0, 1463716782, 365, 1495252782, 1463716782, 2, NULL),
(91, 112, '1', 3, 0, 1463716794, 365, 1495252794, 1463716794, 2, NULL),
(92, 10, '1', 3, 0, 1463716807, 365, 1495252807, 1463716807, 2, NULL),
(93, 113, '1', 3, 0, 1463716875, 365, 1495252875, 1463716875, 2, NULL),
(94, 114, '1', 3, 0, 1463722629, 365, 1495258629, 1463722629, 2, NULL),
(95, 115, '1', 3, 0, 1463722657, 365, 1495258657, 1463722657, 2, NULL),
(96, 116, '1', 3, 0, 1463722686, 365, 1495258686, 1463722686, 2, NULL),
(97, 117, '1', 3, 0, 1463722711, 365, 1495258711, 1463722711, 2, NULL),
(98, 118, '1', 3, 0, 1463722766, 365, 1495258766, 1463722766, 2, NULL),
(99, 119, '1', 3, 0, 1463722792, 365, 1495258792, 1463722792, 2, NULL),
(100, 120, '1', 3, 0, 1463722850, 365, 1495258850, 1463722850, 2, NULL),
(101, 121, '1', 3, 0, 1463722989, 365, 1495258989, 1463722989, 2, NULL),
(102, 122, '1', 3, 0, 1463723014, 365, 1495259014, 1463723014, 2, NULL),
(103, 123, '1', 3, 0, 1463723121, 365, 1495259121, 1463723121, 2, NULL),
(104, 124, '1', 3, 0, 1463723233, 365, 1495259233, 1463723233, 2, NULL),
(105, 125, '1', 3, 0, 1463723260, 365, 1495259260, 1463723260, 2, NULL),
(106, 126, '1', 3, 0, 1463723286, 365, 1495259286, 1463723286, 2, NULL),
(107, 127, '1', 3, 0, 1463723322, 365, 1495259322, 1463723322, 2, NULL),
(108, 128, '1', 3, 0, 1463723347, 365, 1495259347, 1463723347, 2, NULL),
(109, 129, '1', 3, 0, 1463723378, 365, 1495259378, 1463723378, 2, NULL),
(110, 130, '1', 3, 0, 1463723407, 365, 1495259407, 1463723407, 2, NULL),
(111, 131, '1', 3, 0, 1463723436, 365, 1495259436, 1463723436, 2, NULL),
(112, 132, '1', 3, 0, 1463723463, 365, 1495259463, 1463723463, 2, NULL),
(113, 133, '1', 3, 0, 1463723492, 365, 1495259492, 1463723492, 2, NULL),
(114, 134, '1', 3, 0, 1463723522, 365, 1495259522, 1463723522, 2, NULL),
(115, 135, '1', 3, 0, 1463723550, 365, 1495259550, 1463723550, 2, NULL),
(116, 136, '1', 3, 0, 1463723582, 365, 1495259582, 1463723582, 2, NULL),
(117, 137, '1', 3, 0, 1463723610, 365, 1495259610, 1463723610, 2, NULL),
(118, 138, '1', 3, 0, 1463723640, 365, 1495259640, 1463723640, 2, NULL),
(119, 139, '1', 3, 0, 1463723666, 365, 1495259666, 1463723666, 2, NULL),
(120, 140, '1', 3, 0, 1463723692, 365, 1495259692, 1463723692, 2, NULL),
(121, 141, '1', 3, 0, 1463723720, 365, 1495259720, 1463723720, 2, NULL),
(122, 142, '1', 3, 0, 1463723766, 365, 1495259766, 1463723766, 2, NULL),
(123, 143, '1', 3, 0, 1463723799, 365, 1495259799, 1463723799, 2, NULL),
(124, 144, '1', 3, 0, 1463723975, 365, 1495259975, 1463723975, 2, NULL),
(125, 145, '1', 3, 0, 1463724004, 365, 1495260004, 1463724004, 2, NULL),
(126, 147, '1', 3, 0, 1463724071, 365, 1495260071, 1463724071, 2, NULL),
(127, 148, '1', 3, 0, 1463724102, 365, 1495260102, 1463724102, 2, NULL),
(128, 149, '1', 3, 0, 1463724138, 365, 1495260138, 1463724138, 2, NULL),
(129, 150, '1', 3, 0, 1463724173, 365, 1495260173, 1463724173, 2, NULL),
(130, 151, '1', 3, 0, 1463724197, 365, 1495260197, 1463724197, 2, NULL),
(131, 152, '1', 3, 0, 1463724222, 365, 1495260222, 1463724222, 2, NULL),
(132, 153, '1', 3, 0, 1463724260, 365, 1495260260, 1463724260, 2, NULL),
(133, 154, '1', 3, 0, 1463724297, 365, 1495260297, 1463724297, 2, NULL),
(134, 155, '1', 3, 0, 1463724327, 365, 1495260327, 1463724327, 2, NULL),
(135, 156, '1', 3, 0, 1463724375, 365, 1495260375, 1463724375, 2, NULL),
(136, 157, '1', 3, 0, 1463724405, 365, 1495260405, 1463724405, 2, NULL),
(137, 158, '1', 3, 0, 1463724439, 365, 1495260439, 1463724439, 2, NULL),
(138, 159, '1', 3, 0, 1463724468, 365, 1495260468, 1463724468, 2, NULL),
(139, 160, '1', 3, 0, 1463724536, 365, 1495260536, 1463724536, 2, NULL),
(140, 161, '1', 3, 0, 1463724558, 365, 1495260558, 1463724558, 2, NULL),
(141, 162, '1', 3, 0, 1463724588, 365, 1495260588, 1463724588, 2, NULL),
(142, 163, '1', 3, 0, 1463724614, 365, 1495260614, 1463724614, 2, NULL),
(143, 164, '1', 3, 0, 1463724647, 365, 1495260647, 1463724647, 2, NULL),
(144, 165, '1', 3, 0, 1463724678, 365, 1495260678, 1463724678, 2, NULL),
(145, 166, '1', 3, 0, 1463724701, 365, 1495260701, 1463724701, 2, NULL),
(146, 167, '1', 3, 0, 1463724732, 365, 1495260732, 1463724732, 2, NULL),
(147, 169, '1', 3, 0, 1463724808, 365, 1495260808, 1463724808, 2, NULL),
(148, 170, '1', 3, 0, 1463724927, 365, 1495260927, 1463724927, 2, NULL),
(149, 171, '1', 3, 0, 1463724982, 365, 1495260982, 1463724982, 2, NULL),
(150, 172, '1', 3, 0, 1463725059, 365, 1495261059, 1463725059, 2, NULL),
(151, 174, '1', 3, 0, 1463725107, 365, 1495261107, 1463725107, 2, NULL),
(152, 175, '1', 3, 0, 1463725228, 365, 1495261228, 1463725228, 2, NULL),
(153, 176, '1', 3, 0, 1463725253, 365, 1495261253, 1463725253, 2, NULL),
(154, 177, '1', 3, 0, 1463725301, 365, 1495261301, 1463725301, 2, NULL),
(155, 178, '1', 3, 0, 1463725336, 365, 1495261336, 1463725336, 2, NULL),
(156, 179, '1', 3, 0, 1463725362, 365, 1495261362, 1463725362, 2, NULL),
(157, 180, '1', 3, 0, 1463725390, 365, 1495261390, 1463725390, 2, NULL),
(158, 181, '1', 3, 0, 1463725431, 365, 1495261431, 1463725431, 2, NULL),
(159, 182, '1', 3, 0, 1463725456, 365, 1495261456, 1463725456, 2, NULL),
(160, 183, '1', 3, 0, 1463725483, 365, 1495261483, 1463725483, 2, NULL),
(161, 184, '1', 3, 0, 1463725511, 365, 1495261511, 1463725511, 2, NULL),
(162, 185, '1', 3, 0, 1463726116, 365, 1495262116, 1463726116, 2, NULL),
(163, 186, '1', 3, 0, 1463726145, 365, 1495262145, 1463726145, 2, NULL),
(164, 187, '1', 3, 0, 1463726171, 365, 1495262171, 1463726171, 2, NULL),
(165, 188, '1', 3, 0, 1463726347, 365, 1495262347, 1463726347, 2, NULL),
(166, 189, '1', 3, 0, 1463726374, 365, 1495262374, 1463726374, 2, NULL),
(167, 190, '1', 3, 0, 1463726400, 365, 1495262400, 1463726400, 2, NULL),
(168, 191, '1', 3, 0, 1463726437, 365, 1495262437, 1463726437, 2, NULL),
(169, 192, '1', 3, 0, 1463726502, 365, 1495262502, 1463726502, 2, NULL),
(170, 193, '1', 3, 0, 1463726525, 365, 1495262525, 1463726525, 2, NULL),
(171, 194, '1', 3, 0, 1463726548, 365, 1495262548, 1463726548, 2, NULL),
(172, 195, '1', 3, 0, 1463726581, 365, 1495262581, 1463726581, 2, NULL),
(173, 196, '1', 3, 0, 1463726622, 365, 1495262622, 1463726622, 2, NULL),
(174, 197, '1', 3, 0, 1463726663, 365, 1495262663, 1463726663, 2, NULL),
(175, 198, '1', 3, 0, 1463726696, 365, 1495262696, 1463726696, 2, NULL),
(176, 199, '1', 3, 0, 1463726783, 365, 1495262783, 1463726783, 2, NULL),
(177, 200, '1', 3, 0, 1463726805, 365, 1495262805, 1463726805, 2, NULL),
(178, 201, '1', 3, 0, 1463726830, 365, 1495262830, 1463726830, 2, NULL),
(179, 202, '1', 3, 0, 1463726858, 365, 1495262858, 1463726858, 3, NULL),
(180, 202, NULL, 3, 0, 1463726871, 365, 1495262871, 1463726871, 3, NULL),
(181, 202, '1', 3, 0, 1463726984, 365, 1495262984, 1463726984, 2, NULL),
(182, 203, '1', 3, 0, 1463727046, 365, 1495263046, 1463727046, 2, NULL),
(183, 204, '1', 3, 0, 1463727071, 365, 1495263071, 1463727071, 2, NULL),
(184, 205, '1', 3, 0, 1463727100, 365, 1495263100, 1463727100, 2, NULL),
(185, 206, '1', 3, 0, 1463727133, 365, 1495263133, 1463727133, 2, NULL),
(186, 207, '1', 3, 0, 1463727186, 365, 1495263186, 1463727186, 2, NULL),
(187, 208, '1', 3, 0, 1463727233, 365, 1495263233, 1463727233, 2, NULL),
(188, 209, '1', 3, 0, 1463727271, 365, 1495263271, 1463727271, 2, NULL),
(189, 210, '1', 3, 0, 1463727469, 365, 1495263469, 1463727469, 2, NULL),
(190, 211, '1', 3, 0, 1463727494, 365, 1495263494, 1463727494, 2, NULL),
(191, 212, '1', 3, 0, 1463727527, 365, 1495263527, 1463727527, 2, NULL),
(192, 213, '1', 3, 0, 1463727551, 365, 1495263551, 1463727551, 2, NULL),
(193, 214, '1', 3, 0, 1463727580, 365, 1495263580, 1463727580, 2, NULL),
(194, 215, '1', 3, 0, 1463727607, 365, 1495263607, 1463727607, 2, NULL),
(195, 216, '1', 3, 0, 1463727645, 365, 1495263645, 1463727645, 2, NULL),
(196, 217, '1', 3, 0, 1463727683, 365, 1495263683, 1463727683, 2, NULL),
(197, 218, '1', 3, 0, 1463727735, 365, 1495263735, 1463727735, 2, NULL),
(198, 219, '1', 3, 0, 1463728022, 365, 1495264022, 1463728022, 2, NULL),
(199, 220, '1', 3, 0, 1463728052, 365, 1495264052, 1463728052, 2, NULL),
(200, 221, '1', 3, 0, 1463728081, 365, 1495264081, 1463728081, 2, NULL),
(201, 222, '1', 3, 0, 1463728111, 365, 1495264111, 1463728111, 2, NULL),
(202, 223, '1', 3, 0, 1463728138, 365, 1495264138, 1463728138, 2, NULL),
(203, 224, '1', 3, 0, 1463728403, 365, 1495264403, 1463728403, 2, NULL),
(204, 226, '1', 3, 0, 1463728470, 365, 1495264470, 1463728470, 2, NULL),
(205, 227, '1', 3, 0, 1463728512, 365, 1495264512, 1463728512, 2, NULL),
(206, 228, '1', 3, 0, 1463728544, 365, 1495264544, 1463728544, 2, NULL),
(207, 229, '1', 3, 0, 1463728603, 365, 1495264603, 1463728603, 2, NULL),
(208, 230, '1', 3, 0, 1463728654, 365, 1495264654, 1463728654, 2, NULL),
(209, 231, '1', 3, 0, 1463728684, 365, 1495264684, 1463728684, 2, NULL),
(210, 232, '1', 3, 0, 1463728711, 365, 1495264711, 1463728711, 2, NULL),
(211, 233, '1', 3, 0, 1463728746, 365, 1495264746, 1463728746, 2, NULL),
(212, 234, '1', 3, 0, 1463728771, 365, 1495264771, 1463728771, 2, NULL),
(213, 235, '1', 3, 0, 1463728797, 365, 1495264797, 1463728797, 2, NULL),
(214, 236, '1', 3, 0, 1463728822, 365, 1495264822, 1463728822, 2, NULL),
(215, 237, '1', 3, 0, 1463728848, 365, 1495264848, 1463728848, 2, NULL),
(216, 238, '1', 3, 0, 1463728877, 365, 1495264877, 1463728877, 2, NULL),
(217, 239, '1', 3, 0, 1463728915, 365, 1495264915, 1463728915, 2, NULL),
(218, 240, '1', 3, 0, 1463728951, 365, 1495264951, 1463728951, 2, NULL),
(219, 242, '1', 3, 0, 1463729004, 365, 1495265004, 1463729004, 2, NULL),
(220, 243, '1', 3, 0, 1463729027, 365, 1495265027, 1463729027, 2, NULL),
(221, 244, '1', 3, 0, 1463729050, 365, 1495265050, 1463729050, 2, NULL),
(222, 245, '1', 3, 0, 1463729076, 365, 1495265076, 1463729076, 2, NULL),
(223, 246, '1', 3, 0, 1463729100, 365, 1495265100, 1463729100, 2, NULL),
(224, 247, '1', 3, 0, 1463729124, 365, 1495265124, 1463729124, 2, NULL),
(225, 248, '1', 3, 0, 1463729153, 365, 1495265153, 1463729153, 2, NULL),
(226, 249, '1', 3, 0, 1463729183, 365, 1495265183, 1463729183, 2, NULL),
(227, 250, '1', 3, 0, 1463729224, 365, 1495265224, 1463729224, 2, NULL),
(228, 251, '1', 3, 0, 1463729253, 365, 1495265253, 1463729253, 2, NULL),
(229, 252, '1', 3, 0, 1463729290, 365, 1495265290, 1463729290, 2, NULL),
(230, 253, '1', 3, 0, 1463729365, 365, 1495265365, 1463729365, 2, NULL),
(231, 254, '1', 3, 0, 1463729412, 365, 1495265412, 1463729412, 2, NULL),
(232, 255, '1', 3, 0, 1463729435, 365, 1495265435, 1463729435, 2, NULL),
(233, 256, '1', 3, 0, 1463729458, 365, 1495265458, 1463729458, 2, NULL),
(234, 257, '1', 3, 0, 1463729519, 365, 1495265519, 1463729519, 2, NULL),
(235, 258, '1', 3, 0, 1463729540, 365, 1495265540, 1463729540, 2, NULL),
(236, 259, '1', 3, 0, 1463729581, 365, 1495265581, 1463729581, 2, NULL),
(237, 260, '1', 3, 0, 1463729633, 365, 1495265633, 1463729633, 2, NULL),
(238, 261, '0', 3, 0, 1463729753, 365, 1495265753, 1463729753, 2, NULL),
(239, 261, '0', 1, 30, NULL, NULL, NULL, 1463729768, 2, NULL),
(240, 262, '1', 3, 0, 1463733017, 365, 1495269017, 1463733017, 2, NULL),
(241, 262, '0', 1, 30, NULL, NULL, NULL, 1463733027, 2, NULL),
(242, 271, '0', 3, 0, 1463841093, 365, 1495377093, 1463841093, 2, NULL),
(243, 311, '1', 3, 0, 1463909070, 365, 1495445070, 1463909070, 2, NULL),
(244, 312, '1', 3, 0, 1463909145, 365, 1495445145, 1463909145, 2, NULL),
(245, 313, '1', 3, 0, 1463909193, 365, 1495445193, 1463909193, 2, NULL),
(246, 314, '1', 3, 0, 1463909249, 365, 1495445249, 1463909249, 2, NULL),
(247, 315, '1', 3, 0, 1463909529, 365, 1495445529, 1463909529, 2, NULL),
(248, 316, '1', 3, 0, 1463909545, 365, 1495445545, 1463909545, 2, NULL),
(249, 317, '1', 3, 0, 1463909567, 365, 1495445567, 1463909567, 2, NULL),
(250, 318, '1', 3, 0, 1463909581, 365, 1495445581, 1463909581, 2, NULL);

-- --------------------------------------------------------

--
-- 表的结构 `js_user_movement_day`
--

CREATE TABLE IF NOT EXISTS `js_user_movement_day` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `week_id` int(11) NOT NULL COMMENT '对应锻炼周的id(user_movement_week)',
  `day_name` varchar(255) NOT NULL COMMENT '天数显示（第一天、第二天、跑步）可大于7天，有辅助计划',
  `img` varchar(255) NOT NULL COMMENT '计划的图标地址',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为主训练，2 跑步3	划艇4   登山5   跳绳',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1未开始，2已完成，3超额了，4辅助锻炼,5正在进行中,6量不足已停止，7可选择重新当天锻炼或重新开始整个计划',
  `sort` tinyint(4) NOT NULL DEFAULT '1' COMMENT '计划的排序',
  `c_time` int(11) NOT NULL COMMENT '计划的创建时间',
  `l_time` int(11) DEFAULT NULL COMMENT '上次运动时间',
  `last` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为不是最后一天的计划，2为最后一天计划',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为未过期，2为已过期',
  `day` int(11) NOT NULL DEFAULT '1' COMMENT '天数记录，辅助计划为0',
  `push` tinyint(4) NOT NULL DEFAULT '2' COMMENT '是否开启推送1为是2为否',
  `push_kg` varchar(255) DEFAULT NULL COMMENT '推送多少公斤',
  `push_day` varchar(255) DEFAULT NULL COMMENT '多少天后推送',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- 转存表中的数据 `js_user_movement_day`
--

INSERT INTO `js_user_movement_day` (`id`, `user_id`, `week_id`, `day_name`, `img`, `type`, `state`, `sort`, `c_time`, `l_time`, `last`, `status`, `day`, `push`, `push_kg`, `push_day`) VALUES
(1, 262, 1, '划艇', '', 3, 1, 1, 1463923778, 0, 1, 1, 1, 1, '20', '2'),
(2, 262, 1, '第一天', '', 1, 1, 2, 1463924181, NULL, 1, 1, 1, 1, '', '2'),
(3, 103, 2, '跑步', '', 2, 5, 1, 1463990884, 1463996435, 1, 1, 0, 1, '', '2'),
(4, 103, 2, '', '', 1, 1, 2, 1463991785, NULL, 1, 1, 1, 1, '', '2'),
(5, 103, 2, '', '', 1, 1, 3, 1463991792, NULL, 1, 1, 2, 1, '', '2'),
(6, 103, 2, '', '', 1, 1, 4, 1463991795, NULL, 1, 1, 3, 1, '', '2'),
(7, 103, 3, '1', '', 1, 1, 1, 1463992727, NULL, 1, 1, 1, 2, NULL, NULL),
(8, 103, 2, '3', '', 1, 1, 5, 1463992904, NULL, 1, 1, 4, 1, '', '2'),
(9, 103, 4, '', '', 1, 1, 1, 1463992978, NULL, 1, 1, 1, 1, '', '2'),
(10, 103, 5, '', '', 1, 1, 1, 1463994377, 0, 1, 1, 1, 1, '', '2'),
(11, 103, 6, '7', '', 1, 1, 1, 1463995441, NULL, 1, 1, 1, 1, '', '2'),
(12, 1, 7, '1', 'http://bmegimgcdn.b0.upaiyun.com/2016-05-24/5743bac06cb70.jpg!345', 1, 1, 1, 1464056525, NULL, 1, 1, 1, 1, '10', '1'),
(13, 277, 8, '1', '', 1, 1, 1, 1464056743, NULL, 1, 1, 1, 1, '', '2'),
(14, 277, 8, '2', '', 1, 1, 2, 1464056749, NULL, 1, 1, 2, 1, '', '2'),
(15, 277, 8, '3', '', 1, 1, 3, 1464056755, NULL, 1, 1, 3, 1, '', '2');

-- --------------------------------------------------------

--
-- 表的结构 `js_user_movement_day_detail`
--

CREATE TABLE IF NOT EXISTS `js_user_movement_day_detail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `day_id` int(11) NOT NULL COMMENT '当前锻炼天的id（user_movement_day）',
  `movement_id` int(11) NOT NULL COMMENT '动作的id(movement）',
  `difficulty` tinyint(4) NOT NULL DEFAULT '1' COMMENT '难度系数1为初级2为中级3为高级',
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1未完成2已完成3超额4次数不足已取消',
  `frequency1` int(255) NOT NULL COMMENT '动作的标准次数',
  `frequency2` int(255) NOT NULL,
  `frequency3` int(255) NOT NULL,
  `frequency4` int(255) NOT NULL,
  `weight` int(255) NOT NULL COMMENT '动作的标准重量',
  `times` int(11) NOT NULL COMMENT '动作标准时间，单位为秒',
  `factfrequency1` int(255) DEFAULT NULL COMMENT '第一组实际次数',
  `factfrequency2` int(11) DEFAULT NULL,
  `factfrequency3` int(11) DEFAULT NULL,
  `factfrequency4` int(11) DEFAULT NULL,
  `factweight` int(11) DEFAULT NULL COMMENT '实际重量',
  `facttime` int(11) DEFAULT NULL COMMENT '实际完成时间，单位为秒',
  `extrafrequency1` int(11) DEFAULT NULL COMMENT '额外的次数',
  `extrafrequency2` int(11) DEFAULT NULL,
  `extrefrequency3` int(11) DEFAULT NULL,
  `extrafrequency4` int(11) DEFAULT NULL,
  `extraweight` int(11) DEFAULT NULL COMMENT '额外的重量',
  `extratime` int(11) DEFAULT NULL COMMENT '额外的时间',
  `sort` int(255) NOT NULL DEFAULT '1' COMMENT '排序',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  `type` int(11) DEFAULT '1' COMMENT '1增重2减肥3塑形',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=25 ;

--
-- 转存表中的数据 `js_user_movement_day_detail`
--

INSERT INTO `js_user_movement_day_detail` (`id`, `day_id`, `movement_id`, `difficulty`, `state`, `frequency1`, `frequency2`, `frequency3`, `frequency4`, `weight`, `times`, `factfrequency1`, `factfrequency2`, `factfrequency3`, `factfrequency4`, `factweight`, `facttime`, `extrafrequency1`, `extrafrequency2`, `extrefrequency3`, `extrafrequency4`, `extraweight`, `extratime`, `sort`, `c_time`, `type`) VALUES
(1, 1, 28, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(2, 2, 26, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(3, 2, 19, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(4, 2, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(5, 3, 21, 1, 4, 12, 12, 8, 12, 0, 0, 0, 0, 0, 0, 0, 29, -12, -12, NULL, -12, 0, 29, 1, 0, 1),
(6, 3, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(7, 3, 14, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(8, 4, 24, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(9, 4, 24, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(10, 4, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(11, 7, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(12, 8, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(13, 9, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(14, 10, 25, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(15, 11, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(16, 11, 38, 1, 1, 12, 12, 8, 12, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(17, 11, 37, 1, 1, 12, 12, 8, 12, 10, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(18, 11, 34, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(19, 11, 1, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(20, 11, 5, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(21, 13, 24, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(22, 13, 23, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(23, 14, 13, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1),
(24, 15, 38, 1, 1, 12, 12, 8, 12, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, 0, 1);

-- --------------------------------------------------------

--
-- 表的结构 `js_user_movement_week`
--

CREATE TABLE IF NOT EXISTS `js_user_movement_week` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id（user）',
  `total_day` int(11) DEFAULT NULL COMMENT '该计划的总天数',
  `complete_day` int(11) DEFAULT '0' COMMENT '已完成天数',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  `o_time` int(11) DEFAULT NULL COMMENT '过期时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为未过期，1为已过期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- 转存表中的数据 `js_user_movement_week`
--

INSERT INTO `js_user_movement_week` (`id`, `user_id`, `total_day`, `complete_day`, `c_time`, `o_time`, `status`) VALUES
(1, 262, 2, 0, 1463923778, NULL, 0),
(2, 103, 5, 0, 1463990884, 1463991799, 1),
(3, 103, 1, 0, 1463992727, 1463992859, 1),
(4, 103, 1, 0, 1463992978, 1463994377, 1),
(5, 103, 1, 0, 1463994377, 1463995441, 1),
(6, 103, 1, 0, 1463995441, NULL, 0),
(7, 1, 1, 0, 1464056525, NULL, 0),
(8, 277, 3, 0, 1464056743, NULL, 0);

-- --------------------------------------------------------

--
-- 表的结构 `js_yaoqingma`
--

CREATE TABLE IF NOT EXISTS `js_yaoqingma` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shop_id` varchar(255) NOT NULL COMMENT '优惠码',
  `shop_name` varchar(255) DEFAULT NULL,
  `text` varchar(255) NOT NULL,
  `c_time` int(11) NOT NULL DEFAULT '1' COMMENT '1未过期，2已过期',
  `last_time` int(11) NOT NULL COMMENT '失效日期',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1未过期，2已过期',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
