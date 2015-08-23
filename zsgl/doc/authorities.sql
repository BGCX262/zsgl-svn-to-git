/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : roo

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2012-07-28 22:23:49
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `authorities`
-- ----------------------------
DROP TABLE IF EXISTS `authorities`;
CREATE TABLE `authorities` (
  `username` varchar(20) DEFAULT NULL,
  `authority` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of authorities
-- ----------------------------
INSERT INTO `authorities` VALUES ('aaaaaa', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('admin', 'ROLE_USER');
INSERT INTO `authorities` VALUES ('admin', 'ROLE_ADMIN');
