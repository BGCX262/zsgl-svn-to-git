/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50150
Source Host           : localhost:3306
Source Database       : zsgl

Target Server Type    : MYSQL
Target Server Version : 50150
File Encoding         : 65001

Date: 2012-08-16 17:26:27
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `account_type`
-- ----------------------------
DROP TABLE IF EXISTS `account_type`;
CREATE TABLE `account_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of account_type
-- ----------------------------
INSERT INTO `account_type` VALUES ('1', '对公账号', '0');
INSERT INTO `account_type` VALUES ('2', '对私账号', '0');

-- ----------------------------
-- Table structure for `affirm`
-- ----------------------------
DROP TABLE IF EXISTS `affirm`;
CREATE TABLE `affirm` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of affirm
-- ----------------------------
INSERT INTO `affirm` VALUES ('1', '电话确认', '0');
INSERT INTO `affirm` VALUES ('2', '其他', '0');

-- ----------------------------
-- Table structure for `authorities`
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(20) DEFAULT NULL,
  `authority` varchar(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('sa', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('admin', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('admin', 'ROLE_ADMIN');
INSERT INTO `authorities` VALUES ('root', 'ROLE_ROOT');
INSERT INTO `authorities` VALUES ('root', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('root', 'ROLE_ADMIN');

-- ----------------------------
-- Table structure for `bad_type`
-- ----------------------------
DROP TABLE IF EXISTS `bad_type`;
CREATE TABLE `bad_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bad_type
-- ----------------------------
INSERT INTO `bad_type` VALUES ('1', '大床', '0');
INSERT INTO `bad_type` VALUES ('2', '双床', '0');
INSERT INTO `bad_type` VALUES ('3', '单人床', '0');

-- ----------------------------
-- Table structure for `bank_type`
-- ----------------------------
DROP TABLE IF EXISTS `bank_type`;
CREATE TABLE `bank_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `code` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of bank_type
-- ----------------------------
INSERT INTO `bank_type` VALUES ('1', 'ICBC', '中国工商银行', '0');
INSERT INTO `bank_type` VALUES ('2', 'CCB', '中国建设银行', '0');
INSERT INTO `bank_type` VALUES ('3', 'ABC', '中国农业银行', '0');
INSERT INTO `bank_type` VALUES ('4', 'CMB', '招商银行', '0');
INSERT INTO `bank_type` VALUES ('5', 'PSBC', '中国邮政储蓄银行', '0');
INSERT INTO `bank_type` VALUES ('6', 'BOC', '中国银行', '0');
INSERT INTO `bank_type` VALUES ('7', 'COMM', '交通银行', '0');
INSERT INTO `bank_type` VALUES ('8', '农村信用社', '农村信用社', '0');

-- ----------------------------
-- Table structure for `base_order`
-- ----------------------------
DROP TABLE IF EXISTS `base_order`;
CREATE TABLE `base_order` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `call_phone` varchar(255) DEFAULT NULL,
  `contact` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `message` varchar(2000) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `children` int(11) DEFAULT NULL,
  `group_date` datetime DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `enter_date` datetime DEFAULT NULL,
  `leave_date` datetime DEFAULT NULL,
  `affirm` bigint(20) DEFAULT NULL,
  `room` bigint(20) DEFAULT NULL,
  `order_state` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE375D060C525ADCD` (`affirm`),
  KEY `FKE375D060B347B57D` (`room`),
  KEY `FKE375D060DA4CACCA` (`order_state`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of base_order
-- ----------------------------
INSERT INTO `base_order` VALUES ('HotelOrder', '1', '', 'xxx', 'xxx', '', 'xxx', '222', '', '男', '2', null, null, '阳朔时光九篇酒店 ☆☆☆☆☆', '1', '2012-07-02 00:00:00', '2012-07-04 00:00:00', '1', '6', '2');
INSERT INTO `base_order` VALUES ('TourOrder', '2', '', 'xxx', 'xxx', '', 'xxx', '410680', '', '男', '2', '2', '2012-08-08 00:00:00', '市区精华游经济1日游', '1', null, null, '1', null, '1');
INSERT INTO `base_order` VALUES ('TourOrder', '3', '', 'xxx', 'xxxxx', '', 'xxxx', '4.51748e+006', '', '男', '1', '22', '2012-08-08 00:00:00', '市区精华游经济1日游', '11', null, null, '1', null, '1');
INSERT INTO `base_order` VALUES ('HotelOrder', '4', '', '大发发生的', '123@1123.com', '打发打发', '134587984484', '148', '', '男', '0', null, null, '阳朔时光九篇酒店 ☆☆☆☆☆', '1', '2012-07-02 00:00:00', '2012-08-03 00:00:00', '1', '1', '3');

-- ----------------------------
-- Table structure for `cases`
-- ----------------------------
DROP TABLE IF EXISTS `cases`;
CREATE TABLE `cases` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cases
-- ----------------------------
INSERT INTO `cases` VALUES ('1', 'xxaxxxx', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('2', 'cdxsafcxzsdf', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('3', 'adasdsasadsad', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('4', 'xadasdsax', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('5', 'dsaxxxa', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('6', 'xxxsx', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('7', 'assssssssdasda', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('8', 'dasdasdasdas', '会议安排商务旅游', '1');
INSERT INTO `cases` VALUES ('9', '会议安排商务旅游', '会议安排商务旅游', '0');

-- ----------------------------
-- Table structure for `click`
-- ----------------------------
DROP TABLE IF EXISTS `click`;
CREATE TABLE `click` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `hits` bigint(20) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=167 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of click
-- ----------------------------
INSERT INTO `click` VALUES ('1', '0', '0', '2012-07-30 10:44:07');
INSERT INTO `click` VALUES ('2', '0', '0', '2012-07-30 10:52:07');
INSERT INTO `click` VALUES ('3', '0', '0', '2012-07-30 10:53:50');
INSERT INTO `click` VALUES ('4', '0', '0', '2012-07-30 10:54:02');
INSERT INTO `click` VALUES ('5', '0', '0', '2012-07-30 10:55:55');
INSERT INTO `click` VALUES ('6', '0', '0', '2012-07-30 10:56:03');
INSERT INTO `click` VALUES ('7', '0', '0', '2012-07-30 11:13:54');
INSERT INTO `click` VALUES ('8', '0', '0', '2012-07-30 11:15:17');
INSERT INTO `click` VALUES ('9', '0', '0', '2012-07-30 11:17:56');
INSERT INTO `click` VALUES ('10', '0', '0', '2012-07-30 11:20:20');
INSERT INTO `click` VALUES ('11', '0', '0', '2012-07-30 11:20:34');
INSERT INTO `click` VALUES ('12', '0', '0', '2012-07-30 11:20:50');
INSERT INTO `click` VALUES ('13', '0', '0', '2012-07-30 11:20:55');
INSERT INTO `click` VALUES ('14', '0', '0', '2012-07-30 11:21:55');
INSERT INTO `click` VALUES ('15', '0', '0', '2012-07-30 11:22:58');
INSERT INTO `click` VALUES ('16', '0', '0', '2012-07-30 11:23:03');
INSERT INTO `click` VALUES ('17', '171', '0', '2012-07-30 11:24:05');
INSERT INTO `click` VALUES ('18', '0', '0', '2012-07-30 11:26:08');
INSERT INTO `click` VALUES ('19', '18', '0', '2012-07-30 11:39:01');
INSERT INTO `click` VALUES ('20', '0', '0', '2012-07-30 16:51:50');
INSERT INTO `click` VALUES ('21', '0', '0', '2012-07-30 17:02:46');
INSERT INTO `click` VALUES ('22', '1', '0', '2012-07-30 17:11:45');
INSERT INTO `click` VALUES ('23', '0', '0', '2012-08-03 16:56:56');
INSERT INTO `click` VALUES ('24', '7', '0', '2012-08-03 17:01:14');
INSERT INTO `click` VALUES ('25', '0', '0', '2012-08-07 17:24:50');
INSERT INTO `click` VALUES ('26', '2', '0', '2012-08-07 17:29:28');
INSERT INTO `click` VALUES ('27', '0', '0', '2012-08-07 17:32:05');
INSERT INTO `click` VALUES ('28', '1', '0', '2012-08-07 17:32:22');
INSERT INTO `click` VALUES ('29', '0', '0', '2012-08-07 17:32:35');
INSERT INTO `click` VALUES ('30', '0', '0', '2012-08-08 09:22:13');
INSERT INTO `click` VALUES ('31', '1', '0', '2012-08-08 09:25:00');
INSERT INTO `click` VALUES ('32', '0', '0', '2012-08-08 09:25:13');
INSERT INTO `click` VALUES ('33', '0', '0', '2012-08-08 09:25:27');
INSERT INTO `click` VALUES ('34', '0', '0', '2012-08-08 09:27:58');
INSERT INTO `click` VALUES ('35', '0', '0', '2012-08-08 09:41:44');
INSERT INTO `click` VALUES ('36', '0', '0', '2012-08-08 09:47:59');
INSERT INTO `click` VALUES ('37', '2', '0', '2012-08-08 09:54:14');
INSERT INTO `click` VALUES ('38', '0', '0', '2012-08-08 09:54:19');
INSERT INTO `click` VALUES ('39', '0', '0', '2012-08-08 09:58:43');
INSERT INTO `click` VALUES ('40', '0', '0', '2012-08-08 09:58:48');
INSERT INTO `click` VALUES ('41', '0', '0', '2012-08-08 10:00:30');
INSERT INTO `click` VALUES ('42', '0', '0', '2012-08-08 10:00:36');
INSERT INTO `click` VALUES ('43', '0', '0', '2012-08-08 10:01:48');
INSERT INTO `click` VALUES ('44', '0', '0', '2012-08-08 10:02:15');
INSERT INTO `click` VALUES ('45', '1', '0', '2012-08-08 10:03:17');
INSERT INTO `click` VALUES ('46', '0', '0', '2012-08-08 10:03:22');
INSERT INTO `click` VALUES ('47', '0', '0', '2012-08-08 10:14:18');
INSERT INTO `click` VALUES ('48', '0', '0', '2012-08-08 10:14:26');
INSERT INTO `click` VALUES ('49', '0', '0', '2012-08-08 10:16:28');
INSERT INTO `click` VALUES ('50', '0', '0', '2012-08-08 10:16:34');
INSERT INTO `click` VALUES ('51', '0', '0', '2012-08-08 10:18:57');
INSERT INTO `click` VALUES ('52', '0', '0', '2012-08-08 10:19:02');
INSERT INTO `click` VALUES ('53', '1', '0', '2012-08-08 10:31:50');
INSERT INTO `click` VALUES ('54', '0', '0', '2012-08-08 10:32:01');
INSERT INTO `click` VALUES ('55', '0', '0', '2012-08-08 10:38:36');
INSERT INTO `click` VALUES ('56', '0', '0', '2012-08-08 10:40:25');
INSERT INTO `click` VALUES ('57', '2', '0', '2012-08-08 10:48:01');
INSERT INTO `click` VALUES ('58', '0', '0', '2012-08-08 10:48:10');
INSERT INTO `click` VALUES ('59', '0', '0', '2012-08-08 10:49:52');
INSERT INTO `click` VALUES ('60', '0', '0', '2012-08-08 10:49:58');
INSERT INTO `click` VALUES ('61', '0', '0', '2012-08-08 11:22:28');
INSERT INTO `click` VALUES ('62', '1', '0', '2012-08-08 12:09:54');
INSERT INTO `click` VALUES ('63', '0', '0', '2012-08-08 12:10:04');
INSERT INTO `click` VALUES ('64', '0', '0', '2012-08-08 13:32:07');
INSERT INTO `click` VALUES ('65', '0', '0', '2012-08-08 13:33:43');
INSERT INTO `click` VALUES ('66', '0', '0', '2012-08-08 15:44:00');
INSERT INTO `click` VALUES ('67', '2', '0', '2012-08-08 16:27:56');
INSERT INTO `click` VALUES ('68', '0', '0', '2012-08-08 16:28:05');
INSERT INTO `click` VALUES ('69', '0', '0', '2012-08-08 16:29:08');
INSERT INTO `click` VALUES ('70', '0', '0', '2012-08-08 16:30:47');
INSERT INTO `click` VALUES ('71', '0', '0', '2012-08-08 16:30:53');
INSERT INTO `click` VALUES ('72', '9', '0', '2012-08-08 16:52:27');
INSERT INTO `click` VALUES ('73', '0', '0', '2012-08-08 16:55:19');
INSERT INTO `click` VALUES ('74', '1', '0', '2012-08-08 16:59:14');
INSERT INTO `click` VALUES ('75', '0', '0', '2012-08-08 16:59:19');
INSERT INTO `click` VALUES ('76', '0', '0', '2012-08-08 17:09:05');
INSERT INTO `click` VALUES ('77', '0', '0', '2012-08-08 17:11:08');
INSERT INTO `click` VALUES ('78', '0', '0', '2012-08-09 15:30:54');
INSERT INTO `click` VALUES ('79', '0', '0', '2012-08-09 15:42:36');
INSERT INTO `click` VALUES ('80', '5', '0', '2012-08-09 15:47:49');
INSERT INTO `click` VALUES ('81', '0', '0', '2012-08-09 15:47:56');
INSERT INTO `click` VALUES ('82', '26', '0', '2012-08-09 15:54:20');
INSERT INTO `click` VALUES ('83', '0', '0', '2012-08-09 15:55:23');
INSERT INTO `click` VALUES ('84', '0', '0', '2012-08-09 15:57:28');
INSERT INTO `click` VALUES ('85', '0', '0', '2012-08-09 15:58:05');
INSERT INTO `click` VALUES ('86', '0', '0', '2012-08-09 16:01:15');
INSERT INTO `click` VALUES ('87', '5', '0', '2012-08-09 16:04:48');
INSERT INTO `click` VALUES ('88', '0', '0', '2012-08-09 16:04:55');
INSERT INTO `click` VALUES ('89', '0', '0', '2012-08-09 16:06:28');
INSERT INTO `click` VALUES ('90', '0', '0', '2012-08-09 16:22:21');
INSERT INTO `click` VALUES ('91', '5', '0', '2012-08-09 16:27:55');
INSERT INTO `click` VALUES ('92', '0', '0', '2012-08-09 16:28:02');
INSERT INTO `click` VALUES ('93', '0', '0', '2012-08-09 16:29:55');
INSERT INTO `click` VALUES ('94', '0', '0', '2012-08-09 16:59:58');
INSERT INTO `click` VALUES ('95', '0', '0', '2012-08-09 17:00:57');
INSERT INTO `click` VALUES ('96', '6', '0', '2012-08-09 17:01:19');
INSERT INTO `click` VALUES ('97', '0', '0', '2012-08-09 17:01:51');
INSERT INTO `click` VALUES ('98', '0', '0', '2012-08-09 17:05:10');
INSERT INTO `click` VALUES ('99', '0', '0', '2012-08-09 17:20:34');
INSERT INTO `click` VALUES ('100', '4', '0', '2012-08-09 17:36:52');
INSERT INTO `click` VALUES ('101', '0', '0', '2012-08-09 17:47:31');
INSERT INTO `click` VALUES ('102', '0', '0', '2012-08-09 17:58:18');
INSERT INTO `click` VALUES ('103', '1', '0', '2012-08-09 17:59:10');
INSERT INTO `click` VALUES ('104', '0', '0', '2012-08-09 17:59:17');
INSERT INTO `click` VALUES ('105', '0', '0', '2012-08-09 17:59:38');
INSERT INTO `click` VALUES ('106', '0', '0', '2012-08-09 18:00:07');
INSERT INTO `click` VALUES ('107', '1', '0', '2012-08-09 18:06:31');
INSERT INTO `click` VALUES ('108', '0', '0', '2012-08-09 18:06:37');
INSERT INTO `click` VALUES ('109', '0', '0', '2012-08-09 18:08:10');
INSERT INTO `click` VALUES ('110', '0', '0', '2012-08-09 18:10:01');
INSERT INTO `click` VALUES ('111', '0', '0', '2012-08-09 18:46:34');
INSERT INTO `click` VALUES ('112', '48', '0', '2012-08-09 20:26:47');
INSERT INTO `click` VALUES ('113', '0', '0', '2012-08-09 20:31:48');
INSERT INTO `click` VALUES ('114', '0', '0', '2012-08-09 20:36:32');
INSERT INTO `click` VALUES ('115', '0', '0', '2012-08-09 20:44:09');
INSERT INTO `click` VALUES ('116', '0', '0', '2012-08-09 20:49:48');
INSERT INTO `click` VALUES ('117', '1', '0', '2012-08-09 20:53:11');
INSERT INTO `click` VALUES ('118', '0', '0', '2012-08-09 20:53:18');
INSERT INTO `click` VALUES ('119', '0', '0', '2012-08-09 20:53:19');
INSERT INTO `click` VALUES ('120', '0', '0', '2012-08-09 21:39:54');
INSERT INTO `click` VALUES ('121', '1', '0', '2012-08-09 21:41:18');
INSERT INTO `click` VALUES ('122', '0', '0', '2012-08-09 21:42:34');
INSERT INTO `click` VALUES ('123', '0', '0', '2012-08-09 21:59:42');
INSERT INTO `click` VALUES ('124', '0', '0', '2012-08-09 22:02:25');
INSERT INTO `click` VALUES ('125', '0', '0', '2012-08-09 22:08:24');
INSERT INTO `click` VALUES ('126', '0', '0', '2012-08-09 22:09:05');
INSERT INTO `click` VALUES ('127', '1', '0', '2012-08-09 22:18:20');
INSERT INTO `click` VALUES ('128', '0', '0', '2012-08-09 22:18:27');
INSERT INTO `click` VALUES ('129', '0', '0', '2012-08-09 22:19:43');
INSERT INTO `click` VALUES ('130', '1', '0', '2012-08-09 22:20:35');
INSERT INTO `click` VALUES ('131', '0', '0', '2012-08-09 22:20:41');
INSERT INTO `click` VALUES ('132', '0', '0', '2012-08-09 22:23:44');
INSERT INTO `click` VALUES ('133', '0', '0', '2012-08-09 22:24:12');
INSERT INTO `click` VALUES ('134', '0', '0', '2012-08-10 09:34:22');
INSERT INTO `click` VALUES ('135', '4', '0', '2012-08-10 09:56:28');
INSERT INTO `click` VALUES ('136', '0', '0', '2012-08-10 09:56:39');
INSERT INTO `click` VALUES ('137', '0', '0', '2012-08-10 09:56:57');
INSERT INTO `click` VALUES ('138', '0', '0', '2012-08-10 09:59:26');
INSERT INTO `click` VALUES ('139', '15', '0', '2012-08-10 10:14:22');
INSERT INTO `click` VALUES ('140', '0', '0', '2012-08-10 10:24:55');
INSERT INTO `click` VALUES ('141', '21', '0', '2012-08-10 10:44:19');
INSERT INTO `click` VALUES ('142', '0', '0', '2012-08-10 10:44:29');
INSERT INTO `click` VALUES ('143', '0', '0', '2012-08-10 10:44:51');
INSERT INTO `click` VALUES ('144', '0', '0', '2012-08-10 10:45:16');
INSERT INTO `click` VALUES ('145', '9', '0', '2012-08-10 10:48:51');
INSERT INTO `click` VALUES ('146', '0', '0', '2012-08-10 10:48:57');
INSERT INTO `click` VALUES ('147', '0', '0', '2012-08-10 10:49:44');
INSERT INTO `click` VALUES ('148', '0', '0', '2012-08-10 10:52:37');
INSERT INTO `click` VALUES ('149', '9', '0', '2012-08-10 10:54:10');
INSERT INTO `click` VALUES ('150', '0', '0', '2012-08-10 10:54:16');
INSERT INTO `click` VALUES ('151', '10', '0', '2012-08-10 10:57:39');
INSERT INTO `click` VALUES ('152', '0', '0', '2012-08-10 10:58:13');
INSERT INTO `click` VALUES ('153', '2', '0', '2012-08-10 10:59:05');
INSERT INTO `click` VALUES ('154', '0', '0', '2012-08-10 10:59:11');
INSERT INTO `click` VALUES ('155', '36', '0', '2012-08-10 11:45:56');
INSERT INTO `click` VALUES ('156', '0', '0', '2012-08-10 12:11:21');
INSERT INTO `click` VALUES ('157', '0', '0', '2012-08-10 12:21:57');
INSERT INTO `click` VALUES ('158', '3', '0', '2012-08-10 12:24:10');
INSERT INTO `click` VALUES ('159', '0', '0', '2012-08-10 12:24:16');
INSERT INTO `click` VALUES ('160', '6', '0', '2012-08-10 12:31:01');
INSERT INTO `click` VALUES ('161', '0', '0', '2012-08-10 12:32:37');
INSERT INTO `click` VALUES ('162', '9', '0', '2012-08-10 12:35:30');
INSERT INTO `click` VALUES ('163', '0', '0', '2012-08-10 12:35:36');
INSERT INTO `click` VALUES ('164', '19', '0', '2012-08-10 13:47:47');
INSERT INTO `click` VALUES ('165', '0', '0', '2012-08-10 14:02:44');
INSERT INTO `click` VALUES ('166', '0', '0', '2012-08-10 14:55:35');

-- ----------------------------
-- Table structure for `company`
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('1', '<p style=\"color:#21324E;font-family:����;\">\r\n	桂林中国国际旅行社有限责任公司，创建于1959年10月20日，距今已有50年历史，初名为中国国际旅行社桂林支社。主要接待外宾、国际友人、公务员及港澳同胞等，属政府事业单位。1966年，由于\"文化大革命\"的影响，旅游业陷入低靡，我们只好停止业务。1974年底桂林支社正式恢复业务，并成立桂林中国旅行社，内部名为：桂林市外事处旅游科。之后两社合并成立桂林旅游公司。1987、1988年连续荣获国家旅游局颁发的最早的国家级评奖—优质服务先进集体。之后我们通过不断努力一直受到好评。1991年荣获最早的市级评奖—旅游行业先进单位。于1992年荣升为国家一类社，名为桂林中国国际旅行社。之后又与民航广西区联合成立桂林航空旅游公司。\r\n</p>\r\n<p style=\"color:#21324E;font-family:����;\">\r\n	从1993到1995年连续荣获中国第一、第二类旅行社百强。荣获1996年度广西国际旅行社十强，那是我们第一次进入区十强，也获得国家旅游局一、二类百强旅行社。到1997年已连续十一届参加太平洋亚洲地区旅游协会。1998年桂林实行城市规划，参与建设两江四湖环城水系，之后桂林的旅游业迅速发展。我们依然靠着优质的服务在2001—2008年连续荣获全国百强国际旅行社，目前排名第十；经过了2003年的\"非典\"、北京奥运会和四川大地震带来的旅游低潮，以及金融危机带来的影响，我们依旧连续8年获得桂林市国际旅行社七强之首，目前在同行之中独占鳌头,成为广西第一国际旅行社。2006年8月召开第一届股东大会，并完成企业改制，变更为桂林中国国际旅行社有限责任公司，注册资本3980万，并拥有国旅大厦这个地理位置最优越的不动产硬件支持,是您桂林旅游最为放心的选择。\r\n</p>\r\n<p style=\"color:#21324E;font-family:����;\">\r\n	从创社初的十人左右到现在公司员工300人；从原本寥寥几个组，发展为现在2个管理部门、14个业务部门；从中国国际旅行社桂林支社提升到了桂林中国国际旅行社责任有限公司，并且组建了柳州、南宁分社；历经了\"文化大革命\"的业务停止；通过不断的改革创新；走过了2003年的非典、北京奥运会和四川地震时期带来的旅游的低潮，又面临金融危机带来的影响。如今转眼50年，她依旧风华正茂，前程似锦。\r\n</p>\r\n<p style=\"color:#21324E;font-family:����;\">\r\n	50年以来我们坚持不断创新改革，以\"您的口碑，我们的荣耀\"作为经营理念。作为桂林规模最大、历史最悠久的旅行社，我们一直以优质的接待、热情的态度、细致的服务、经典的旅游线路和不断创新的理念为游客提供舒心愉快的旅游。在公司员工爱岗敬业、团结协作、坚持不懈、热情周到服务的精神下，1991年至今共获得国家级奖励：18个，自治区奖励：9 个，桂林市奖励：48 个。\r\n</p>', '0');

-- ----------------------------
-- Table structure for `company_account`
-- ----------------------------
DROP TABLE IF EXISTS `company_account`;
CREATE TABLE `company_account` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `bank` varchar(255) DEFAULT NULL,
  `cardid` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `account_type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5778A06B5BA69317` (`type`),
  KEY `FK5778A06B44BC8F6C` (`account_type`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of company_account
-- ----------------------------
INSERT INTO `company_account` VALUES ('2', '交通银行桂林分行营业部', '6222 6007 7000 3713 316', 'image/jth.gif', '刘艳君', '4', '7', null);
INSERT INTO `company_account` VALUES ('3', '建行凤北支行', '4367 4233 9517 0237 061', 'image/jh.gif', '刘艳君', '4', '2', null);
INSERT INTO `company_account` VALUES ('4', '农业银行', '5465413215', 'image/nh.gif', '王五', '3', '3', null);
INSERT INTO `company_account` VALUES ('5', '工商银行南门桥支行', '6222 0221 0300 3168 044', 'image/gh.gif', '刘艳君', '3', '1', null);
INSERT INTO `company_account` VALUES ('6', '中国银行桂林中山南路支行', '626257488918', '/attached/image/20120815/20120815142538_369.jpg', '桂林招商国际旅行社有限责任公司', '1', '6', null);

-- ----------------------------
-- Table structure for `hotel`
-- ----------------------------
DROP TABLE IF EXISTS `hotel`;
CREATE TABLE `hotel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `attractons` varchar(255) DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num` varchar(255) DEFAULT NULL,
  `opening_time` datetime DEFAULT NULL,
  `remark` varchar(4000) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` bigint(20) DEFAULT NULL,
  `hotel_level` bigint(20) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `dtype` varchar(31) NOT NULL,
  `recommend` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK5EDC1B4FA4505F0` (`hotel_level`),
  KEY `FK5EDC1B4BEAE785B` (`address`),
  KEY `FK5EDC1B4F39BB211` (`recommend`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel
-- ----------------------------
INSERT INTO `hotel` VALUES ('1', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '5层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '阳朔时光九篇酒店 ☆☆☆☆☆', '50间', '2012-07-19 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '2', '4', '5', '1', 'Hotel', '2');
INSERT INTO `hotel` VALUES ('2', 'xxx、xxxx', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林观光大酒店 ☆☆☆☆☆', '100', '2012-07-20 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n', '1', '1', '4', '2', 'Hotel', null);
INSERT INTO `hotel` VALUES ('3', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林漓江大瀑布饭店', '100', '2012-07-27 00:00:00', 'sdasdas', '1', '1', '1', '1', 'Hotel', null);
INSERT INTO `hotel` VALUES ('4', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林漓江大瀑布饭店', '100', '2012-07-27 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '1', '4', '1', '4', 'Hotel', null);
INSERT INTO `hotel` VALUES ('5', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林漓江大瀑布饭店', '100', '2012-07-27 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '1', '4', '1', '32', 'Hotel', null);
INSERT INTO `hotel` VALUES ('6', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林漓江大瀑布饭店', '100', '2012-07-27 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '1', '1', '1', '12', 'Hotel', null);
INSERT INTO `hotel` VALUES ('7', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林漓江大瀑布饭店', '100', '2012-07-27 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '1', '1', '1', '33', 'Hotel', null);
INSERT INTO `hotel` VALUES ('8', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林漓江大瀑布饭店', '100', '2012-07-27 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '1', '1', '1', '32', 'Hotel', null);
INSERT INTO `hotel` VALUES ('9', '阳朔十里画廊、遇龙河漂流、大榕树、聚龙潭、鉴山寺、月亮山、 图腾古道、龙水岩', '10层', '/attached/image/20120727/20120727151826_940.gif', '阳朔县工农桥旁29号', '桂林漓江大瀑布饭店', '100', '2012-07-27 00:00:00', '<table width=\"727\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" style=\"font-size:12px;font-family:����;color:#21324E;\">\r\n	<tbody>\r\n		<tr>\r\n			<td width=\"239\" height=\"127\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"241\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n			<td width=\"247\" align=\"center\" style=\"font-family:����;\">\r\n				<img src=\"file://C:/Users/itachi/Desktop/zsgl/image/h_imga.gif\" width=\"168\" height=\"110\" /> \r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"33\" align=\"center\" valign=\"top\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n			<td align=\"center\" style=\"font-family:����;\">\r\n				双人房\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td height=\"84\" colspan=\"4\" style=\"font-family:����;\">\r\n				阳朔时光九篇酒店位于十画廊景区内，临近工农桥、遇龙河，其建筑造型融合现代艺术和古典民族风格，古朴、优雅。酒店按国家星级标准建造，设施设备齐全，拥有豪华佳景房、豪华套房、豪华双人房、大床房、温馨家庭房，所有客房豪华舒适，画廊风景临窗而视，山水美景尽收眼底，让您享受躺在床上看风景的暇情逸致，是您旅游度假的理想住宿选择，而酒店殷切周到的服务将是您永久美好的回忆。\r\n			</td>\r\n		</tr>\r\n		<tr>\r\n			<td colspan=\"4\" style=\"font-family:����;\">\r\n				<strong>基本服务</strong><br />\r\n叫醒服务 有可无线上网的公共区域 免费停车场<br />\r\n<strong>票务服务</strong><br />\r\n免费旅游交通图（可赠送）<br />\r\n<strong>餐饮设施</strong><br />\r\n大堂吧<br />\r\n<strong>娱乐/健身设施</strong><br />\r\n<strong>房间设施/服务</strong><br />\r\n拖鞋 有线电视 木质地板 宽带上网 24小时热水供应 中央空调/普通分体空调<br />\r\n<strong>支持信用卡</strong> \r\n			</td>\r\n		</tr>\r\n	</tbody>\r\n</table>', '1', '4', '1', '34', 'Hotel', null);
INSERT INTO `hotel` VALUES ('10', 'xxxxxxxxx', '213', 'xxxx', 'xxxxxxxx', '桂林漓江大瀑布饭店', '312', '2012-07-27 00:00:00', 'xxxxxxxxx', '1', '1', '1', '32', 'Hotel', null);
INSERT INTO `hotel` VALUES ('11', 'xssx', 'sxx', 'xxxx', 'xsxs', '桂林漓江大瀑布饭店', 'xss', '2012-07-26 00:00:00', 'csadas', '0', '1', '1', '32', 'Hotel', null);
INSERT INTO `hotel` VALUES ('12', 'dsasa', 'xxx', 'sdas', 'das', '桂林漓江大瀑布饭店', 'xxx', '2012-07-19 00:00:00', 'xx', '1', '1', '1', '432', 'Hotel', null);
INSERT INTO `hotel` VALUES ('13', 'xx', '213', 'hotel_img.gif', 'xx', 'xxx', '321', '2012-08-15 00:00:00', 'dsadas', '0', '1', '1', '2', 'MeetingHotel', null);
INSERT INTO `hotel` VALUES ('14', '法师法师饭店', '发法术阿斯顿', '/attached/image/20120815/20120815141538_154.jpg', '的发放阿发', '桂林桂林', '发放阿道夫阿发', '2012-08-15 00:00:00', '发大发阿斯顿发', '0', '1', '1', '2', 'Hotel', '1');

-- ----------------------------
-- Table structure for `hotel_address`
-- ----------------------------
DROP TABLE IF EXISTS `hotel_address`;
CREATE TABLE `hotel_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_address
-- ----------------------------
INSERT INTO `hotel_address` VALUES ('1', '桂林酒店', '0');
INSERT INTO `hotel_address` VALUES ('2', '南宁酒店', '0');
INSERT INTO `hotel_address` VALUES ('3', '龙胜酒店', '0');
INSERT INTO `hotel_address` VALUES ('4', '阳朔酒店', '0');
INSERT INTO `hotel_address` VALUES ('5', '柳州酒店', '0');
INSERT INTO `hotel_address` VALUES ('6', '兴安酒店', '0');

-- ----------------------------
-- Table structure for `hotel_level`
-- ----------------------------
DROP TABLE IF EXISTS `hotel_level`;
CREATE TABLE `hotel_level` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_level
-- ----------------------------
INSERT INTO `hotel_level` VALUES ('1', '客栈式', '1');
INSERT INTO `hotel_level` VALUES ('2', '二星级', '0');
INSERT INTO `hotel_level` VALUES ('3', '三星级', '0');
INSERT INTO `hotel_level` VALUES ('4', '四星级', '0');
INSERT INTO `hotel_level` VALUES ('5', '五星级', '0');

-- ----------------------------
-- Table structure for `hotel_rooms`
-- ----------------------------
DROP TABLE IF EXISTS `hotel_rooms`;
CREATE TABLE `hotel_rooms` (
  `hotel` bigint(20) NOT NULL,
  `rooms` bigint(20) NOT NULL,
  PRIMARY KEY (`hotel`,`rooms`),
  KEY `FK8D51A8ADB98CCF9A` (`rooms`),
  KEY `FK8D51A8ADB4954881` (`hotel`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hotel_rooms
-- ----------------------------
INSERT INTO `hotel_rooms` VALUES ('1', '1');
INSERT INTO `hotel_rooms` VALUES ('1', '2');
INSERT INTO `hotel_rooms` VALUES ('1', '3');
INSERT INTO `hotel_rooms` VALUES ('1', '4');
INSERT INTO `hotel_rooms` VALUES ('1', '5');
INSERT INTO `hotel_rooms` VALUES ('1', '6');
INSERT INTO `hotel_rooms` VALUES ('2', '1');
INSERT INTO `hotel_rooms` VALUES ('2', '2');
INSERT INTO `hotel_rooms` VALUES ('2', '3');
INSERT INTO `hotel_rooms` VALUES ('2', '4');
INSERT INTO `hotel_rooms` VALUES ('3', '1');
INSERT INTO `hotel_rooms` VALUES ('3', '2');
INSERT INTO `hotel_rooms` VALUES ('3', '3');
INSERT INTO `hotel_rooms` VALUES ('3', '4');
INSERT INTO `hotel_rooms` VALUES ('3', '5');
INSERT INTO `hotel_rooms` VALUES ('3', '6');
INSERT INTO `hotel_rooms` VALUES ('4', '1');
INSERT INTO `hotel_rooms` VALUES ('4', '2');
INSERT INTO `hotel_rooms` VALUES ('4', '3');
INSERT INTO `hotel_rooms` VALUES ('4', '4');
INSERT INTO `hotel_rooms` VALUES ('5', '1');
INSERT INTO `hotel_rooms` VALUES ('5', '2');
INSERT INTO `hotel_rooms` VALUES ('5', '3');
INSERT INTO `hotel_rooms` VALUES ('5', '4');
INSERT INTO `hotel_rooms` VALUES ('6', '1');
INSERT INTO `hotel_rooms` VALUES ('6', '2');
INSERT INTO `hotel_rooms` VALUES ('7', '1');
INSERT INTO `hotel_rooms` VALUES ('7', '2');
INSERT INTO `hotel_rooms` VALUES ('7', '3');
INSERT INTO `hotel_rooms` VALUES ('8', '2');
INSERT INTO `hotel_rooms` VALUES ('8', '3');
INSERT INTO `hotel_rooms` VALUES ('8', '4');
INSERT INTO `hotel_rooms` VALUES ('9', '2');
INSERT INTO `hotel_rooms` VALUES ('9', '3');
INSERT INTO `hotel_rooms` VALUES ('9', '4');
INSERT INTO `hotel_rooms` VALUES ('10', '1');
INSERT INTO `hotel_rooms` VALUES ('10', '2');
INSERT INTO `hotel_rooms` VALUES ('11', '1');
INSERT INTO `hotel_rooms` VALUES ('11', '2');
INSERT INTO `hotel_rooms` VALUES ('12', '1');
INSERT INTO `hotel_rooms` VALUES ('12', '2');
INSERT INTO `hotel_rooms` VALUES ('12', '3');
INSERT INTO `hotel_rooms` VALUES ('12', '4');
INSERT INTO `hotel_rooms` VALUES ('13', '2');
INSERT INTO `hotel_rooms` VALUES ('13', '3');
INSERT INTO `hotel_rooms` VALUES ('13', '4');
INSERT INTO `hotel_rooms` VALUES ('13', '5');

-- ----------------------------
-- Table structure for `link`
-- ----------------------------
DROP TABLE IF EXISTS `link`;
CREATE TABLE `link` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of link
-- ----------------------------
INSERT INTO `link` VALUES ('1', 'http://www.baidu.com', '百度', '0');
INSERT INTO `link` VALUES ('2', 'http://www.hy0773.com', '会议网', '0');
INSERT INTO `link` VALUES ('3', 'http://www.google.com', '谷歌', '0');
INSERT INTO `link` VALUES ('4', 'http://www.hao123.com', '好123', '0');

-- ----------------------------
-- Table structure for `meeting_hotel`
-- ----------------------------
DROP TABLE IF EXISTS `meeting_hotel`;
CREATE TABLE `meeting_hotel` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_hotel
-- ----------------------------
INSERT INTO `meeting_hotel` VALUES ('1', '<p>\r\n	xaxdsad\r\n</p>\r\n<p>\r\n	das\r\n</p>\r\n<p>\r\n	das\r\n</p>\r\n<p>\r\n	a\r\n</p>\r\n<p>\r\n	sd\r\n</p>\r\n<p>\r\n	asd\r\n</p>\r\n<p>\r\n	sa\r\n</p>', '/attached/image/20120719/20120719145422_574.gif', 'xxxx', '0');
INSERT INTO `meeting_hotel` VALUES ('2', '<p>\r\n	fsda\r\n</p>\r\n<p>\r\n	d\r\n</p>\r\n<p>\r\n	f\r\n</p>\r\n<p>\r\n	asd\r\n</p>\r\n<p>\r\n	fsd\r\n</p>\r\n<p>\r\n	f\r\n</p>\r\n<p>\r\n	sdaf\r\n</p>', '/attached/image/20120719/20120719145422_574.gif', 'ssss', '0');
INSERT INTO `meeting_hotel` VALUES ('3', '<p>\r\n	das\r\n</p>\r\n<p>\r\n	d\r\n</p>\r\n<p>\r\n	sa&nbsp;\r\n</p>\r\n<p>\r\n	das\r\n</p>\r\n<p>\r\n	&nbsp;\r\n</p>\r\n<p>\r\n	d\r\n</p>\r\n<p>\r\n	fa&nbsp;\r\n</p>\r\n<p>\r\n	df\r\n</p>\r\n<p>\r\n	&nbsp;asd\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', '/attached/image/20120719/20120719151012_216.gif', 'sdasd', '0');

-- ----------------------------
-- Table structure for `meeting_place`
-- ----------------------------
DROP TABLE IF EXISTS `meeting_place`;
CREATE TABLE `meeting_place` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting_place
-- ----------------------------
INSERT INTO `meeting_place` VALUES ('1', '<p>\r\n	<span style=\"color:#21324E;font-family:����;line-height:21px;\">桂林是一座美丽的旅游城市，桂林山水风景如画，交通便利，旅业发达，星级酒店便布城区，中外</span>\r\n</p>\r\n<p>\r\n	<br />\r\n</p>', 'image/hy_img.gif', '会议旅游--广西中青旅旅行社有限公司官方网站专业会议旅游', '2');
INSERT INTO `meeting_place` VALUES ('4', '<span style=\"color:#21324E;font-family:����;line-height:21px;\">桂林是一座美丽的旅游城市，桂林山水风景如画，交通便利，旅业发达，星级酒店便布城区，中外</span>', 'image/hy_img.gif', '会议旅游--广西中青旅旅行社有限公司官方网站专业会议旅游 ', '2');
INSERT INTO `meeting_place` VALUES ('5', '<span style=\"color:#21324E;font-family:����;line-height:21px;\">桂林是一座美丽的旅游城市，桂林山水风景如画，交通便利，旅业发达，星级酒店便布城区，中外</span>', 'image/hy_img.gif', '会议旅游--广西中青旅旅行社有限公司官方网站专业会议旅游', '0');
INSERT INTO `meeting_place` VALUES ('6', '<span style=\"color:#21324E;font-family:����;line-height:21px;\">桂林是一座美丽的旅游城市，桂林山水风景如画，交通便利，旅业发达，星级酒店便布城区，中外</span>', 'image/hy_img.gif', '会议旅游--广西中青旅旅行社有限公司官方网站专业会议旅游', '0');
INSERT INTO `meeting_place` VALUES ('7', '<span style=\"color:#21324E;font-family:����;line-height:21px;\">桂林是一座美丽的旅游城市，桂林山水风景如画，交通便利，旅业发达，星级酒店便布城区，中外</span>', 'image/hy_img.gif', '会议旅游--广西中青旅旅行社有限公司官方网站专业会议旅游', '0');

-- ----------------------------
-- Table structure for `metting_service`
-- ----------------------------
DROP TABLE IF EXISTS `metting_service`;
CREATE TABLE `metting_service` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of metting_service
-- ----------------------------
INSERT INTO `metting_service` VALUES ('1', '<span style=\"color:#21324E;font-family:����;line-height:25px;\">桂林是一座美丽的旅游城市，桂林山水风景如画，交通便利，旅业发达，星级酒店便布城区，中外游客云集，在此举办会议会展，让您感觉非同，永不忘怀。如果您准备将会议、会展安排在广西桂林举办，只要把您的要求告诉我们，剩下的一切由我们为您安排。我们业务范围包括：&nbsp;</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（1）会议酒店：各档桂林星级酒店预订...</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（2）会议场地：各种会议室场所及会场布置...&nbsp;</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（3）会议用餐：桂林地方特色风味餐...&nbsp;</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（4）会议用车：各款中低高档轿车，巴士...</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（5）会议票务：代订返程火车票...</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（6）旅游考察：提供桂林旅游阳朔旅游线路...</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（7）会议娱乐：各种会后娱乐活动...</span><br />\r\n<span style=\"color:#21324E;font-family:����;line-height:25px;\">（8）会议礼品：桂林会议旅游纪念品订作...</span>', '0');

-- ----------------------------
-- Table structure for `nav_menu`
-- ----------------------------
DROP TABLE IF EXISTS `nav_menu`;
CREATE TABLE `nav_menu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of nav_menu
-- ----------------------------
INSERT INTO `nav_menu` VALUES ('1', 'lvgl.html?type=2', 'image/yl.gif', '桂林娱乐', '2');
INSERT INTO `nav_menu` VALUES ('2', 'lvgl.html?type=3', 'image/gwc.gif', '桂林购物', '1');
INSERT INTO `nav_menu` VALUES ('3', 'lvgl.html?type=4', 'image/ms.gif', '桂林美食', '2');
INSERT INTO `nav_menu` VALUES ('4', 'http://map.baidu.com/?newmap=1&s=s%26wd%3D%E6%A1%82%E6%9E%97%E5%B8%82%26c%3D142&fr=alab0&from=alamap', 'image/dt.gif', '桂林地图', '0');
INSERT INTO `nav_menu` VALUES ('5', 'lvgl.html?type=5', 'image/gl.gif', '桂林攻略', '3');
INSERT INTO `nav_menu` VALUES ('6', 'http://www.weather.com.cn/weather/101300501.shtml', 'image/tq.gif', '天气查询', '0');
INSERT INTO `nav_menu` VALUES ('7', 'http://www.17u.cn/THFlight.aspx?TCAllianceID=1170731&RefId=1170731&tckeywordid=699042&', 'image/fj.gif', '机票查询', '0');
INSERT INTO `nav_menu` VALUES ('8', 'http://train.qunar.com/?ex_track=bd_aladding_train_tb_title', 'image/hc.gif', '火车查询', '0');

-- ----------------------------
-- Table structure for `order_state`
-- ----------------------------
DROP TABLE IF EXISTS `order_state`;
CREATE TABLE `order_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_state
-- ----------------------------
INSERT INTO `order_state` VALUES ('1', '已确认', '0');
INSERT INTO `order_state` VALUES ('2', '正在处理', '0');
INSERT INTO `order_state` VALUES ('3', '未处理', '0');

-- ----------------------------
-- Table structure for `poster`
-- ----------------------------
DROP TABLE IF EXISTS `poster`;
CREATE TABLE `poster` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of poster
-- ----------------------------
INSERT INTO `poster` VALUES ('1', '#', 'image/banner.gif', '1');
INSERT INTO `poster` VALUES ('2', '#', 'image/banner.gif', '1');
INSERT INTO `poster` VALUES ('3', '#', 'image/banner.gif', '1');
INSERT INTO `poster` VALUES ('4', '#', 'image/banner.gif', '1');

-- ----------------------------
-- Table structure for `price`
-- ----------------------------
DROP TABLE IF EXISTS `price`;
CREATE TABLE `price` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `price` float DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=166 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of price
-- ----------------------------
INSERT INTO `price` VALUES ('1', '2012-08-01 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('2', '2012-08-02 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('3', '2012-08-03 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('4', '2012-08-04 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('5', '2012-08-05 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('6', '2012-08-06 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('7', '2012-08-07 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('8', '2012-08-08 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('9', '2012-08-09 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('10', '2012-08-10 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('11', '2012-08-11 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('12', '2012-08-12 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('13', '2012-08-13 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('14', '2012-08-14 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('15', '2012-08-15 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('16', '2012-08-16 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('17', '2012-08-17 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('18', '2012-08-18 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('19', '2012-08-19 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('20', '2012-08-20 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('21', '2012-08-21 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('22', '2012-08-22 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('23', '2012-08-23 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('24', '2012-08-24 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('25', '2012-08-25 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('26', '2012-08-26 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('27', '2012-08-27 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('28', '2012-08-28 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('29', '2012-08-29 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('30', '2012-08-30 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('31', '2012-08-31 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('32', '2012-08-01 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('33', '2012-08-02 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('34', '2012-08-03 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('35', '2012-08-04 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('36', '2012-08-05 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('37', '2012-08-06 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('38', '2012-08-07 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('39', '2012-08-08 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('40', '2012-08-09 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('41', '2012-08-10 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('42', '2012-08-11 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('43', '2012-08-12 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('44', '2012-08-13 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('45', '2012-08-14 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('46', '2012-08-15 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('47', '2012-08-16 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('48', '2012-08-17 00:00:00', '80', '0');
INSERT INTO `price` VALUES ('49', '2012-08-01 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('50', '2012-08-02 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('51', '2012-08-03 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('52', '2012-08-04 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('53', '2012-08-05 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('54', '2012-08-06 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('55', '2012-08-07 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('56', '2012-08-08 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('57', '2012-08-09 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('58', '2012-08-10 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('59', '2012-08-11 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('60', '2012-08-12 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('61', '2012-08-13 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('62', '2012-08-14 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('63', '2012-08-15 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('64', '2012-08-16 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('65', '2012-08-17 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('66', '2012-08-18 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('67', '2012-08-19 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('68', '2012-08-20 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('69', '2012-08-21 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('70', '2012-08-22 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('71', '2012-08-23 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('72', '2012-08-01 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('73', '2012-08-02 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('74', '2012-08-03 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('75', '2012-08-04 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('76', '2012-08-05 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('77', '2012-08-06 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('78', '2012-08-07 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('79', '2012-08-08 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('80', '2012-08-09 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('81', '2012-08-10 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('82', '2012-08-11 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('83', '2012-08-12 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('84', '2012-08-13 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('85', '2012-08-14 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('86', '2012-08-15 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('87', '2012-08-16 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('88', '2012-08-17 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('89', '2012-08-18 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('90', '2012-08-19 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('91', '2012-08-20 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('92', '2012-08-21 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('93', '2012-08-22 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('94', '2012-08-23 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('95', '2012-08-24 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('96', '2012-08-01 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('97', '2012-08-02 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('98', '2012-08-03 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('99', '2012-08-04 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('100', '2012-08-05 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('101', '2012-08-06 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('102', '2012-08-07 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('103', '2012-08-08 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('104', '2012-08-09 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('105', '2012-08-10 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('106', '2012-08-11 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('107', '2012-08-12 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('108', '2012-08-13 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('109', '2012-08-14 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('110', '2012-08-15 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('111', '2012-08-16 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('112', '2012-08-17 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('113', '2012-08-18 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('114', '2012-08-19 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('115', '2012-08-20 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('116', '2012-08-21 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('117', '2012-08-22 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('118', '2012-08-23 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('119', '2012-08-24 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('120', '2012-08-25 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('121', '2012-08-26 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('122', '2012-08-27 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('123', '2012-08-28 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('124', '2012-08-29 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('125', '2012-08-30 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('126', '2012-08-31 00:00:00', '111', '0');
INSERT INTO `price` VALUES ('127', '2012-08-01 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('128', '2012-08-02 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('129', '2012-08-03 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('130', '2012-08-04 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('131', '2012-08-05 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('132', '2012-08-06 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('133', '2012-08-07 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('134', '2012-08-08 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('135', '2012-08-09 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('136', '2012-08-10 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('137', '2012-08-11 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('138', '2012-08-12 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('139', '2012-08-13 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('140', '2012-08-14 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('141', '2012-08-15 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('142', '2012-08-16 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('143', '2012-08-17 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('144', '2012-08-18 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('145', '2012-08-19 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('146', '2012-08-20 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('147', '2012-08-21 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('148', '2012-08-22 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('149', '2012-08-23 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('150', '2012-08-24 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('151', '2012-08-25 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('152', '2012-08-26 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('153', '2012-08-27 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('154', '2012-08-28 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('155', '2012-08-29 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('156', '2012-08-30 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('157', '2012-08-31 00:00:00', '222', '0');
INSERT INTO `price` VALUES ('158', '2012-07-01 00:00:00', '148', '0');
INSERT INTO `price` VALUES ('159', '2012-07-02 00:00:00', '158', '0');
INSERT INTO `price` VALUES ('160', '2012-08-16 00:00:00', '213', '0');
INSERT INTO `price` VALUES ('161', '2012-08-16 00:00:00', '213', '0');
INSERT INTO `price` VALUES ('162', '2012-08-16 00:00:00', '12', '0');
INSERT INTO `price` VALUES ('163', '2012-08-16 00:00:00', '11', '0');
INSERT INTO `price` VALUES ('164', '2012-08-16 00:00:00', '100', '0');
INSERT INTO `price` VALUES ('165', '2012-08-16 00:00:00', '120', '0');

-- ----------------------------
-- Table structure for `recommend`
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of recommend
-- ----------------------------
INSERT INTO `recommend` VALUES ('1', '否', '0');
INSERT INTO `recommend` VALUES ('2', '是', '0');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `area` varchar(255) DEFAULT NULL,
  `breakfast` varchar(255) DEFAULT NULL,
  `door_price` float DEFAULT NULL,
  `floor` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `net` varchar(255) DEFAULT NULL,
  `privilege` float DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `bad` varchar(255) DEFAULT NULL,
  `room_state` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3580DB89188D3C` (`room_state`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '14-16', '-', '160', '2-4层', '浪漫大床型', '免费', null, '6', '1', null, null);
INSERT INTO `room` VALUES ('2', '22', '包', '111', '12', '温馨家庭房', '免费', null, '4', '1', null, null);
INSERT INTO `room` VALUES ('3', 'xxx', 'xxxx', '111', 'xx', '豪华观景标房', 'xxx', null, '5', '1', null, null);
INSERT INTO `room` VALUES ('4', 'xx', 'xxx', '111', 'xxx', '豪华观景标房', 'xxx', null, '5', '1', null, null);
INSERT INTO `room` VALUES ('5', 'xxx', 'xx', '222', 'x', '豪华佳景标房', 'xxx', null, '5', '1', null, null);
INSERT INTO `room` VALUES ('6', 'xx', 'xxx', '111', 'xxx', '豪华佳景套房', 'xx', null, '5', '1', null, null);

-- ----------------------------
-- Table structure for `room_prices`
-- ----------------------------
DROP TABLE IF EXISTS `room_prices`;
CREATE TABLE `room_prices` (
  `room` bigint(20) NOT NULL,
  `prices` bigint(20) NOT NULL,
  PRIMARY KEY (`room`,`prices`),
  UNIQUE KEY `prices` (`prices`),
  KEY `FK2542582E74AFEEAC` (`prices`),
  KEY `FK2542582EB347B57D` (`room`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_prices
-- ----------------------------
INSERT INTO `room_prices` VALUES ('1', '165');
INSERT INTO `room_prices` VALUES ('2', '164');
INSERT INTO `room_prices` VALUES ('3', '163');
INSERT INTO `room_prices` VALUES ('4', '162');
INSERT INTO `room_prices` VALUES ('5', '161');
INSERT INTO `room_prices` VALUES ('6', '160');

-- ----------------------------
-- Table structure for `room_state`
-- ----------------------------
DROP TABLE IF EXISTS `room_state`;
CREATE TABLE `room_state` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_state
-- ----------------------------
INSERT INTO `room_state` VALUES ('1', '有', '0');
INSERT INTO `room_state` VALUES ('2', '无', '0');

-- ----------------------------
-- Table structure for `room_type`
-- ----------------------------
DROP TABLE IF EXISTS `room_type`;
CREATE TABLE `room_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_type
-- ----------------------------
INSERT INTO `room_type` VALUES ('6', '浪漫大床型', '0');
INSERT INTO `room_type` VALUES ('7', '温馨家庭房', '0');
INSERT INTO `room_type` VALUES ('8', '豪华观景标房', '0');
INSERT INTO `room_type` VALUES ('9', '豪华佳景标房', '0');
INSERT INTO `room_type` VALUES ('10', '豪华佳景套房', '0');

-- ----------------------------
-- Table structure for `scenic`
-- ----------------------------
DROP TABLE IF EXISTS `scenic`;
CREATE TABLE `scenic` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `door_price` float DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `address` bigint(20) DEFAULT NULL,
  `strength` bigint(20) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKC9DFF9D39FCA18C9` (`strength`),
  KEY `FKC9DFF9D3137B60C9` (`address`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of scenic
-- ----------------------------
INSERT INTO `scenic` VALUES ('1', '<p>\r\n	afsd\r\n</p>\r\n<p>\r\n	fds\r\n</p>\r\n<p>\r\n	fsd\r\n</p>\r\n<p>\r\n	fa\r\n</p>\r\n<p>\r\n	asd\r\n</p>\r\n<p>\r\n	fa\r\n</p>\r\n<p>\r\n	sdf\r\n</p>\r\n<p>\r\n	&nbsp;sd\r\n</p>', '111', 'image/imgc.gif', '两江四湖', '2', '1', '2', '1');
INSERT INTO `scenic` VALUES ('2', '<p>\r\n	fasdfsd ffsdafsd\r\n</p>\r\n<p>\r\n	ds\r\n</p>\r\n<p>\r\n	f\r\n</p>\r\n<p>\r\n	sd&nbsp;\r\n</p>\r\n<p>\r\n	fd s\r\n</p>', '222', 'image/imgc.gif', '两江四湖', '2', '1', '2', '2');
INSERT INTO `scenic` VALUES ('3', '', '333', 'image/imgc.gif', '两江四湖', '0', '1', '1', '1');
INSERT INTO `scenic` VALUES ('4', '', '22', 'image/imgc.gif', '两江四湖', '0', '1', '1', '2');
INSERT INTO `scenic` VALUES ('5', '', '44', 'image/imgc.gif', '两江四湖', '0', '1', '1', '6');
INSERT INTO `scenic` VALUES ('6', '', '22', 'image/imgc.gif', '两江四湖', '0', '1', '1', '5');

-- ----------------------------
-- Table structure for `strategy`
-- ----------------------------
DROP TABLE IF EXISTS `strategy`;
CREATE TABLE `strategy` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `content` varchar(4000) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6A8FA373BC65414E` (`type`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strategy
-- ----------------------------
INSERT INTO `strategy` VALUES ('2', '<p>\r\n	dasdas\r\n</p>\r\n<p>\r\n	dsa\r\n</p>\r\n<p>\r\n	<br />\r\n</p>\r\n<p>\r\n	fd\r\n</p>\r\n<p>\r\n	af\r\n</p>\r\n<p>\r\n	dfad\r\n</p>', 'xxxx', '2012-07-27 00:00:00', '1', '1');
INSERT INTO `strategy` VALUES ('3', '<a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><br />', '桂林-阳朔-北海最强攻略！', '2012-07-28 00:00:00', '1', '2');
INSERT INTO `strategy` VALUES ('4', '<a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a>', '桂林-阳朔-北海最强攻略！', '2012-07-29 00:00:00', '1', '3');
INSERT INTO `strategy` VALUES ('5', '<a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a>', '桂林-阳朔-北海最强攻略！', '2012-07-30 00:00:00', '1', '4');
INSERT INTO `strategy` VALUES ('6', '<a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a><a href=\"file://C:/Users/itachi/Desktop/zsgl/lvgl.html#\">桂林-阳朔-北海最强攻略！</a>', '桂林-阳朔-北海最强攻略！', '2012-07-31 00:00:00', '1', '5');
INSERT INTO `strategy` VALUES ('7', '444444444444444444444444444444444444444444444444444444444444444444444444', '44444444444444', '2012-08-08 00:00:00', '1', '1');

-- ----------------------------
-- Table structure for `strategy_type`
-- ----------------------------
DROP TABLE IF EXISTS `strategy_type`;
CREATE TABLE `strategy_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strategy_type
-- ----------------------------
INSERT INTO `strategy_type` VALUES ('1', '旅游攻略', '0');
INSERT INTO `strategy_type` VALUES ('2', '桂林娱乐', '0');
INSERT INTO `strategy_type` VALUES ('3', '桂林购物', '0');
INSERT INTO `strategy_type` VALUES ('4', '桂林美食', '0');
INSERT INTO `strategy_type` VALUES ('5', '桂林攻略', '0');

-- ----------------------------
-- Table structure for `strength`
-- ----------------------------
DROP TABLE IF EXISTS `strength`;
CREATE TABLE `strength` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of strength
-- ----------------------------
INSERT INTO `strength` VALUES ('1', '强', '0');
INSERT INTO `strength` VALUES ('2', '中', '0');
INSERT INTO `strength` VALUES ('3', '弱', '0');

-- ----------------------------
-- Table structure for `tour`
-- ----------------------------
DROP TABLE IF EXISTS `tour`;
CREATE TABLE `tour` (
  `dtype` varchar(31) NOT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `children` float DEFAULT NULL,
  `door_price` float DEFAULT NULL,
  `feature` text,
  `group_date` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `plan` text,
  `privilege` float DEFAULT NULL,
  `start_city` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  `way` varchar(256) DEFAULT NULL,
  `address` bigint(20) DEFAULT NULL,
  `tour_day` bigint(20) DEFAULT NULL,
  `type` bigint(20) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `recommend` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK366A58EDB57632` (`tour_day`),
  KEY `FK366A58137B60C9` (`address`),
  KEY `FK366A589A678933` (`type`),
  KEY `FK366A58F39BB211` (`recommend`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tour
-- ----------------------------
INSERT INTO `tour` VALUES ('Tour', '6', '34223', '324', 'xxxeew', '每天', '/image/hotel_img.gif', '市区精华游经济1日游', 'xxx', '342234', '桂林', '3', '巴士', '1', '1', '12', '1', null);
INSERT INTO `tour` VALUES ('Tour', '7', '333', '111', 'xxx', '每天', '/image/hotel_img.gif', '市区精华游经济1日游', 'xxx', '222', '桂林', '1', '巴士', '1', '1', '1', '2', null);
INSERT INTO `tour` VALUES ('Tour', '8', '444', '122', 'xxdw', '每天', '/image/hotel_img.gif', '市区精华游经济1日游', 'xxxx', '333', '桂林', '2', '巴士', '1', '1', '1', '3', null);
INSERT INTO `tour` VALUES ('Tour', '9', '111', '333', 'xxdds', 'xxx', '/image/hotel_img.gif', '市区精华游经济1日游', 'xx', '222', 'xxx', '2', 'xxx', '1', '1', '12', '2', null);
INSERT INTO `tour` VALUES ('Tour', '10', '44', '22', 'x', 'xx', '/image/hotel_img.gif', '市区精华游经济1日游', 'x', '33', 'xx', '1', 'xxx', '1', '2', '1', '3', null);
INSERT INTO `tour` VALUES ('Tour', '11', '22', '33', 'xx', 'xxx', '/image/hotel_img.gif', '市区精华游经济1日游', 'x', '44', 'xx', '1', 'xxx', '1', '2', '1', '3', null);
INSERT INTO `tour` VALUES ('Tour', '12', '33', '11', 'xx', 'xx', '/image/hotel_img.gif', '市区精华游经济1日游', 'xx', '22', 'xx', '1', 'xxx', '1', '4', '1', '5', null);
INSERT INTO `tour` VALUES ('Tour', '13', '322', '3232', 'xxxxxx', 'xx', '/image/hotel_img.gif', '市区精华游经济1日游', 'xxxxxx', '332', 'xx', '2', 'xxx', '1', '4', '13', '4', null);
INSERT INTO `tour` VALUES ('Tour', '14', '343', '232332', 'xx', 'xx', '/image/hotel_img.gif', '市区精华游经济1日游', 'xxx', '33232', 'xx', '1', 'xxx', '1', '1', '13', '6', null);
INSERT INTO `tour` VALUES ('Tour', '15', '22', '222', 'xxxcx', '每天', '/image/hotel_img.gif', '[玩转桂林]桂林纯玩五游二江四湖', 'xxxx', '111', '桂林', '1', '巴士', '1', '1', '1', '3', null);
INSERT INTO `tour` VALUES ('Tour', '16', '23423', '32', 'ssdadsa', 'xxx', 'image/hotel_img.gif', '[玩转桂林]桂林纯玩五游二江四湖', 'xxdssaxx', '324', 'xxx', '2', 'xxxx', '1', '2', '1', '3', null);
INSERT INTO `tour` VALUES ('Tour', '17', '4444', '222', 'xx', 'xxx', 'xxxx', '市区精华游经济1日游', 'xxx', '333', 'xxx', '0', 'xxx', '1', '1', '12', '3232', null);
INSERT INTO `tour` VALUES ('Tour', '18', '444', '22', 'xx', 'xx', 'xx', '市区精华游经济1日游', 'xxx', '333', 'xx', '0', 'xxx', '1', '1', '12', '34', null);
INSERT INTO `tour` VALUES ('Tour', '19', '3443', '332', 'xxxxx', 'xxx', 'xx', '市区精华游经济1日游', 'xxx', '4334', 'xxx', '0', 'xxxx', '1', '1', '12', '324', null);
INSERT INTO `tour` VALUES ('Tour', '20', '3443', '232', 'xxddsaas', 'xxx', 'sdfds', '市区精华游经济1日游', 'sasdasad32', '323', 'xxx', '1', 'xxxx', '1', '2', '12', '32', '2');
INSERT INTO `tour` VALUES ('Tour', '21', '3423', '324', 'dsa', 'sda', 'sdas', '市区精华游经济1日游', 'sda', '323', 'sdasda', '0', 'dsas', '1', '3', '13', '344', null);
INSERT INTO `tour` VALUES ('Tour', '22', '453', '34', 'cxz', 'cxz', 'ca', '市区精华游经济1日游', 'czx', '43', 'cxz', '0', 'czx', '1', '4', '13', '324', null);
INSERT INTO `tour` VALUES ('Tour', '23', '654', '43', 'dasdsa', 'xxxx', 'xxx', '市区精华游经济1日游', 'dadsa', '543', 'xx', '0', 'xxxx', '1', '3', '13', '534', null);
INSERT INTO `tour` VALUES ('OverseasTour', '24', '333', '111', 'xxxx', '每天', 'xxx', '境外旅游', 'xxxxx', '222', '桂林', '0', '巴士', '1', '1', '1', '1', null);
INSERT INTO `tour` VALUES ('Tour', '25', null, null, 'xxx', 'xx', 'xxx', 'xxx', '', null, 'xx', '0', 'xxx', '1', '1', null, '2', '1');
INSERT INTO `tour` VALUES ('Tour', '26', '21', '2121', '21', '12', '21', '212', '21', '212', '212', '0', '1', '1', '1', '14', '21', '1');
INSERT INTO `tour` VALUES ('Tour', '27', '2121', '212', '2121', '211', '212', '2121', '2121', '1212', '1221', '0', '21', '1', '1', '14', '21', '1');
INSERT INTO `tour` VALUES ('Tour', '28', null, '12', '4323', '342', '32', '21', '342', '21', '324', '0', '342', '1', '1', '12', '432', '1');
INSERT INTO `tour` VALUES ('Tour', '29', '444', '222', '54354', '333', 'xxx', 'xxxx', '534', '333', '222', '0', '444', '1', '1', '14', '3243', '1');
INSERT INTO `tour` VALUES ('OverseasTour', '30', '3', '432', 'xxx', '11', '33', '23443', '<p style=\"margin-left:-51.75pt;text-indent:53.5pt;\">\r\n	<b>超值赠送：<span></span></b> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	1.&nbsp;&nbsp;\r\n巴黎卢浮宫：专业中文讲解；<span></span> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	2.&nbsp;&nbsp;\r\n登巴黎蒙柏纳斯大厦，鸟瞰巴黎全景，纵观赛纳河两岸。<span></span> \r\n</p>\r\n<p>\r\n	<b>行程特色：</b> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	1.&nbsp;&nbsp;\r\n乘坐阿联酋航空公司客机飞往欧洲，优质服务，使整个飞行便捷舒适；<span></span> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	2.&nbsp;&nbsp; 安排专业中文领队，为您全程提供贴心周到的服务；\r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	3.&nbsp;&nbsp; 当地三<span>-</span>四星级酒店住宿，五菜一汤。\r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	4. 时尚之都<span>-</span><b>巴黎</b>：充分感受浪漫之都的文化风情，巴黎绝对是时尚和奢侈品的天堂，在巴黎游客可以搜<span></span> \r\n</p>\r\n<p>\r\n	&nbsp; 罗到最全的顶级消费品，享受贵族般的顶级服务；<span></span> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	5. 千年古城<span>-</span><b>罗马</b>、浪漫水都<span>-</span><b>威尼斯</b>、文艺复兴发源地<span>-</span><b>佛罗伦萨</b>，在庄严、喧闹、辉煌的意大利，经历<span></span> \r\n</p>\r\n<p style=\"text-indent:10.5pt;\">\r\n	一次精彩的旅程；<span></span> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	6. 湖畔小镇<span>-</span><b>琉森</b>：感受阿尔卑斯山的蜿蜒与壮丽；<span></span> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	7. 教皇之国<span>-</span><b>梵蒂冈</b>：在“先知之地”感受历代教廷遗存的威严古朴；<span></span> \r\n</p>\r\n<p style=\"margin-left:21.0pt;text-indent:-21.0pt;\">\r\n	8. 北方威尼斯—<b>阿姆斯特丹</b>：荷兰的工业、金融贸易、旅游和文化艺术中心；\r\n</p>\r\n<p>\r\n	6.欧洲之都<span>-</span><b>布鲁塞尔</b>：体验欧洲之都的情怀；<span></span> \r\n</p>\r\n<p>\r\n	7.千堡之国<span>-</span><b>卢森堡：</b>游览现今欧洲大陆仅存的大公国。<span></span> \r\n</p>\r\n<p>\r\n	<span>&nbsp;</span> \r\n</p>\r\n<p style=\"margin-left:-53.95pt;text-align:justify;text-indent:31.5pt;\">\r\n	&nbsp;<b>&nbsp;</b><b>一、行程安排</b>：<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>签证种类：意签<span></span> \r\n</p>\r\n<div align=\"center\">\r\n	<table border=\"1\" cellspacing=\"0\" cellpadding=\"0\" width=\"714\">\r\n		<tbody>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">日期<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">行<span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>程<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">用餐<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">交通<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">住宿<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>01</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">深圳—香港<span></span></span></b> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">在深圳蛇口码头集合，乘船前往香港机场，办理登机手续后，我们将满怀着快乐与期待乘坐阿联酋航空公司客机经迪拜飞往“永恒之都”罗马。<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>02</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">香港<span> / </span>迪拜<span> / </span>罗马（梵蒂冈）<span></span></span></b> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">抵达后，乘车前往教皇之国－梵蒂冈，观圣彼得大教堂（不少于<span>60</span>分钟），圣彼得广场（不少于<span>20</span>分钟），之后参观具有<span>2000</span>余年文化历史的帝国著名景观：著名的斗兽场外景（不少于<span>30</span>分钟），君士坦丁凯旋门，途经帝国大道，古罗马废墟，参观传说中的幸福喷泉－许愿池（不少于<span>30</span>分钟）。<span></span></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">航 班 号：</span><span style=\"font-family:宋体;\">EK381 00:35-04:35</span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; EK97&nbsp; 09:25-13:45</span><span style=\"font-family:宋体;\"></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">飞机<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span> </span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>03</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">罗马—佛罗伦萨</span></b><span style=\"font-family:宋体;\">（预计<span>280</span>公里）<b><span></span></b></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">早餐后，乘车前往文艺复兴的发源地—佛罗伦萨，游览君主广场，参观圣母之花大教堂（不少于<span>30</span>分钟），圣母之花大教堂是文艺复兴时期一座伟大建筑，<span>1295</span>年开始兴建，<span>1496</span>年才最后完工，是世界第四大教堂。夜宿意大利小镇。</span><span style=\"font-family:宋体;\"></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">午餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>04</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">佛罗伦萨—威尼斯—意大利小镇</span></b><span style=\"font-family:宋体;\">（预计<span>270</span>公里<span>/</span>预计<span>230</span>公里）<b><span></span></b></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐后，乘车前往水城威尼斯，乘船到威尼斯本岛。外观叹息桥（不少于<span>15</span>分钟），此桥连接旧时审判庭与地牢，因犯人被送进地牢时不住的叹息而得名，参观圣马可广场，又称威尼斯中心广场，它一直是威尼斯的政治、宗教和传统节日的公共活动中心，被拿破仑称为“世界上最美丽的客厅”，外观用云石精心雕嵌、镶上颜色玻璃的建筑—圣马可大教堂（不少于<span>20</span>分钟），欣赏意大利吹玻璃工艺（不少于<span>40</span>分钟）。夜宿意大利小镇。</span><span style=\"font-family:宋体;\"></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">午餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>自理<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>05</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">意大利小镇—琉森</span></b><span style=\"font-family:宋体;\">（预计<span>290</span>公里）<b><span></span></b></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐后，乘车前往瑞士中部第一度假胜地－琉森，</span><span style=\"font-family:宋体;\">参观</span><span style=\"font-family:宋体;\">水塔花桥，参观</span><span style=\"font-family:宋体;\">由丹麦雕刻家特尔巴尔森设计的狮子纪念碑（不少于<span>30</span>分钟），整座纪念碑是雕刻在整块崖壁上的石像，意在祈求世界和平，参观风格独特的卡贝尔桥及群山环抱、风景如画的琉森湖。</span><span style=\"font-family:宋体;\"></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">午餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>06</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">琉森</span></b><b><span style=\"font-family:宋体;\">—巴黎</span></b><span style=\"font-family:宋体;\">（预计<span>577</span>公里）<b><span></span></b></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐后</span><span style=\"font-family:宋体;\">，乘车前往“时尚之都”巴黎，它是一座拥有众多古迹建筑和深厚历史沉淀的世界历史名城，同时它还是融合文化与艺术精华于一身的文化之都，与生俱来的时尚气息吸引着成千上万追求品质的潮流追随者。<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">午餐<span>:</span>自理<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>07</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">巴黎<span></span></span></b> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐后，入内参观法国国家艺术宝库－<b><u>卢浮宫</u></b></span><span style=\"font-family:宋体;\">（不少于<span>100</span>分钟），现今是世界三大博物馆之一，如今博物馆收藏的艺术品已达<span>40</span>万件，其中包括雕塑、绘画、美术工艺及古代东方、古代埃及和古希腊罗马等<span>7</span>个门类</span><span style=\"font-family:宋体;\">，在这里可以亲眼目睹世界名画－“蒙娜丽莎”，“维娜斯”雕像及“胜利女神”雕像，登上著名的<b><u>蒙柏纳斯大厦</u></b>（不少于<span>30</span>分钟），整栋大厦高<span>210</span>米，是巴黎最高的建筑，游客可以将整个城市的绚丽美景尽收眼底，在埃菲尔铁塔前驻足留影</span><span style=\"font-family:宋体;\">。</span><span style=\"font-family:宋体;\">前往著名的巴黎花宫娜香水博物馆（不少于<span>40</span>分钟），参观法国香水制作工艺，体验闻名世界的法国的香水文化。参观雄伟的协和广场（不少于<span>30</span>分钟），这里被法国人民誉为“世界上最美丽的广场”，车经豪华优雅的世界第一街—香榭丽舍大街，在宏伟壮丽的凯旋门前留影。在欧洲最著名的百货公司自由购物，巴黎的货品林林总总，无论是名牌时装、香水、还是精致典雅的工艺品，无一不散发着巴黎特有的浪漫情致。</span><span style=\"font-family:宋体;\"></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">午餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>08</span>天 <span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">巴黎—卢森堡—布鲁塞尔</span></b><span style=\"font-family:宋体;\">（预计<span>365</span>公里<span>/</span>预计<span>212</span>公里）<b><span></span></b></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐后，</span><span style=\"font-family:宋体;\">乘车前往被法国、德国和比利时所包围的大公国卢森堡，观风格独特的阿道尔夫大桥（不少于<span>15</span>分钟），欣赏佩特罗斯大峡谷的迷人风光。之后乘车前往比利时首都－被称为“欧洲之都”的布鲁塞尔。</span><span style=\"font-family:宋体;\"> </span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">午餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>09</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">布鲁塞尔</span></b><b><span style=\"font-family:宋体;\">—阿姆斯特丹</span></b><span style=\"font-family:宋体;\">（预计<span>220</span>公里）<b><span></span></b></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐后，</span><span style=\"font-family:宋体;\">外观赏顶天立地、气势非凡的原子塔（不少于<span>30</span>分钟），游览雄伟的大广场（不少于<span>30</span>分钟），探访布市第一公民－尿童于连（不少于<span>20</span>分钟）：于连雕像仅高<span>50</span>厘米，它建于<span>1619</span>年、是雕塑大师捷罗姆克思诺的作品。之后乘车前往荷兰的工业、金融贸易、旅游和文化艺术中心—阿姆斯特丹。</span><span style=\"font-family:宋体;\"></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n					<p align=\"left\" style=\"text-align:left;\">\r\n						<span style=\"font-family:宋体;\">午餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">晚餐<span>:</span>中式餐食<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">三星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">或<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">四星<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">同级<span></span></span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>10</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">阿姆斯特丹<span> / </span>迪拜（</span></b><span style=\"font-family:宋体;\">航 班 号：<span>EK148\r\n  15:30-23:59</span><b>）<span></span></b></span> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐后，探访风格独特的扎达姆风车村（不少于<span>60</span>分钟），参观村内传统木鞋加工厂，驰名世界的钻石加工厂，十六世纪钻石加工业引进到荷兰，使其逐渐发展成世界著名的钻石加工中心。阿姆斯特丹著名的钻石加工厂都对外开放参观，由专业人士介绍钻石的加工过程和鉴定方法。之后乘车前往机场办理登机手续，乘坐阿联酋航空公司豪华客机经迪拜转机返回香港。<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<span style=\"font-family:宋体;\">早餐<span>:</span>酒店内<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">汽车飞机<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n			<tr>\r\n				<td width=\"92\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">第<span>11</span>天<span></span></span> \r\n					</p>\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"404\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p>\r\n						<b><span style=\"font-family:宋体;\">迪拜<span> / </span>香港—深圳（</span></b><span style=\"font-family:宋体;\">航 班\r\n  号：<span>EK382 03:20-15:05</span></span><b><span style=\"font-family:宋体;\">）<span></span></span></b> \r\n					</p>\r\n					<p>\r\n						<span style=\"font-family:宋体;\">抵达香港机场后，乘旅游巴士返回深圳散团。请将护照、登机牌交予领队，以便送入领事馆进行销签工作。根据领事馆要求，所有办理团队签证的客人均有可能被通知前往领事馆进行面试销签，请提前作好思想准备，谢谢配合！<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"114\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">飞机<span></span></span> \r\n					</p>\r\n				</td>\r\n				<td width=\"52\" style=\"border:solid windowtext 1.0pt;\">\r\n					<p align=\"center\" style=\"text-align:center;\">\r\n						<span style=\"font-family:宋体;\">&nbsp;</span> \r\n					</p>\r\n				</td>\r\n			</tr>\r\n		</tbody>\r\n	</table>\r\n</div>\r\n<p>\r\n	<b>三、服务所含：<span></span></b> \r\n</p>\r\n<p>\r\n	<span>1. ADS</span>团队旅游签证费；\r\n</p>\r\n<p>\r\n	<span>2. </span>行程中所标明的欧洲星级双人间酒店住宿及早餐；\r\n</p>\r\n<p>\r\n	<span>3. </span>午、晚餐以中式餐食为主（用餐标准为五菜一汤）；\r\n</p>\r\n<p>\r\n	<span>4. </span>全程提供巴士，专业司机；\r\n</p>\r\n<p>\r\n	<span>5. </span>欧洲境内中文陪同；\r\n</p>\r\n<p>\r\n	<span>6. </span>行程所含门票：巴黎卢浮宫（含讲解），巴黎蒙柏纳斯大厦；\r\n</p>\r\n<p>\r\n	<span>7. </span>国际间往返机票及欧洲境内段机票（经济舱、含机场税）。\r\n</p>\r\n<p>\r\n	<b>四、不含服务：<span></span></b> \r\n</p>\r\n<p>\r\n	<span>1. </span>护照费、申请签证中准备相关材料所需的制作、手续费，如未成年人所需的公证书、认证费；\r\n</p>\r\n<p>\r\n	<span>2. </span>小费<span>80</span>欧元<span>/</span>人（欧洲各国均有付小费的规定）；\r\n</p>\r\n<p>\r\n	<span>3. </span>交通工具上非免费餐饮费、洗衣、理发、电话、饮料、烟酒、付费电视、行李搬运、自由活动期间等\r\n</p>\r\n<p>\r\n	私人费用；\r\n</p>\r\n<p>\r\n	<span>4. </span>出入境的行李海关课税，超重行李的托运费、管理费等；\r\n</p>\r\n<p>\r\n	<span>5. </span>行程中未提到的其它费用：如特殊门票、游船（轮）、缆车、地铁票等费用；\r\n</p>\r\n<p>\r\n	<span>6. </span>行程中自理餐。\r\n</p>\r\n<p>\r\n	<span>7. </span>桂林<span>/</span>深圳往返交通\r\n</p>\r\n<p style=\"margin-left:-12.4pt;text-indent:-23.5pt;\">\r\n	&nbsp; &nbsp;\r\n</p>', '43', '22', '8', 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', '1', '1', '1', '432', '1');

-- ----------------------------
-- Table structure for `tour_address`
-- ----------------------------
DROP TABLE IF EXISTS `tour_address`;
CREATE TABLE `tour_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tour_address
-- ----------------------------
INSERT INTO `tour_address` VALUES ('1', '桂林', '0');
INSERT INTO `tour_address` VALUES ('2', '漓江阳朔', '0');
INSERT INTO `tour_address` VALUES ('3', '龙胜', '0');
INSERT INTO `tour_address` VALUES ('4', '桂林周边', '0');
INSERT INTO `tour_address` VALUES ('5', '越南', '0');
INSERT INTO `tour_address` VALUES ('6', '北海', '0');
INSERT INTO `tour_address` VALUES ('7', '德天瀑布', '0');
INSERT INTO `tour_address` VALUES ('8', '黄姚古镇', '0');
INSERT INTO `tour_address` VALUES ('9', '巴马', '0');
INSERT INTO `tour_address` VALUES ('10', '广西其他', '0');
INSERT INTO `tour_address` VALUES ('11', '不限', '0');

-- ----------------------------
-- Table structure for `tour_day`
-- ----------------------------
DROP TABLE IF EXISTS `tour_day`;
CREATE TABLE `tour_day` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tour_day
-- ----------------------------
INSERT INTO `tour_day` VALUES ('1', '一日游', '0');
INSERT INTO `tour_day` VALUES ('2', '二日游', '0');
INSERT INTO `tour_day` VALUES ('3', '三日游', '0');
INSERT INTO `tour_day` VALUES ('4', '四日游', '0');
INSERT INTO `tour_day` VALUES ('7', '多日游', '0');

-- ----------------------------
-- Table structure for `tour_type`
-- ----------------------------
DROP TABLE IF EXISTS `tour_type`;
CREATE TABLE `tour_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `version` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tour_type
-- ----------------------------
INSERT INTO `tour_type` VALUES ('1', '纯玩团', '0');
INSERT INTO `tour_type` VALUES ('2', '经济拼团', '0');
INSERT INTO `tour_type` VALUES ('3', '度假休闲', '0');
INSERT INTO `tour_type` VALUES ('4', '摄影', '0');
INSERT INTO `tour_type` VALUES ('5', '浪漫婚纱', '0');
INSERT INTO `tour_type` VALUES ('6', '激情户外', '0');
INSERT INTO `tour_type` VALUES ('7', '深度文化', '0');
INSERT INTO `tour_type` VALUES ('8', '高尔夫', '0');
INSERT INTO `tour_type` VALUES ('9', '自架车', '0');
INSERT INTO `tour_type` VALUES ('10', '自助游', '0');
INSERT INTO `tour_type` VALUES ('12', '桂林散客游', '0');
INSERT INTO `tour_type` VALUES ('13', '独立用车游', '0');
INSERT INTO `tour_type` VALUES ('14', '国内路线', '0');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('sa', 'sa', '1');
INSERT INTO `users` VALUES ('admin', 'glsywl', '1');
INSERT INTO `users` VALUES ('root', '520', '1');
