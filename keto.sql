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
INSERT INTO `csdl_sdt` VALUES (1, '912340000', 'Nội dung mess gửi 1', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (2, '912340001', 'Nội dung mess gửi 2', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (3, '912340002', 'Nội dung mess gửi 3', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (4, '912340003', 'Nội dung mess gửi 4', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (5, '912340004', 'Nội dung mess gửi 5', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (6, '912340005', 'Nội dung mess gửi 6', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (7, '912340006', 'Nội dung mess gửi 7', 0, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (8, '912340007', 'Nội dung mess gửi 8', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (9, '912340008', 'Nội dung mess gửi 9', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (10, '912340009', 'Nội dung mess gửi 10', 1, 'used', '2022-09-25 20:57:00', '2022-09-25 20:57:00', '9908808463', 'Team1');
INSERT INTO `csdl_sdt` VALUES (11, '912340010', 'Nội dung mess gửi 11', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (12, '912340011', 'Nội dung mess gửi 12', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (13, '912340012', 'Nội dung mess gửi 13', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (14, '912340013', 'Nội dung mess gửi 14', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (15, '912340014', 'Nội dung mess gửi 15', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (16, '912340015', 'Nội dung mess gửi 16', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (17, '912340016', 'Nội dung mess gửi 17', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);
INSERT INTO `csdl_sdt` VALUES (18, '912340017', 'Nội dung mess gửi 18', 1, NULL, '2022-09-25 20:57:00', NULL, NULL, NULL);

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
INSERT INTO `csdl_upload_inboxmess` VALUES (1, '9908808463', 912345678, 'Nội dung inbox số 1', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (2, '5273508816', 912345679, 'Nội dung inbox số 2', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (3, '3681197002', 912345680, 'Nội dung inbox số 3', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (4, '8218443323', 912345681, 'Nội dung inbox số 4', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (5, '6366410978', 912345682, 'Nội dung inbox số 5', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (6, '3945493647', 912345683, 'Nội dung inbox số 6', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (7, '4792457204', 912345684, 'Nội dung inbox số 7', 'Team1', '2022-09-25 20:57:00');
INSERT INTO `csdl_upload_inboxmess` VALUES (8, '5508004158', 912345685, 'Nội dung inbox số 8', 'Team1', '2022-09-25 20:57:00');

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
