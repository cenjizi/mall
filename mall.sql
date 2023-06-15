/*
 Navicat MySQL Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80025 (8.0.25)
 Source Host           : localhost:3306
 Source Schema         : mall

 Target Server Type    : MySQL
 Target Server Version : 80025 (8.0.25)
 File Encoding         : 65001

 Date: 15/06/2023 18:36:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int NOT NULL AUTO_INCREMENT COMMENT '主键 分类id主键',
  `category_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '分类名称 分类名称',
  `category_level` int NOT NULL COMMENT '分类层级 分类得类型，\n1:一级大分类\n2:二级分类\n3:三级小分类',
  `parent_id` int NOT NULL COMMENT '父层级id 父id 上一级依赖的id，1级分类则为0，二级三级分别依赖上一级',
  `category_icon` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标 logo',
  `category_slogan` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '口号',
  `category_pic` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '分类图',
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品分类' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '女装', 1, 0, 'girl.png', '优雅寇楠，美若天然', 'girl-big.png');
INSERT INTO `category` VALUES (2, '鞋包', 1, 0, 'shoe.png', '每一步，为进步! ', 'shoe-big.jpg');
INSERT INTO `category` VALUES (3, '男装', 1, 0, 'boy.png', '彰显男人个性，引领时尚潮流', 'boy-big.jpg');
INSERT INTO `category` VALUES (4, '食品', 1, 0, 'food.png', '让味觉随心掌握，让味道客随主便', 'foot-big.png');
INSERT INTO `category` VALUES (5, '母婴', 1, 0, 'child.png', '呵护母亲，呵护关爱;呵护宝宝，呵护未来', 'child-big.jpg');
INSERT INTO `category` VALUES (6, '手机', 1, 0, 'phone.png', '凭科技突破，让想象成为触手可及的现实', 'phone-big.jpg');
INSERT INTO `category` VALUES (7, '运动', 1, 0, 'sport.png', '即使在最黑的夜，也要有最热的血', 'sport-big.jpg');
INSERT INTO `category` VALUES (8, '水果', 1, 0, 'fruit.png', '新鲜水果每一天，健康生活每一刻', 'fruit-big.jpg');
INSERT INTO `category` VALUES (9, '电器', 1, 0, 'electricity.png', '品质至上，精彩到家', 'electricity-big.jpg');
INSERT INTO `category` VALUES (10, '家具', 1, 0, 'furniture.png', '有内涵的人选有内涵的家具!', 'furniture-big.jpg');
INSERT INTO `category` VALUES (11, '衣裤', 2, 1, NULL, NULL, NULL);
INSERT INTO `category` VALUES (12, '裙装', 2, 1, NULL, NULL, NULL);
INSERT INTO `category` VALUES (13, '鞋子', 2, 2, NULL, NULL, NULL);
INSERT INTO `category` VALUES (14, '包包', 2, 2, NULL, NULL, NULL);
INSERT INTO `category` VALUES (15, '上装', 2, 3, NULL, NULL, NULL);
INSERT INTO `category` VALUES (16, '下装', 2, 3, NULL, NULL, NULL);
INSERT INTO `category` VALUES (17, '干货', 2, 4, NULL, NULL, NULL);
INSERT INTO `category` VALUES (18, '饮料', 2, 4, NULL, NULL, NULL);
INSERT INTO `category` VALUES (19, '母亲用品', 2, 5, NULL, NULL, NULL);
INSERT INTO `category` VALUES (20, '婴儿用品', 2, 5, NULL, NULL, NULL);
INSERT INTO `category` VALUES (21, '国产', 2, 6, NULL, NULL, NULL);
INSERT INTO `category` VALUES (22, '国外', 2, 6, NULL, NULL, NULL);
INSERT INTO `category` VALUES (23, '运动服装', 2, 7, NULL, NULL, NULL);
INSERT INTO `category` VALUES (24, '运动用品', 2, 7, NULL, NULL, NULL);
INSERT INTO `category` VALUES (25, '酸性', 2, 8, NULL, NULL, NULL);
INSERT INTO `category` VALUES (26, '甜性', 2, 8, NULL, NULL, NULL);
INSERT INTO `category` VALUES (27, '电热式', 2, 9, NULL, NULL, NULL);
INSERT INTO `category` VALUES (28, '非电热式', 2, 9, NULL, NULL, NULL);
INSERT INTO `category` VALUES (29, '实木', 2, 10, NULL, NULL, NULL);
INSERT INTO `category` VALUES (30, '非实木', 2, 10, NULL, NULL, NULL);
INSERT INTO `category` VALUES (31, '衣服', 3, 11, NULL, NULL, NULL);
INSERT INTO `category` VALUES (32, '长裙', 3, 12, NULL, NULL, NULL);
INSERT INTO `category` VALUES (33, '皮鞋', 3, 13, NULL, NULL, NULL);
INSERT INTO `category` VALUES (34, '挎包', 3, 14, NULL, NULL, NULL);
INSERT INTO `category` VALUES (35, '短袖', 3, 15, NULL, NULL, NULL);
INSERT INTO `category` VALUES (36, '短裤', 3, 16, NULL, NULL, NULL);
INSERT INTO `category` VALUES (37, '油炸', 3, 17, NULL, NULL, NULL);
INSERT INTO `category` VALUES (38, '奶茶', 3, 18, NULL, NULL, NULL);
INSERT INTO `category` VALUES (39, '枕头', 3, 19, NULL, NULL, NULL);
INSERT INTO `category` VALUES (40, '奶瓶', 3, 20, NULL, NULL, NULL);
INSERT INTO `category` VALUES (41, '华为', 3, 21, NULL, NULL, NULL);
INSERT INTO `category` VALUES (42, '苹果', 3, 22, NULL, NULL, NULL);
INSERT INTO `category` VALUES (43, '休闲运动服', 3, 23, NULL, NULL, NULL);
INSERT INTO `category` VALUES (44, '篮球', 3, 24, NULL, NULL, NULL);
INSERT INTO `category` VALUES (45, '草莓', 3, 25, NULL, NULL, NULL);
INSERT INTO `category` VALUES (46, '西瓜', 3, 26, NULL, NULL, NULL);
INSERT INTO `category` VALUES (47, '电热水壶', 3, 27, NULL, NULL, NULL);
INSERT INTO `category` VALUES (48, '冰箱', 3, 28, NULL, NULL, NULL);
INSERT INTO `category` VALUES (49, '枫木', 3, 29, NULL, NULL, NULL);
INSERT INTO `category` VALUES (50, '复合木', 3, 30, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for index_img
-- ----------------------------
DROP TABLE IF EXISTS `index_img`;
CREATE TABLE `index_img`  (
  `img_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '主键',
  `img_url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片 图片地址',
  `prod_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品id 商品id',
  `category_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品分类id 商品分类id',
  `index_type` int NOT NULL COMMENT '轮播图类型 轮播图类型，用于判断，可以根据商品id或者分类进行页面跳转，1：商品 2：分类',
  `seq` int NOT NULL COMMENT '轮播图展示顺序 轮播图展示顺序，从小到大',
  `status` int NOT NULL COMMENT '是否展示:1表示正常显示，0表示下线 是否展示，1：展示    0：不展示',
  `create_time` datetime NOT NULL COMMENT '创建时间 创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间 更新',
  PRIMARY KEY (`img_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '轮播图 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of index_img
-- ----------------------------
INSERT INTO `index_img` VALUES ('1', 'ad1.jpg', '101', NULL, 1, 1, 1, '2021-04-14 17:21:13', '2021-04-14 17:21:18');
INSERT INTO `index_img` VALUES ('2', 'ad2.jpg', NULL, '1', 2, 2, 1, '2021-04-14 17:21:49', '2021-04-14 17:21:52');
INSERT INTO `index_img` VALUES ('3', 'ad3.jpg', '103', NULL, 1, 3, 1, '2021-04-14 17:22:23', '2021-04-14 17:22:27');
INSERT INTO `index_img` VALUES ('4', 'ad4.jpg', NULL, '2', 2, 4, 1, '2021-04-14 17:23:06', '2021-04-14 17:23:08');

-- ----------------------------
-- Table structure for order_item
-- ----------------------------
DROP TABLE IF EXISTS `order_item`;
CREATE TABLE `order_item`  (
  `item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单项ID',
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `product_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `product_img` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品图片',
  `sku_id` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'skuID',
  `sku_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称',
  `product_price` decimal(32, 8) NOT NULL COMMENT '商品价格',
  `buy_counts` int NOT NULL COMMENT '购买数量',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '商品总金额',
  `basket_date` datetime NULL DEFAULT NULL COMMENT '加入购物车时间',
  `buy_time` datetime NULL DEFAULT NULL COMMENT '购买时间',
  `is_comment` int NULL DEFAULT NULL COMMENT '评论状态： 0 未评价  1 已评价',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单项/快照 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of order_item
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `order_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '订单ID 同时也是订单编号',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `untitled` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '产品名称（多个产品用,隔开）',
  `receiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人快照',
  `receiver_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货人手机号快照',
  `receiver_address` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收货地址快照',
  `total_amount` decimal(32, 8) NULL DEFAULT NULL COMMENT '订单总价格',
  `actual_amount` int NULL DEFAULT NULL COMMENT '实际支付总价格',
  `pay_type` int NULL DEFAULT NULL COMMENT '支付方式 1:微信 2:支付宝',
  `order_remark` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单备注',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单状态 1:待付款 2:待发货 3:待收货 4:待评价 5:已完成 6:已关闭',
  `delivery_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '配送方式',
  `delivery_flow_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '物流单号',
  `order_freight` decimal(32, 8) NULL DEFAULT 0.00000000 COMMENT '订单运费 默认可以为零，代表包邮',
  `delete_status` int NULL DEFAULT 0 COMMENT '逻辑删除状态 1: 删除 0:未删除',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间（成交时间）',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '付款时间',
  `delivery_time` datetime NULL DEFAULT NULL COMMENT '发货时间',
  `flish_time` datetime NULL DEFAULT NULL COMMENT '完成时间',
  `cancel_time` datetime NULL DEFAULT NULL COMMENT '取消时间',
  `close_type` int NULL DEFAULT NULL COMMENT '订单关闭类型1-超时未支付 2-退款关闭 4-买家取消 15-已通过货到付款交易',
  PRIMARY KEY (`order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '订单 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品主键id',
  `product_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称 商品名称',
  `category_id` int NOT NULL COMMENT '分类外键id 分类id',
  `root_category_id` int NOT NULL COMMENT '一级分类外键id 一级分类id，用于优化查询',
  `sold_num` int NOT NULL COMMENT '销量 累计销售',
  `product_status` int NOT NULL COMMENT '默认是1，表示正常状态, -1表示删除, 0下架 默认是1，表示正常状态, -1表示删除, 0下架',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品内容 商品内容',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品 商品信息相关表：分类表，商品图片表，商品规格表，商品参数表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES ('1', '衣服1', 31, 1, 128, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('10', '衣服2', 31, 1, 129, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('11', '衣服3', 31, 1, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('12', '长裙1', 32, 1, 213, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('13', '长裙2', 32, 1, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('14', '长裙3', 32, 1, 212, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('15', '皮鞋1', 33, 2, 204, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-07-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('16', '皮鞋2', 33, 2, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('17', '皮鞋3', 33, 2, 202, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-26 15:27:22', '2021-04-25 15:27:25');
INSERT INTO `product` VALUES ('18', '挎包1', 34, 2, 112, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-06-17 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('19', '挎包2', 34, 2, 122, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('2', '挎包3', 34, 2, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('20', '短袖1', 35, 3, 123, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('21', '短袖2', 35, 3, 125, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-10-01 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('22', '短袖3', 35, 3, 125, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product` VALUES ('23', '奶茶2', 38, 4, 206, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('24', '奶茶3', 38, 4, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('25', '枕头1', 39, 5, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('26', '枕头2', 39, 5, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('27', '枕头3', 39, 5, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('28', '奶瓶1', 40, 5, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('29', '奶瓶2', 40, 5, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('3', '短裤1', 36, 3, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('30', '奶瓶3', 40, 5, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('31', '华为1', 41, 6, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('32', '华为2', 41, 6, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('33', '华为3', 41, 6, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('34', '苹果1', 42, 6, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('35', '苹果2', 42, 6, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('36', '苹果3', 42, 6, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('37', '休闲运动服1', 43, 7, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('38', '休闲运动服2', 43, 7, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('39', '休闲运动服3', 43, 7, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('4', '短裤2', 36, 3, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('40', '篮球1', 44, 7, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('41', '篮球2', 44, 7, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('42', '篮球3', 44, 7, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('43', '草莓1', 45, 8, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('44', '草莓2', 45, 8, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('45', '草莓3', 45, 8, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('46', '西瓜1', 46, 8, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('47', '西瓜2', 46, 8, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('48', '西瓜3', 46, 8, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('49', '电热水壶1', 47, 9, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('5', '短裤3', 36, 3, 300, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-02-17 15:58:59', '2021-06-01 15:59:03');
INSERT INTO `product` VALUES ('50', '电热水壶2', 47, 9, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('51', '电热水壶3', 47, 9, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('52', '冰箱1', 48, 9, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('53', '冰箱2', 48, 9, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('54', '冰箱3', 48, 9, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('55', '枫木椅子1', 49, 10, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('56', '枫木椅子2', 49, 10, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('57', '枫木椅子3', 49, 10, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('58', '复合木茶几1', 50, 10, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('59', '复合木茶几2', 50, 10, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('6', '油炸1', 37, 4, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('60', '复合木茶几3', 50, 10, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('7', '油炸2', 37, 4, 206, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('8', '油炸3', 37, 4, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');
INSERT INTO `product` VALUES ('9', '奶茶1', 38, 4, 201, 1, '<img src=\"static/images/spjs.jpg\"/>', '2021-04-25 15:58:59', '2021-04-25 15:59:03');

-- ----------------------------
-- Table structure for product_comments
-- ----------------------------
DROP TABLE IF EXISTS `product_comments`;
CREATE TABLE `product_comments`  (
  `comm_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'ID',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `product_name` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品名称',
  `order_item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '订单项(商品快照)ID 可为空',
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论用户id 用户名须脱敏',
  `is_anonymous` int NULL DEFAULT NULL COMMENT '是否匿名（1:是，0:否）',
  `comm_type` int NULL DEFAULT NULL COMMENT '评价类型（1好评，0中评，-1差评）',
  `comm_content` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评价内容',
  `comm_imgs` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评价晒图(JSON {img1:url1,img2:url2}  )',
  `sepc_name` datetime NULL DEFAULT NULL COMMENT '评价时间 可为空',
  `reply_status` int NULL DEFAULT NULL COMMENT '是否回复（0:未回复，1:已回复）',
  `reply_content` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '回复内容',
  `reply_time` datetime NULL DEFAULT NULL COMMENT '回复时间',
  `is_show` int NULL DEFAULT NULL COMMENT '是否显示（1:是，0:否）',
  PRIMARY KEY (`comm_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品评价 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_comments
-- ----------------------------
INSERT INTO `product_comments` VALUES (' 1', '1', '衣服1', '1', '19', 1, 0, '衣服很好哦！', '{img1:“mmxt2.png”}', '2021-04-27 14:51:10', 0, NULL, '2021-04-27 14:51:32', 1);

-- ----------------------------
-- Table structure for product_img
-- ----------------------------
DROP TABLE IF EXISTS `product_img`;
CREATE TABLE `product_img`  (
  `id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片主键',
  `item_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品外键id 商品外键id',
  `url` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '图片地址 图片地址',
  `sort` int NOT NULL COMMENT '顺序 图片顺序，从小到大',
  `is_main` int NOT NULL COMMENT '是否主图 是否主图，1：是，0：否',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品图片 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_img
-- ----------------------------
INSERT INTO `product_img` VALUES ('1', '1', 'p1.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('10', '10', 'p2.jpg', 1, 1, '2021-04-25 15:59:28', '2021-04-25 15:59:31');
INSERT INTO `product_img` VALUES ('11', '11', 'p3.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('12', '12', 'p4.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('13', '13', 'p5.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('14', '14', 'p6.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('15', '15', 'p7.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('16', '16', 'p8.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('17', '17', 'p9.jpg', 2, 1, '2021-04-22 15:25:39', '2021-04-22 15:25:44');
INSERT INTO `product_img` VALUES ('18', '18', 'p10.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('19', '19', 'p11.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('2', '2', 'p12.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('20', '20', 'p13.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('21', '21', 'p14.jpg', 2, 1, '2021-04-22 15:25:39', '2021-04-22 15:25:44');
INSERT INTO `product_img` VALUES ('22', '22', 'p15.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('23', '23', 'p16.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('24', '24', 'p17.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('25', '25', 'p18.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('26', '26', 'p19.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('27', '27', 'p20.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('28', '28', 'p21.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('29', '29', 'p22.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('3', '3', 'p23.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('30', '30', 'p24.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('31', '31', 'p25.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('32', '32', 'p26.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('33', '33', 'p27.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('34', '34', 'p28.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('35', '35', 'p29.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('36', '36', 'p30.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('37', '37', 'p31.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('38', '38', 'p32.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('39', '39', 'p33.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('4', '4', 'p34.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('40', '40', 'p35.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('41', '41', 'p36.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('42', '42', 'p37.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('43', '43', 'p38.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('44', '44', 'p39.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('45', '45', 'p40.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('46', '46', 'p41.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('47', '47', 'p42.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('48', '48', 'p42-1.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('49', '49', 'p43.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('5', '5', 'p44.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('50', '50', 'p45.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('51', '51', 'p46.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('52', '52', 'p47.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('53', '53', 'p48.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('54', '54', 'p49.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('55', '55', 'p50.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('56', '56', 'p51.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('57', '57', 'p52.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('58', '58', 'p53.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('59', '59', 'p54.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('6', '6', 'p55.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('60', '60', 'p56.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');
INSERT INTO `product_img` VALUES ('7', '7', 'p57.jpg', 1, 1, '2021-04-26 11:11:11', '2021-04-26 11:11:11');
INSERT INTO `product_img` VALUES ('8', '8', 'p58.jpg', 1, 1, '2021-04-15 11:11:11', '2021-04-30 11:11:11');
INSERT INTO `product_img` VALUES ('9', '9', 'p59.jpg', 2, 1, '2021-04-25 15:30:45', '2021-04-25 15:30:48');

-- ----------------------------
-- Table structure for product_params
-- ----------------------------
DROP TABLE IF EXISTS `product_params`;
CREATE TABLE `product_params`  (
  `param_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品参数id',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `product_publisher` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出版社，例：清华大学出版社',
  `author` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '作者，例：李白',
  `packaging_method` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '装帧类型，例：平装',
  `publication_date` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '出版时间，例：2023-10-1',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`param_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品参数 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_params
-- ----------------------------
INSERT INTO `product_params` VALUES ('1', '1', '1号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('10', '10', '10号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('11', '11', '11号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('12', '12', '12号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('13', '13', '13号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('14', '14', '14号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('15', '15', '15号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('16', '16', '16号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('17', '17', '17号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('18', '18', '18号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('19', '19', '19号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('2', '2', '2号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('20', '20', '20号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('21', '21', '21号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('22', '22', '22号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('23', '23', '23号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('24', '24', '24号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('25', '25', '25号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('26', '26', '26号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('27', '27', '27号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('28', '28', '28号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('29', '29', '29号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('3', '3', '3号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('30', '30', '30号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('31', '31', '31号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('32', '32', '32号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('33', '33', '33号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('34', '34', '34号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('35', '35', '35号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('36', '36', '36号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('37', '37', '37号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('38', '38', '38号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('39', '39', '39号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('4', '4', '4号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('40', '40', '40号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('41', '41', '41号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('42', '42', '42号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('43', '43', '43号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('44', '44', '44号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('45', '45', '45号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('46', '46', '46号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('47', '47', '47号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('48', '48', '48号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('49', '49', '49号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('5', '5', '5号店', '40kg', '平装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('50', '50', '50号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('51', '51', '51号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('52', '52', '52号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('53', '53', '53号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('54', '54', '54号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('55', '55', '55号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('56', '56', '56号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('57', '57', '57号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('58', '58', '58号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('59', '59', '59号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('6', '6', '6号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('60', '60', '60号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('7', '7', '7号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('8', '8', '8号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');
INSERT INTO `product_params` VALUES ('9', '9', '9号店', '40kg', '精装', '2021-1', '2021-04-27 11:53:20', '2021-04-27 11:53:35');

-- ----------------------------
-- Table structure for product_sku
-- ----------------------------
DROP TABLE IF EXISTS `product_sku`;
CREATE TABLE `product_sku`  (
  `sku_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku编号',
  `product_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品id',
  `sku_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'sku名称',
  `sku_img` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'sku图片',
  `untitled` varchar(400) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '属性组合（格式是p1:v1;p2:v2）',
  `original_price` int NOT NULL COMMENT '原价',
  `sell_price` int NOT NULL COMMENT '销售价格',
  `discounts` decimal(4, 2) NOT NULL COMMENT '折扣力度',
  `stock` int NOT NULL COMMENT '库存',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `status` int NULL DEFAULT NULL COMMENT 'sku状态(1启用，0禁用，-1删除)',
  PRIMARY KEY (`sku_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '商品规格 每一件商品都有不同的规格，不同的规格又有不同的价格和优惠力度，规格表为此设计' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of product_sku
-- ----------------------------
INSERT INTO `product_sku` VALUES ('1', '1', '买二送一', 'p1.jpg', '{包装:[\"盒装\",\"袋装\"]}', 2, 1, 0.70, 310, '2021-04-26 15:58:00', '2021-04-25 15:58:00', 1);
INSERT INTO `product_sku` VALUES ('10', '10', '买二送一', 'p2.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('100', '40', '单件装', 'p35.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('101', '41', '单件装', 'p36.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('102', '42', '单件装', 'p37.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('103', '43', '单件装', 'p38.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('104', '44', '单件装', 'p39.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('105', '45', '单件装', 'p4.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('106', '46', '单件装', 'p40.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('107', '47', '单件装', 'p41.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('108', '48', '单件装', 'p42-1.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('109', '49', '单件装', 'p43.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('11', '11', '买二送一', 'p3.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('110', '50', '单件装', 'p45.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('111', '51', '单件装', 'p46.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('112', '52', '单件装', 'p47.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('113', '53', '单件装', 'p48.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('114', '54', '单件装', 'p49.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('115', '55', '单件装', 'p50.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('116', '56', '单件装', 'p51.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('117', '57', '单件装', 'p51.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('118', '58', '单件装', 'p53.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('119', '59', '单件装', 'p53.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('12', '12', '买二送一', 'p4.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('120', '60', '单件装', 'p54.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('13', '13', '买二送一', 'p5.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('14', '14', '买二送一', 'p6.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('15', '15', '买二送一', 'p7.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('16', '16', '买二送一', 'p8.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('17', '17', '买二送一', 'p9.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('18', '18', '买二送一', 'p10.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('19', '19', '买二送一', 'p11.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('2', '2', '买二送一', 'p12.jpg', '{包装:[\"盒装\",\"袋装\"]}', 10, 8, 0.80, 137, '2021-04-27 11:38:55', '2021-04-27 11:39:00', 1);
INSERT INTO `product_sku` VALUES ('20', '20', '买二送一', 'p13.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('21', '21', '买二送一', 'p14.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('22', '22', '买二送一', 'p15.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('23', '23', '买二送一', 'p16.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('24', '24', '买二送一', 'p17.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('25', '25', '买二送一', 'p18.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('26', '26', '买二送一', 'p19.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('27', '27', '买二送一', 'p20.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('28', '28', '买二送一', 'p21.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('29', '29', '买二送一', 'p22.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('3', '3', '买二送一', 'p23.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('30', '30', '买二送一', 'p24.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('31', '31', '买二送一', 'p25.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('32', '32', '买二送一', 'p26.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('33', '33', '买二送一', 'p27.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('34', '34', '买二送一', 'p28.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('35', '35', '买二送一', 'p29.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('36', '36', '买二送一', 'p30.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('37', '37', '买二送一', 'p31.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('38', '38', '买二送一', 'p32.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('39', '39', '买二送一', 'p33.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('4', '4', '买二送一', 'p34.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('40', '40', '买二送一', 'p35.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('41', '41', '买二送一', 'p36.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('42', '42', '买二送一', 'p37.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('43', '43', '买二送一', 'p38.jpg', '{包装:[\"盒装\",\"袋装\"]}', 6, 5, 0.60, 166, '2021-04-26 14:48:21', '2021-04-26 14:48:25', 1);
INSERT INTO `product_sku` VALUES ('44', '44', '买二送一', 'p39.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 40, 0.50, 37, '2021-04-26 14:49:20', '2021-04-26 14:49:23', 1);
INSERT INTO `product_sku` VALUES ('45', '45', '买二送一', 'p40.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('46', '46', '买二送一', 'p41.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('47', '47', '买二送一', 'p42.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('48', '48', '买二送一', 'p42-1.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('49', '49', '买二送一', 'p43.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('5', '5', '买二送一', 'p44.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('50', '50', '买二送一', 'p45.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('51', '51', '买二送一', 'p46.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('52', '52', '买二送一', 'p47.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('53', '53', '买二送一', 'p48.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('54', '54', '买二送一', 'p49.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('55', '55', '买二送一', 'p50.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('56', '56', '买二送一', 'p51.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('57', '57', '买二送一', 'p52.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('58', '58', '买二送一', 'p53.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('59', '59', '买二送一', 'p54.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('6', '6', '买二送一', 'p55.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('60', '60', '买二送一', 'p56.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('61', '1', '单件装', 'p1.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('62', '2', '单件装', 'p12.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('63', '3', '单件装', 'p23.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('64', '4', '单件装', 'p34.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('65', '5', '单件装', 'p44.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('66', '6', '单件装', 'p55.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('67', '7', '单件装', 'p57.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('68', '8', '单件装', 'p58.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('69', '9', '单件装', 'p59.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('7', '7', '买二送一', 'p57.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('70', '10', '单件装', 'p2.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('71', '11', '单件装', 'p3.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('72', '12', '单件装', 'p4.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('73', '13', '单件装', 'p5.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('74', '14', '单件装', 'p6.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('75', '15', '单件装', 'p7.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('76', '16', '单件装', 'p8.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('77', '17', '单件装', 'p9.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('78', '18', '单件装', 'p10.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('79', '19', '单件装', 'p11.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('8', '8', '买二送一', 'p58.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('80', '20', '单件装', 'p13.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('81', '21', '单件装', 'p14.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('82', '22', '单件装', 'p15.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('83', '23', '单件装', 'p16.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('84', '24', '单件装', 'p17.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('85', '25', '单件装', 'p18.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('86', '26', '单件装', 'p19.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('87', '27', '单件装', 'p20.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('88', '28', '单件装', 'p21.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('89', '29', '单件装', 'p22.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('9', '9', '买二送一', 'p59.jpg', '{包装:[\"盒装\",\"袋装\"]}', 50, 45, 0.90, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('90', '30', '单件装', 'p24.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('91', '31', '单件装', 'p25.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('92', '32', '单件装', 'p26.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('93', '33', '单件装', 'p27.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('94', '34', '单件装', 'p28.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('95', '35', '单件装', 'p29.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('96', '36', '单件装', 'p30.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('97', '37', '单件装', 'p31.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('98', '38', '单件装', 'p32.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);
INSERT INTO `product_sku` VALUES ('99', '39', '单件装', 'p33.jpg', '{包装:[\"盒装\",\"袋装\"]}', 3, 2, 0.50, 999, '2021-05-10 09:56:09', '2021-05-10 09:56:12', 1);

-- ----------------------------
-- Table structure for shopping_cart
-- ----------------------------
DROP TABLE IF EXISTS `shopping_cart`;
CREATE TABLE `shopping_cart`  (
  `cart_id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `product_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品ID',
  `sku_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'skuID',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `cart_num` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '1' COMMENT '购物车商品数量',
  `cart_time` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '添加购物车时间',
  `product_price` decimal(32, 8) NULL DEFAULT NULL COMMENT '添加购物车时商品价格',
  `sku_props` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选择的套餐的属性',
  PRIMARY KEY (`cart_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 105 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '购物车 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of shopping_cart
-- ----------------------------
INSERT INTO `shopping_cart` VALUES (102, '21', '21', '23', '1', '2023-06-15 03:05:36', 45.00000000, '包装:盒装');

-- ----------------------------
-- Table structure for user_addr
-- ----------------------------
DROP TABLE IF EXISTS `user_addr`;
CREATE TABLE `user_addr`  (
  `user_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户ID',
  `receiver_name` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人姓名',
  `receiver_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '收件人手机号',
  `province` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份',
  `city` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市',
  `area` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '区县',
  `addr` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `status` int NULL DEFAULT NULL COMMENT '状态,1正常，0无效',
  `common_addr` int NULL DEFAULT NULL COMMENT '是否默认地址 1是 1:是  0:否',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `addr_id` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '地址主键id',
  PRIMARY KEY (`addr_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户地址 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of user_addr
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` int NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `username` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `nickname` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称，默认为用户名',
  `user_img` varchar(1024) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '头像',
  `user_mobile` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `user_sex` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别 M(男) or F(女)',
  `user_regtime` datetime NOT NULL COMMENT '注册时间',
  `user_modtime` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户 ' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (23, '15307426805', '25d55ad283aa400af464c76d713c07ad', '15307426805', 'images/default.png', NULL, NULL, '2023-06-15 14:44:43', '2023-06-15 14:44:43');

SET FOREIGN_KEY_CHECKS = 1;
