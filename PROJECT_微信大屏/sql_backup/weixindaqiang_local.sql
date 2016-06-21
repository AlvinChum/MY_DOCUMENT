/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50547
Source Host           : localhost:3306
Source Database       : weixindaqiang

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-06-01 17:24:44
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
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_admin_auth
-- ----------------------------
INSERT INTO `wx_admin_auth` VALUES ('12', '753a52e736cf2019352d2a6ff2138783', '10');
INSERT INTO `wx_admin_auth` VALUES ('11', '8310f87332120d904eb9bbb6d2d633a6', '10');

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
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_admin_user
-- ----------------------------
INSERT INTO `wx_admin_user` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', '2016-05-27 18:49:03', '::1', '20', '99');
INSERT INTO `wx_admin_user` VALUES ('2', 'test', '21232f297a57a5a743894a0e4a801fc3', null, null, null, '1');
INSERT INTO `wx_admin_user` VALUES ('10', '微信大墙', 'e10adc3949ba59abbe56e057f20f883e', '2016-04-27 17:53:43', '::1', '2', '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_award
-- ----------------------------
INSERT INTO `wx_award` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '互动消息墙', 'www.douyutv.com', '1');
INSERT INTO `wx_award` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '拼手气抢红包', 'www.bilibili.tv', '2');
INSERT INTO `wx_award` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖', 'www.acfun.tv', '3');

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_config
-- ----------------------------
INSERT INTO `wx_config` VALUES ('1', 'mob_server', 'http://weixinmob.gzaojun.com');
INSERT INTO `wx_config` VALUES ('2', 'api_server', 'http://weixinapi.gzaojun.com');
INSERT INTO `wx_config` VALUES ('3', 'web_server', 'http://weixinweb.gzaojun.com');
INSERT INTO `wx_config` VALUES ('4', 'back_server', 'http://weixinback.gzaojun.com');
INSERT INTO `wx_config` VALUES ('5', 'img_server', 'http://weixinimgcdn.b0.upaiyun.com');
INSERT INTO `wx_config` VALUES ('6', 'server_ip', '123.59.43.119');

-- ----------------------------
-- Table structure for wx_dazhuanpan
-- ----------------------------
DROP TABLE IF EXISTS `wx_dazhuanpan`;
CREATE TABLE `wx_dazhuanpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL COMMENT '大转盘主题',
  `award` text NOT NULL COMMENT '奖品名称，用‘，’分开',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1关闭2开启',
  `c_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_dazhuanpan
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

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
INSERT INTO `wx_function` VALUES ('1', 'dq', '大墙', '1', 'shangqiang', null);
INSERT INTO `wx_function` VALUES ('2', 'cj', '摇奖', '0', 'yaojiang', '#EE9A59');
INSERT INTO `wx_function` VALUES ('3', 'ddp', '对对碰', '0', 'duiduipeng', '#FB5184');
INSERT INTO `wx_function` VALUES ('4', 'tm', '弹幕', '0', 'danmu', '#F0C30F');
INSERT INTO `wx_function` VALUES ('5', 'xydzp', '大转盘', '0', 'dazhuanpan', '#3AA2C0');
INSERT INTO `wx_function` VALUES ('6', 'xys', '许愿树', '0', 'xuyuanshu', ' #A8C42F;margin-bottom: 16px');
INSERT INTO `wx_function` VALUES ('7', 'qdq', '签到墙', '0', 'qiandaoqiang', '#884949');
INSERT INTO `wx_function` VALUES ('8', '3dqdq', '3D签到墙', '0', '3dqiandaoqiang', '#044A42');
INSERT INTO `wx_function` VALUES ('9', 'yyy', '摇一摇', '0', 'yaoyiyao', '#377FD8');
INSERT INTO `wx_function` VALUES ('10', 'yhb', '摇红包', '0', 'yaohongbao', '#C73B3B');
INSERT INTO `wx_function` VALUES ('11', 'jbzs', '嘉宾展示', '0', 'jiabinzhanshi', '#34495E');
INSERT INTO `wx_function` VALUES ('12', 'ewm', '二维码', '0', 'erweima', null);
INSERT INTO `wx_function` VALUES ('13', 'tp', '投票', '0', 'toupiao', '#D6C0DF');
INSERT INTO `wx_function` VALUES ('14', 'ds', '打赏', '0', 'dashang', '#37B6B4');

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
  `wish_check` tinyint(4) NOT NULL DEFAULT '1' COMMENT '愿望树1为关闭审核自动上墙，2为开启审核',
  `yaojiang_num` int(11) DEFAULT '0' COMMENT '参加摇奖的人数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_huodong
-- ----------------------------
INSERT INTO `wx_huodong` VALUES ('1', '8310f87332120d904eb9bbb6d2d633a6', '微博之夜', null, null, '1464692400', '1', 'www.baj.com', 'www.daf.com', 'sdj23234d2', '', 'http://weixinweb.gzaojun.com/Home/Oauth/get_oauth', '1461580593', '2,3,4,9,10,11,12,13,14', '1', '1', '1', '0', '1', null);
INSERT INTO `wx_huodong` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '微信大墙', '傲骏', '微信大墙测试', '0', '0', 'www.baj.com', 'www.daf.com', 'wx6668a266b6ecdf30', 'e6e7ad19556f9b9d427026d513022432', 'http://weixinmob.gzaojun.com/Home/Oauth/get_oauth', '1461829310', '2,3,4,5,6,7,8,9,10,11,12,13,14', '1', '1', '1', '2', '2', null);

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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_jiabin
-- ----------------------------
INSERT INTO `wx_jiabin` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '马云', 'https://ss0.bdstatic.com/94oJfD_bAAcT8t7mm9GUKT-xh_/timg?image&quality=100&size=b4000_4000&sec=1464619432&di=22aea29bd1d58f2a930e74859389e583&src=http://www.cnr.cn/jingji/gs/201305/W020130511631480027123.jpg', '阿里巴巴与四十大盗', ' 阿里巴巴集团主要创始人，现担任阿里巴巴集团董事局主席、日本软银董事、TNC（大自然保护协会）中国理事会主席兼全球董事会成员、华谊兄弟董事、生命科学突破奖基金会董事');
INSERT INTO `wx_jiabin` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '马化腾', 'http://f.hiphotos.baidu.com/baike/w%3D268%3Bg%3D0/sign=3a59720eb18f8c54e3d3c22902124ac8/060828381f30e9242d9128d149086e061d95f71d.jpg', '腾讯公司控股董事会主席', '综合排名全球第45位，财务表现排名第2位——在本次《哈佛商业评论·全球最佳CEO》的排行榜中，腾讯董事会主席兼首席执行官马化腾成为中国内地惟一上榜的企业家');

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
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_message
-- ----------------------------
INSERT INTO `wx_message` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1461840301', 'text', 'hello world', null, '1');
INSERT INTO `wx_message` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1461840419', 'text', 'hello world', null, '1');
INSERT INTO `wx_message` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1461840478', 'text', 'hello world', null, '1');
INSERT INTO `wx_message` VALUES ('16', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264449', 'text', 'hello worlds', null, '1');
INSERT INTO `wx_message` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264464', 'text', 'hello worlds', null, '1');
INSERT INTO `wx_message` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264517', 'text', 'hello worlds', null, '2');
INSERT INTO `wx_message` VALUES ('19', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264679', 'text', 'hello worlds', null, '2');
INSERT INTO `wx_message` VALUES ('20', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264716', 'text', 'hello worlds', null, '2');
INSERT INTO `wx_message` VALUES ('21', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264775', 'text', 'hello worlds', null, '1');
INSERT INTO `wx_message` VALUES ('22', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264807', 'pic', null, 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1');
INSERT INTO `wx_message` VALUES ('23', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264822', 'pic', null, 'http://www.liantu.com/images/2013/case/2.jpg', '1');
INSERT INTO `wx_message` VALUES ('24', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462264856', 'pic', null, 'http://www.liantu.com/images/2013/case/2.jpg', '1');
INSERT INTO `wx_message` VALUES ('25', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462265075', 'pic', null, 'http://www.liantu.com/images/2013/case/2.jpg', '1');
INSERT INTO `wx_message` VALUES ('26', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1462265084', 'text', 'hello worlds', null, '1');

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
) ENGINE=MyISAM AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_program
-- ----------------------------
INSERT INTO `wx_program` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', '揭幕', '1', '10:00', '11:00', '1', '1461648859');
INSERT INTO `wx_program` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', '节目1', '1', '11:00', '12：00', '2', '1461648881');
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
  `department_name` varchar(255) NOT NULL COMMENT '用户部门',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_qiandao
-- ----------------------------
INSERT INTO `wx_qiandao` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '1', '覃志鹏', '1', 'www.baidu.com', '1591576219', 'chumchipang');

-- ----------------------------
-- Table structure for wx_qianghongbao_round
-- ----------------------------
DROP TABLE IF EXISTS `wx_qianghongbao_round`;
CREATE TABLE `wx_qianghongbao_round` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `status` int(255) NOT NULL DEFAULT '1' COMMENT '1为开启2为关闭',
  `c_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_qianghongbao_round
-- ----------------------------

-- ----------------------------
-- Table structure for wx_shake
-- ----------------------------
DROP TABLE IF EXISTS `wx_shake`;
CREATE TABLE `wx_shake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) DEFAULT NULL,
  `max_shake` int(11) NOT NULL COMMENT '每人最大摇动次数',
  `max_shake_time` int(11) NOT NULL COMMENT '单位秒，活动持续时间',
  `down_count` int(11) NOT NULL DEFAULT '5' COMMENT '开始倒计时事件，单位秒',
  `show_award` int(11) NOT NULL COMMENT '显示中奖人数，最大10',
  `join_num` int(11) NOT NULL DEFAULT '0' COMMENT '参加摇一摇的人数设置，0为无限制',
  `black_num` int(11) NOT NULL DEFAULT '0' COMMENT '设置前几名用户无法参加以后的活动',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为关闭2为开启',
  `c_time` int(11) NOT NULL COMMENT '创建时间',
  `l_time` int(11) NOT NULL COMMENT '结束时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_shake
-- ----------------------------
INSERT INTO `wx_shake` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '100', '60', '10', '5', '0', '0', '2', '213', '0');

-- ----------------------------
-- Table structure for wx_user
-- ----------------------------
DROP TABLE IF EXISTS `wx_user`;
CREATE TABLE `wx_user` (
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
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user
-- ----------------------------
INSERT INTO `wx_user` VALUES ('1', 'oi0qPwlrXUhhaH0m8A1C0E4wEKZI', '覃志鹏', '1', 'gd', 'gz', 'cn', 'http://wenda.workerman.net/uploads/avatar/000/00/00/01_avatar_mid.jpg', '1', '1', '753a52e736cf2019352d2a6ff2138783', '1');

-- ----------------------------
-- Table structure for wx_user_award
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_award`;
CREATE TABLE `wx_user_award` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL COMMENT '活动唯一标识',
  `user_openid` varchar(255) NOT NULL COMMENT '用户唯一标识',
  `dsid` int(11) NOT NULL COMMENT '打赏项目的对应id',
  `money` decimal(10,0) NOT NULL COMMENT '打赏的金额',
  `u_time` int(11) NOT NULL COMMENT '打赏时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_award
-- ----------------------------

-- ----------------------------
-- Table structure for wx_user_dazhuanpan
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_dazhuanpan`;
CREATE TABLE `wx_user_dazhuanpan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `user_openid` varchar(255) NOT NULL,
  `d_id` int(11) NOT NULL COMMENT '大转盘的id',
  `award` varchar(255) NOT NULL COMMENT '奖品名称',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT '1为未兑现2为正在申请3为已兑现4为已取消',
  `c_time` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_dazhuanpan
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_qianghongbao
-- ----------------------------
INSERT INTO `wx_user_qianghongbao` VALUES ('1', '1', '1', '1', '2.00', '1', '1', null);
INSERT INTO `wx_user_qianghongbao` VALUES ('2', '1', '1', '1', '3.00', '1', '1', null);
INSERT INTO `wx_user_qianghongbao` VALUES ('3', '1', '2', '1', '8.00', '1', '1', null);
INSERT INTO `wx_user_qianghongbao` VALUES ('4', '1', '2', '1', '3.00', '1', '1', null);
INSERT INTO `wx_user_qianghongbao` VALUES ('5', '1', '3', '1', '2.00', '1', '1', null);

-- ----------------------------
-- Table structure for wx_user_shake
-- ----------------------------
DROP TABLE IF EXISTS `wx_user_shake`;
CREATE TABLE `wx_user_shake` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` int(11) NOT NULL,
  `shake_id` int(11) NOT NULL COMMENT '摇一摇活动的id',
  `user_id` int(11) NOT NULL,
  `shake_count` int(11) NOT NULL COMMENT '摇动总次数',
  `ranking` int(11) NOT NULL COMMENT '排名',
  `c_time` int(11) NOT NULL COMMENT '参与时间',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_shake
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_shake_blacklist
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_user_vote
-- ----------------------------
INSERT INTO `wx_user_vote` VALUES ('5', '753a52e736cf2019352d2a6ff2138783', '1', '1', '1462332576');
INSERT INTO `wx_user_vote` VALUES ('6', '753a52e736cf2019352d2a6ff2138783', '1', '2', '1462332601');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_vote
-- ----------------------------
INSERT INTO `wx_vote` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', '个性签到墙', 'http://y.zdmimg.com/201605/26/5746c991c2a075751.jpg_d200.jpg', '1', '1');
INSERT INTO `wx_vote` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', '打赏', 'http://y.zdmimg.com/201605/07/572d8842bf6a13491.png_d200.jpg', '1', '2');
INSERT INTO `wx_vote` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', '摇一摇抽奖', 'http://ym.zdmimg.com/201512/12/566c07487ee96.jpg_d200.jpg', '0', '3');

-- ----------------------------
-- Table structure for wx_wish
-- ----------------------------
DROP TABLE IF EXISTS `wx_wish`;
CREATE TABLE `wx_wish` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `huodong_openid` varchar(255) NOT NULL,
  `wish_id` int(11) DEFAULT NULL COMMENT '许愿设置的id',
  `user_openid` varchar(255) NOT NULL,
  `text` varchar(255) NOT NULL COMMENT '文本',
  `utime` int(11) NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1已上墙2未上墙',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_wish
-- ----------------------------
INSERT INTO `wx_wish` VALUES ('1', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654004', '2');
INSERT INTO `wx_wish` VALUES ('2', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654064', '2');
INSERT INTO `wx_wish` VALUES ('3', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654340', '2');
INSERT INTO `wx_wish` VALUES ('4', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654367', '2');
INSERT INTO `wx_wish` VALUES ('5', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654405', '1');
INSERT INTO `wx_wish` VALUES ('6', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654485', '1');
INSERT INTO `wx_wish` VALUES ('7', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654530', '1');
INSERT INTO `wx_wish` VALUES ('8', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654546', '1');
INSERT INTO `wx_wish` VALUES ('9', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654612', '1');
INSERT INTO `wx_wish` VALUES ('10', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654818', '1');
INSERT INTO `wx_wish` VALUES ('11', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654820', '1');
INSERT INTO `wx_wish` VALUES ('12', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463654970', '1');
INSERT INTO `wx_wish` VALUES ('13', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463655209', '1');
INSERT INTO `wx_wish` VALUES ('14', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463655272', '1');
INSERT INTO `wx_wish` VALUES ('15', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463655848', '1');
INSERT INTO `wx_wish` VALUES ('16', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463656669', '1');
INSERT INTO `wx_wish` VALUES ('17', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463656765', '1');
INSERT INTO `wx_wish` VALUES ('18', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463724332', '1');
INSERT INTO `wx_wish` VALUES ('19', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao', '1463724453', '1');
INSERT INTO `wx_wish` VALUES ('20', '753a52e736cf2019352d2a6ff2138783', null, '1', 'nihao222', '1463724728', '2');

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_wish_config
-- ----------------------------
