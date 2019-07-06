/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50520
Source Host           : localhost:3306
Source Database       : transport

Target Server Type    : MYSQL
Target Server Version : 50520
File Encoding         : 65001

Date: 2019-01-22 22:45:42
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for tb_admin
-- ----------------------------
DROP TABLE IF EXISTS `tb_admin`;
CREATE TABLE `tb_admin` (
  `admin_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '管理编号',
  `admin_name` varchar(50) DEFAULT NULL COMMENT '管理员名称',
  `admin_account` varchar(50) DEFAULT NULL COMMENT '管理员账号',
  `admin_pwd` varchar(50) DEFAULT NULL COMMENT '管理员密码',
  `admin_status` int(10) unsigned DEFAULT NULL COMMENT '管理员状态,0可用，1禁用',
  `role_id` bigint(20) NOT NULL COMMENT '角色编号',
  `identity` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `no` varchar(255) DEFAULT NULL,
  `deptno` int(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `net_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='管理员表';

-- ----------------------------
-- Table structure for tb_car
-- ----------------------------
DROP TABLE IF EXISTS `tb_car`;
CREATE TABLE `tb_car` (
  `id` int(11) DEFAULT NULL,
  `car_no` varchar(255) DEFAULT NULL,
  `car_type` varchar(255) DEFAULT NULL,
  `car_license` varchar(255) DEFAULT NULL,
  `car_dun` varchar(255) DEFAULT NULL,
  `car_date` date DEFAULT NULL,
  `network_id` int(255) DEFAULT NULL,
  `car_remark` varchar(255) DEFAULT NULL,
  `car_status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_customer
-- ----------------------------
DROP TABLE IF EXISTS `tb_customer`;
CREATE TABLE `tb_customer` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'customer_id',
  `customer_name` varchar(255) DEFAULT NULL COMMENT '客户姓名',
  `customer_phone` varchar(255) DEFAULT NULL COMMENT '客户电话',
  `customer_address` varchar(255) DEFAULT NULL COMMENT '通讯地址',
  `customer_email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `customer_remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `customer_destination` varchar(255) DEFAULT NULL COMMENT '常用目的地',
  `customer_date` date DEFAULT NULL COMMENT '添加时间',
  `staff_no` int(11) NOT NULL COMMENT '业务员编号',
  `customer_gender` int(11) DEFAULT NULL COMMENT '客户性别 1男 2女 0保密',
  `customer_identity` varchar(255) DEFAULT NULL COMMENT '客户身份证号',
  PRIMARY KEY (`customer_id`),
  KEY `staff_no` (`staff_no`),
  CONSTRAINT `tb_customer_ibfk_1` FOREIGN KEY (`staff_no`) REFERENCES `tb_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Table structure for tb_dept
-- ----------------------------
DROP TABLE IF EXISTS `tb_dept`;
CREATE TABLE `tb_dept` (
  `id` int(11) NOT NULL COMMENT 'id',
  `name` varchar(255) DEFAULT NULL COMMENT 'name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Table structure for tb_dictionary
-- ----------------------------
DROP TABLE IF EXISTS `tb_dictionary`;
CREATE TABLE `tb_dictionary` (
  `dic_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '数据字典编号',
  `dic_value` varchar(500) DEFAULT NULL COMMENT '字典数据名',
  `dic_type_code` bigint(20) DEFAULT NULL COMMENT '字典类型编码',
  `dic_type_name` varchar(100) DEFAULT NULL COMMENT '字典类型名称',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字典名',
  PRIMARY KEY (`dic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典表';

-- ----------------------------
-- Table structure for tb_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_menu`;
CREATE TABLE `tb_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'menu_id',
  `menu_parent_id` int(11) NOT NULL COMMENT '父菜单id  0表示菜单 其它表示菜单项',
  `menu_name` varchar(255) DEFAULT NULL COMMENT '菜单名称',
  `menu_path` varchar(255) DEFAULT NULL COMMENT '菜单对应的路径',
  `is_publish` int(11) DEFAULT NULL COMMENT '是否发布 0发布 1未发布',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='菜单表（权限表）';

-- ----------------------------
-- Table structure for tb_modular
-- ----------------------------
DROP TABLE IF EXISTS `tb_modular`;
CREATE TABLE `tb_modular` (
  `modular_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '模块编号',
  `modular_name` varchar(200) DEFAULT NULL COMMENT '模块名',
  PRIMARY KEY (`modular_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COMMENT='模块表';

-- ----------------------------
-- Table structure for tb_network
-- ----------------------------
DROP TABLE IF EXISTS `tb_network`;
CREATE TABLE `tb_network` (
  `id` int(11) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_order
-- ----------------------------
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order` (
  `order_id` varchar(255) NOT NULL COMMENT '订单编号',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `staff_no` int(255) DEFAULT NULL COMMENT '业务员编号',
  `order_totalfee` float DEFAULT NULL COMMENT '总费用',
  `remark` varchar(255) DEFAULT NULL COMMENT '订单备注',
  `order_deliverytype` varchar(255) DEFAULT NULL COMMENT '货运方式 海、陆、空',
  `order_destination` varchar(255) DEFAULT NULL COMMENT '到达国家',
  `order_createdate` date DEFAULT NULL COMMENT '订单创建时间',
  `order_status` int(11) DEFAULT NULL COMMENT '订单状态 0签收 1取件 2入库 3报价 4审核 5发货...',
  `order_paytype` varchar(255) DEFAULT NULL COMMENT '支付方式 预付 到付 预付部分+到付部分',
  `order_prepay` float DEFAULT NULL COMMENT '预付金额',
  `order_prepaydate` date DEFAULT NULL COMMENT '预付时间',
  `order_postpay` float DEFAULT NULL COMMENT '到付金额',
  `order_postpaydate` date DEFAULT NULL COMMENT '到付时间',
  `order_currentpay` float DEFAULT NULL COMMENT '当前支付',
  `order_repo` varchar(11) DEFAULT NULL COMMENT '货物入的仓库编号',
  `order_recieveraddress` varchar(255) DEFAULT NULL COMMENT '收货地址',
  `order_recievername` varchar(255) DEFAULT NULL COMMENT '收货人姓名',
  `order_recieverphone` varchar(255) DEFAULT NULL COMMENT '收货电话',
  `net_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `tb_order_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Table structure for tb_orderdetil
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderdetil`;
CREATE TABLE `tb_orderdetil` (
  `id` int(255) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `detiltime` datetime DEFAULT NULL,
  `detil_remark` varchar(255) DEFAULT NULL,
  `zhandian` int(255) DEFAULT NULL,
  `detil_status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- ----------------------------
-- Table structure for tb_orderfee
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderfee`;
CREATE TABLE `tb_orderfee` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(255) NOT NULL COMMENT '订单编号',
  `size_check_fee` float DEFAULT NULL COMMENT '核算体积费率',
  `weight_check_fee` float DEFAULT NULL COMMENT '核算重量费率',
  `size_order_fee` float DEFAULT NULL COMMENT '报价体积费率',
  `weight_order_fee` float DEFAULT NULL COMMENT '报价重量费率',
  `other_fee` float DEFAULT '0' COMMENT '其它费用',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `tb_orderfee_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='订单核算表';

-- ----------------------------
-- Table structure for tb_orderitem
-- ----------------------------
DROP TABLE IF EXISTS `tb_orderitem`;
CREATE TABLE `tb_orderitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `order_id` varchar(255) NOT NULL COMMENT '订单编号',
  `item_name` varchar(255) DEFAULT NULL COMMENT '货物名称',
  `item_num` int(11) DEFAULT NULL COMMENT '货物数量',
  `item_pruefee` float DEFAULT NULL COMMENT '单价货物价值',
  `item_totalfee` float DEFAULT NULL COMMENT '货物总价值',
  `item_length` int(11) DEFAULT NULL COMMENT '货物打包长度',
  `item_width` int(11) DEFAULT NULL COMMENT '货物打包宽度',
  `item_height` int(11) DEFAULT NULL COMMENT '货物打包高度',
  `item_truesize` float DEFAULT NULL COMMENT '核算体积',
  `item_size` float DEFAULT NULL COMMENT '报价体积',
  `item_trueweight` float DEFAULT NULL COMMENT '核算重量',
  `item_weight` float DEFAULT NULL COMMENT '报价重量',
  `item_remark` varchar(255) DEFAULT NULL COMMENT '备注信息',
  `item_unit` varchar(255) DEFAULT NULL COMMENT '计量单位',
  `index0` int(11) DEFAULT NULL COMMENT 'index0',
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `tb_orderitem_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='订单项表';

-- ----------------------------
-- Table structure for tb_ordershipping
-- ----------------------------
DROP TABLE IF EXISTS `tb_ordershipping`;
CREATE TABLE `tb_ordershipping` (
  `reciever_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'reciever_id',
  `customer_destination` varchar(255) DEFAULT NULL COMMENT '到达国家',
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `reciever_address` varchar(255) DEFAULT NULL COMMENT '收件地址',
  `reciever_phone` varchar(255) DEFAULT NULL COMMENT '收件电话',
  `reciever_name` varchar(255) DEFAULT NULL COMMENT '收件人',
  `reciever_default` int(11) DEFAULT NULL COMMENT '是否默认 0默认 ',
  PRIMARY KEY (`reciever_id`),
  KEY `customer_id` (`customer_id`),
  CONSTRAINT `tb_ordershipping_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `tb_customer` (`customer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='客户地址表';

-- ----------------------------
-- Table structure for tb_pick
-- ----------------------------
DROP TABLE IF EXISTS `tb_pick`;
CREATE TABLE `tb_pick` (
  `pick_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'pick_id',
  `order_id` varchar(255) NOT NULL COMMENT 'order_id',
  `pick_type` varchar(255) DEFAULT NULL COMMENT '取件方式 快递 客户配送 上门取件',
  `pick_transcompany` varchar(255) DEFAULT NULL COMMENT '快递公司',
  `pick_transid` varchar(255) DEFAULT NULL COMMENT '快递单号',
  `pick_name` varchar(255) DEFAULT NULL COMMENT '取件联系人',
  `pick_address` varchar(255) DEFAULT NULL COMMENT '取件地址',
  `pick_phone` varchar(255) DEFAULT NULL COMMENT '取件联系电话',
  `pick_fee` float DEFAULT '0' COMMENT '取件费用',
  `pick_realfee` float DEFAULT '0' COMMENT '取件实际费用',
  PRIMARY KEY (`pick_id`),
  KEY `order_id` (`order_id`),
  CONSTRAINT `tb_pick_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `tb_order` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='快递配送表';

-- ----------------------------
-- Table structure for tb_power
-- ----------------------------
DROP TABLE IF EXISTS `tb_power`;
CREATE TABLE `tb_power` (
  `power_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '权限编号',
  `power_name` varchar(200) DEFAULT NULL COMMENT '权限名',
  `power_action` varchar(500) DEFAULT NULL COMMENT '权限路径',
  `power_parent` bigint(20) DEFAULT NULL COMMENT '父权限',
  `power_is_show` int(11) DEFAULT NULL COMMENT '是否显示，0显示，1隐藏',
  `modular_id` bigint(20) NOT NULL COMMENT '模块编号',
  PRIMARY KEY (`power_id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COMMENT='权限表';

-- ----------------------------
-- Table structure for tb_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_role`;
CREATE TABLE `tb_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'role_id',
  `role_name` varchar(255) DEFAULT NULL COMMENT 'role_name',
  `role_powers` varchar(255) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Table structure for tb_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `tb_role_menu`;
CREATE TABLE `tb_role_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  `menu_id` int(11) NOT NULL COMMENT '菜单id',
  PRIMARY KEY (`id`),
  KEY `menu_id` (`menu_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `tb_role_menu_ibfk_1` FOREIGN KEY (`menu_id`) REFERENCES `tb_menu` (`menu_id`),
  CONSTRAINT `tb_role_menu_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='角色权限表';

-- ----------------------------
-- Table structure for tb_staff
-- ----------------------------
DROP TABLE IF EXISTS `tb_staff`;
CREATE TABLE `tb_staff` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `no` varchar(255) NOT NULL COMMENT '员工编号',
  `name` varchar(255) NOT NULL COMMENT '姓名',
  `phone` varchar(255) NOT NULL COMMENT '电话',
  `address` varchar(255) DEFAULT NULL COMMENT '通讯地址',
  `qq` varchar(255) DEFAULT NULL COMMENT 'qq号码',
  `email` varchar(255) DEFAULT NULL COMMENT '邮箱',
  `hiredate` date DEFAULT NULL COMMENT '入职时间',
  `remark` varchar(255) DEFAULT NULL COMMENT '备注',
  `gender` int(11) DEFAULT NULL COMMENT '性别：0 保密 1 男 2 女',
  `identity` varchar(255) NOT NULL COMMENT '身份证号',
  `password` varchar(255) NOT NULL DEFAULT 'yctransport' COMMENT '登陆密码',
  `deptno` int(11) NOT NULL COMMENT '部门编号',
  PRIMARY KEY (`id`),
  KEY `deptno` (`deptno`),
  CONSTRAINT `tb_staff_ibfk_1` FOREIGN KEY (`deptno`) REFERENCES `tb_dept` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Table structure for tb_staff_role
-- ----------------------------
DROP TABLE IF EXISTS `tb_staff_role`;
CREATE TABLE `tb_staff_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `staff_id` int(11) NOT NULL COMMENT '员工id',
  `role_id` int(11) NOT NULL COMMENT '角色id',
  PRIMARY KEY (`id`),
  KEY `role_id` (`role_id`),
  KEY `staff_id` (`staff_id`),
  CONSTRAINT `tb_staff_role_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `tb_role` (`role_id`),
  CONSTRAINT `tb_staff_role_ibfk_2` FOREIGN KEY (`staff_id`) REFERENCES `tb_staff` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='员工角色表';
