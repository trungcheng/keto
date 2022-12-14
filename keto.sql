/*
 Navicat Premium Data Transfer

 Source Server         : laragon
 Source Server Type    : MySQL
 Source Server Version : 50733
 Source Host           : localhost:3306
 Source Schema         : keto

 Target Server Type    : MySQL
 Target Server Version : 50733
 File Encoding         : 65001

 Date: 30/09/2022 17:26:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for alert
-- ----------------------------
DROP TABLE IF EXISTS `alert`;
CREATE TABLE `alert`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Device_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AlertMess` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `AlertTime` timestamp(0) NULL DEFAULT NULL,
  `Team` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of alert
-- ----------------------------
INSERT INTO `alert` VALUES (1, '9908808463', 'Alert Content', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `alert` VALUES (2, '5273508816', 'Alert Content', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `alert` VALUES (3, '3681197002', 'Alert Content', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `alert` VALUES (4, '8218443323', 'Alert Content', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `alert` VALUES (5, '6366410978', 'Alert Content', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `alert` VALUES (6, '3945493647', 'Alert Content', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `alert` VALUES (7, '4792457204', 'Alert Content', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `alert` VALUES (8, '5508004158', 'Alert Content', '2022-09-25 20:57:00', 'Team1');

-- ----------------------------
-- Table structure for csdl_device
-- ----------------------------
DROP TABLE IF EXISTS `csdl_device`;
CREATE TABLE `csdl_device`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Device_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Device_Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Insert_timeStamp` timestamp(0) NULL DEFAULT NULL,
  `Team` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csdl_device
-- ----------------------------
INSERT INTO `csdl_device` VALUES (1, '9908808463', 'OK', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `csdl_device` VALUES (2, '5273508816', 'OK', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `csdl_device` VALUES (3, '3681197002', 'OK', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `csdl_device` VALUES (4, '8218443323', 'OK', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `csdl_device` VALUES (5, '6366410978', 'OK', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `csdl_device` VALUES (6, '3945493647', 'OK', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `csdl_device` VALUES (7, '4792457204', 'OK', '2022-09-25 20:57:00', 'Team1');
INSERT INTO `csdl_device` VALUES (8, '5508004158', 'OK', '2022-09-25 20:57:00', 'Team1');

-- ----------------------------
-- Table structure for csdl_sdt
-- ----------------------------
DROP TABLE IF EXISTS `csdl_sdt`;
CREATE TABLE `csdl_sdt`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `SDT` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Priority` tinyint(1) NULL DEFAULT 0,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Insert_TimeStamp` timestamp(0) NULL DEFAULT NULL,
  `Used_TimeStamp` timestamp(0) NULL DEFAULT NULL,
  `Sent_to_by_Device` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Team` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csdl_sdt
-- ----------------------------
INSERT INTO `csdl_sdt` VALUES (1, '912340000', 'N???i dung mess g???i 1', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (2, '912340001', 'N???i dung mess g???i 2', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (3, '912340002', 'N???i dung mess g???i 3', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (4, '912340003', 'N???i dung mess g???i 4', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (5, '912340004', 'N???i dung mess g???i 5', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (6, '912340005', 'N???i dung mess g???i 6', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (7, '912340006', 'N???i dung mess g???i 7', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (8, '912340007', 'N???i dung mess g???i 8', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (9, '912340008', 'N???i dung mess g???i 9', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (10, '912340009', 'N???i dung mess g???i 10', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (11, '912340010', 'N???i dung mess g???i 11', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (12, '912340011', 'N???i dung mess g???i 12', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (13, '912340012', 'N???i dung mess g???i 13', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (14, '912340013', 'N???i dung mess g???i 14', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (15, '912340014', 'N???i dung mess g???i 15', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (16, '912340015', 'N???i dung mess g???i 16', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (17, '912340016', 'N???i dung mess g???i 17', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (18, '912340017', 'N???i dung mess g???i 18', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for csdl_upload_inboxmess
-- ----------------------------
DROP TABLE IF EXISTS `csdl_upload_inboxmess`;
CREATE TABLE `csdl_upload_inboxmess`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Device_ID` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Ib_Sdt` int(11) NULL DEFAULT NULL,
  `Ib_content` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Team` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `Ib_timestamp` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of csdl_upload_inboxmess
-- ----------------------------
INSERT INTO `csdl_upload_inboxmess` VALUES (1, '9908808463', 912345678, 'N???i dung inbox s??? 1', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (2, '5273508816', 912345679, 'N???i dung inbox s??? 2', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (3, '3681197002', 912345680, 'N???i dung inbox s??? 3', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (4, '8218443323', 912345681, 'N???i dung inbox s??? 4', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (5, '6366410978', 912345682, 'N???i dung inbox s??? 5', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (6, '3945493647', 912345683, 'N???i dung inbox s??? 6', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (7, '4792457204', 912345684, 'N???i dung inbox s??? 7', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (8, '5508004158', 912345685, 'N???i dung inbox s??? 8', 'Team1', '2022-09-25 20:57:00');

-- ----------------------------
-- Table structure for on_off_time
-- ----------------------------
DROP TABLE IF EXISTS `on_off_time`;
CREATE TABLE `on_off_time`  (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of on_off_time
-- ----------------------------
INSERT INTO `on_off_time` VALUES (1, 'On');

SET FOREIGN_KEY_CHECKS = 1;
