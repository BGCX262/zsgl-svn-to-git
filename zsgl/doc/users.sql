/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50517
Source Host           : localhost:3306
Source Database       : roo

Target Server Type    : MYSQL
Target Server Version : 50517
File Encoding         : 65001

Date: 2012-07-28 22:24:16
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(20) DEFAULT NULL,
  `password` varchar(20) DEFAULT NULL,
  `enabled` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('aaaaaa', 'aaaaaa', '1');
INSERT INTO `users` VALUES ('admin', 'admin', '1');
