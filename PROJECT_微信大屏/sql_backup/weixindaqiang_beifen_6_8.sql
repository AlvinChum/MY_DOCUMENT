/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50173
Source Host           : 123.59.43.119:3306
Source Database       : weixindaqiang

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-06-08 15:31:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for wx_admin_auth
-- ----------------------------
DROP TABLE IF EXISTS `wx_admin_auth`;
CREATE TABLE `wx_admin_auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '对应的活动openid，0为所有权限',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_admin_auth
-- ----------------------------
INSERT INTO `wx_admin_auth` VALUES ('14', 'b38976481553fd595386ecdd03d7a227', '10');
INSERT INTO `wx_admin_auth` VALUES ('13', '753a52e736cf2019352d2a6ff2138783', '10');

-- ----------------------------
-- Table structure for wx_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_admin_user`;
CREATE TABLE `wx_admin_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `last_login_time` varchar(255) DEFAULT NULL,
  `last_login_ip` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `role` int(11) NOT NULL DEFAULT '1' COMMENT '1为普通用户，99为超级管理员',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_admin_user
-- ----------------------------
INSERT INTO `wx_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2016-06-08 14:24:41', '::1', '28', '99');
INSERT INTO `wx_admin_user` VALUES ('2', '微信', '21232f297a57a5a743894a0e4a801fc3', null, null, null, '1');
INSERT INTO `wx_admin_user` VALUES ('10', '微信大墙', 'e10adc3949ba59abbe56e057f20f883e', '2016-06-08 15:14:22', '119.130.99.189', '12', '1');

-- ----------------------------
-- Table structure for wx_award
-- ----------------------------
DROP TABLE IF EXISTS `wx_award`;
CREATE TABLE `wx_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '活动唯一标示',
  `title` varchar(255) NOT NULL COMMENT '打赏项目的名称',
  `imgurl` varchar(255) NOT NULL COMMENT '打赏项目的封面图片url',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_award
-- ----------------------------
INSERT INTO `wx_award` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '个性签到墙', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-04/57528c043fb6d.jpg', '1');
INSERT INTO `wx_award` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '拼手气抢红包', 'https://ss1.baidu.com/6ONXsjip0QIZ8tyhnq/it/u=2671142056,57308166&fm=82&s=DC98BEF2D6315596E495E67B0300C05E&w=121&h=81&img.JPEG', '2');
INSERT INTO `wx_award` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');
INSERT INTO `wx_award` VALUES ('4', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖2', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');
INSERT INTO `wx_award` VALUES ('5', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖3', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');
INSERT INTO `wx_award` VALUES ('6', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖4', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');
INSERT INTO `wx_award` VALUES ('7', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖5', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');
INSERT INTO `wx_award` VALUES ('8', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖6', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');
INSERT INTO `wx_award` VALUES ('9', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖7', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');
INSERT INTO `wx_award` VALUES ('10', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖8', 'https://ss0.baidu.com/73t1bjeh1BF3odCf/it/u=3962639126,3844600024&fm=96&s=EBA31364269E247F0DD0508F010080C2', '3');

-- ----------------------------
-- Table structure for wx_boardcast
-- ----------------------------
DROP TABLE IF EXISTS `wx_boardcast`;
CREATE TABLE `wx_boardcast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_boardcast
-- ----------------------------

-- ----------------------------
-- Table structure for wx_config
-- ----------------------------
DROP TABLE IF EXISTS `wx_config`;
CREATE TABLE `wx_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_config
-- ----------------------------
INSERT INTO `wx_config` VALUES ('1', 'mob_server', 'http://weixinmob.gzaojun.com');
INSERT INTO `wx_config` VALUES ('2', 'api_server', 'http://weixinapi.gzaojun.com');
INSERT INTO `wx_config` VALUES ('3', 'web_server', 'http://weixinweb.gzaojun.com');
INSERT INTO `wx_config` VALUES ('4', 'back_server', 'weixindaqiang_back');
INSERT INTO `wx_config` VALUES ('5', 'img_server', 'http://weixinimgcdn.b0.upaiyun.com');
INSERT INTO `wx_config` VALUES ('6', 'server_ip', '123.59.43.119');
INSERT INTO `wx_config` VALUES ('7', 'upyun_server', 'http://weixinimgcdn.b0.upaiyun.com');
INSERT INTO `wx_config` VALUES ('8', 'upyun_bucket_name', 'weixinimgcdn');
INSERT INTO `wx_config` VALUES ('9', 'upyun_operator_name', 'weixinimgcdn');
INSERT INTO `wx_config` VALUES ('10', 'upyun_operator_pwd', 'weixinimgcdn2016');

-- ----------------------------
-- Table structure for wx_dazhuanpan
-- ----------------------------
DROP TABLE IF EXISTS `wx_dazhuanpan`;
CREATE TABLE `wx_dazhuanpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '大转盘主题',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1关闭2正在进行中3结束',
  `c_time` int(11) NOT NULL,
  `l_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_dazhuanpan
-- ----------------------------
INSERT INTO `wx_dazhuanpan` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '大转盘测试', '3', '1465129650', '1465129659');
INSERT INTO `wx_dazhuanpan` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', 'dazhuanpanceshi 1', '3', '1465139487', '1465139883');

-- ----------------------------
-- Table structure for wx_dazhuanpan_award
-- ----------------------------
DROP TABLE IF EXISTS `wx_dazhuanpan_award`;
CREATE TABLE `wx_dazhuanpan_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dzpid` int(11) NOT NULL,
  `award_name` varchar(255) NOT NULL COMMENT '奖品名称：iPhone',
  `award_level` varchar(255) NOT NULL COMMENT '奖品等级：一等奖',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_dazhuanpan_award
-- ----------------------------
INSERT INTO `wx_dazhuanpan_award` VALUES ('1', '1', 'b1', 'a1');
INSERT INTO `wx_dazhuanpan_award` VALUES ('2', '1', 'b2', 'a2');
INSERT INTO `wx_dazhuanpan_award` VALUES ('3', '1', 'a3', 'a3');
INSERT INTO `wx_dazhuanpan_award` VALUES ('8', '2', 'iPod', '二等奖');
INSERT INTO `wx_dazhuanpan_award` VALUES ('7', '2', 'iphone1', '一等奖');
INSERT INTO `wx_dazhuanpan_award` VALUES ('9', '2', '谢谢参与', '谢谢参与');
INSERT INTO `wx_dazhuanpan_award` VALUES ('10', '2', '谢谢参与', '谢谢参与');

-- ----------------------------
-- Table structure for wx_dazhuanpan_temp
-- ----------------------------
DROP TABLE IF EXISTS `wx_dazhuanpan_temp`;
CREATE TABLE `wx_dazhuanpan_temp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `dazhuanpan_id` int(11) NOT NULL,
  `unicode` varchar(255) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1未使用2已使用',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_dazhuanpan_temp
-- ----------------------------
INSERT INTO `wx_dazhuanpan_temp` VALUES ('1', '1', '50d798627a64dc4e0510d8dec9bed8d3', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('2', '1', '0a728b5034ab10101944c2972dc1c7ec', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('3', '1', 'f947522d5e780cc79d18dee23b7e0216', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('4', '1', 'd8fd58fd4a6d3cd3a27b339f93600f95', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('5', '1', '3521cf2bc9770db1c514a49caeccc0c9', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('6', '1', 'd2bf76630a45a6d024a328bd92f3f801', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('7', '1', '37552dbf60b9e3b46902d5fa3044ab28', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('8', '1', '7730638bc5c2b1d561d8aefcb67dd92d', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('9', '1', 'e09418e521115667563617383fa32f5a', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('10', '1', '73e00a6b2a1c2d35cd7783a3278ecb61', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('11', '1', 'da9e48ece73baefad20e0881ffb495f3', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('12', '1', '381d6128c37ce29cad2cad07b280d536', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('13', '1', 'b5622f94f236d9f2602aa390461dabb1', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('14', '1', '828fb03eb50e6b971a865e36d847cc58', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('15', '1', '3c2c0f42a975f8644b74580804ade2d4', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('16', '1', '5be4dc9a2513499aa8d36a42ce2dfc7f', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('17', '1', '2a5f5e05fd91f2692ee44567ea8d9c38', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('18', '1', 'f4a491d6b542c8d9a108cfca5779a5d5', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('19', '1', '99d7241e8561f8f65e9560c9bdd97990', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('20', '1', '63f8a871ce1a5e6ff9ac4565fde58d39', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('21', '2', 'bffde37e57b7de69c68d0e91981e98d3', '2');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('22', '2', 'fd86ee234314d953a3a88f8bd2c65028', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('23', '2', 'bf18e73ac57b0774630b7905fa1a71d9', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('24', '2', '3f42bf7aa40384f82fad5dbd31db84dd', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('25', '2', 'a258558eca2aa61a8495da52ba346e74', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('26', '2', '089d00920e963a4252dd1ffb08915493', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('27', '2', '0d5d9941fbd37a0efc9bd9730f13846c', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('28', '2', '6f65b9446826f124c1450316ed0bf7d5', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('29', '2', 'f82e58c2bfac9d43d25ecd104cfa2800', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('30', '2', '2baea094316c8fcffcab6999e2906250', '1');
INSERT INTO `wx_dazhuanpan_temp` VALUES ('31', '2', '8f21932753c8aebae49407aa238870fd', '2');

-- ----------------------------
-- Table structure for wx_function
-- ----------------------------
DROP TABLE IF EXISTS `wx_function`;
CREATE TABLE `wx_function` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '功能名称',
  `function` varchar(255) DEFAULT NULL COMMENT '对应的功能注释',
  `default` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0为非默认，1为默认',
  `class` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_function
-- ----------------------------
INSERT INTO `wx_function` VALUES ('2', 'cj', '摇奖', '0', 'yaojiang', '#EE9A59');
INSERT INTO `wx_function` VALUES ('3', 'ddp', '对对碰', '0', 'duiduipeng', '#FB5184');
INSERT INTO `wx_function` VALUES ('4', 'tm', '弹幕', '0', 'danmu', '#F0C30F');
INSERT INTO `wx_function` VALUES ('5', 'xydzp', '大转盘', '0', 'dazhuanpan', '#3AA2C0');
INSERT INTO `wx_function` VALUES ('6', 'xys', '许愿树', '0', 'xuyuanshu', ' #A8C42F');
INSERT INTO `wx_function` VALUES ('9', 'yyy', '摇一摇', '0', 'yaoyiyao', '#377FD8');
INSERT INTO `wx_function` VALUES ('10', 'yhb', '摇红包', '0', 'yaohongbao', '#C73B3B');
INSERT INTO `wx_function` VALUES ('11', 'jbzs', '嘉宾展示', '0', 'jiabinzhanshi', '#34495E');
INSERT INTO `wx_function` VALUES ('13', 'tp', '投票', '0', 'toupiao', '#D6C0DF');
INSERT INTO `wx_function` VALUES ('14', 'ds', '打赏', '0', 'dashang', '#37B6B4');

-- ----------------------------
-- Table structure for wx_gonggao
-- ----------------------------
DROP TABLE IF EXISTS `wx_gonggao`;
CREATE TABLE `wx_gonggao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL COMMENT '公告内容',
  `c_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_gonggao
-- ----------------------------
INSERT INTO `wx_gonggao` VALUES ('7', '753a52e736cf2019352d2a6ff2138783', 'text2', '2016-06-05 12:18:36');
INSERT INTO `wx_gonggao` VALUES ('6', '753a52e736cf2019352d2a6ff2138783', 'text1', '2016-06-05 12:18:26');
INSERT INTO `wx_gonggao` VALUES ('8', '753a52e736cf2019352d2a6ff2138783', 'text3', '2016-06-05 12:18:43');
INSERT INTO `wx_gonggao` VALUES ('9', 'b38976481553fd595386ecdd03d7a227', 'ceshi1', '2016-06-08 14:34:58');
INSERT INTO `wx_gonggao` VALUES ('10', 'b38976481553fd595386ecdd03d7a227', 'ceshi2s', '2016-06-08 14:38:43');
INSERT INTO `wx_gonggao` VALUES ('11', 'b38976481553fd595386ecdd03d7a227', '测试3', '2016-06-08 14:41:24');
INSERT INTO `wx_gonggao` VALUES ('12', 'b38976481553fd595386ecdd03d7a227', '测试4', '2016-06-08 14:42:06');

-- ----------------------------
-- Table structure for wx_huodong
-- ----------------------------
DROP TABLE IF EXISTS `wx_huodong`;
CREATE TABLE `wx_huodong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(255) NOT NULL COMMENT '活动对应唯一的id（32位字符串）',
  `name` varchar(255) NOT NULL COMMENT '活动名称',
  `zhubandanwei` varchar(255) DEFAULT NULL COMMENT '主办单位',
  `theme` varchar(255) DEFAULT NULL COMMENT '活动主题',
  `time_limit` int(11) DEFAULT '0' COMMENT '参与时间的显示，0为无限制',
  `people_limit` int(11) DEFAULT '0' COMMENT '人数的最大值,0为无限制',
  `logo_url` varchar(255) DEFAULT NULL COMMENT '活动的LOGO',
  `qr_code` varchar(255) DEFAULT NULL COMMENT '二维码对应的url',
  `user_self_qrcode` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1不启用2启用',
  `background_img` varchar(255) NOT NULL DEFAULT 'http://weixinweb.gzaojun.com/Public/index_img/bg.png',
  `gzh_appid` varchar(255) DEFAULT NULL COMMENT '公众号对应的appid',
  `gzh_app_secret` varchar(255) DEFAULT NULL COMMENT '公众号的sec',
  `gzh_callback_url` varchar(255) DEFAULT 'http://weixinmob.gzaojun.com/Home/Oauth/get_oauth' COMMENT '公众号的回调url',
  `gzh_wxzf_mchid` varchar(255) DEFAULT NULL COMMENT '微信支付用户账号',
  `gzh_wxzf_key` varchar(255) DEFAULT NULL COMMENT '微信支付商户api安全密码',
  `check` tinyint(4) NOT NULL DEFAULT '1' COMMENT '留言1为关闭审核自动上墙，2为开启审核',
  `function_group` varchar(255) NOT NULL COMMENT '开启的功能列表',
  `default_function` varchar(255) DEFAULT NULL COMMENT '默认的功能',
  `switch` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为活动开启，0为活动关闭',
  `vote_limit` int(11) NOT NULL DEFAULT '0' COMMENT '每人每个活动有多少票,默认0为无限制',
  `yaojiang_num` int(11) DEFAULT '0' COMMENT '参加摇奖的人数',
  `c_time` int(11) NOT NULL COMMENT '活动创建时间',
  `hongbao_money` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '抢红包活动的总余额',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_huodong
-- ----------------------------
INSERT INTO `wx_huodong` VALUES ('1', '8310f87332120d904eb9bbb6d2d633a6', '微博之夜', null, null, '1464692400', '1', 'www.baj.com', 'www.daf.com', '1', 'http://weixinweb.gzaojun.com/Public/index_img/bg.png', 'sdj23234d2', '', 'http://weixinweb.gzaojun.com/Home/Oauth/get_oauth', null, null, '1', '3,4,5,6,8,9,10,11,13,14', '1', '0', '0', null, '1461580593', '0.00');
INSERT INTO `wx_huodong` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '微信大墙', '傲骏', 'hazh', '0', '0', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-02/574f966120bf5.jpg', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-02/574f966f3bccc.gif', '1', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-04/57527a651190b.png', 'wx6668a266b6ecdf30', 'e6e7ad19556f9b9d427026d513022432', 'http://weixinmob.gzaojun.com/Home/Oauth/get_oauth', '1317613101', 'weixindapingmu13137776560asdfefs', '2', '2,3,4,5,6,9,10,11,13,14', '1', '1', '0', null, '1461829310', '9.00');
INSERT INTO `wx_huodong` VALUES ('3', 'b261c79685cfa9333ab8efc850aa3f6a', '测试1', '测试1单位', '测试1主题', '0', '0', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-07/5756ddc59cfd8.jpg', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-07/5756ddc938b2d.jpg', '2', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-04/57527a651190b.png', 'appid', 'appokey', '46546', '123456789', 'dasfdasfa', '1', '2,4,5', null, '0', '0', '0', '0', '10.00');
INSERT INTO `wx_huodong` VALUES ('4', 'b38976481553fd595386ecdd03d7a227', '大墙测试1', 'aojun', '大墙测试1主题', '0', '0', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-08/5757b2a53d103.jpg', '', '1', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-04/57527a651190b.png', 'wx6668a266b6ecdf30', 'e6e7ad19556f9b9d427026d513022432', 'http://weixinmob.gzaojun.com/Home/Oauth/get_oauth', '1317613101', 'weixindapingmu13137776560asdfefs', '2', '2,3,4,5,6,9,10,11,13,14', null, '1', '0', '0', '1465367665', '10.00');

-- ----------------------------
-- Table structure for wx_jiabin
-- ----------------------------
DROP TABLE IF EXISTS `wx_jiabin`;
CREATE TABLE `wx_jiabin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `jiabin_name` varchar(255) NOT NULL COMMENT '嘉宾的名字',
  `jiabin_img` varchar(255) NOT NULL COMMENT '嘉宾的头像url',
  `short` varchar(255) DEFAULT NULL COMMENT '嘉宾头衔',
  `long` varchar(255) NOT NULL COMMENT '嘉宾简介',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_jiabin
-- ----------------------------
INSERT INTO `wx_jiabin` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '马云1', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-06/5754eb7a4a63e.jpg', '阿里巴巴与四十大盗1', ' 阿里巴巴集团主要创始人，现担任阿里巴巴集团董事局主席、日本软银董事、TNC（大自然保护协会）中国理事会主席兼全球董事会成员、华谊兄弟董事、生命科学突破奖基金会董事1');
INSERT INTO `wx_jiabin` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', '马化腾', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-06/5754ecec47030.jpg', '深圳', '阿斯顿发放机卡还上课就放寒假开始抵抗力符合健康大会飞机亏了哈尽快回复哈克家乐福黄金卡和付款哈家客户可 akshdjkfhkadhfkaklfkdakfbjlaihiwehhjsaduhfjweuh');

-- ----------------------------
-- Table structure for wx_message
-- ----------------------------
DROP TABLE IF EXISTS `wx_message`;
CREATE TABLE `wx_message` (
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
) ENGINE=MyISAM AUTO_INCREMENT=129 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_message
-- ----------------------------
INSERT INTO `wx_message` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1461840301', 'text', 'hello world', null, '1');
INSERT INTO `wx_message` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1461840419', 'text', 'hello world', null, '2');
INSERT INTO `wx_message` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1461840478', 'text', 'hello world', null, '1');
INSERT INTO `wx_message` VALUES ('16', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264449', 'text', 'hello worlds', null, '1');
INSERT INTO `wx_message` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264464', 'text', 'hello worlds', null, '1');
INSERT INTO `wx_message` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264517', 'text', 'hello worlds', null, '2');
INSERT INTO `wx_message` VALUES ('19', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264679', 'text', 'hello worlds', null, '2');
INSERT INTO `wx_message` VALUES ('20', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264716', 'text', 'hello worlds', null, '2');
INSERT INTO `wx_message` VALUES ('21', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264775', 'text', 'hello worlds', null, '1');
INSERT INTO `wx_message` VALUES ('22', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264807', 'pic', null, 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1');
INSERT INTO `wx_message` VALUES ('23', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264822', 'pic', null, 'http://www.liantu.com/images/2013/case/2.jpg', '1');
INSERT INTO `wx_message` VALUES ('24', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264856', 'pic', null, 'http://www.liantu.com/images/2013/case/2.jpg', '1');
INSERT INTO `wx_message` VALUES ('25', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462265075', 'pic', null, 'http://www.liantu.com/images/2013/case/2.jpg', '1');
INSERT INTO `wx_message` VALUES ('26', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462265084', 'text', 'hello worlds', null, '1');
INSERT INTO `wx_message` VALUES ('27', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464147872', 'text', '123', null, '1');
INSERT INTO `wx_message` VALUES ('28', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464147957', 'text', 'heiheiehi', null, '1');
INSERT INTO `wx_message` VALUES ('29', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464148140', 'text', 'saf', null, '1');
INSERT INTO `wx_message` VALUES ('30', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464155407', 'text', 'baby', null, '1');
INSERT INTO `wx_message` VALUES ('31', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464155508', 'text', 'text', null, '1');
INSERT INTO `wx_message` VALUES ('32', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464156176', 'text', 'caosaf', null, '1');
INSERT INTO `wx_message` VALUES ('33', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464156325', 'text', 'boy', null, '1');
INSERT INTO `wx_message` VALUES ('34', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464157590', 'text', 'sad', null, '1');
INSERT INTO `wx_message` VALUES ('35', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464157758', 'text', 'dfas', null, '1');
INSERT INTO `wx_message` VALUES ('36', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464158181', 'text', '打', null, '1');
INSERT INTO `wx_message` VALUES ('37', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464158301', 'text', 'cham', null, '1');
INSERT INTO `wx_message` VALUES ('38', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464158317', 'text', 'fire', null, '1');
INSERT INTO `wx_message` VALUES ('39', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464158439', 'text', 'we', null, '1');
INSERT INTO `wx_message` VALUES ('40', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464158442', 'text', 'on', null, '1');
INSERT INTO `wx_message` VALUES ('41', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464158446', 'text', 'fire', null, '1');
INSERT INTO `wx_message` VALUES ('42', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464161131', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/57455367c7049.gif', '1');
INSERT INTO `wx_message` VALUES ('43', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464161208', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/574553b7c75ef.jpg', '1');
INSERT INTO `wx_message` VALUES ('44', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464161262', 'text', '哈哈', null, '1');
INSERT INTO `wx_message` VALUES ('45', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464161600', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/5745554064578.jpg', '1');
INSERT INTO `wx_message` VALUES ('46', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464163093', 'text', 'as', null, '1');
INSERT INTO `wx_message` VALUES ('47', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464164236', 'text', 'sd', null, '1');
INSERT INTO `wx_message` VALUES ('48', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464165473', 'text', '哈哈', null, '1');
INSERT INTO `wx_message` VALUES ('49', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464165825', 'text', '噶', null, '1');
INSERT INTO `wx_message` VALUES ('50', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464165880', 'text', 'en', null, '1');
INSERT INTO `wx_message` VALUES ('51', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166539', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/5745688b33517.jpg', '1');
INSERT INTO `wx_message` VALUES ('52', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166579', 'text', '？', null, '1');
INSERT INTO `wx_message` VALUES ('53', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166620', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/574568dba48bc.jpg', '1');
INSERT INTO `wx_message` VALUES ('54', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166784', 'text', '哈哈', null, '1');
INSERT INTO `wx_message` VALUES ('55', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166809', 'text', '？', null, '1');
INSERT INTO `wx_message` VALUES ('56', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166822', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/574569a57eeaf.jpg', '1');
INSERT INTO `wx_message` VALUES ('57', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166931', 'text', '航海家好', null, '1');
INSERT INTO `wx_message` VALUES ('58', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166942', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/57456a1ddc9a9.jpg', '1');
INSERT INTO `wx_message` VALUES ('59', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464166999', 'text', '哈哈哈', null, '1');
INSERT INTO `wx_message` VALUES ('60', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167004', 'text', '？', null, '1');
INSERT INTO `wx_message` VALUES ('61', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', '1464167096', 'text', 'vghhh', null, '1');
INSERT INTO `wx_message` VALUES ('62', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', '1464167101', 'text', '哈哈哈哈', null, '1');
INSERT INTO `wx_message` VALUES ('63', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', '1464167108', 'text', '刚刚好豪豪', null, '1');
INSERT INTO `wx_message` VALUES ('64', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167194', 'text', '嗨', null, '1');
INSERT INTO `wx_message` VALUES ('65', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167207', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/57456b272c0f4.jpg', '1');
INSERT INTO `wx_message` VALUES ('66', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167215', 'text', '听', null, '1');
INSERT INTO `wx_message` VALUES ('67', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167218', 'text', '日', null, '1');
INSERT INTO `wx_message` VALUES ('68', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167488', 'text', '1', null, '1');
INSERT INTO `wx_message` VALUES ('69', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167489', 'text', '2', null, '1');
INSERT INTO `wx_message` VALUES ('70', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167490', 'text', '3', null, '1');
INSERT INTO `wx_message` VALUES ('71', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167492', 'text', '4', null, '1');
INSERT INTO `wx_message` VALUES ('72', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167493', 'text', '5', null, '1');
INSERT INTO `wx_message` VALUES ('73', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167504', 'text', '6', null, '1');
INSERT INTO `wx_message` VALUES ('74', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167506', 'text', '7', null, '1');
INSERT INTO `wx_message` VALUES ('75', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464167508', 'text', '8', null, '1');
INSERT INTO `wx_message` VALUES ('76', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464168528', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-25/5745704fb7006.jpg', '1');
INSERT INTO `wx_message` VALUES ('77', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464168857', 'text', '1', null, '1');
INSERT INTO `wx_message` VALUES ('78', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464168942', 'text', '2', null, '1');
INSERT INTO `wx_message` VALUES ('79', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464225543', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-26/57464f063be55.jpg', '1');
INSERT INTO `wx_message` VALUES ('80', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464225608', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-26/57464f46b56ca.png', '1');
INSERT INTO `wx_message` VALUES ('81', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464225661', 'text', '唔知', null, '1');
INSERT INTO `wx_message` VALUES ('82', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464225702', 'text', 'wt', null, '1');
INSERT INTO `wx_message` VALUES ('83', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464225810', 'text', 'sda', null, '1');
INSERT INTO `wx_message` VALUES ('84', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464225914', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-05-26/57465076c66cc.jpg', '1');
INSERT INTO `wx_message` VALUES ('85', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464229522', 'text', '噶', null, '1');
INSERT INTO `wx_message` VALUES ('86', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464229550', 'text', '哈哈哈哈哈哈哈哈', null, '1');
INSERT INTO `wx_message` VALUES ('87', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464229646', 'text', '丽丽', null, '1');
INSERT INTO `wx_message` VALUES ('88', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464230315', 'text', '4', null, '1');
INSERT INTO `wx_message` VALUES ('89', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464230401', 'text', 'Assss', null, '1');
INSERT INTO `wx_message` VALUES ('90', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464250956', 'text', '哈哈', null, '1');
INSERT INTO `wx_message` VALUES ('91', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464256514', 'text', '弹幕测试', null, '1');
INSERT INTO `wx_message` VALUES ('92', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464256643', 'text', '十分需要这个机油', null, '1');
INSERT INTO `wx_message` VALUES ('93', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464877778', 'text', '测试', null, '2');
INSERT INTO `wx_message` VALUES ('94', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464880154', 'text', '紧', null, '2');
INSERT INTO `wx_message` VALUES ('95', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464880489', 'text', '没电了', null, '2');
INSERT INTO `wx_message` VALUES ('96', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464880500', 'text', '没电了', null, '2');
INSERT INTO `wx_message` VALUES ('97', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464880561', 'text', '傻女', null, '2');
INSERT INTO `wx_message` VALUES ('98', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464881019', 'text', '嗯', null, '2');
INSERT INTO `wx_message` VALUES ('99', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464881090', 'text', '1', null, '1');
INSERT INTO `wx_message` VALUES ('100', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464881122', 'text', '？', null, '1');
INSERT INTO `wx_message` VALUES ('101', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464881149', 'text', '2', null, '2');
INSERT INTO `wx_message` VALUES ('102', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464881367', 'text', '连诗雅', null, '2');
INSERT INTO `wx_message` VALUES ('103', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464881585', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-06-02/575051b0815e3.jpg', '2');
INSERT INTO `wx_message` VALUES ('104', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464920255', 'text', 'q', null, '2');
INSERT INTO `wx_message` VALUES ('105', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464921372', 'text', '23', null, '2');
INSERT INTO `wx_message` VALUES ('106', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464921390', 'text', '12', null, '2');
INSERT INTO `wx_message` VALUES ('107', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464922059', 'text', '1', null, '2');
INSERT INTO `wx_message` VALUES ('108', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464922969', 'text', '是否', null, '2');
INSERT INTO `wx_message` VALUES ('109', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464926042', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-06-03/5750ff5a3d185.jpg', '2');
INSERT INTO `wx_message` VALUES ('110', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464926072', 'text', '1', null, '2');
INSERT INTO `wx_message` VALUES ('111', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464926075', 'text', '1', null, '2');
INSERT INTO `wx_message` VALUES ('112', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464926113', 'text', '1', null, '1');
INSERT INTO `wx_message` VALUES ('113', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464926117', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-06-03/5750ffa589e6a.jpg', '1');
INSERT INTO `wx_message` VALUES ('114', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464926699', 'text', '1', null, '2');
INSERT INTO `wx_message` VALUES ('115', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464926834', 'text', '1', null, '2');
INSERT INTO `wx_message` VALUES ('116', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464927909', 'text', '2', null, '2');
INSERT INTO `wx_message` VALUES ('117', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464927925', 'text', '1', null, '2');
INSERT INTO `wx_message` VALUES ('118', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464927964', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-06-03/575106dc6a557.jpg', '2');
INSERT INTO `wx_message` VALUES ('119', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464932398', 'text', '测试', null, '2');
INSERT INTO `wx_message` VALUES ('120', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464932439', 'text', '测试2', null, '2');
INSERT INTO `wx_message` VALUES ('121', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935190', 'text', '特', null, '2');
INSERT INTO `wx_message` VALUES ('122', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935237', 'text', '爱的发大水发的说法大师法打发', null, '2');
INSERT INTO `wx_message` VALUES ('123', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935420', 'text', '大师法', null, '2');
INSERT INTO `wx_message` VALUES ('124', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935531', 'text', '大方法反反复复反复反复反复反复反复反复', null, '1');
INSERT INTO `wx_message` VALUES ('125', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935664', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-06-03/575124f015ca3.jpg', '1');
INSERT INTO `wx_message` VALUES ('126', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935665', 'text', '发发', null, '1');
INSERT INTO `wx_message` VALUES ('127', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935732', 'text', '的飞洒发发发大是大非大法师是打发', null, '1');
INSERT INTO `wx_message` VALUES ('128', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '1464935781', 'pic', null, 'http://weixinimgcdn.b0.upaiyun.com/2016-06-03/5751256120b0a.gif', '1');

-- ----------------------------
-- Table structure for wx_program
-- ----------------------------
DROP TABLE IF EXISTS `wx_program`;
CREATE TABLE `wx_program` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '对应活动的openid',
  `program_name` varchar(255) NOT NULL COMMENT '节目名',
  `program_len` varchar(255) NOT NULL COMMENT '节目长度，单位小时',
  `start_time` varchar(255) NOT NULL COMMENT '开始时间',
  `end_time` varchar(255) NOT NULL COMMENT '结束时间',
  `sort` int(11) NOT NULL COMMENT '节目排序',
  `c_time` int(11) NOT NULL COMMENT '插入时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_program
-- ----------------------------
INSERT INTO `wx_program` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', '揭幕', '1', '10:00', '11:00', '1', '1461648859');
INSERT INTO `wx_program` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', '节目1', '1', '11:00', '12：00', '1', '1461648881');
INSERT INTO `wx_program` VALUES ('19', '753a52e736cf2019352d2a6ff2138783', '节目2', '2', '14:00', '16:00', '3', '1461648903');
INSERT INTO `wx_program` VALUES ('21', '393ba5cc4db2a2b65fdd92efcee69275', '1', '1', '1', '1', '1', '1461649351');
INSERT INTO `wx_program` VALUES ('22', '393ba5cc4db2a2b65fdd92efcee69275', '2', '2', '2', '2', '2', '1461649368');

-- ----------------------------
-- Table structure for wx_qiandao
-- ----------------------------
DROP TABLE IF EXISTS `wx_qiandao`;
CREATE TABLE `wx_qiandao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '活动唯一id',
  `user_openid` varchar(255) NOT NULL COMMENT '用户唯一id',
  `nickname` varchar(255) NOT NULL COMMENT '用户昵称',
  `sex` tinyint(4) NOT NULL COMMENT '1男2女0未知',
  `headimgurl` varchar(255) NOT NULL COMMENT '头像',
  `phone` varchar(255) NOT NULL COMMENT '手机号',
  `depart_name` varchar(255) NOT NULL COMMENT '用户签到界面输入的姓名',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=316 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_qiandao
-- ----------------------------
INSERT INTO `wx_qiandao` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', '1', 'www.baidu.com', '1591576219', 'chumchipang');
INSERT INTO `wx_qiandao` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', '501', 'test5', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', '');
INSERT INTO `wx_qiandao` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', '419', 'test6', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', '');
INSERT INTO `wx_qiandao` VALUES ('10', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', '1', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '18589221964', '');
INSERT INTO `wx_qiandao` VALUES ('11', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', '1', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', '13390633695', '');
INSERT INTO `wx_qiandao` VALUES ('12', '753a52e736cf2019352d2a6ff2138783', '367', 'test0', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '0', '');
INSERT INTO `wx_qiandao` VALUES ('13', '753a52e736cf2019352d2a6ff2138783', '339', 'test1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', '');
INSERT INTO `wx_qiandao` VALUES ('14', '753a52e736cf2019352d2a6ff2138783', '895', 'test2', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', '');
INSERT INTO `wx_qiandao` VALUES ('15', '753a52e736cf2019352d2a6ff2138783', '142', 'test3', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', '');
INSERT INTO `wx_qiandao` VALUES ('16', '753a52e736cf2019352d2a6ff2138783', '483', 'test4', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', '');
INSERT INTO `wx_qiandao` VALUES ('19', '753a52e736cf2019352d2a6ff2138783', '457', 'test7', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', '');
INSERT INTO `wx_qiandao` VALUES ('20', '753a52e736cf2019352d2a6ff2138783', '93', 'test8', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', '');
INSERT INTO `wx_qiandao` VALUES ('21', '753a52e736cf2019352d2a6ff2138783', '310', 'test9', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', '');
INSERT INTO `wx_qiandao` VALUES ('22', '753a52e736cf2019352d2a6ff2138783', '885', 'test10', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', '');
INSERT INTO `wx_qiandao` VALUES ('23', '753a52e736cf2019352d2a6ff2138783', '824', 'test11', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', '');
INSERT INTO `wx_qiandao` VALUES ('24', '753a52e736cf2019352d2a6ff2138783', '326', 'test12', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', '');
INSERT INTO `wx_qiandao` VALUES ('25', '753a52e736cf2019352d2a6ff2138783', '640', 'test13', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', '');
INSERT INTO `wx_qiandao` VALUES ('26', '753a52e736cf2019352d2a6ff2138783', '363', 'test14', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', '');
INSERT INTO `wx_qiandao` VALUES ('27', '753a52e736cf2019352d2a6ff2138783', '299', 'test15', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', '');
INSERT INTO `wx_qiandao` VALUES ('28', '753a52e736cf2019352d2a6ff2138783', '825', 'test16', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', '');
INSERT INTO `wx_qiandao` VALUES ('29', '753a52e736cf2019352d2a6ff2138783', '914', 'test17', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', '');
INSERT INTO `wx_qiandao` VALUES ('30', '753a52e736cf2019352d2a6ff2138783', '594', 'test18', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', '');
INSERT INTO `wx_qiandao` VALUES ('31', '753a52e736cf2019352d2a6ff2138783', '352', 'test19', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', '');
INSERT INTO `wx_qiandao` VALUES ('32', '753a52e736cf2019352d2a6ff2138783', '753', 'test20', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', '');
INSERT INTO `wx_qiandao` VALUES ('33', '753a52e736cf2019352d2a6ff2138783', '867', 'test21', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', '');
INSERT INTO `wx_qiandao` VALUES ('34', '753a52e736cf2019352d2a6ff2138783', '928', 'test22', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', '');
INSERT INTO `wx_qiandao` VALUES ('35', '753a52e736cf2019352d2a6ff2138783', '505', 'test23', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', '');
INSERT INTO `wx_qiandao` VALUES ('36', '753a52e736cf2019352d2a6ff2138783', '269', 'test24', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', '');
INSERT INTO `wx_qiandao` VALUES ('37', '753a52e736cf2019352d2a6ff2138783', '162', 'test25', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', '');
INSERT INTO `wx_qiandao` VALUES ('38', '753a52e736cf2019352d2a6ff2138783', '972', 'test26', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', '');
INSERT INTO `wx_qiandao` VALUES ('39', '753a52e736cf2019352d2a6ff2138783', '43', 'test27', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', '');
INSERT INTO `wx_qiandao` VALUES ('40', '753a52e736cf2019352d2a6ff2138783', '981', 'test28', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', '');
INSERT INTO `wx_qiandao` VALUES ('41', '753a52e736cf2019352d2a6ff2138783', '341', 'test29', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', '');
INSERT INTO `wx_qiandao` VALUES ('42', '753a52e736cf2019352d2a6ff2138783', '461', 'test30', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', '');
INSERT INTO `wx_qiandao` VALUES ('43', '753a52e736cf2019352d2a6ff2138783', '332', 'test31', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', '');
INSERT INTO `wx_qiandao` VALUES ('44', '753a52e736cf2019352d2a6ff2138783', '859', 'test32', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', '');
INSERT INTO `wx_qiandao` VALUES ('45', '753a52e736cf2019352d2a6ff2138783', '628', 'test33', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', '');
INSERT INTO `wx_qiandao` VALUES ('46', '753a52e736cf2019352d2a6ff2138783', '843', 'test34', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', '');
INSERT INTO `wx_qiandao` VALUES ('47', '753a52e736cf2019352d2a6ff2138783', '232', 'test35', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', '');
INSERT INTO `wx_qiandao` VALUES ('48', '753a52e736cf2019352d2a6ff2138783', '119', 'test36', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', '');
INSERT INTO `wx_qiandao` VALUES ('49', '753a52e736cf2019352d2a6ff2138783', '71', 'test37', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', '');
INSERT INTO `wx_qiandao` VALUES ('50', '753a52e736cf2019352d2a6ff2138783', '91', 'test38', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', '');
INSERT INTO `wx_qiandao` VALUES ('51', '753a52e736cf2019352d2a6ff2138783', '90', 'test39', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', '');
INSERT INTO `wx_qiandao` VALUES ('52', '753a52e736cf2019352d2a6ff2138783', '576', 'test40', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', '');
INSERT INTO `wx_qiandao` VALUES ('53', '753a52e736cf2019352d2a6ff2138783', '522', 'test41', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', '');
INSERT INTO `wx_qiandao` VALUES ('54', '753a52e736cf2019352d2a6ff2138783', '218', 'test42', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', '');
INSERT INTO `wx_qiandao` VALUES ('55', '753a52e736cf2019352d2a6ff2138783', '842', 'test43', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', '');
INSERT INTO `wx_qiandao` VALUES ('56', '753a52e736cf2019352d2a6ff2138783', '972', 'test44', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', '');
INSERT INTO `wx_qiandao` VALUES ('57', '753a52e736cf2019352d2a6ff2138783', '977', 'test45', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', '');
INSERT INTO `wx_qiandao` VALUES ('58', '753a52e736cf2019352d2a6ff2138783', '36', 'test46', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', '');
INSERT INTO `wx_qiandao` VALUES ('59', '753a52e736cf2019352d2a6ff2138783', '703', 'test47', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', '');
INSERT INTO `wx_qiandao` VALUES ('60', '753a52e736cf2019352d2a6ff2138783', '759', 'test48', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', '');
INSERT INTO `wx_qiandao` VALUES ('61', '753a52e736cf2019352d2a6ff2138783', '744', 'test49', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', '');
INSERT INTO `wx_qiandao` VALUES ('62', '753a52e736cf2019352d2a6ff2138783', '603', 'test50', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', '');
INSERT INTO `wx_qiandao` VALUES ('63', '753a52e736cf2019352d2a6ff2138783', '943', 'test51', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', '');
INSERT INTO `wx_qiandao` VALUES ('64', '753a52e736cf2019352d2a6ff2138783', '864', 'test52', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', '');
INSERT INTO `wx_qiandao` VALUES ('65', '753a52e736cf2019352d2a6ff2138783', '958', 'test53', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', '');
INSERT INTO `wx_qiandao` VALUES ('66', '753a52e736cf2019352d2a6ff2138783', '919', 'test54', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', '');
INSERT INTO `wx_qiandao` VALUES ('67', '753a52e736cf2019352d2a6ff2138783', '274', 'test55', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', '');
INSERT INTO `wx_qiandao` VALUES ('68', '753a52e736cf2019352d2a6ff2138783', '915', 'test56', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', '');
INSERT INTO `wx_qiandao` VALUES ('69', '753a52e736cf2019352d2a6ff2138783', '949', 'test57', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', '');
INSERT INTO `wx_qiandao` VALUES ('70', '753a52e736cf2019352d2a6ff2138783', '318', 'test58', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', '');
INSERT INTO `wx_qiandao` VALUES ('71', '753a52e736cf2019352d2a6ff2138783', '312', 'test59', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', '');
INSERT INTO `wx_qiandao` VALUES ('72', '753a52e736cf2019352d2a6ff2138783', '442', 'test60', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', '');
INSERT INTO `wx_qiandao` VALUES ('73', '753a52e736cf2019352d2a6ff2138783', '944', 'test61', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', '');
INSERT INTO `wx_qiandao` VALUES ('74', '753a52e736cf2019352d2a6ff2138783', '85', 'test62', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', '');
INSERT INTO `wx_qiandao` VALUES ('75', '753a52e736cf2019352d2a6ff2138783', '646', 'test63', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', '');
INSERT INTO `wx_qiandao` VALUES ('76', '753a52e736cf2019352d2a6ff2138783', '537', 'test64', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', '');
INSERT INTO `wx_qiandao` VALUES ('77', '753a52e736cf2019352d2a6ff2138783', '616', 'test65', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', '');
INSERT INTO `wx_qiandao` VALUES ('78', '753a52e736cf2019352d2a6ff2138783', '801', 'test66', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', '');
INSERT INTO `wx_qiandao` VALUES ('79', '753a52e736cf2019352d2a6ff2138783', '996', 'test67', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', '');
INSERT INTO `wx_qiandao` VALUES ('80', '753a52e736cf2019352d2a6ff2138783', '493', 'test68', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', '');
INSERT INTO `wx_qiandao` VALUES ('81', '753a52e736cf2019352d2a6ff2138783', '972', 'test69', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', '');
INSERT INTO `wx_qiandao` VALUES ('82', '753a52e736cf2019352d2a6ff2138783', '899', 'test70', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', '');
INSERT INTO `wx_qiandao` VALUES ('83', '753a52e736cf2019352d2a6ff2138783', '964', 'test71', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', '');
INSERT INTO `wx_qiandao` VALUES ('84', '753a52e736cf2019352d2a6ff2138783', '906', 'test72', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', '');
INSERT INTO `wx_qiandao` VALUES ('85', '753a52e736cf2019352d2a6ff2138783', '98', 'test73', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', '');
INSERT INTO `wx_qiandao` VALUES ('86', '753a52e736cf2019352d2a6ff2138783', '932', 'test74', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', '');
INSERT INTO `wx_qiandao` VALUES ('87', '753a52e736cf2019352d2a6ff2138783', '881', 'test75', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', '');
INSERT INTO `wx_qiandao` VALUES ('88', '753a52e736cf2019352d2a6ff2138783', '753', 'test76', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', '');
INSERT INTO `wx_qiandao` VALUES ('89', '753a52e736cf2019352d2a6ff2138783', '233', 'test77', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', '');
INSERT INTO `wx_qiandao` VALUES ('90', '753a52e736cf2019352d2a6ff2138783', '77', 'test78', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', '');
INSERT INTO `wx_qiandao` VALUES ('91', '753a52e736cf2019352d2a6ff2138783', '241', 'test79', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', '');
INSERT INTO `wx_qiandao` VALUES ('92', '753a52e736cf2019352d2a6ff2138783', '920', 'test80', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', '');
INSERT INTO `wx_qiandao` VALUES ('93', '753a52e736cf2019352d2a6ff2138783', '695', 'test81', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', '');
INSERT INTO `wx_qiandao` VALUES ('94', '753a52e736cf2019352d2a6ff2138783', '336', 'test82', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', '');
INSERT INTO `wx_qiandao` VALUES ('95', '753a52e736cf2019352d2a6ff2138783', '244', 'test83', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', '');
INSERT INTO `wx_qiandao` VALUES ('96', '753a52e736cf2019352d2a6ff2138783', '725', 'test84', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', '');
INSERT INTO `wx_qiandao` VALUES ('97', '753a52e736cf2019352d2a6ff2138783', '148', 'test85', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', '');
INSERT INTO `wx_qiandao` VALUES ('98', '753a52e736cf2019352d2a6ff2138783', '981', 'test86', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', '');
INSERT INTO `wx_qiandao` VALUES ('99', '753a52e736cf2019352d2a6ff2138783', '913', 'test87', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', '');
INSERT INTO `wx_qiandao` VALUES ('100', '753a52e736cf2019352d2a6ff2138783', '888', 'test88', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', '');
INSERT INTO `wx_qiandao` VALUES ('101', '753a52e736cf2019352d2a6ff2138783', '712', 'test89', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', '');
INSERT INTO `wx_qiandao` VALUES ('102', '753a52e736cf2019352d2a6ff2138783', '696', 'test90', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', '');
INSERT INTO `wx_qiandao` VALUES ('103', '753a52e736cf2019352d2a6ff2138783', '324', 'test91', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', '');
INSERT INTO `wx_qiandao` VALUES ('104', '753a52e736cf2019352d2a6ff2138783', '486', 'test92', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', '');
INSERT INTO `wx_qiandao` VALUES ('105', '753a52e736cf2019352d2a6ff2138783', '423', 'test93', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', '');
INSERT INTO `wx_qiandao` VALUES ('106', '753a52e736cf2019352d2a6ff2138783', '946', 'test94', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', '');
INSERT INTO `wx_qiandao` VALUES ('107', '753a52e736cf2019352d2a6ff2138783', '410', 'test95', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', '');
INSERT INTO `wx_qiandao` VALUES ('108', '753a52e736cf2019352d2a6ff2138783', '358', 'test96', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', '');
INSERT INTO `wx_qiandao` VALUES ('109', '753a52e736cf2019352d2a6ff2138783', '524', 'test97', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', '');
INSERT INTO `wx_qiandao` VALUES ('110', '753a52e736cf2019352d2a6ff2138783', '71', 'test98', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', '');
INSERT INTO `wx_qiandao` VALUES ('111', '753a52e736cf2019352d2a6ff2138783', '879', 'test99', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', '');
INSERT INTO `wx_qiandao` VALUES ('112', '753a52e736cf2019352d2a6ff2138783', '869', 'test0', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '0', '');
INSERT INTO `wx_qiandao` VALUES ('113', '753a52e736cf2019352d2a6ff2138783', '315', 'test1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', '');
INSERT INTO `wx_qiandao` VALUES ('114', '753a52e736cf2019352d2a6ff2138783', '449', 'test2', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', '');
INSERT INTO `wx_qiandao` VALUES ('115', '753a52e736cf2019352d2a6ff2138783', '273', 'test3', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', '');
INSERT INTO `wx_qiandao` VALUES ('116', '753a52e736cf2019352d2a6ff2138783', '399', 'test4', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', '');
INSERT INTO `wx_qiandao` VALUES ('117', '753a52e736cf2019352d2a6ff2138783', '432', 'test5', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', '');
INSERT INTO `wx_qiandao` VALUES ('118', '753a52e736cf2019352d2a6ff2138783', '267', 'test6', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', '');
INSERT INTO `wx_qiandao` VALUES ('119', '753a52e736cf2019352d2a6ff2138783', '73', 'test7', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', '');
INSERT INTO `wx_qiandao` VALUES ('120', '753a52e736cf2019352d2a6ff2138783', '645', 'test8', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', '');
INSERT INTO `wx_qiandao` VALUES ('121', '753a52e736cf2019352d2a6ff2138783', '639', 'test9', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', '');
INSERT INTO `wx_qiandao` VALUES ('122', '753a52e736cf2019352d2a6ff2138783', '391', 'test10', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', '');
INSERT INTO `wx_qiandao` VALUES ('123', '753a52e736cf2019352d2a6ff2138783', '97', 'test11', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', '');
INSERT INTO `wx_qiandao` VALUES ('124', '753a52e736cf2019352d2a6ff2138783', '472', 'test12', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', '');
INSERT INTO `wx_qiandao` VALUES ('125', '753a52e736cf2019352d2a6ff2138783', '255', 'test13', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', '');
INSERT INTO `wx_qiandao` VALUES ('126', '753a52e736cf2019352d2a6ff2138783', '393', 'test14', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', '');
INSERT INTO `wx_qiandao` VALUES ('127', '753a52e736cf2019352d2a6ff2138783', '423', 'test15', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', '');
INSERT INTO `wx_qiandao` VALUES ('128', '753a52e736cf2019352d2a6ff2138783', '606', 'test16', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', '');
INSERT INTO `wx_qiandao` VALUES ('129', '753a52e736cf2019352d2a6ff2138783', '659', 'test17', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', '');
INSERT INTO `wx_qiandao` VALUES ('130', '753a52e736cf2019352d2a6ff2138783', '26', 'test18', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', '');
INSERT INTO `wx_qiandao` VALUES ('131', '753a52e736cf2019352d2a6ff2138783', '929', 'test19', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', '');
INSERT INTO `wx_qiandao` VALUES ('132', '753a52e736cf2019352d2a6ff2138783', '765', 'test20', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', '');
INSERT INTO `wx_qiandao` VALUES ('133', '753a52e736cf2019352d2a6ff2138783', '861', 'test21', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', '');
INSERT INTO `wx_qiandao` VALUES ('134', '753a52e736cf2019352d2a6ff2138783', '390', 'test22', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', '');
INSERT INTO `wx_qiandao` VALUES ('135', '753a52e736cf2019352d2a6ff2138783', '352', 'test23', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', '');
INSERT INTO `wx_qiandao` VALUES ('136', '753a52e736cf2019352d2a6ff2138783', '490', 'test24', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', '');
INSERT INTO `wx_qiandao` VALUES ('137', '753a52e736cf2019352d2a6ff2138783', '158', 'test25', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', '');
INSERT INTO `wx_qiandao` VALUES ('138', '753a52e736cf2019352d2a6ff2138783', '65', 'test26', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', '');
INSERT INTO `wx_qiandao` VALUES ('139', '753a52e736cf2019352d2a6ff2138783', '664', 'test27', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', '');
INSERT INTO `wx_qiandao` VALUES ('140', '753a52e736cf2019352d2a6ff2138783', '199', 'test28', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', '');
INSERT INTO `wx_qiandao` VALUES ('141', '753a52e736cf2019352d2a6ff2138783', '382', 'test29', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', '');
INSERT INTO `wx_qiandao` VALUES ('142', '753a52e736cf2019352d2a6ff2138783', '715', 'test30', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', '');
INSERT INTO `wx_qiandao` VALUES ('143', '753a52e736cf2019352d2a6ff2138783', '326', 'test31', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', '');
INSERT INTO `wx_qiandao` VALUES ('144', '753a52e736cf2019352d2a6ff2138783', '969', 'test32', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', '');
INSERT INTO `wx_qiandao` VALUES ('145', '753a52e736cf2019352d2a6ff2138783', '253', 'test33', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', '');
INSERT INTO `wx_qiandao` VALUES ('146', '753a52e736cf2019352d2a6ff2138783', '664', 'test34', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', '');
INSERT INTO `wx_qiandao` VALUES ('147', '753a52e736cf2019352d2a6ff2138783', '854', 'test35', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', '');
INSERT INTO `wx_qiandao` VALUES ('148', '753a52e736cf2019352d2a6ff2138783', '529', 'test36', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', '');
INSERT INTO `wx_qiandao` VALUES ('149', '753a52e736cf2019352d2a6ff2138783', '312', 'test37', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', '');
INSERT INTO `wx_qiandao` VALUES ('150', '753a52e736cf2019352d2a6ff2138783', '932', 'test38', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', '');
INSERT INTO `wx_qiandao` VALUES ('151', '753a52e736cf2019352d2a6ff2138783', '253', 'test39', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', '');
INSERT INTO `wx_qiandao` VALUES ('152', '753a52e736cf2019352d2a6ff2138783', '967', 'test40', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', '');
INSERT INTO `wx_qiandao` VALUES ('153', '753a52e736cf2019352d2a6ff2138783', '958', 'test41', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', '');
INSERT INTO `wx_qiandao` VALUES ('154', '753a52e736cf2019352d2a6ff2138783', '250', 'test42', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', '');
INSERT INTO `wx_qiandao` VALUES ('155', '753a52e736cf2019352d2a6ff2138783', '779', 'test43', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', '');
INSERT INTO `wx_qiandao` VALUES ('156', '753a52e736cf2019352d2a6ff2138783', '670', 'test44', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', '');
INSERT INTO `wx_qiandao` VALUES ('157', '753a52e736cf2019352d2a6ff2138783', '74', 'test45', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', '');
INSERT INTO `wx_qiandao` VALUES ('158', '753a52e736cf2019352d2a6ff2138783', '529', 'test46', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', '');
INSERT INTO `wx_qiandao` VALUES ('159', '753a52e736cf2019352d2a6ff2138783', '549', 'test47', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', '');
INSERT INTO `wx_qiandao` VALUES ('160', '753a52e736cf2019352d2a6ff2138783', '966', 'test48', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', '');
INSERT INTO `wx_qiandao` VALUES ('161', '753a52e736cf2019352d2a6ff2138783', '745', 'test49', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', '');
INSERT INTO `wx_qiandao` VALUES ('162', '753a52e736cf2019352d2a6ff2138783', '320', 'test50', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', '');
INSERT INTO `wx_qiandao` VALUES ('163', '753a52e736cf2019352d2a6ff2138783', '503', 'test51', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', '');
INSERT INTO `wx_qiandao` VALUES ('164', '753a52e736cf2019352d2a6ff2138783', '2', 'test52', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', '');
INSERT INTO `wx_qiandao` VALUES ('165', '753a52e736cf2019352d2a6ff2138783', '580', 'test53', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', '');
INSERT INTO `wx_qiandao` VALUES ('166', '753a52e736cf2019352d2a6ff2138783', '719', 'test54', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', '');
INSERT INTO `wx_qiandao` VALUES ('167', '753a52e736cf2019352d2a6ff2138783', '197', 'test55', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', '');
INSERT INTO `wx_qiandao` VALUES ('168', '753a52e736cf2019352d2a6ff2138783', '321', 'test56', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', '');
INSERT INTO `wx_qiandao` VALUES ('169', '753a52e736cf2019352d2a6ff2138783', '111', 'test57', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', '');
INSERT INTO `wx_qiandao` VALUES ('170', '753a52e736cf2019352d2a6ff2138783', '262', 'test58', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', '');
INSERT INTO `wx_qiandao` VALUES ('171', '753a52e736cf2019352d2a6ff2138783', '944', 'test59', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', '');
INSERT INTO `wx_qiandao` VALUES ('172', '753a52e736cf2019352d2a6ff2138783', '681', 'test60', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', '');
INSERT INTO `wx_qiandao` VALUES ('173', '753a52e736cf2019352d2a6ff2138783', '798', 'test61', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', '');
INSERT INTO `wx_qiandao` VALUES ('174', '753a52e736cf2019352d2a6ff2138783', '267', 'test62', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', '');
INSERT INTO `wx_qiandao` VALUES ('175', '753a52e736cf2019352d2a6ff2138783', '808', 'test63', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', '');
INSERT INTO `wx_qiandao` VALUES ('176', '753a52e736cf2019352d2a6ff2138783', '573', 'test64', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', '');
INSERT INTO `wx_qiandao` VALUES ('177', '753a52e736cf2019352d2a6ff2138783', '131', 'test65', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', '');
INSERT INTO `wx_qiandao` VALUES ('178', '753a52e736cf2019352d2a6ff2138783', '167', 'test66', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', '');
INSERT INTO `wx_qiandao` VALUES ('179', '753a52e736cf2019352d2a6ff2138783', '928', 'test67', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', '');
INSERT INTO `wx_qiandao` VALUES ('180', '753a52e736cf2019352d2a6ff2138783', '961', 'test68', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', '');
INSERT INTO `wx_qiandao` VALUES ('181', '753a52e736cf2019352d2a6ff2138783', '307', 'test69', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', '');
INSERT INTO `wx_qiandao` VALUES ('182', '753a52e736cf2019352d2a6ff2138783', '291', 'test70', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', '');
INSERT INTO `wx_qiandao` VALUES ('183', '753a52e736cf2019352d2a6ff2138783', '693', 'test71', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', '');
INSERT INTO `wx_qiandao` VALUES ('184', '753a52e736cf2019352d2a6ff2138783', '759', 'test72', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', '');
INSERT INTO `wx_qiandao` VALUES ('185', '753a52e736cf2019352d2a6ff2138783', '30', 'test73', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', '');
INSERT INTO `wx_qiandao` VALUES ('186', '753a52e736cf2019352d2a6ff2138783', '635', 'test74', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', '');
INSERT INTO `wx_qiandao` VALUES ('187', '753a52e736cf2019352d2a6ff2138783', '259', 'test75', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', '');
INSERT INTO `wx_qiandao` VALUES ('188', '753a52e736cf2019352d2a6ff2138783', '497', 'test76', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', '');
INSERT INTO `wx_qiandao` VALUES ('189', '753a52e736cf2019352d2a6ff2138783', '868', 'test77', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', '');
INSERT INTO `wx_qiandao` VALUES ('190', '753a52e736cf2019352d2a6ff2138783', '81', 'test78', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', '');
INSERT INTO `wx_qiandao` VALUES ('191', '753a52e736cf2019352d2a6ff2138783', '912', 'test79', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', '');
INSERT INTO `wx_qiandao` VALUES ('192', '753a52e736cf2019352d2a6ff2138783', '730', 'test80', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', '');
INSERT INTO `wx_qiandao` VALUES ('193', '753a52e736cf2019352d2a6ff2138783', '742', 'test81', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', '');
INSERT INTO `wx_qiandao` VALUES ('194', '753a52e736cf2019352d2a6ff2138783', '597', 'test82', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', '');
INSERT INTO `wx_qiandao` VALUES ('195', '753a52e736cf2019352d2a6ff2138783', '774', 'test83', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', '');
INSERT INTO `wx_qiandao` VALUES ('196', '753a52e736cf2019352d2a6ff2138783', '659', 'test84', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', '');
INSERT INTO `wx_qiandao` VALUES ('197', '753a52e736cf2019352d2a6ff2138783', '978', 'test85', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', '');
INSERT INTO `wx_qiandao` VALUES ('198', '753a52e736cf2019352d2a6ff2138783', '907', 'test86', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', '');
INSERT INTO `wx_qiandao` VALUES ('199', '753a52e736cf2019352d2a6ff2138783', '348', 'test87', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', '');
INSERT INTO `wx_qiandao` VALUES ('200', '753a52e736cf2019352d2a6ff2138783', '460', 'test88', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', '');
INSERT INTO `wx_qiandao` VALUES ('201', '753a52e736cf2019352d2a6ff2138783', '473', 'test89', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', '');
INSERT INTO `wx_qiandao` VALUES ('202', '753a52e736cf2019352d2a6ff2138783', '121', 'test90', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', '');
INSERT INTO `wx_qiandao` VALUES ('203', '753a52e736cf2019352d2a6ff2138783', '414', 'test91', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', '');
INSERT INTO `wx_qiandao` VALUES ('204', '753a52e736cf2019352d2a6ff2138783', '849', 'test92', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', '');
INSERT INTO `wx_qiandao` VALUES ('205', '753a52e736cf2019352d2a6ff2138783', '441', 'test93', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', '');
INSERT INTO `wx_qiandao` VALUES ('206', '753a52e736cf2019352d2a6ff2138783', '838', 'test94', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', '');
INSERT INTO `wx_qiandao` VALUES ('207', '753a52e736cf2019352d2a6ff2138783', '763', 'test95', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', '');
INSERT INTO `wx_qiandao` VALUES ('208', '753a52e736cf2019352d2a6ff2138783', '355', 'test96', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', '');
INSERT INTO `wx_qiandao` VALUES ('209', '753a52e736cf2019352d2a6ff2138783', '262', 'test97', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', '');
INSERT INTO `wx_qiandao` VALUES ('210', '753a52e736cf2019352d2a6ff2138783', '224', 'test98', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', '');
INSERT INTO `wx_qiandao` VALUES ('211', '753a52e736cf2019352d2a6ff2138783', '280', 'test99', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', '');
INSERT INTO `wx_qiandao` VALUES ('212', '753a52e736cf2019352d2a6ff2138783', '501', 'test0', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '0', '');
INSERT INTO `wx_qiandao` VALUES ('213', '753a52e736cf2019352d2a6ff2138783', '115', 'test1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', '');
INSERT INTO `wx_qiandao` VALUES ('214', '753a52e736cf2019352d2a6ff2138783', '585', 'test2', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', '');
INSERT INTO `wx_qiandao` VALUES ('215', '753a52e736cf2019352d2a6ff2138783', '712', 'test3', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', '');
INSERT INTO `wx_qiandao` VALUES ('216', '753a52e736cf2019352d2a6ff2138783', '917', 'test4', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', '');
INSERT INTO `wx_qiandao` VALUES ('217', '753a52e736cf2019352d2a6ff2138783', '634', 'test5', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', '');
INSERT INTO `wx_qiandao` VALUES ('218', '753a52e736cf2019352d2a6ff2138783', '206', 'test6', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', '');
INSERT INTO `wx_qiandao` VALUES ('219', '753a52e736cf2019352d2a6ff2138783', '756', 'test7', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', '');
INSERT INTO `wx_qiandao` VALUES ('220', '753a52e736cf2019352d2a6ff2138783', '438', 'test8', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', '');
INSERT INTO `wx_qiandao` VALUES ('221', '753a52e736cf2019352d2a6ff2138783', '692', 'test9', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', '');
INSERT INTO `wx_qiandao` VALUES ('222', '753a52e736cf2019352d2a6ff2138783', '100', 'test10', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', '');
INSERT INTO `wx_qiandao` VALUES ('223', '753a52e736cf2019352d2a6ff2138783', '918', 'test11', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', '');
INSERT INTO `wx_qiandao` VALUES ('224', '753a52e736cf2019352d2a6ff2138783', '16', 'test12', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', '');
INSERT INTO `wx_qiandao` VALUES ('225', '753a52e736cf2019352d2a6ff2138783', '740', 'test13', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', '');
INSERT INTO `wx_qiandao` VALUES ('226', '753a52e736cf2019352d2a6ff2138783', '842', 'test14', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', '');
INSERT INTO `wx_qiandao` VALUES ('227', '753a52e736cf2019352d2a6ff2138783', '444', 'test15', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', '');
INSERT INTO `wx_qiandao` VALUES ('228', '753a52e736cf2019352d2a6ff2138783', '978', 'test16', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', '');
INSERT INTO `wx_qiandao` VALUES ('229', '753a52e736cf2019352d2a6ff2138783', '97', 'test17', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', '');
INSERT INTO `wx_qiandao` VALUES ('230', '753a52e736cf2019352d2a6ff2138783', '600', 'test18', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', '');
INSERT INTO `wx_qiandao` VALUES ('231', '753a52e736cf2019352d2a6ff2138783', '801', 'test19', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', '');
INSERT INTO `wx_qiandao` VALUES ('232', '753a52e736cf2019352d2a6ff2138783', '768', 'test20', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', '');
INSERT INTO `wx_qiandao` VALUES ('233', '753a52e736cf2019352d2a6ff2138783', '797', 'test21', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', '');
INSERT INTO `wx_qiandao` VALUES ('234', '753a52e736cf2019352d2a6ff2138783', '33', 'test22', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', '');
INSERT INTO `wx_qiandao` VALUES ('235', '753a52e736cf2019352d2a6ff2138783', '642', 'test23', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', '');
INSERT INTO `wx_qiandao` VALUES ('236', '753a52e736cf2019352d2a6ff2138783', '630', 'test24', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', '');
INSERT INTO `wx_qiandao` VALUES ('237', '753a52e736cf2019352d2a6ff2138783', '809', 'test25', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', '');
INSERT INTO `wx_qiandao` VALUES ('238', '753a52e736cf2019352d2a6ff2138783', '411', 'test26', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', '');
INSERT INTO `wx_qiandao` VALUES ('239', '753a52e736cf2019352d2a6ff2138783', '376', 'test27', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', '');
INSERT INTO `wx_qiandao` VALUES ('240', '753a52e736cf2019352d2a6ff2138783', '778', 'test28', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', '');
INSERT INTO `wx_qiandao` VALUES ('241', '753a52e736cf2019352d2a6ff2138783', '76', 'test29', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', '');
INSERT INTO `wx_qiandao` VALUES ('242', '753a52e736cf2019352d2a6ff2138783', '452', 'test30', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', '');
INSERT INTO `wx_qiandao` VALUES ('243', '753a52e736cf2019352d2a6ff2138783', '821', 'test31', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', '');
INSERT INTO `wx_qiandao` VALUES ('244', '753a52e736cf2019352d2a6ff2138783', '537', 'test32', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', '');
INSERT INTO `wx_qiandao` VALUES ('245', '753a52e736cf2019352d2a6ff2138783', '909', 'test33', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', '');
INSERT INTO `wx_qiandao` VALUES ('246', '753a52e736cf2019352d2a6ff2138783', '384', 'test34', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', '');
INSERT INTO `wx_qiandao` VALUES ('247', '753a52e736cf2019352d2a6ff2138783', '460', 'test35', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', '');
INSERT INTO `wx_qiandao` VALUES ('248', '753a52e736cf2019352d2a6ff2138783', '938', 'test36', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', '');
INSERT INTO `wx_qiandao` VALUES ('249', '753a52e736cf2019352d2a6ff2138783', '229', 'test37', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', '');
INSERT INTO `wx_qiandao` VALUES ('250', '753a52e736cf2019352d2a6ff2138783', '713', 'test38', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', '');
INSERT INTO `wx_qiandao` VALUES ('251', '753a52e736cf2019352d2a6ff2138783', '785', 'test39', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', '');
INSERT INTO `wx_qiandao` VALUES ('252', '753a52e736cf2019352d2a6ff2138783', '297', 'test40', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', '');
INSERT INTO `wx_qiandao` VALUES ('253', '753a52e736cf2019352d2a6ff2138783', '139', 'test41', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', '');
INSERT INTO `wx_qiandao` VALUES ('254', '753a52e736cf2019352d2a6ff2138783', '220', 'test42', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', '');
INSERT INTO `wx_qiandao` VALUES ('255', '753a52e736cf2019352d2a6ff2138783', '237', 'test43', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', '');
INSERT INTO `wx_qiandao` VALUES ('256', '753a52e736cf2019352d2a6ff2138783', '251', 'test44', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', '');
INSERT INTO `wx_qiandao` VALUES ('257', '753a52e736cf2019352d2a6ff2138783', '354', 'test45', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', '');
INSERT INTO `wx_qiandao` VALUES ('258', '753a52e736cf2019352d2a6ff2138783', '673', 'test46', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', '');
INSERT INTO `wx_qiandao` VALUES ('259', '753a52e736cf2019352d2a6ff2138783', '237', 'test47', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', '');
INSERT INTO `wx_qiandao` VALUES ('260', '753a52e736cf2019352d2a6ff2138783', '771', 'test48', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', '');
INSERT INTO `wx_qiandao` VALUES ('261', '753a52e736cf2019352d2a6ff2138783', '964', 'test49', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', '');
INSERT INTO `wx_qiandao` VALUES ('262', '753a52e736cf2019352d2a6ff2138783', '765', 'test50', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', '');
INSERT INTO `wx_qiandao` VALUES ('263', '753a52e736cf2019352d2a6ff2138783', '816', 'test51', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', '');
INSERT INTO `wx_qiandao` VALUES ('264', '753a52e736cf2019352d2a6ff2138783', '639', 'test52', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', '');
INSERT INTO `wx_qiandao` VALUES ('265', '753a52e736cf2019352d2a6ff2138783', '52', 'test53', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', '');
INSERT INTO `wx_qiandao` VALUES ('266', '753a52e736cf2019352d2a6ff2138783', '754', 'test54', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', '');
INSERT INTO `wx_qiandao` VALUES ('267', '753a52e736cf2019352d2a6ff2138783', '336', 'test55', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', '');
INSERT INTO `wx_qiandao` VALUES ('268', '753a52e736cf2019352d2a6ff2138783', '895', 'test56', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', '');
INSERT INTO `wx_qiandao` VALUES ('269', '753a52e736cf2019352d2a6ff2138783', '639', 'test57', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', '');
INSERT INTO `wx_qiandao` VALUES ('270', '753a52e736cf2019352d2a6ff2138783', '339', 'test58', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', '');
INSERT INTO `wx_qiandao` VALUES ('271', '753a52e736cf2019352d2a6ff2138783', '798', 'test59', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', '');
INSERT INTO `wx_qiandao` VALUES ('272', '753a52e736cf2019352d2a6ff2138783', '757', 'test60', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', '');
INSERT INTO `wx_qiandao` VALUES ('273', '753a52e736cf2019352d2a6ff2138783', '494', 'test61', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', '');
INSERT INTO `wx_qiandao` VALUES ('274', '753a52e736cf2019352d2a6ff2138783', '247', 'test62', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', '');
INSERT INTO `wx_qiandao` VALUES ('275', '753a52e736cf2019352d2a6ff2138783', '263', 'test63', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', '');
INSERT INTO `wx_qiandao` VALUES ('276', '753a52e736cf2019352d2a6ff2138783', '496', 'test64', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', '');
INSERT INTO `wx_qiandao` VALUES ('277', '753a52e736cf2019352d2a6ff2138783', '266', 'test65', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', '');
INSERT INTO `wx_qiandao` VALUES ('278', '753a52e736cf2019352d2a6ff2138783', '38', 'test66', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', '');
INSERT INTO `wx_qiandao` VALUES ('279', '753a52e736cf2019352d2a6ff2138783', '837', 'test67', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', '');
INSERT INTO `wx_qiandao` VALUES ('280', '753a52e736cf2019352d2a6ff2138783', '803', 'test68', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', '');
INSERT INTO `wx_qiandao` VALUES ('281', '753a52e736cf2019352d2a6ff2138783', '480', 'test69', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', '');
INSERT INTO `wx_qiandao` VALUES ('282', '753a52e736cf2019352d2a6ff2138783', '630', 'test70', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', '');
INSERT INTO `wx_qiandao` VALUES ('283', '753a52e736cf2019352d2a6ff2138783', '784', 'test71', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', '');
INSERT INTO `wx_qiandao` VALUES ('284', '753a52e736cf2019352d2a6ff2138783', '100', 'test72', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', '');
INSERT INTO `wx_qiandao` VALUES ('285', '753a52e736cf2019352d2a6ff2138783', '860', 'test73', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', '');
INSERT INTO `wx_qiandao` VALUES ('286', '753a52e736cf2019352d2a6ff2138783', '49', 'test74', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', '');
INSERT INTO `wx_qiandao` VALUES ('287', '753a52e736cf2019352d2a6ff2138783', '202', 'test75', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', '');
INSERT INTO `wx_qiandao` VALUES ('288', '753a52e736cf2019352d2a6ff2138783', '335', 'test76', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', '');
INSERT INTO `wx_qiandao` VALUES ('289', '753a52e736cf2019352d2a6ff2138783', '507', 'test77', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', '');
INSERT INTO `wx_qiandao` VALUES ('290', '753a52e736cf2019352d2a6ff2138783', '881', 'test78', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', '');
INSERT INTO `wx_qiandao` VALUES ('291', '753a52e736cf2019352d2a6ff2138783', '812', 'test79', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', '');
INSERT INTO `wx_qiandao` VALUES ('292', '753a52e736cf2019352d2a6ff2138783', '745', 'test80', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', '');
INSERT INTO `wx_qiandao` VALUES ('293', '753a52e736cf2019352d2a6ff2138783', '412', 'test81', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', '');
INSERT INTO `wx_qiandao` VALUES ('294', '753a52e736cf2019352d2a6ff2138783', '965', 'test82', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', '');
INSERT INTO `wx_qiandao` VALUES ('295', '753a52e736cf2019352d2a6ff2138783', '338', 'test83', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', '');
INSERT INTO `wx_qiandao` VALUES ('296', '753a52e736cf2019352d2a6ff2138783', '81', 'test84', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', '');
INSERT INTO `wx_qiandao` VALUES ('297', '753a52e736cf2019352d2a6ff2138783', '823', 'test85', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', '');
INSERT INTO `wx_qiandao` VALUES ('298', '753a52e736cf2019352d2a6ff2138783', '786', 'test86', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', '');
INSERT INTO `wx_qiandao` VALUES ('299', '753a52e736cf2019352d2a6ff2138783', '968', 'test87', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', '');
INSERT INTO `wx_qiandao` VALUES ('300', '753a52e736cf2019352d2a6ff2138783', '802', 'test88', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', '');
INSERT INTO `wx_qiandao` VALUES ('301', '753a52e736cf2019352d2a6ff2138783', '947', 'test89', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', '');
INSERT INTO `wx_qiandao` VALUES ('302', '753a52e736cf2019352d2a6ff2138783', '97', 'test90', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', '');
INSERT INTO `wx_qiandao` VALUES ('303', '753a52e736cf2019352d2a6ff2138783', '432', 'test91', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', '');
INSERT INTO `wx_qiandao` VALUES ('304', '753a52e736cf2019352d2a6ff2138783', '748', 'test92', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', '');
INSERT INTO `wx_qiandao` VALUES ('305', '753a52e736cf2019352d2a6ff2138783', '500', 'test93', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', '');
INSERT INTO `wx_qiandao` VALUES ('306', '753a52e736cf2019352d2a6ff2138783', '255', 'test94', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', '');
INSERT INTO `wx_qiandao` VALUES ('307', '753a52e736cf2019352d2a6ff2138783', '145', 'test95', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', '');
INSERT INTO `wx_qiandao` VALUES ('308', '753a52e736cf2019352d2a6ff2138783', '772', 'test96', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', '');
INSERT INTO `wx_qiandao` VALUES ('309', '753a52e736cf2019352d2a6ff2138783', '594', 'test97', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', '');
INSERT INTO `wx_qiandao` VALUES ('310', '753a52e736cf2019352d2a6ff2138783', '781', 'test98', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', '');
INSERT INTO `wx_qiandao` VALUES ('311', '753a52e736cf2019352d2a6ff2138783', '973', 'test99', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', '');
INSERT INTO `wx_qiandao` VALUES ('312', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwkdbT7WPdXuvKjpR0x5_VIU', '开心一族', '0', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OP6v78OA2ka0X1iamuDJuPYZnY4IP60odbGdibZKp5xY9hbll9shzuupJO2mUurkeD27ibl5ibGjDHKjC1fIkT4BNFY/0', '13066398765', '');
INSERT INTO `wx_qiandao` VALUES ('313', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwmmrp1Uo59zw98jz8xbrDFw', 'immortalDark', '1', 'http://wx.qlogo.cn/mmopen/QjSJUDRGAQFOwn9rickOhzsH56bKxt8tTgM9f8DX8kdYuFibqlvgjW8t4K5Hh1WccEBY1bLOnoU00EZlBYVgvSlbnCJdP3loOh/0', '18589221966', '广州傲骏');
INSERT INTO `wx_qiandao` VALUES ('314', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlK4YttgIlJpTnrktXwL0Rc', '鞋好闻童鞋', '1', 'http://wx.qlogo.cn/mmopen/4AqhHF5EicR0YtJQEHqLwWBQwnqPmBia49rjQev9kyYhTAj1oaVj2CqyFJ4Tkn9twUUhmHFFQwNbPZDnfHcLwayQ/0', '13622213121', '64364');
INSERT INTO `wx_qiandao` VALUES ('315', 'b38976481553fd595386ecdd03d7a227', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', '1', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '18589221966', '测试');

-- ----------------------------
-- Table structure for wx_qianghongbao_round
-- ----------------------------
DROP TABLE IF EXISTS `wx_qianghongbao_round`;
CREATE TABLE `wx_qianghongbao_round` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '这轮的红包标题',
  `status` int(255) NOT NULL DEFAULT '1' COMMENT '1为未开启2准备中未开始3正在进行中4已结束',
  `c_time` int(11) NOT NULL COMMENT '开始时间',
  `l_time` int(11) DEFAULT NULL COMMENT '结束时间',
  `u_time` int(11) NOT NULL COMMENT '创建时间',
  `yue` decimal(11,2) NOT NULL DEFAULT '0.00' COMMENT '这一轮的余额',
  `min_money` decimal(11,2) NOT NULL DEFAULT '1.00' COMMENT '单个红包最少值',
  `max_money` decimal(11,2) NOT NULL COMMENT '单个红包最大值',
  `max_people` int(11) NOT NULL DEFAULT '0' COMMENT '这轮最多中奖人次,0为无限制',
  `gailv` int(11) NOT NULL DEFAULT '10' COMMENT '摇红包中奖概率',
  `black_num` tinyint(4) NOT NULL DEFAULT '1' COMMENT '这轮已经中奖的用户可以参加下一轮，1可以，2不可以',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_qianghongbao_round
-- ----------------------------
INSERT INTO `wx_qianghongbao_round` VALUES ('24', '753a52e736cf2019352d2a6ff2138783', '摇红包测试', '4', '1465308034', null, '1465292779', '4.00', '1.00', '1.00', '0', '100', '1');
INSERT INTO `wx_qianghongbao_round` VALUES ('25', '753a52e736cf2019352d2a6ff2138783', 'ceshi2', '4', '1465309601', null, '1465308951', '9.00', '1.00', '1.00', '0', '100', '1');

-- ----------------------------
-- Table structure for wx_shake
-- ----------------------------
DROP TABLE IF EXISTS `wx_shake`;
CREATE TABLE `wx_shake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) DEFAULT NULL,
  `title` varchar(255) NOT NULL COMMENT '标题',
  `max_shake` int(11) NOT NULL COMMENT '每人最大摇动次数',
  `max_shake_time` int(11) NOT NULL COMMENT '单位秒，活动持续时间',
  `down_count` int(11) NOT NULL DEFAULT '5' COMMENT '开始倒计时事件，单位秒',
  `show_award` int(11) NOT NULL COMMENT '显示中奖人数，最大9',
  `join_num` int(11) NOT NULL DEFAULT '0' COMMENT '参加摇一摇的人数设置，0为无限制',
  `black_num` int(11) NOT NULL DEFAULT '0' COMMENT '设置前几名用户无法参加以后的活动',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为关闭2为开启未进行，3进行中，4已结束',
  `u_time` int(11) NOT NULL COMMENT '创建时间',
  `c_time` int(11) NOT NULL DEFAULT '0' COMMENT '发起时间',
  `l_time` int(11) NOT NULL DEFAULT '0' COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_shake
-- ----------------------------
INSERT INTO `wx_shake` VALUES ('28', '753a52e736cf2019352d2a6ff2138783', '标题1', '100', '20', '0', '5', '0', '0', '4', '0', '1465045124', '1465045186');
INSERT INTO `wx_shake` VALUES ('29', '753a52e736cf2019352d2a6ff2138783', '标题2', '100', '20', '5', '5', '5', '0', '4', '0', '1465045368', '1465045424');
INSERT INTO `wx_shake` VALUES ('30', '753a52e736cf2019352d2a6ff2138783', '标题3', '100', '20', '0', '5', '0', '0', '4', '0', '213', '1464511685');
INSERT INTO `wx_shake` VALUES ('31', '753a52e736cf2019352d2a6ff2138783', '标题4', '100', '20', '0', '5', '0', '0', '4', '0', '213', '1464512578');
INSERT INTO `wx_shake` VALUES ('32', '753a52e736cf2019352d2a6ff2138783', '标题5', '100', '20', '0', '5', '0', '0', '4', '0', '213', '1464512654');
INSERT INTO `wx_shake` VALUES ('33', '753a52e736cf2019352d2a6ff2138783', '标题6', '100', '20', '0', '5', '0', '0', '4', '0', '1465032960', '1465033109');
INSERT INTO `wx_shake` VALUES ('34', '753a52e736cf2019352d2a6ff2138783', '摇一摇测试', '10', '20', '2', '1', '5', '2', '4', '1465046718', '1465047437', '1465047493');
INSERT INTO `wx_shake` VALUES ('35', '753a52e736cf2019352d2a6ff2138783', '摇一摇测试2', '6', '20', '1', '5', '5', '2', '4', '1465097636', '1465097733', '1465097785');
INSERT INTO `wx_shake` VALUES ('36', '753a52e736cf2019352d2a6ff2138783', '摇一摇测试3', '10', '10', '1', '5', '0', '0', '4', '1465097835', '1465097859', '1465097907');

-- ----------------------------
-- Table structure for wx_te
-- ----------------------------
DROP TABLE IF EXISTS `wx_te`;
CREATE TABLE `wx_te` (
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_te
-- ----------------------------
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');
INSERT INTO `wx_te` VALUES ('ok');

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orign_openid` varchar(255) NOT NULL COMMENT '微信原本的openid',
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
) ENGINE=MyISAM AUTO_INCREMENT=267 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES ('1', '', '1', '覃志鹏', '1', 'gd', 'gz', 'cn', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1', '1', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('2', '', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '社会主义接锅侠', '1', null, '广州', '中国', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OOzxQyJ36bMxf1wqpY8TELSpsxdice57UXXEJ2gnqzd60kcLsP93ial0NK7mKRR7hIpkRVjvCmlReGQ/0', '[]', null, '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('3', '', 'oi0qPwtC16bhg_KWhZNasyPO42gA', '牛牛', '1', null, '', '中国', 'http://wx.qlogo.cn/mmopen/Q3auHgzwzM5cKUqWW6TjKJygCHJstTRuiaU7Yy0zboOoHIemDrRGwnolpazVlHcJvOiaRASEmbsa63s5A26mfEicQ/0', '[]', null, '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('4', '', 'user_openid1', 'nickname1', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', '1', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('5', '', 'user_openid2', 'nickname2', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', '2', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('6', '', 'user_openid3', 'nickname3', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', '3', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('7', '', 'user_openid4', 'nickname4', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', '4', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('8', '', 'user_openid5', 'nickname5', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', '5', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('9', '', 'user_openid6', 'nickname6', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', '6', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('10', '', 'user_openid7', 'nickname7', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', '7', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('11', '', 'user_openid8', 'nickname8', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', '8', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('12', '', 'user_openid9', 'nickname9', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', '9', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('13', '', 'user_openid10', 'nickname10', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', '10', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('14', '', 'user_openid11', 'nickname11', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', '11', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('15', '', 'user_openid12', 'nickname12', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', '12', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('16', '', 'user_openid13', 'nickname13', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', '13', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('17', '', 'user_openid14', 'nickname14', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', '14', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('18', '', 'user_openid15', 'nickname15', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', '15', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('19', '', 'user_openid16', 'nickname16', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', '16', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('20', '', 'user_openid17', 'nickname17', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', '17', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('21', '', 'user_openid18', 'nickname18', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', '18', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('22', '', 'user_openid19', 'nickname19', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', '19', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('23', '', 'user_openid20', 'nickname20', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', '20', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('24', '', 'user_openid21', 'nickname21', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', '21', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('25', '', 'user_openid22', 'nickname22', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', '22', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('26', '', 'user_openid23', 'nickname23', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', '23', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('27', '', 'user_openid24', 'nickname24', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', '24', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('28', '', 'user_openid25', 'nickname25', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', '25', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('29', '', 'user_openid26', 'nickname26', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', '26', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('30', '', 'user_openid27', 'nickname27', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', '27', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('31', '', 'user_openid28', 'nickname28', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', '28', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('32', '', 'user_openid29', 'nickname29', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', '29', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('33', '', 'user_openid30', 'nickname30', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', '30', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('34', '', 'user_openid31', 'nickname31', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', '31', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('35', '', 'user_openid32', 'nickname32', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', '32', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('36', '', 'user_openid33', 'nickname33', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', '33', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('37', '', 'user_openid34', 'nickname34', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', '34', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('38', '', 'user_openid35', 'nickname35', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', '35', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('39', '', 'user_openid36', 'nickname36', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', '36', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('40', '', 'user_openid37', 'nickname37', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', '37', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('41', '', 'user_openid38', 'nickname38', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', '38', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('42', '', 'user_openid39', 'nickname39', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', '39', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('43', '', 'user_openid40', 'nickname40', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', '40', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('44', '', 'user_openid41', 'nickname41', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', '41', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('45', '', 'user_openid42', 'nickname42', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', '42', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('46', '', 'user_openid43', 'nickname43', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', '43', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('47', '', 'user_openid44', 'nickname44', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', '44', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('48', '', 'user_openid45', 'nickname45', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', '45', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('49', '', 'user_openid46', 'nickname46', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', '46', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('50', '', 'user_openid47', 'nickname47', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', '47', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('51', '', 'user_openid48', 'nickname48', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', '48', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('52', '', 'user_openid49', 'nickname49', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', '49', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('53', '', 'user_openid50', 'nickname50', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', '50', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('54', '', 'user_openid1', 'nickname1', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '1', '1', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('55', '', 'user_openid2', 'nickname2', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '2', '2', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('56', '', 'user_openid3', 'nickname3', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '3', '3', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('57', '', 'user_openid4', 'nickname4', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '4', '4', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('58', '', 'user_openid5', 'nickname5', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '5', '5', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('59', '', 'user_openid6', 'nickname6', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '6', '6', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('60', '', 'user_openid7', 'nickname7', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '7', '7', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('61', '', 'user_openid8', 'nickname8', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '8', '8', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('62', '', 'user_openid9', 'nickname9', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '9', '9', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('63', '', 'user_openid10', 'nickname10', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '10', '10', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('64', '', 'user_openid11', 'nickname11', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '11', '11', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('65', '', 'user_openid12', 'nickname12', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '12', '12', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('66', '', 'user_openid13', 'nickname13', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '13', '13', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('67', '', 'user_openid14', 'nickname14', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '14', '14', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('68', '', 'user_openid15', 'nickname15', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '15', '15', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('69', '', 'user_openid16', 'nickname16', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '16', '16', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('70', '', 'user_openid17', 'nickname17', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '17', '17', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('71', '', 'user_openid18', 'nickname18', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '18', '18', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('72', '', 'user_openid19', 'nickname19', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '19', '19', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('73', '', 'user_openid20', 'nickname20', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '20', '20', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('74', '', 'user_openid21', 'nickname21', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '21', '21', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('75', '', 'user_openid22', 'nickname22', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '22', '22', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('76', '', 'user_openid23', 'nickname23', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '23', '23', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('77', '', 'user_openid24', 'nickname24', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '24', '24', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('78', '', 'user_openid25', 'nickname25', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '25', '25', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('79', '', 'user_openid26', 'nickname26', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '26', '26', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('80', '', 'user_openid27', 'nickname27', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '27', '27', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('81', '', 'user_openid28', 'nickname28', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '28', '28', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('82', '', 'user_openid29', 'nickname29', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '29', '29', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('83', '', 'user_openid30', 'nickname30', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '30', '30', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('84', '', 'user_openid31', 'nickname31', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '31', '31', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('85', '', 'user_openid32', 'nickname32', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '32', '32', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('86', '', 'user_openid33', 'nickname33', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '33', '33', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('87', '', 'user_openid34', 'nickname34', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '34', '34', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('88', '', 'user_openid35', 'nickname35', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '35', '35', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('89', '', 'user_openid36', 'nickname36', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '36', '36', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('90', '', 'user_openid37', 'nickname37', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '37', '37', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('91', '', 'user_openid38', 'nickname38', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '38', '38', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('92', '', 'user_openid39', 'nickname39', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '39', '39', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('93', '', 'user_openid40', 'nickname40', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '40', '40', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('94', '', 'user_openid41', 'nickname41', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '41', '41', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('95', '', 'user_openid42', 'nickname42', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '42', '42', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('96', '', 'user_openid43', 'nickname43', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '43', '43', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('97', '', 'user_openid44', 'nickname44', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '44', '44', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('98', '', 'user_openid45', 'nickname45', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '45', '45', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('99', '', 'user_openid46', 'nickname46', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '46', '46', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('100', '', 'user_openid47', 'nickname47', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '47', '47', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('101', '', 'user_openid48', 'nickname48', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '48', '48', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('102', '', 'user_openid49', 'nickname49', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '49', '49', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('103', '', 'user_openid50', 'nickname50', '1', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '50', '50', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('104', '', 'user_openid51', 'lady51', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', '51', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('105', '', 'user_openid52', 'lady52', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', '52', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('106', '', 'user_openid53', 'lady53', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', '53', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('107', '', 'user_openid54', 'lady54', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', '54', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('108', '', 'user_openid55', 'lady55', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', '55', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('109', '', 'user_openid56', 'lady56', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', '56', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('110', '', 'user_openid57', 'lady57', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', '57', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('111', '', 'user_openid58', 'lady58', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', '58', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('112', '', 'user_openid59', 'lady59', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', '59', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('113', '', 'user_openid60', 'lady60', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', '60', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('114', '', 'user_openid61', 'lady61', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', '61', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('115', '', 'user_openid62', 'lady62', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', '62', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('116', '', 'user_openid63', 'lady63', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', '63', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('117', '', 'user_openid64', 'lady64', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', '64', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('118', '', 'user_openid65', 'lady65', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', '65', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('119', '', 'user_openid66', 'lady66', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', '66', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('120', '', 'user_openid67', 'lady67', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', '67', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('121', '', 'user_openid68', 'lady68', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', '68', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('122', '', 'user_openid69', 'lady69', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', '69', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('123', '', 'user_openid70', 'lady70', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', '70', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('124', '', 'user_openid71', 'lady71', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', '71', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('125', '', 'user_openid72', 'lady72', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', '72', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('126', '', 'user_openid73', 'lady73', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', '73', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('127', '', 'user_openid74', 'lady74', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', '74', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('128', '', 'user_openid75', 'lady75', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', '75', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('129', '', 'user_openid76', 'lady76', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', '76', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('130', '', 'user_openid77', 'lady77', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', '77', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('131', '', 'user_openid78', 'lady78', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', '78', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('132', '', 'user_openid79', 'lady79', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', '79', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('133', '', 'user_openid80', 'lady80', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', '80', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('134', '', 'user_openid81', 'lady81', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', '81', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('135', '', 'user_openid82', 'lady82', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', '82', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('136', '', 'user_openid83', 'lady83', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', '83', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('137', '', 'user_openid84', 'lady84', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', '84', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('138', '', 'user_openid85', 'lady85', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', '85', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('139', '', 'user_openid86', 'lady86', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', '86', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('140', '', 'user_openid87', 'lady87', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', '87', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('141', '', 'user_openid88', 'lady88', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', '88', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('142', '', 'user_openid89', 'lady89', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', '89', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('143', '', 'user_openid90', 'lady90', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', '90', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('144', '', 'user_openid91', 'lady91', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', '91', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('145', '', 'user_openid92', 'lady92', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', '92', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('146', '', 'user_openid93', 'lady93', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', '93', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('147', '', 'user_openid94', 'lady94', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', '94', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('148', '', 'user_openid95', 'lady95', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', '95', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('149', '', 'user_openid96', 'lady96', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', '96', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('150', '', 'user_openid97', 'lady97', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', '97', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('151', '', 'user_openid98', 'lady98', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', '98', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('152', '', 'user_openid99', 'lady99', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', '99', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('153', '', 'user_openid100', 'lady100', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '100', '100', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('154', '', 'user_openid51', 'lady51', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '51', '51', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('155', '', 'user_openid52', 'lady52', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '52', '52', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('156', '', 'user_openid53', 'lady53', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '53', '53', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('157', '', 'user_openid54', 'lady54', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '54', '54', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('158', '', 'user_openid55', 'lady55', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '55', '55', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('159', '', 'user_openid56', 'lady56', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '56', '56', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('160', '', 'user_openid57', 'lady57', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '57', '57', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('161', '', 'user_openid58', 'lady58', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '58', '58', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('162', '', 'user_openid59', 'lady59', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '59', '59', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('163', '', 'user_openid60', 'lady60', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '60', '60', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('164', '', 'user_openid61', 'lady61', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '61', '61', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('165', '', 'user_openid62', 'lady62', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '62', '62', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('166', '', 'user_openid63', 'lady63', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '63', '63', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('167', '', 'user_openid64', 'lady64', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '64', '64', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('168', '', 'user_openid65', 'lady65', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '65', '65', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('169', '', 'user_openid66', 'lady66', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '66', '66', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('170', '', 'user_openid67', 'lady67', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '67', '67', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('171', '', 'user_openid68', 'lady68', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '68', '68', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('172', '', 'user_openid69', 'lady69', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '69', '69', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('173', '', 'user_openid70', 'lady70', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '70', '70', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('174', '', 'user_openid71', 'lady71', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '71', '71', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('175', '', 'user_openid72', 'lady72', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '72', '72', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('176', '', 'user_openid73', 'lady73', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '73', '73', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('177', '', 'user_openid74', 'lady74', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '74', '74', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('178', '', 'user_openid75', 'lady75', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '75', '75', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('179', '', 'user_openid76', 'lady76', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '76', '76', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('180', '', 'user_openid77', 'lady77', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '77', '77', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('181', '', 'user_openid78', 'lady78', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '78', '78', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('182', '', 'user_openid79', 'lady79', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '79', '79', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('183', '', 'user_openid80', 'lady80', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '80', '80', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('184', '', 'user_openid81', 'lady81', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '81', '81', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('185', '', 'user_openid82', 'lady82', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '82', '82', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('186', '', 'user_openid83', 'lady83', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '83', '83', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('187', '', 'user_openid84', 'lady84', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '84', '84', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('188', '', 'user_openid85', 'lady85', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '85', '85', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('189', '', 'user_openid86', 'lady86', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '86', '86', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('190', '', 'user_openid87', 'lady87', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '87', '87', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('191', '', 'user_openid88', 'lady88', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '88', '88', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('192', '', 'user_openid89', 'lady89', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '89', '89', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('193', '', 'user_openid90', 'lady90', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '90', '90', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('194', '', 'user_openid91', 'lady91', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '91', '91', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('195', '', 'user_openid92', 'lady92', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '92', '92', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('196', '', 'user_openid93', 'lady93', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '93', '93', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('197', '', 'user_openid94', 'lady94', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '94', '94', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('198', '', 'user_openid95', 'lady95', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '95', '95', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('199', '', 'user_openid96', 'lady96', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '96', '96', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('200', '', 'user_openid97', 'lady97', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '97', '97', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('201', '', 'user_openid98', 'lady98', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '98', '98', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('202', '', 'user_openid99', 'lady99', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '99', '99', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('203', '', 'user_openid100', 'lady100', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '100', '100', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('204', '', 'user_openid101', 'lady101', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '101', '101', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('205', '', 'user_openid102', 'lady102', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '102', '102', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('206', '', 'user_openid103', 'lady103', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '103', '103', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('207', '', 'user_openid104', 'lady104', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '104', '104', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('208', '', 'user_openid105', 'lady105', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '105', '105', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('209', '', 'user_openid106', 'lady106', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '106', '106', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('210', '', 'user_openid107', 'lady107', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '107', '107', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('211', '', 'user_openid108', 'lady108', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '108', '108', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('212', '', 'user_openid109', 'lady109', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '109', '109', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('213', '', 'user_openid110', 'lady110', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '110', '110', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('214', '', 'user_openid111', 'lady111', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '111', '111', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('215', '', 'user_openid112', 'lady112', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '112', '112', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('216', '', 'user_openid113', 'lady113', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '113', '113', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('217', '', 'user_openid114', 'lady114', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '114', '114', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('218', '', 'user_openid115', 'lady115', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '115', '115', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('219', '', 'user_openid116', 'lady116', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '116', '116', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('220', '', 'user_openid117', 'lady117', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '117', '117', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('221', '', 'user_openid118', 'lady118', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '118', '118', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('222', '', 'user_openid119', 'lady119', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '119', '119', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('223', '', 'user_openid120', 'lady120', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '120', '120', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('224', '', 'user_openid121', 'lady121', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '121', '121', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('225', '', 'user_openid122', 'lady122', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '122', '122', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('226', '', 'user_openid123', 'lady123', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '123', '123', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('227', '', 'user_openid124', 'lady124', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '124', '124', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('228', '', 'user_openid125', 'lady125', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '125', '125', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('229', '', 'user_openid126', 'lady126', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '126', '126', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('230', '', 'user_openid127', 'lady127', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '127', '127', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('231', '', 'user_openid128', 'lady128', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '128', '128', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('232', '', 'user_openid129', 'lady129', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '129', '129', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('233', '', 'user_openid130', 'lady130', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '130', '130', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('234', '', 'user_openid101', 'lady101', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '101', '101', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('235', '', 'user_openid102', 'lady102', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '102', '102', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('236', '', 'user_openid103', 'lady103', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '103', '103', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('237', '', 'user_openid104', 'lady104', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '104', '104', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('238', '', 'user_openid105', 'lady105', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '105', '105', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('239', '', 'user_openid106', 'lady106', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '106', '106', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('240', '', 'user_openid107', 'lady107', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '107', '107', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('241', '', 'user_openid108', 'lady108', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '108', '108', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('242', '', 'user_openid109', 'lady109', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '109', '109', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('243', '', 'user_openid110', 'lady110', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '110', '110', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('244', '', 'user_openid111', 'lady111', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '111', '111', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('245', '', 'user_openid112', 'lady112', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '112', '112', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('246', '', 'user_openid113', 'lady113', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '113', '113', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('247', '', 'user_openid114', 'lady114', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '114', '114', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('248', '', 'user_openid115', 'lady115', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '115', '115', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('249', '', 'user_openid116', 'lady116', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '116', '116', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('250', '', 'user_openid117', 'lady117', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '117', '117', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('251', '', 'user_openid118', 'lady118', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '118', '118', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('252', '', 'user_openid119', 'lady119', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '119', '119', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('253', '', 'user_openid120', 'lady120', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '120', '120', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('254', '', 'user_openid121', 'lady121', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '121', '121', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('255', '', 'user_openid122', 'lady122', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '122', '122', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('256', '', 'user_openid123', 'lady123', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '123', '123', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('257', '', 'user_openid124', 'lady124', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '124', '124', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('258', '', 'user_openid125', 'lady125', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '125', '125', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('259', '', 'user_openid126', 'lady126', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '126', '126', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('260', '', 'user_openid127', 'lady127', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '127', '127', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('261', '', 'user_openid128', 'lady128', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '128', '128', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('262', '', 'user_openid129', 'lady129', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '129', '129', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('263', '', 'user_openid130', 'lady130', '2', '1', '1', '1', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', '130', '130', '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('264', '', 'oi0qPwkdbT7WPdXuvKjpR0x5_VIU', '开心一族', '0', null, '', '中国', 'http://wx.qlogo.cn/mmopen/wXJ5kSJT6OP6v78OA2ka0X1iamuDJuPYZnY4IP60odbGdibZKp5xY9hbll9shzuupJO2mUurkeD27ibl5ibGjDHKjC1fIkT4BNFY/0', '[]', null, '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('265', '', 'oi0qPwmmrp1Uo59zw98jz8xbrDFw', 'immortalDark', '1', null, '广州', '中国', 'http://wx.qlogo.cn/mmopen/QjSJUDRGAQFOwn9rickOhzsH56bKxt8tTgM9f8DX8kdYuFibqlvgjW8t4K5Hh1WccEBY1bLOnoU00EZlBYVgvSlbnCJdP3loOh/0', '[]', null, '753a52e736cf2019352d2a6ff2138783', '1');
INSERT INTO `wx_user` VALUES ('266', '', 'oi0qPwlK4YttgIlJpTnrktXwL0Rc', '鞋好闻童鞋', '1', null, '惠州', '中国', 'http://wx.qlogo.cn/mmopen/4AqhHF5EicR0YtJQEHqLwWBQwnqPmBia49rjQev9kyYhTAj1oaVj2CqyFJ4Tkn9twUUhmHFFQwNbPZDnfHcLwayQ/0', '[]', null, '753a52e736cf2019352d2a6ff2138783', '1');

-- ----------------------------
-- Table structure for wx_user_award
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_award`;
CREATE TABLE `wx_user_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '活动唯一标识',
  `user_openid` varchar(255) NOT NULL COMMENT '用户唯一标识',
  `dsid` int(11) NOT NULL COMMENT '打赏项目的对应id',
  `money` decimal(10,2) NOT NULL COMMENT '打赏的金额单位元',
  `u_time` int(11) NOT NULL COMMENT '打赏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_award
-- ----------------------------
INSERT INTO `wx_user_award` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '1.00', '1464767623');
INSERT INTO `wx_user_award` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '1.00', '1464767667');
INSERT INTO `wx_user_award` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '1.00', '1464767671');
INSERT INTO `wx_user_award` VALUES ('4', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '0.00', '1464767786');
INSERT INTO `wx_user_award` VALUES ('5', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '1.00', '1464768162');
INSERT INTO `wx_user_award` VALUES ('6', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '1.00', '1464768219');
INSERT INTO `wx_user_award` VALUES ('7', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '0.00', '1464768233');
INSERT INTO `wx_user_award` VALUES ('8', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '0.01', '1464768347');
INSERT INTO `wx_user_award` VALUES ('9', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '0.01', '1464768348');
INSERT INTO `wx_user_award` VALUES ('10', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '3', '0.01', '1464768444');
INSERT INTO `wx_user_award` VALUES ('11', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '0.01', '1464770695');
INSERT INTO `wx_user_award` VALUES ('12', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '0.01', '1464770697');
INSERT INTO `wx_user_award` VALUES ('13', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '0.01', '1464770707');
INSERT INTO `wx_user_award` VALUES ('14', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '0.01', '1464770723');
INSERT INTO `wx_user_award` VALUES ('15', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '0.01', '1464770755');
INSERT INTO `wx_user_award` VALUES ('16', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '0.01', '1464770938');
INSERT INTO `wx_user_award` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '0.01', '1464771267');
INSERT INTO `wx_user_award` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '4', '0.01', '1464772721');
INSERT INTO `wx_user_award` VALUES ('19', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '5', '0.02', '1464772849');
INSERT INTO `wx_user_award` VALUES ('20', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '5', '0.01', '1464772913');
INSERT INTO `wx_user_award` VALUES ('21', '753a52e736cf2019352d2a6ff2138783', 'user_openid1', '1', '0.01', '1464772913');
INSERT INTO `wx_user_award` VALUES ('22', '753a52e736cf2019352d2a6ff2138783', 'user_openid1', '1', '0.01', '1464772913');
INSERT INTO `wx_user_award` VALUES ('23', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '0.01', '1465181104');

-- ----------------------------
-- Table structure for wx_user_choujiang
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_choujiang`;
CREATE TABLE `wx_user_choujiang` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `nickname` varchar(255) NOT NULL,
  `c_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_choujiang
-- ----------------------------
INSERT INTO `wx_user_choujiang` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', 'user_openid23', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname23', '1465120401');
INSERT INTO `wx_user_choujiang` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', 'user_openid16', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname16', '1465120401');
INSERT INTO `wx_user_choujiang` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', 'user_openid17', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname17', '1465120401');
INSERT INTO `wx_user_choujiang` VALUES ('4', '753a52e736cf2019352d2a6ff2138783', 'user_openid31', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname31', '1465120585');
INSERT INTO `wx_user_choujiang` VALUES ('5', '753a52e736cf2019352d2a6ff2138783', 'user_openid18', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname18', '1465120585');
INSERT INTO `wx_user_choujiang` VALUES ('6', '753a52e736cf2019352d2a6ff2138783', 'user_openid19', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname19', '1465120585');
INSERT INTO `wx_user_choujiang` VALUES ('7', '753a52e736cf2019352d2a6ff2138783', 'user_openid20', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname20', '1465120585');
INSERT INTO `wx_user_choujiang` VALUES ('8', '753a52e736cf2019352d2a6ff2138783', 'user_openid21', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname21', '1465120585');
INSERT INTO `wx_user_choujiang` VALUES ('9', '753a52e736cf2019352d2a6ff2138783', 'user_openid22', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname22', '1465120585');
INSERT INTO `wx_user_choujiang` VALUES ('11', '753a52e736cf2019352d2a6ff2138783', 'user_openid32', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname32', '1465121102');
INSERT INTO `wx_user_choujiang` VALUES ('12', '753a52e736cf2019352d2a6ff2138783', 'user_openid33', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname33', '1465121102');
INSERT INTO `wx_user_choujiang` VALUES ('13', '753a52e736cf2019352d2a6ff2138783', 'user_openid34', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname34', '1465121102');
INSERT INTO `wx_user_choujiang` VALUES ('14', '753a52e736cf2019352d2a6ff2138783', 'user_openid35', 'http://passport.onethink.cn/Avatar/000/007/90/43/80_80.gif', 'nickname35', '1465121102');

-- ----------------------------
-- Table structure for wx_user_dazhuanpan
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_dazhuanpan`;
CREATE TABLE `wx_user_dazhuanpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `d_id` int(11) NOT NULL COMMENT '大转盘的id',
  `name` varchar(255) NOT NULL COMMENT '奖品名称',
  `level` varchar(255) NOT NULL COMMENT '奖品等级',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为未兑现2为正在申请3为已兑现4为已取消',
  `c_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_dazhuanpan
-- ----------------------------
INSERT INTO `wx_user_dazhuanpan` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '', '10元', '1', '1464596603');
INSERT INTO `wx_user_dazhuanpan` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '', '10元', '1', '1464596537');
INSERT INTO `wx_user_dazhuanpan` VALUES ('4', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '谢谢参与', '谢谢参与', '2', '1465139900');

-- ----------------------------
-- Table structure for wx_user_qianghongbao
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_qianghongbao`;
CREATE TABLE `wx_user_qianghongbao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `round_id` int(11) NOT NULL COMMENT '对应的qianghongbao_round的id',
  `money` decimal(10,2) NOT NULL COMMENT '随机的钱',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1为未发钱2为已申请提现3为成功提现4为失败提现',
  `c_time` int(11) NOT NULL,
  `l_time` int(11) DEFAULT NULL COMMENT '提现的钱',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_qianghongbao
-- ----------------------------
INSERT INTO `wx_user_qianghongbao` VALUES ('88', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '24', '1.00', '3', '1465308730', '1465308730');
INSERT INTO `wx_user_qianghongbao` VALUES ('89', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '25', '1.00', '3', '1465309009', '1465309009');
INSERT INTO `wx_user_qianghongbao` VALUES ('90', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '25', '1.00', '3', '1465309602', '1465309602');

-- ----------------------------
-- Table structure for wx_user_shake
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_shake`;
CREATE TABLE `wx_user_shake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `shake_id` int(11) NOT NULL COMMENT '摇一摇活动的id',
  `user_id` int(11) NOT NULL,
  `shake_count` int(11) NOT NULL COMMENT '摇动总次数',
  `ranking` int(11) NOT NULL COMMENT '排名',
  `c_time` int(11) NOT NULL COMMENT '参与时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_shake
-- ----------------------------
INSERT INTO `wx_user_shake` VALUES ('1', '753', '27', '2', '16', '1', '1464510109');
INSERT INTO `wx_user_shake` VALUES ('2', '753', '27', '2', '0', '1', '1464510109');
INSERT INTO `wx_user_shake` VALUES ('3', '753', '28', '2', '12', '1', '1464511260');
INSERT INTO `wx_user_shake` VALUES ('4', '753', '28', '264', '7', '2', '1464511273');
INSERT INTO `wx_user_shake` VALUES ('5', '753', '29', '264', '6', '1', '1464511513');
INSERT INTO `wx_user_shake` VALUES ('6', '753', '29', '2', '3', '2', '1464511504');
INSERT INTO `wx_user_shake` VALUES ('7', '753', '30', '2', '14', '1', '1464511684');
INSERT INTO `wx_user_shake` VALUES ('8', '753a52e736cf2019352d2a6ff2138783', '31', '2', '24', '1', '1464512562');
INSERT INTO `wx_user_shake` VALUES ('9', '753a52e736cf2019352d2a6ff2138783', '32', '2', '16', '1', '1464512653');
INSERT INTO `wx_user_shake` VALUES ('10', '753a52e736cf2019352d2a6ff2138783', '34', '2', '10', '1', '1465047493');
INSERT INTO `wx_user_shake` VALUES ('11', '753a52e736cf2019352d2a6ff2138783', '35', '2', '6', '1', '1465097784');

-- ----------------------------
-- Table structure for wx_user_shake_blacklist
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_shake_blacklist`;
CREATE TABLE `wx_user_shake_blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `huodong_openid` varchar(255) NOT NULL,
  `shake_id` int(11) NOT NULL COMMENT '哪轮摇一摇被拉黑',
  `c_time` int(11) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1被拉黑，2取消拉黑',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_shake_blacklist
-- ----------------------------
INSERT INTO `wx_user_shake_blacklist` VALUES ('1', '2', '753a52e736cf2019352d2a6ff2138783', '35', '1465097785', '1');

-- ----------------------------
-- Table structure for wx_user_vote
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_vote`;
CREATE TABLE `wx_user_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `tpid` int(11) NOT NULL COMMENT '投票项目的id',
  `c_time` int(11) NOT NULL COMMENT '投票时间s',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_vote
-- ----------------------------
INSERT INTO `wx_user_vote` VALUES ('27', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '1464334255');
INSERT INTO `wx_user_vote` VALUES ('26', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '3', '1464334252');

-- ----------------------------
-- Table structure for wx_vote
-- ----------------------------
DROP TABLE IF EXISTS `wx_vote`;
CREATE TABLE `wx_vote` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL COMMENT '投票项目标题',
  `imgurl` varchar(255) NOT NULL COMMENT '投票项目的封面图',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '该投票的票数',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_vote
-- ----------------------------
INSERT INTO `wx_vote` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '个性签到墙', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-04/57528c8a55d9a.jpg', '10', '1');
INSERT INTO `wx_vote` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '打赏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '9', '2');
INSERT INTO `wx_vote` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '4', '3');
INSERT INTO `wx_vote` VALUES ('4', '753a52e736cf2019352d2a6ff2138783', '投票2', 'http://weixinimgcdn.b0.upaiyun.com/2016-06-04/5752947464f56.jpg', '0', '1465029757');

-- ----------------------------
-- Table structure for wx_wish
-- ----------------------------
DROP TABLE IF EXISTS `wx_wish`;
CREATE TABLE `wx_wish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `wish_id` int(11) DEFAULT NULL COMMENT '许愿设置的id',
  `text` varchar(255) NOT NULL COMMENT '文本',
  `utime` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1已上墙2未上墙',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_wish
-- ----------------------------
INSERT INTO `wx_wish` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654004', '2');
INSERT INTO `wx_wish` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654064', '2');
INSERT INTO `wx_wish` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654340', '2');
INSERT INTO `wx_wish` VALUES ('4', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654367', '2');
INSERT INTO `wx_wish` VALUES ('5', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654405', '2');
INSERT INTO `wx_wish` VALUES ('6', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654485', '2');
INSERT INTO `wx_wish` VALUES ('7', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654530', '2');
INSERT INTO `wx_wish` VALUES ('8', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654546', '2');
INSERT INTO `wx_wish` VALUES ('9', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654612', '2');
INSERT INTO `wx_wish` VALUES ('10', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654818', '2');
INSERT INTO `wx_wish` VALUES ('11', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654820', '2');
INSERT INTO `wx_wish` VALUES ('12', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463654970', '2');
INSERT INTO `wx_wish` VALUES ('13', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463655209', '2');
INSERT INTO `wx_wish` VALUES ('14', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463655272', '2');
INSERT INTO `wx_wish` VALUES ('15', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463655848', '2');
INSERT INTO `wx_wish` VALUES ('16', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463656669', '2');
INSERT INTO `wx_wish` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463656765', '1');
INSERT INTO `wx_wish` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463724332', '1');
INSERT INTO `wx_wish` VALUES ('19', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao', '1463724453', '1');
INSERT INTO `wx_wish` VALUES ('20', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'nihao222', '1463724728', '1');
INSERT INTO `wx_wish` VALUES ('21', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'ceshishis', '1464601982', '1');
INSERT INTO `wx_wish` VALUES ('22', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'haha', '1464602314', '1');
INSERT INTO `wx_wish` VALUES ('23', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', 'heheh', '1464602332', '1');
INSERT INTO `wx_wish` VALUES ('24', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '张学友', '1464602443', '1');
INSERT INTO `wx_wish` VALUES ('25', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '非洲', '1464602513', '1');
INSERT INTO `wx_wish` VALUES ('26', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '无线', '1464603539', '1');
INSERT INTO `wx_wish` VALUES ('27', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '真的可以去', '1464603569', '1');
INSERT INTO `wx_wish` VALUES ('28', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '1', '哈哈哈', '1464603575', '1');
INSERT INTO `wx_wish` VALUES ('29', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '哈哈啊', '1464623112', '1');
INSERT INTO `wx_wish` VALUES ('30', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '2', '？？', '1464623129', '1');
INSERT INTO `wx_wish` VALUES ('31', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '3', '哈哈哈这个', '1464623370', '1');
INSERT INTO `wx_wish` VALUES ('32', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '3', 'Test', '1464623378', '1');
INSERT INTO `wx_wish` VALUES ('33', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '3', '速度的', '1464623393', '1');
INSERT INTO `wx_wish` VALUES ('34', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '3', '？？？？', '1465181077', '2');
INSERT INTO `wx_wish` VALUES ('35', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwmmrp1Uo59zw98jz8xbrDFw', '3', '黑夜传说', '1465182616', '1');
INSERT INTO `wx_wish` VALUES ('36', '753a52e736cf2019352d2a6ff2138783', 'oi0qPwmmrp1Uo59zw98jz8xbrDFw', '3', '增进楼主要是我都系度过来了', '1465182653', '1');

-- ----------------------------
-- Table structure for wx_wish_config
-- ----------------------------
DROP TABLE IF EXISTS `wx_wish_config`;
CREATE TABLE `wx_wish_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `wish_name` varchar(255) NOT NULL COMMENT '许愿的主题',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为关闭二为开启',
  `wish_check` int(11) DEFAULT '1' COMMENT '愿望树1为关闭审核自动上墙，2为开启审核',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_wish_config
-- ----------------------------
INSERT INTO `wx_wish_config` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', '快来许愿2', '2', '2');
