/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : lizhi

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2024-03-19 14:20:53
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for af_caiwu
-- ----------------------------
DROP TABLE IF EXISTS `af_caiwu`;
CREATE TABLE `af_caiwu` (
  `cw_id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` tinyint(11) DEFAULT '1' COMMENT '1进项 2销项',
  `type_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type_child_id` int(11) DEFAULT NULL,
  `child_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '分类子名称',
  `cate_id` int(11) DEFAULT '1' COMMENT '类目id 1进项 2销项',
  `cate_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '金额',
  `laiyuan_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1' COMMENT '1有效2失效',
  PRIMARY KEY (`cw_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='财务流水账';

-- ----------------------------
-- Records of af_caiwu
-- ----------------------------

-- ----------------------------
-- Table structure for af_caiwu_type
-- ----------------------------
DROP TABLE IF EXISTS `af_caiwu_type`;
CREATE TABLE `af_caiwu_type` (
  `cwtype_id` int(11) NOT NULL AUTO_INCREMENT,
  `cwtype_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT '1' COMMENT '1有效2失效',
  PRIMARY KEY (`cwtype_id`)
) ENGINE=MyISAM AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='财务分类表';

-- ----------------------------
-- Records of af_caiwu_type
-- ----------------------------
INSERT INTO `af_caiwu_type` VALUES ('1', '进项', '0', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('2', '销项', '0', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('3', '全款', '1', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('4', '预付款', '1', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('5', '尾款', '1', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('6', '验收款', '1', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('7', '货款', '2', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('8', '工资', '2', null, null, null, '1');
INSERT INTO `af_caiwu_type` VALUES ('9', '展会', '2', null, null, '1', '1');
INSERT INTO `af_caiwu_type` VALUES ('10', '喷漆', '2', null, null, '2', '1');
INSERT INTO `af_caiwu_type` VALUES ('11', '备用金', '2', null, null, '2', '1');
INSERT INTO `af_caiwu_type` VALUES ('12', '切割加工费', '2', null, null, '1', '1');

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
-- Table structure for af_invoice
-- ----------------------------
DROP TABLE IF EXISTS `af_invoice`;
CREATE TABLE `af_invoice` (
  `invoice_id` int(11) NOT NULL AUTO_INCREMENT,
  `kehu_id` int(11) DEFAULT NULL,
  `xs_id` int(11) DEFAULT NULL COMMENT '销售单号',
  `invoice_no` int(11) DEFAULT NULL,
  `rate` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '税率',
  `rate_money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '税金',
  `total_money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `beizhu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态 1 未开票 2 已开票 3已邮寄 4已收到',
  PRIMARY KEY (`invoice_id`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of af_invoice
-- ----------------------------
INSERT INTO `af_invoice` VALUES ('12', '20', '16', null, '', '', '9000', '2021-06-03 00:00:00', null, null);
INSERT INTO `af_invoice` VALUES ('13', '21', '17', null, '', '', '21000', '2021-06-10 00:00:00', null, null);
INSERT INTO `af_invoice` VALUES ('14', '22', '18', null, '1668.14', '1668.14', '14500', '2021-05-27 00:00:00', null, null);
INSERT INTO `af_invoice` VALUES ('15', null, null, '0', null, null, null, '2021-06-19 11:28:16', '已开票', null);
INSERT INTO `af_invoice` VALUES ('16', '23', '19', null, '1265.49', '1265.49', '11000', '2021-11-12 00:00:00', null, null);

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
-- Table structure for af_kehu
-- ----------------------------
DROP TABLE IF EXISTS `af_kehu`;
CREATE TABLE `af_kehu` (
  `kehu_id` int(11) NOT NULL AUTO_INCREMENT,
  `kehu_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '客户名称',
  `kehu_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kehu_company` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `contact_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '联系人',
  `contact_phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `create_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL COMMENT '状态',
  PRIMARY KEY (`kehu_id`)
) ENGINE=MyISAM AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of af_kehu
-- ----------------------------
INSERT INTO `af_kehu` VALUES ('20', '鼎明塑料', null, null, null, null, '2021-06-03 00:00:00', null, null, null);
INSERT INTO `af_kehu` VALUES ('21', '艾美特焊接', null, null, null, null, '2021-06-10 00:00:00', null, null, null);
INSERT INTO `af_kehu` VALUES ('22', '阳宇环保', null, null, null, null, '2021-05-27 00:00:00', null, null, null);
INSERT INTO `af_kehu` VALUES ('23', '盛翔激光', null, null, null, null, '2021-11-12 00:00:00', null, null, null);
INSERT INTO `af_kehu` VALUES ('24', '阳宇环保', null, null, null, null, '2021-05-27 00:00:00', null, null, null);
INSERT INTO `af_kehu` VALUES ('25', '阳宇环保', null, null, null, null, '2021-05-27 00:00:00', null, null, null);
INSERT INTO `af_kehu` VALUES ('26', '阳宇环保', null, null, null, null, '2021-05-27 00:00:00', null, null, null);
INSERT INTO `af_kehu` VALUES ('27', '阳宇环保', null, null, null, null, '2021-05-27 00:00:00', null, null, null);

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
-- Table structure for af_payway
-- ----------------------------
DROP TABLE IF EXISTS `af_payway`;
CREATE TABLE `af_payway` (
  `payway_id` int(11) NOT NULL AUTO_INCREMENT,
  `payway_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user` int(11) DEFAULT NULL,
  `status` int(4) DEFAULT '1' COMMENT '1有效2无效',
  PRIMARY KEY (`payway_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='支付方式';

-- ----------------------------
-- Records of af_payway
-- ----------------------------
INSERT INTO `af_payway` VALUES ('1', '7058卡', null, null, '1');
INSERT INTO `af_payway` VALUES ('2', '微信', null, null, '1');
INSERT INTO `af_payway` VALUES ('3', '支付宝', null, null, '1');
INSERT INTO `af_payway` VALUES ('4', '公司公帐', null, null, '1');

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
-- Table structure for af_product
-- ----------------------------
DROP TABLE IF EXISTS `af_product`;
CREATE TABLE `af_product` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '产品名称',
  `create_time` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  `add_user` int(11) DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=MyISAM AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of af_product
-- ----------------------------
INSERT INTO `af_product` VALUES ('19', 'LZ-KKP-6-E', '2021-06-03 00:00:00', '1', null);
INSERT INTO `af_product` VALUES ('20', 'LZ-KKP-16-E', '2021-06-10 00:00:00', '1', null);
INSERT INTO `af_product` VALUES ('21', 'LZ-KKP-12-E', '2021-05-27 00:00:00', '1', null);
INSERT INTO `af_product` VALUES ('22', 'LZ-KKP-6-W', '2021-11-12 00:00:00', '1', null);
INSERT INTO `af_product` VALUES ('23', 'LZ-KKP-12-E', '2021-05-27 00:00:00', '1', null);
INSERT INTO `af_product` VALUES ('24', 'LZ-KKP-12-E', '2021-05-27 00:00:00', '1', null);
INSERT INTO `af_product` VALUES ('25', 'LZ-KKP-12-E', '2021-05-27 00:00:00', '1', null);
INSERT INTO `af_product` VALUES ('26', 'LZ-KKP-12-E', '2021-05-27 00:00:00', '1', null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理人员表';

-- ----------------------------
-- Records of af_user
-- ----------------------------

-- ----------------------------
-- Table structure for af_xiaoshoulocal
-- ----------------------------
DROP TABLE IF EXISTS `af_xiaoshoulocal`;
CREATE TABLE `af_xiaoshoulocal` (
  `xiaoshou_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) DEFAULT NULL COMMENT '公司名称',
  `company_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '公司名称',
  `rate` decimal(10,0) DEFAULT NULL COMMENT '税率',
  `rate_money` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '税额',
  `hanshui` tinyint(4) DEFAULT NULL COMMENT '是否含税 1含税 2不含税',
  `money` decimal(10,0) DEFAULT NULL COMMENT '已付款',
  `owe` decimal(10,0) DEFAULT NULL COMMENT '欠款',
  `total_money` decimal(10,0) DEFAULT NULL COMMENT '总价',
  `product_id` int(11) DEFAULT NULL,
  `product_status` int(11) DEFAULT '1' COMMENT '是否收货 1未收货 2已发货',
  `fahuo_way` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `fahuo_src` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发货单图片',
  `deeliverydays` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '交货期几天',
  `firpay_time` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '预付到账时间',
  `fahuo_time` datetime DEFAULT NULL COMMENT '发货时间',
  `pay_status` tinyint(4) DEFAULT NULL COMMENT '状态 1 未付款 2 未结清 3已结清',
  `invoice_status` tinyint(4) DEFAULT '1' COMMENT '发票状态 1 未开票 2 已开票 3 已邮寄 ',
  `payway_id` int(11) DEFAULT NULL COMMENT '支付方式',
  `beizhu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '备注',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态 1正常 2 废弃',
  PRIMARY KEY (`xiaoshou_id`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='销售基础表';

-- ----------------------------
-- Records of af_xiaoshoulocal
-- ----------------------------
INSERT INTO `af_xiaoshoulocal` VALUES ('18', '22', '阳宇环保', '0', '1668.14', '1', '0', '14500', '14500', '21', '1', null, null, '14', '', null, null, '2', null, null, '2021-05-27 00:00:00', '2021-11-13 12:54:46', '1');
INSERT INTO `af_xiaoshoulocal` VALUES ('19', '23', '盛翔激光', '0', '1265.49', '1', null, '11000', '11000', '22', '1', null, null, null, null, null, null, '1', null, null, '2021-11-12 00:00:00', null, '1');

-- ----------------------------
-- Table structure for af_xs_log
-- ----------------------------
DROP TABLE IF EXISTS `af_xs_log`;
CREATE TABLE `af_xs_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(4) DEFAULT NULL COMMENT '类型 1 基础表添加 2基础表更改 3 基础表删除 4发票创建 5 发票状态改变 6 货物状态改变',
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `add_user` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of af_xs_log
-- ----------------------------
INSERT INTO `af_xs_log` VALUES ('1', '1', '\"company_name*11,create_time*,product_name*111,rate*0.13,rate_money*,money*,owe*,total_money*,invoice_status*1,product_status*1,hanshui*1\"', '2021-06-18 19:26:28', null);
INSERT INTO `af_xs_log` VALUES ('2', '1', '\"company_name*11,create_time*2021-04-03,product_name*1111,rate*0.13,rate_money*,money*,owe*,total_money*,invoice_status*1,product_status*1,hanshui*1\"', '2021-06-18 19:32:02', null);
INSERT INTO `af_xs_log` VALUES ('3', '1', '\"company_name*11,create_time*2021-04-03,product_name*1111,rate*0.13,rate_money*,money*,owe*,total_money*,invoice_status*1,product_status*1,hanshui*1\"', '2021-06-18 19:32:17', null);
INSERT INTO `af_xs_log` VALUES ('4', '1', '\"company_name*\\u54b3\\u54b3\\u54b3\\u770b\\u770b,create_time*2021-04-03,product_name*\\u6069\\u6211\\u53bb\\u7684,rate*0.13,rate_money*,money*,owe*,total_money*,invoice_status*1,product_status*1,hanshui*1\"', '2021-06-18 19:33:20', null);
INSERT INTO `af_xs_log` VALUES ('5', '1', '\"company_name*\\u5b8f\\u62d3\\u946b,create_time*2021-04-03,product_name*kkp,rate*0.13,rate_money*,money*,owe*,total_money*13000,invoice_status*1,product_status*1,hanshui*1\"', '2021-06-18 19:36:34', null);
INSERT INTO `af_xs_log` VALUES ('6', '1', '\"company_name*\\u9f0e\\u660e\\u5851\\u6599,create_time*2021-06-03,product_name*LZ-KKP-6-E,rate*0.13,rate_money*,money*9000,owe*,total_money*9000,invoice_status*1,product_status*1,hanshui*1\"', '2021-06-19 11:45:20', null);
INSERT INTO `af_xs_log` VALUES ('7', '1', '\"company_name*\\u827e\\u7f8e\\u7279\\u710a\\u63a5,create_time*2021-06-10,product_name*LZ-KKP-16-E,rate*0.13,rate_money*,money*21000,owe*,total_money*21000,invoice_status*1,product_status*2,hanshui*1\"', '2021-06-19 11:46:41', null);
INSERT INTO `af_xs_log` VALUES ('8', '6', '2021-06-12发货', '2021-06-20 16:30:05', null);
INSERT INTO `af_xs_log` VALUES ('9', '6', '2021-06-12发货', '2021-06-20 16:35:17', null);
INSERT INTO `af_xs_log` VALUES ('10', '6', '2021-06-12发货', '2021-06-20 16:42:15', null);
INSERT INTO `af_xs_log` VALUES ('11', '6', '2021-06-12发货', '2021-06-20 16:43:35', null);
INSERT INTO `af_xs_log` VALUES ('12', '6', '2021-06-12发货', '2021-06-20 16:44:38', null);
INSERT INTO `af_xs_log` VALUES ('13', '6', '2021-06-12发货', '2021-06-20 16:44:44', null);
INSERT INTO `af_xs_log` VALUES ('14', '6', '2021-06-12发货', '2021-06-20 16:44:54', null);
INSERT INTO `af_xs_log` VALUES ('15', '6', '2021-06-13发货', '2021-06-20 16:46:08', null);
INSERT INTO `af_xs_log` VALUES ('16', '6', '2021-06-14发货', '2021-06-20 16:48:50', null);
INSERT INTO `af_xs_log` VALUES ('17', '6', '2021-06-15发货', '2021-06-20 16:49:42', null);
INSERT INTO `af_xs_log` VALUES ('18', '6', '2021-06-16发货', '2021-06-20 16:50:42', null);
INSERT INTO `af_xs_log` VALUES ('19', '6', '2021-06-16发货', '2021-06-20 17:26:29', null);
INSERT INTO `af_xs_log` VALUES ('20', '1', '\"company_name*\\u9633\\u5b87\\u73af\\u4fdd,create_time*2021-05-27,product_name*LZ-KKP-12-E,rate*0.13,rate_money*1668.14,money*,owe*,total_money*14500,invoice_status*1,product_status*1,hanshui*1\"', '2021-06-23 08:33:07', null);
INSERT INTO `af_xs_log` VALUES ('21', '4', '2021-06-19 11:28:16开票', '2021-06-23 11:28:16', null);
INSERT INTO `af_xs_log` VALUES ('22', '1', '\"company_name*\\u76db\\u7fd4\\u6fc0\\u5149,create_time*2021-11-12,product_name*LZ-KKP-6-W,rate*0.13,rate_money*1265.49,money*0,owe*11000,total_money*11000,invoice_status*2,product_status*1,hanshui*1\"', '2021-11-12 17:37:11', null);
