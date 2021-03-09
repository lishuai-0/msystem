/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : manage

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 08/01/2021 11:24:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for base
-- ----------------------------
create database manage;
use manage;
DROP TABLE IF EXISTS `base`;
CREATE TABLE `base`  (
  `bno` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `adress` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`bno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of base
-- ----------------------------
INSERT INTO `base` VALUES ('A', '武汉仓库', '武汉');
INSERT INTO `base` VALUES ('B', '上海仓库', '上海');
INSERT INTO `base` VALUES ('C', '杭州仓库', '杭州');
INSERT INTO `base` VALUES ('D', '深圳仓库', '深圳');
INSERT INTO `base` VALUES ('E', '北京仓库', '北京');
INSERT INTO `base` VALUES ('F', '广州仓库', '广州');
INSERT INTO `base` VALUES ('G', '天门仓库', '天门');
INSERT INTO `base` VALUES ('H', '苏州仓库', '苏州');
INSERT INTO `base` VALUES ('I', '洛阳仓库', '洛阳');

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `gno` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `gname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `gtype` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`gno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('10001', '苹果', '水果 ');
INSERT INTO `goods` VALUES ('10002', '葡萄', '水果');
INSERT INTO `goods` VALUES ('10003', '床', '家具 ');
INSERT INTO `goods` VALUES ('10004', '梨子', '水果 ');
INSERT INTO `goods` VALUES ('10005', '香蕉', '水果 ');
INSERT INTO `goods` VALUES ('10008', '大米', '食物 ');

-- ----------------------------
-- Table structure for stock
-- ----------------------------
DROP TABLE IF EXISTS `stock`;
CREATE TABLE `stock`  (
  `gno` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `bno` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `stockNum` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`gno`, `bno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stock
-- ----------------------------
INSERT INTO `stock` VALUES ('10001', 'A', 212);
INSERT INTO `stock` VALUES ('10001', 'B', 400);
INSERT INTO `stock` VALUES ('10001', 'C', 380);
INSERT INTO `stock` VALUES ('10002', 'B', 171);
INSERT INTO `stock` VALUES ('10002', 'C', 21);
INSERT INTO `stock` VALUES ('10003', 'A', 541);
INSERT INTO `stock` VALUES ('10003', 'B', 50);
INSERT INTO `stock` VALUES ('10004', 'A', 53);
INSERT INTO `stock` VALUES ('10005', 'A', 7);
INSERT INTO `stock` VALUES ('10008', 'A', 181);
INSERT INTO `stock` VALUES ('10008', 'B', 123);
INSERT INTO `stock` VALUES ('10008', 'C', 431);

-- ----------------------------
-- Table structure for supplier
-- ----------------------------
DROP TABLE IF EXISTS `supplier`;
CREATE TABLE `supplier`  (
  `sno` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sname` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `adress` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`sno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of supplier
-- ----------------------------
INSERT INTO `supplier` VALUES ('00001', '阿里', '北京', '18062795547');
INSERT INTO `supplier` VALUES ('00002', '百度', '北京', '13751256211');
INSERT INTO `supplier` VALUES ('00003', '腾讯', '深圳', '18065324125');
INSERT INTO `supplier` VALUES ('00004', '淘宝', '武汉', '12345678902');
INSERT INTO `supplier` VALUES ('00005', '立得', '武汉', '12345678903');
INSERT INTO `supplier` VALUES ('00006', '谷歌', '纽约', '74185296301');
INSERT INTO `supplier` VALUES ('00007', '外婆桥', '湖北', '18062354785');
INSERT INTO `supplier` VALUES ('00008', '地信', '长达', '18062124123');
INSERT INTO `supplier` VALUES ('00009', '美团', '天津', '13835421265');

-- ----------------------------
-- Table structure for t_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_menu`;
CREATE TABLE `t_menu`  (
  `mno` int(11) NOT NULL AUTO_INCREMENT,
  `mname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mhref` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mtarget` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `pno` int(11) NULL DEFAULT NULL,
  `yl1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yl2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`mno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_menu
-- ----------------------------
INSERT INTO `t_menu` VALUES (1, '权限管理', NULL, NULL, -1, NULL, NULL);
INSERT INTO `t_menu` VALUES (3, '角色管理', 'roleList.do', 'right', 1, NULL, NULL);
INSERT INTO `t_menu` VALUES (4, '菜单管理', 'menuList.jsp', 'right', 1, NULL, NULL);
INSERT INTO `t_menu` VALUES (9, '系统管理', NULL, NULL, -1, NULL, NULL);
INSERT INTO `t_menu` VALUES (22, '基本信息管理', NULL, NULL, -1, NULL, NULL);
INSERT INTO `t_menu` VALUES (23, '货物管理', 'page/Goods.jsp', 'right', 22, NULL, NULL);
INSERT INTO `t_menu` VALUES (24, '库存管理', 'page/stock.jsp', 'right', 22, NULL, NULL);
INSERT INTO `t_menu` VALUES (25, '供应商管理', 'page/supplier.jsp', NULL, 22, NULL, NULL);
INSERT INTO `t_menu` VALUES (26, '仓库管理', 'page/base.jsp', NULL, 22, NULL, NULL);
INSERT INTO `t_menu` VALUES (28, '用户管理', 'userList.do', 'right', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_role
-- ----------------------------
DROP TABLE IF EXISTS `t_role`;
CREATE TABLE `t_role`  (
  `rno` int(11) NOT NULL AUTO_INCREMENT,
  `rname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yl1` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yl2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`rno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role
-- ----------------------------
INSERT INTO `t_role` VALUES (1, '系统管理员', '非常牛', NULL, NULL);
INSERT INTO `t_role` VALUES (2, '货物管理员', '很牛', NULL, NULL);
INSERT INTO `t_role` VALUES (3, '仓库管理员', '一般', NULL, NULL);
INSERT INTO `t_role` VALUES (4, '供应商管理员', '一般', NULL, NULL);
INSERT INTO `t_role` VALUES (5, '库存管理员', '一般', NULL, NULL);

-- ----------------------------
-- Table structure for t_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `t_role_menu`;
CREATE TABLE `t_role_menu`  (
  `rno` int(11) NOT NULL,
  `mno` int(11) NOT NULL,
  PRIMARY KEY (`rno`, `mno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_role_menu
-- ----------------------------
INSERT INTO `t_role_menu` VALUES (1, 1);
INSERT INTO `t_role_menu` VALUES (1, 2);
INSERT INTO `t_role_menu` VALUES (1, 3);
INSERT INTO `t_role_menu` VALUES (1, 4);
INSERT INTO `t_role_menu` VALUES (1, 9);
INSERT INTO `t_role_menu` VALUES (1, 12);
INSERT INTO `t_role_menu` VALUES (1, 14);
INSERT INTO `t_role_menu` VALUES (1, 22);
INSERT INTO `t_role_menu` VALUES (1, 23);
INSERT INTO `t_role_menu` VALUES (1, 24);
INSERT INTO `t_role_menu` VALUES (1, 25);
INSERT INTO `t_role_menu` VALUES (1, 26);
INSERT INTO `t_role_menu` VALUES (1, 27);
INSERT INTO `t_role_menu` VALUES (1, 28);
INSERT INTO `t_role_menu` VALUES (2, 22);
INSERT INTO `t_role_menu` VALUES (2, 23);
INSERT INTO `t_role_menu` VALUES (3, 22);
INSERT INTO `t_role_menu` VALUES (3, 26);
INSERT INTO `t_role_menu` VALUES (4, 22);
INSERT INTO `t_role_menu` VALUES (4, 25);
INSERT INTO `t_role_menu` VALUES (5, 22);
INSERT INTO `t_role_menu` VALUES (5, 24);
INSERT INTO `t_role_menu` VALUES (7, 1);
INSERT INTO `t_role_menu` VALUES (7, 2);
INSERT INTO `t_role_menu` VALUES (7, 27);
INSERT INTO `t_role_menu` VALUES (7, 28);
INSERT INTO `t_role_menu` VALUES (7, 29);
INSERT INTO `t_role_menu` VALUES (7, 31);

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `uno` int(11) NOT NULL AUTO_INCREMENT,
  `uname` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `upass` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `trueName` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `sex` char(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `yl2` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`uno`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 364 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'zs', '123', '张三', 54, '男', '123', '47440880@qq.com', NULL);
INSERT INTO `t_user` VALUES (360, 'zs1', '123', '1fsda', 1, '男', '1', '47440880@qq.com', NULL);
INSERT INTO `t_user` VALUES (361, 'zs2', '123', '1fdsafds', 1, '女', '1', '47440880@qq.com', NULL);
INSERT INTO `t_user` VALUES (362, 'zs3', '123', '1fsda', 1, '男', '1', '47440880@qq.com', NULL);
INSERT INTO `t_user` VALUES (363, 'zs4', '123', '1fdsafds', 1, '女', '1', '47440880@qq.com', NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `uno` int(11) NOT NULL,
  `rno` int(11) NOT NULL,
  PRIMARY KEY (`uno`, `rno`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (1, 1);
INSERT INTO `t_user_role` VALUES (1, 2);
INSERT INTO `t_user_role` VALUES (1, 3);
INSERT INTO `t_user_role` VALUES (1, 4);
INSERT INTO `t_user_role` VALUES (1, 5);
INSERT INTO `t_user_role` VALUES (1, 6);
INSERT INTO `t_user_role` VALUES (1, 7);
INSERT INTO `t_user_role` VALUES (360, 3);
INSERT INTO `t_user_role` VALUES (361, 4);
INSERT INTO `t_user_role` VALUES (362, 5);

SET FOREIGN_KEY_CHECKS = 1;
