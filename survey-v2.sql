/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80011
 Source Host           : localhost:3306
 Source Schema         : survey

 Target Server Type    : MySQL
 Target Server Version : 80011
 File Encoding         : 65001

 Date: 12/07/2020 23:41:19
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2081 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_admin
-- ----------------------------
INSERT INTO `tb_admin` VALUES (2073, 'admin', 'e4231e2e70aa6acf73928e7fb1e476b9', 'xx', '18533333333', '');
INSERT INTO `tb_admin` VALUES (2077, 'xx', '433db2fa87c8e880868dcf6ae9c2fca2', 'xxx', '18555555555', 'xxxx');
INSERT INTO `tb_admin` VALUES (2079, 'asdfasdf', '433db2fa87c8e880868dcf6ae9c2fca2', 'asdfasdfasdf', '18533333333', '');
INSERT INTO `tb_admin` VALUES (2080, '111111111111111111111111111', '433db2fa87c8e880868dcf6ae9c2fca2', '111111111111111111111', '18533333333', '');
INSERT INTO `tb_admin` VALUES (2081, '啊啊啊', '433db2fa87c8e880868dcf6ae9c2fca2', 'javascript:;', '18533333333', '');

-- ----------------------------
-- Table structure for tb_answer_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_opt`;
CREATE TABLE `tb_answer_opt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `opt_id` int(11) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1radio|2checkbox',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `voter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_2`(`opt_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_answer_opt
-- ----------------------------
INSERT INTO `tb_answer_opt` VALUES (23, 19, 33, 96, '1', '2020-06-16 09:39:38', 'ef539923-716d-4735-a286-81167a1f4e63');
INSERT INTO `tb_answer_opt` VALUES (24, 19, 34, 100, '2', '2020-06-16 09:39:38', 'ef539923-716d-4735-a286-81167a1f4e63');
INSERT INTO `tb_answer_opt` VALUES (25, 19, 33, 97, '1', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (26, 19, 34, 100, '2', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (27, 19, 34, 102, '2', '2020-06-16 09:39:45', 'de0be419-4847-4e00-8590-3b7ddfec1671');
INSERT INTO `tb_answer_opt` VALUES (28, 19, 33, 98, '1', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_opt` VALUES (29, 19, 34, 103, '2', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_opt` VALUES (30, 19, 33, 97, '1', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (31, 19, 34, 101, '2', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (32, 19, 34, 103, '2', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');
INSERT INTO `tb_answer_opt` VALUES (33, 20, 41, 120, '1', '2020-07-12 22:52:48', '1ec92c75-1692-4ecb-9786-6346ab9f4162');
INSERT INTO `tb_answer_opt` VALUES (34, 20, 42, 124, '2', '2020-07-12 22:52:48', '1ec92c75-1692-4ecb-9786-6346ab9f4162');
INSERT INTO `tb_answer_opt` VALUES (35, 20, 42, 125, '2', '2020-07-12 22:52:48', '1ec92c75-1692-4ecb-9786-6346ab9f4162');

-- ----------------------------
-- Table structure for tb_answer_txt
-- ----------------------------
DROP TABLE IF EXISTS `tb_answer_txt`;
CREATE TABLE `tb_answer_txt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `result` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `voter` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_answer_txt
-- ----------------------------
INSERT INTO `tb_answer_txt` VALUES (9, 19, 38, '111', '2020-06-16 09:39:38', NULL);
INSERT INTO `tb_answer_txt` VALUES (10, 19, 38, '11222', '2020-06-16 09:39:45', NULL);
INSERT INTO `tb_answer_txt` VALUES (11, 19, 38, '阿斯顿发斯蒂芬', '2020-06-16 09:41:59', NULL);
INSERT INTO `tb_answer_txt` VALUES (12, 19, 38, '啊啊啊', '2020-06-16 09:53:17', '6ac48f74-6794-406e-b354-ad8bcebc2ff7');
INSERT INTO `tb_answer_txt` VALUES (13, 19, 38, '啊啊啊', '2020-06-16 09:54:59', 'd5ebbe66-39fd-476c-ba97-c28ef12a558b');

-- ----------------------------
-- Table structure for tb_question
-- ----------------------------
DROP TABLE IF EXISTS `tb_question`;
CREATE TABLE `tb_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` int(1) NULL DEFAULT NULL COMMENT '1radio|2checkbox|3text|4textarea',
  `required` int(1) NULL DEFAULT NULL COMMENT '0非必填1必填',
  `check_style` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'text;number;date',
  `order_style` int(1) NULL DEFAULT NULL COMMENT '0顺序1随机',
  `show_style` int(1) NULL DEFAULT NULL COMMENT '1;2;3;4',
  `test` int(1) NULL DEFAULT NULL COMMENT '0不测评1测评',
  `score` int(3) NULL DEFAULT NULL,
  `orderby` int(11) NULL DEFAULT NULL,
  `creator` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  `survey_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`survey_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_question
-- ----------------------------
INSERT INTO `tb_question` VALUES (27, '标题', '描述', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-13 10:22:00', 18);
INSERT INTO `tb_question` VALUES (28, '标题', '描述', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 13:42:43', 18);
INSERT INTO `tb_question` VALUES (29, '标题', '描述', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-15 13:42:45', 18);
INSERT INTO `tb_question` VALUES (30, '标题', '描述', 4, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-15 13:42:46', 18);
INSERT INTO `tb_question` VALUES (31, '标题', '描述', 2, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 13:43:15', 18);
INSERT INTO `tb_question` VALUES (32, '标题adsfgasdfgasdsfgsadfgsdfg', '', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 13:46:03', 18);
INSERT INTO `tb_question` VALUES (33, '你未来的职业规划是什么吗？', '', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 15:20:59', 19);
INSERT INTO `tb_question` VALUES (34, '你期望的薪水', '', 2, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-15 15:21:25', 19);
INSERT INTO `tb_question` VALUES (38, '标题', '描述', 3, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2020-06-16 09:14:05', 19);
INSERT INTO `tb_question` VALUES (40, '标题', '描述', 2, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-06-16 10:55:44', 19);
INSERT INTO `tb_question` VALUES (41, '标题', '描述', 1, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-07-12 22:51:56', 20);
INSERT INTO `tb_question` VALUES (42, '标题', '描述', 2, 1, NULL, NULL, NULL, 0, 0, NULL, NULL, '2020-07-12 22:51:58', 20);

-- ----------------------------
-- Table structure for tb_question_opt
-- ----------------------------
DROP TABLE IF EXISTS `tb_question_opt`;
CREATE TABLE `tb_question_opt`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `survey_id` int(11) NULL DEFAULT NULL,
  `question_id` int(11) NULL DEFAULT NULL,
  `type` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '1radio|2checkbox',
  `opt` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orderby` int(11) NULL DEFAULT NULL,
  `answer` int(1) NULL DEFAULT NULL COMMENT '默认为NULL；1答案',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 119 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tb_question_opt
-- ----------------------------
INSERT INTO `tb_question_opt` VALUES (80, 18, 28, '1', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (81, 18, 28, '1', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (82, 18, 28, '1', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (83, 18, 28, '1', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (84, 18, 31, '2', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (85, 18, 31, '2', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (86, 18, 31, '2', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (87, 18, 31, '2', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (88, 18, 32, '1', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (89, 18, 32, '1', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (90, 18, 32, '1', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (91, 18, 32, '1', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (92, 18, 27, '1', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (93, 18, 27, '1', '选项12qasdfasdf', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (94, 18, 27, '1', '选项asdfasdf', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (95, 18, 27, '1', '选项fffffffasddddddddddddddddddddddddddddddddddddd', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (96, 19, 33, '1', 'Java软件工程师', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (97, 19, 33, '1', '前端工程师', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (98, 19, 33, '1', 'Python工程师', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (99, 19, 33, '1', '大数据工程师', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (100, 19, 34, '2', '5000', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (101, 19, 34, '2', '8000', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (102, 19, 34, '2', '10000', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (103, 19, 34, '2', '15000', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (116, 19, 40, '2', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (117, 19, 40, '2', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (118, 19, 40, '2', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (119, 19, 40, '2', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (120, 20, 41, '1', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (121, 20, 41, '1', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (122, 20, 41, '1', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (123, 20, 41, '1', '选项', 4, NULL);
INSERT INTO `tb_question_opt` VALUES (124, 20, 42, '2', '选项', 1, NULL);
INSERT INTO `tb_question_opt` VALUES (125, 20, 42, '2', '选项', 2, NULL);
INSERT INTO `tb_question_opt` VALUES (126, 20, 42, '2', '选项', 3, NULL);
INSERT INTO `tb_question_opt` VALUES (127, 20, 42, '2', '选项', 4, NULL);

-- ----------------------------
-- Table structure for tb_survey
-- ----------------------------
DROP TABLE IF EXISTS `tb_survey`;
CREATE TABLE `tb_survey`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bounds` int(1) NULL DEFAULT NULL COMMENT '0:不限制;1:限制',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `rules` int(1) NULL DEFAULT NULL COMMENT '0公开;1密码',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `state` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建、执行中、结束',
  `logo` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `bgimg` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `anon` int(1) NULL DEFAULT NULL COMMENT '0匿名；1不匿名',
  `creator` int(11) NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
