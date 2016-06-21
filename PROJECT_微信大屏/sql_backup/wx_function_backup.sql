/*
Navicat MySQL Data Transfer

Source Server         : 阿里云
Source Server Version : 50173
Source Host           : 123.59.43.119:3306
Source Database       : weixindaqiang

Target Server Type    : MYSQL
Target Server Version : 50173
File Encoding         : 65001

Date: 2016-06-02 14:27:04
*/

SET FOREIGN_KEY_CHECKS=0;

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
INSERT INTO `wx_function` VALUES ('6', 'xys', '许愿树', '0', 'xuyuanshu', ' #A8C42F');
INSERT INTO `wx_function` VALUES ('7', 'qdq', '签到墙', '0', 'qiandaoqiang', '#884949');
INSERT INTO `wx_function` VALUES ('8', '3dqdq', '3D签到墙', '0', '3dqiandaoqiang', '#044A42');
INSERT INTO `wx_function` VALUES ('9', 'yyy', '摇一摇', '0', 'yaoyiyao', '#377FD8');
INSERT INTO `wx_function` VALUES ('10', 'yhb', '摇红包', '0', 'yaohongbao', '#C73B3B');
INSERT INTO `wx_function` VALUES ('11', 'jbzs', '嘉宾展示', '0', 'jiabinzhanshi', '#34495E');
INSERT INTO `wx_function` VALUES ('12', 'ewm', '二维码', '0', 'erweima', null);
INSERT INTO `wx_function` VALUES ('13', 'tp', '投票', '0', 'toupiao', '#D6C0DF');
INSERT INTO `wx_function` VALUES ('14', 'ds', '打赏', '0', 'dashang', '#37B6B4');
