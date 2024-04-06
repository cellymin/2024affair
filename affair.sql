/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : affair

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2021-06-05 17:56:14
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for af_chain
-- ----------------------------
DROP TABLE IF EXISTS `af_chain`;
CREATE TABLE `af_chain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT '1' COMMENT '1苗医生 2苗博士',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `phone` varchar(255) NOT NULL COMMENT '电话',
  `tel` varchar(255) NOT NULL COMMENT '固定电话',
  `address` varchar(255) NOT NULL COMMENT '地址',
  `country` varchar(255) DEFAULT NULL COMMENT '国家',
  `province` varchar(255) DEFAULT NULL COMMENT '省份',
  `city` varchar(255) DEFAULT NULL COMMENT '城市',
  `area` varchar(255) DEFAULT NULL COMMENT '区域',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='门店表';

-- ----------------------------
-- Records of af_chain
-- ----------------------------
INSERT INTO `af_chain` VALUES ('1', '2', '苗博士清扬路店', '', '', '清扬路1', '中国', '江苏', '无锡市', '崇安区', '2021-06-05 17:33:25', null, '1');
INSERT INTO `af_chain` VALUES ('3', '2', '苗博士胜利门店', '', '', '胜利门站', '中国', '江苏', '无锡市', '崇安区', '2021-06-04 15:18:04', null, '1');

-- ----------------------------
-- Table structure for af_department
-- ----------------------------
DROP TABLE IF EXISTS `af_department`;
CREATE TABLE `af_department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT '1' COMMENT '0网络部 1苗医生 2苗博士',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `adduserid` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of af_department
-- ----------------------------
INSERT INTO `af_department` VALUES ('9', '0', '网络部', '1', '2021-05-05 14:34:04', null, '1');
INSERT INTO `af_department` VALUES ('10', '0', '客服一部', '1', '2021-05-05 14:34:59', null, '1');

-- ----------------------------
-- Table structure for af_grade
-- ----------------------------
DROP TABLE IF EXISTS `af_grade`;
CREATE TABLE `af_grade` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL COMMENT '职级名称',
  `sort` varchar(255) NOT NULL COMMENT '职级排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `parent_id` int(11) NOT NULL COMMENT '父id',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1激活 0失效',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='职级表';

-- ----------------------------
-- Records of af_grade
-- ----------------------------
INSERT INTO `af_grade` VALUES ('1', '总经理', '1', '2021-05-05 14:26:20', '0', null, '1');
INSERT INTO `af_grade` VALUES ('2', '网络部经理', '2', '2021-05-05 14:26:59', '1', null, '1');
INSERT INTO `af_grade` VALUES ('3', '网络部副经理/部门经理', '3', '2021-05-05 14:28:02', '2', null, '1');
INSERT INTO `af_grade` VALUES ('4', '网络部主管/部门副经理', '4', '2021-05-05 14:28:40', '3', null, '1');
INSERT INTO `af_grade` VALUES ('5', '网络部副主管/部门主管', '5', '2021-05-05 14:29:12', '4', null, '1');
INSERT INTO `af_grade` VALUES ('6', '部门副主管', '6', '2021-05-05 14:29:35', '5', null, '1');
INSERT INTO `af_grade` VALUES ('7', '组长', '7', '2021-05-05 14:29:54', '6', null, '1');

-- ----------------------------
-- Table structure for af_job_name
-- ----------------------------
DROP TABLE IF EXISTS `af_job_name`;
CREATE TABLE `af_job_name` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT '1' COMMENT '0网络部 1苗医生 2苗博士',
  `name` varchar(255) NOT NULL COMMENT '职位名称',
  `adduserid` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`job_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职位称呼表';

-- ----------------------------
-- Records of af_job_name
-- ----------------------------

-- ----------------------------
-- Table structure for af_menu_url
-- ----------------------------
DROP TABLE IF EXISTS `af_menu_url`;
CREATE TABLE `af_menu_url` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT,
  `menu_name` varchar(50) NOT NULL,
  `menu_url` varchar(255) NOT NULL,
  `module_id` int(11) NOT NULL,
  `is_show` tinyint(4) NOT NULL COMMENT '是否在sidebar里出现',
  `online` int(11) NOT NULL DEFAULT '1' COMMENT '在线状态，还是下线状态，即可用，不可用。',
  `shortcut_allowed` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '是否允许快捷访问',
  `menu_desc` varchar(255) DEFAULT NULL,
  `father_menu` int(11) NOT NULL DEFAULT '0' COMMENT '上一级菜单',
  PRIMARY KEY (`menu_id`),
  UNIQUE KEY `menu_url` (`menu_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='功能链接（菜单链接）';

-- ----------------------------
-- Records of af_menu_url
-- ----------------------------

-- ----------------------------
-- Table structure for af_people
-- ----------------------------
DROP TABLE IF EXISTS `af_people`;
CREATE TABLE `af_people` (
  `people_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '名称',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `type` tinyint(4) DEFAULT '0' COMMENT '0网络部 1苗医生 2苗博士',
  `chain_id` int(11) NOT NULL COMMENT '应聘门店id',
  `department_id` int(11) NOT NULL COMMENT '应聘部门id',
  `applyjob_id` int(11) NOT NULL COMMENT '应聘岗位id',
  `workyear` varchar(255) NOT NULL COMMENT '工作年限',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文名',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `quanpin` varchar(255) NOT NULL COMMENT '名称全拼',
  `jianxie` varchar(255) NOT NULL COMMENT '名称简写',
  `nick_quan_pin` varchar(255) DEFAULT NULL COMMENT '昵称全拼',
  `adduserid` int(11) NOT NULL COMMENT '创建人',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `usrsrc` mediumblob COMMENT '照片',
  `profile` varchar(200) DEFAULT NULL COMMENT '简历快照',
  `ifyaoyue` tinyint(2) DEFAULT NULL COMMENT '是否邀约',
  `yaoyue_time` datetime NOT NULL COMMENT '邀约时间',
  `ifreview` tinyint(2) DEFAULT NULL COMMENT '是否面试',
  `review_time` datetime NOT NULL COMMENT '面试时间',
  `ifruzhi` tinyint(2) DEFAULT NULL COMMENT '是否入职',
  `ruzhi_time` datetime NOT NULL COMMENT '入职时间',
  `ifzhuanzheng` tinyint(2) DEFAULT NULL COMMENT '是否转正',
  `zhuanzheng_time` datetime NOT NULL COMMENT '转正时间',
  `iflizhi` tinyint(2) DEFAULT NULL COMMENT '是否离职',
  `lizhi_time` datetime NOT NULL COMMENT '离职时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0无效 1有效',
  PRIMARY KEY (`people_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人才信息表';

-- ----------------------------
-- Records of af_people
-- ----------------------------

-- ----------------------------
-- Table structure for af_people_log
-- ----------------------------
DROP TABLE IF EXISTS `af_people_log`;
CREATE TABLE `af_people_log` (
  `people_log_id` int(11) NOT NULL AUTO_INCREMENT,
  `logtype` tinyint(2) DEFAULT NULL COMMENT '类别 1邀约 2面试 3入职 4转正 5 离职',
  `people_id` int(11) DEFAULT NULL COMMENT '人员id',
  `logContent` text,
  `adduserid` varchar(100) DEFAULT NULL COMMENT '操作人id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`people_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人才操作日志表';

-- ----------------------------
-- Records of af_people_log
-- ----------------------------

-- ----------------------------
-- Table structure for af_recruitment
-- ----------------------------
DROP TABLE IF EXISTS `af_recruitment`;
CREATE TABLE `af_recruitment` (
  `recu_id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL COMMENT '描述',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别 0不限 1男 2女',
  `num` int(11) DEFAULT NULL COMMENT '人数',
  `type` tinyint(4) DEFAULT '0' COMMENT '0网络部 1苗医生 2苗博士',
  `chain_id` int(11) NOT NULL COMMENT '应聘门店id',
  `department_id` int(11) NOT NULL COMMENT '应聘部门id',
  `applyjob_id` int(11) NOT NULL COMMENT '应聘岗位id',
  `adduserid` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `start_time` datetime DEFAULT NULL COMMENT '开始时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 0无效 1有效',
  PRIMARY KEY (`recu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='招聘需求表';

-- ----------------------------
-- Records of af_recruitment
-- ----------------------------

-- ----------------------------
-- Table structure for af_role
-- ----------------------------
DROP TABLE IF EXISTS `af_role`;
CREATE TABLE `af_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT '0' COMMENT '0网络部 1苗医生 2苗博士',
  `grade_id` int(11) NOT NULL COMMENT '职级id',
  `department_id` int(11) NOT NULL COMMENT '部门id',
  `menuids` varchar(255) NOT NULL COMMENT '菜单id逗号隔开',
  `adduserid` int(11) NOT NULL COMMENT '创建人',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='职级权限表';

-- ----------------------------
-- Records of af_role
-- ----------------------------

-- ----------------------------
-- Table structure for af_user
-- ----------------------------
DROP TABLE IF EXISTS `af_user`;
CREATE TABLE `af_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL COMMENT '名称',
  `sex` tinyint(2) DEFAULT NULL COMMENT '性别',
  `birthday` date DEFAULT NULL COMMENT '生日',
  `phone` varchar(255) DEFAULT NULL COMMENT '电话',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `type` tinyint(4) DEFAULT '0' COMMENT '0网络部 1苗医生 2苗博士',
  `chain_id` int(11) NOT NULL COMMENT '门店id',
  `department_id` int(11) NOT NULL COMMENT '部门id',
  `grade_id` int(11) NOT NULL COMMENT '职级id',
  `job_id` varchar(255) NOT NULL COMMENT '职位',
  `en_name` varchar(255) DEFAULT NULL COMMENT '英文名',
  `nickname` varchar(255) DEFAULT NULL COMMENT '昵称',
  `quanpin` varchar(255) NOT NULL COMMENT '名称全拼',
  `jianxie` varchar(255) NOT NULL COMMENT '名称简写',
  `nick_quan_pin` varchar(255) DEFAULT NULL COMMENT '昵称全拼',
  `adduserid` int(11) NOT NULL COMMENT '创建人',
  `entry_time` datetime DEFAULT NULL COMMENT '入职日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '状态 1在职 2离职',
  `usrsrc` mediumblob COMMENT '照片',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='管理人员表';

-- ----------------------------
-- Records of af_user
-- ----------------------------
INSERT INTO `af_user` VALUES ('1', '总经理', null, null, null, null, null, '0', '0', '9', '2', '', null, null, '', '', null, '0', null, '0000-00-00 00:00:00', null, '1', null);
INSERT INTO `af_user` VALUES ('2', '网络部副经理', null, null, null, null, null, '0', '0', '9', '3', '', null, null, '', '', null, '0', null, '0000-00-00 00:00:00', null, '1', null);
