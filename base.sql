/*
Navicat MySQL Data Transfer

Source Server         : secret
Source Server Version : 50647
Source Host           : 127.0.0.1:3306
Source Database       : micro_book_mall

Target Server Type    : MYSQL
Target Server Version : 50647
File Encoding         : 65001

Date: 2020-05-09 17:41:46
*/

SET FOREIGN_KEY_CHECKS=0;

CREATE DATABASE `micro_book_mall` ;/*!40100 DEFAULT CHARACTER SET latin1 */

-- ----------------------------
-- Table structure for inventory
-- ----------------------------
DROP TABLE IF EXISTS `inventory`;
CREATE TABLE `inventory` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` int(10) unsigned NOT NULL COMMENT '书id',
  `unit_price` int(10) unsigned NOT NULL COMMENT '单价',
  `stock` int(10) unsigned NOT NULL COMMENT '总数',
  `version` int(10) unsigned NOT NULL COMMENT '版本号',
  `created_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='库存表';


-- ----------------------------
-- Table structure for inventory_history
-- ----------------------------
DROP TABLE IF EXISTS `inventory_history`;
CREATE TABLE `inventory_history` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `book_id` int(10) unsigned NOT NULL COMMENT '书id',
  `user_id` int(10) unsigned NOT NULL COMMENT '单价',
  `state` int(10) unsigned NOT NULL COMMENT '未出库1，出库2',
  `created_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单表历史';


-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `book_id` int(10) NOT NULL COMMENT '书id',
  `inv_his_id` int(10) NOT NULL COMMENT '库存历史记录id',
  `state` tinyint(1) NOT NULL COMMENT '1未支付，2支付',
  `created_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='订单表';


-- ----------------------------
-- Table structure for payment
-- ----------------------------
DROP TABLE IF EXISTS `payment`;
CREATE TABLE `payment` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `book_id` int(10) NOT NULL COMMENT '书id',
  `order_id` int(10) NOT NULL COMMENT '订单id',
  `inv_his_id` int(10) NOT NULL COMMENT '库存历史id',
  `state` tinyint(1) NOT NULL COMMENT '1：未支付，2：支付',
  `created_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin COMMENT='支付表';


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(20) NOT NULL COMMENT '用户名',
  `pwd` varchar(128) NOT NULL COMMENT '密码',
  `created_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `updated_time` timestamp(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_user_name_uindex` (`user_name`),
  UNIQUE KEY `user_user_id_uindex` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 COMMENT='用户表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '10001', 'micro', '1234', '2020-05-08 06:28:26.713', '2020-05-08 06:28:26.713');
