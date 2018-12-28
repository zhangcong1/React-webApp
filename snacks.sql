/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50721
 Source Host           : localhost:3306
 Source Schema         : snacks

 Target Server Type    : MySQL
 Target Server Version : 50721
 File Encoding         : 65001

 Date: 28/12/2018 12:05:47
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Banner名称，通常作为标识',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Banner描述',
  `delete_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'banner管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner
-- ----------------------------
INSERT INTO `banner` VALUES (1, '首页置顶', '首页轮播图', NULL, NULL);

-- ----------------------------
-- Table structure for banner_item
-- ----------------------------
DROP TABLE IF EXISTS `banner_item`;
CREATE TABLE `banner_item`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联image表',
  `key_word` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行关键字，根据不同的type含义不同',
  `type` tinyint(4) NOT NULL DEFAULT 1 COMMENT '跳转类型，可能导向商品，可能导向专题，可能导向其他。0，无导向；1：导向商品;2:导向专题',
  `delete_time` int(11) NULL DEFAULT NULL,
  `banner_id` int(11) NOT NULL COMMENT '外键，关联banner表',
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'banner子项表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of banner_item
-- ----------------------------
INSERT INTO `banner_item` VALUES (1, 65, '6', 1, NULL, 1, NULL);
INSERT INTO `banner_item` VALUES (2, 2, '25', 1, NULL, 1, NULL);
INSERT INTO `banner_item` VALUES (3, 3, '11', 1, NULL, 1, NULL);
INSERT INTO `banner_item` VALUES (5, 1, '10', 1, NULL, 1, NULL);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '分类名称',
  `topic_img_id` int(11) NULL DEFAULT NULL COMMENT '外键，关联image表',
  `delete_time` int(11) NULL DEFAULT NULL,
  `description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '描述',
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '商品类目' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (2, '果味', 6, NULL, NULL, NULL);
INSERT INTO `category` VALUES (3, '蔬菜', 5, NULL, NULL, NULL);
INSERT INTO `category` VALUES (4, '炒货', 7, NULL, NULL, NULL);
INSERT INTO `category` VALUES (5, '点心', 4, NULL, NULL, NULL);
INSERT INTO `category` VALUES (6, '粗茶', 8, NULL, NULL, NULL);
INSERT INTO `category` VALUES (7, '淡饭', 9, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '图片路径',
  `from` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1 来自本地，2 来自公网',
  `delete_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 70 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '图片总表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of image
-- ----------------------------
INSERT INTO `image` VALUES (1, '/banner-1a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (2, '/banner-2a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (3, '/banner-3a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (4, '/category-cake.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (5, '/category-vg.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (6, '/category-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (7, '/category-fry-a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (8, '/category-tea.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (9, '/category-rice.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (10, '/product-dryfruit@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (13, '/product-vg@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (14, '/product-rice@6.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (16, '/1@theme.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (17, '/2@theme.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (18, '/3@theme.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (19, '/detail-1@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (20, '/detail-2@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (21, '/detail-3@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (22, '/detail-4@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (23, '/detail-5@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (24, '/detail-6@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (25, '/detail-7@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (26, '/detail-8@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (27, '/detail-9@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (28, '/detail-11@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (29, '/detail-10@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (31, '/product-rice@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (32, '/product-tea@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (33, '/product-dryfruit@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (36, '/product-dryfruit@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (37, '/product-dryfruit@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (38, '/product-dryfruit@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (39, '/product-dryfruit-a@6.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (40, '/product-dryfruit@7.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (41, '/product-rice@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (42, '/product-rice@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (43, '/product-rice@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (44, '/product-fry@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (45, '/product-fry@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (46, '/product-fry@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (47, '/product-tea@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (48, '/product-tea@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (49, '/1@theme-head.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (50, '/2@theme-head.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (51, '/3@theme-head.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (52, '/product-cake@1.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (53, '/product-cake@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (54, '/product-cake-a@3.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (55, '/product-cake-a@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (56, '/product-dryfruit@8.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (57, '/product-fry@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (58, '/product-fry@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (59, '/product-rice@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (60, '/product-rice@7.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (62, '/detail-12@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (63, '/detail-13@1-dryfruit.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (65, '/banner-4a.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (66, '/product-vg@4.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (67, '/product-vg@5.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (68, '/product-vg@2.png', 1, NULL, NULL);
INSERT INTO `image` VALUES (69, '/product-vg@3.png', 1, NULL, NULL);

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_no` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '订单号',
  `user_id` int(11) NOT NULL COMMENT '外键，用户id，注意并不是openid',
  `delete_time` int(11) NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL,
  `total_price` decimal(6, 2) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 1 COMMENT '1:未支付， 2：已支付，3：已发货 , 4: 已支付，但库存不足',
  `snap_img` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单快照图片',
  `snap_name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单快照名称',
  `total_count` int(11) NOT NULL DEFAULT 0,
  `update_time` int(11) NULL DEFAULT NULL,
  `snap_items` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '订单其他信息快照（json)',
  `snap_address` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址快照',
  `prepay_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单微信支付的预订单id（用于发送模板消息）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 61 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES (12, 'A824997681298095', 1, NULL, 1535099768, 0.03, 1, 'http://www.snacks.com/images/product-cake@2.png', '小红的猪耳朵 120克', 3, 1535099768, '[{\"id\":6,\"haveStock\":true,\"count\":3,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.03}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (13, 'A824997818656283', 1, NULL, 1535099781, 0.01, 1, 'http://www.snacks.com/images/product-dryfruit@1.png', '梨花带雨 3个', 1, 1535099781, '[{\"id\":2,\"haveStock\":true,\"count\":1,\"name\":\"\\u68a8\\u82b1\\u5e26\\u96e8 3\\u4e2a\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (14, 'A824997949644710', 1, NULL, 1535099794, 0.01, 1, 'http://www.snacks.com/images/product-rice@1.png', '素米 327克', 1, 1535099794, '[{\"id\":3,\"haveStock\":true,\"count\":1,\"name\":\"\\u7d20\\u7c73 327\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (15, 'A824998046324905', 1, NULL, 1535099804, 0.01, 1, 'http://www.snacks.com/images/product-dryfruit@5.png', '万紫千凤梨 300克', 1, 1535099804, '[{\"id\":10,\"haveStock\":true,\"count\":1,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (16, 'A824998152085148', 1, NULL, 1535099815, 0.01, 1, 'http://www.snacks.com/images/product-rice@2.png', '绿豆 125克', 1, 1535099815, '[{\"id\":13,\"haveStock\":true,\"count\":1,\"name\":\"\\u7eff\\u8c46 125\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (17, 'A824006083770233', 1, NULL, 1535100608, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100608, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (18, 'A824006092852082', 1, NULL, 1535100609, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100609, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (19, 'A824006098504369', 1, NULL, 1535100609, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100609, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (20, 'A824006104339076', 1, NULL, 1535100610, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100610, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (21, 'A824006109959933', 1, NULL, 1535100610, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100610, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (22, 'A824006115316460', 1, NULL, 1535100611, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100611, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (23, 'A824006124336366', 1, NULL, 1535100612, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100612, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (24, 'A824006135358254', 1, NULL, 1535100613, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100613, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (25, 'A824006141900810', 1, NULL, 1535100614, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100614, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (26, 'A824006147538752', 1, NULL, 1535100614, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100614, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (27, 'A824006153520878', 1, NULL, 1535100615, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100615, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (28, 'A824006159623191', 1, NULL, 1535100615, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100615, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (29, 'A824006165065815', 1, NULL, 1535100616, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100616, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (30, 'A824006172054768', 1, NULL, 1535100617, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100617, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (31, 'A824006178891893', 1, NULL, 1535100617, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100617, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (32, 'A824006185578606', 1, NULL, 1535100618, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100618, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (33, 'A824006192390498', 1, NULL, 1535100619, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100619, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (34, 'A824006198287086', 1, NULL, 1535100619, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100619, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (35, 'A824006204073021', 1, NULL, 1535100620, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100620, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (36, 'A824006209833067', 1, NULL, 1535100620, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100620, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (37, 'A824006216151551', 1, NULL, 1535100621, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100621, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (38, 'A824006222020826', 1, NULL, 1535100622, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100622, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (39, 'A824006227563208', 1, NULL, 1535100622, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100622, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (40, 'A824006233555475', 1, NULL, 1535100623, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100623, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (41, 'A824006241223381', 1, NULL, 1535100624, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100624, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (42, 'A824006252595275', 1, NULL, 1535100625, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100625, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (43, 'A824006259707819', 1, NULL, 1535100625, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100625, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (44, 'A824006267709055', 1, NULL, 1535100626, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100626, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (45, 'A824006274478459', 1, NULL, 1535100627, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100627, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (46, 'A824006281646656', 1, NULL, 1535100628, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100628, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (47, 'A824006287894158', 1, NULL, 1535100628, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100628, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (48, 'A824006294655286', 1, NULL, 1535100629, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100629, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (49, 'A824006301808164', 1, NULL, 1535100630, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100630, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (50, 'A824006307837049', 1, NULL, 1535100630, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100630, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (51, 'A824006313987345', 1, NULL, 1535100631, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100631, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (52, 'A824006319440865', 1, NULL, 1535100631, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100631, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (53, 'A824006324877656', 1, NULL, 1535100632, 0.01, 1, 'http://www.snacks.com/images/product-tea@1.png', '红袖枸杞 6克*3袋', 1, 1535100632, '[{\"id\":4,\"haveStock\":true,\"count\":1,\"name\":\"\\u7ea2\\u8896\\u67b8\\u675e 6\\u514b*3\\u888b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (54, 'A827629398641633', 1, NULL, 1535362939, 0.01, 1, 'http://www.snacks.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1535362939, '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (55, 'A827639092147634', 1, NULL, 1535363909, 0.01, 1, 'http://www.snacks.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1535363909, '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (56, 'A828339672955433', 1, NULL, 1535433967, 0.01, 1, 'http://www.snacks.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1535433967, '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (57, 'A828345625087853', 1, NULL, 1535434562, 0.01, 1, 'http://www.snacks.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1535434562, '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (58, 'A828347159839116', 1, NULL, 1535434715, 0.01, 1, 'http://www.snacks.com/images/product-cake@2.png', '小红的猪耳朵 120克', 1, 1535434715, '[{\"id\":6,\"haveStock\":true,\"count\":1,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (59, 'A907089029135812', 1, NULL, 1536308902, 0.11, 1, 'http://192.168.0.126/snacks/public/images/product-cake@2.png', '小红的猪耳朵 120克等', 11, 1536308902, '[{\"id\":6,\"haveStock\":true,\"count\":2,\"name\":\"\\u5c0f\\u7ea2\\u7684\\u732a\\u8033\\u6735 120\\u514b\",\"totalPrice\":0.02},{\"id\":10,\"haveStock\":true,\"count\":9,\"name\":\"\\u4e07\\u7d2b\\u5343\\u51e4\\u68a8 300\\u514b\",\"totalPrice\":0.09}]', '{\"id\":2,\"name\":\"\\u5f20\\u4e09\",\"mobile\":\"020-81167888\",\"province\":\"\\u5e7f\\u4e1c\\u7701\",\"city\":\"\\u5e7f\\u5dde\\u5e02\",\"country\":\"\\u6d77\\u73e0\\u533a\",\"detail\":\"\\u65b0\\u6e2f\\u4e2d\\u8def397\\u53f7\",\"user_id\":1}', NULL);
INSERT INTO `order` VALUES (60, 'A910718619042560', 1, NULL, 1536571861, 0.02, 1, 'http://192.168.0.126/snacks/public/images/product-dryfruit@2.png', '春生龙眼 500克等', 2, 1536571861, '[{\"id\":5,\"haveStock\":true,\"count\":1,\"name\":\"\\u6625\\u751f\\u9f99\\u773c 500\\u514b\",\"totalPrice\":0.01},{\"id\":11,\"haveStock\":true,\"count\":1,\"name\":\"\\u8d35\\u5983\\u7b11 100\\u514b\",\"totalPrice\":0.01}]', '{\"id\":2,\"name\":\"\\u5f20\\u806a\",\"mobile\":\"15935412153\",\"province\":\"\\u6d59\\u6c5f\\u7701\",\"city\":\"\\u676d\\u5dde\\u5e02\",\"country\":\"\\u62f1\\u5885\\u533a\",\"detail\":\"\\u666f\\u745e\\u7533\\u82b1\\u90e1\",\"user_id\":1}', NULL);

-- ----------------------------
-- Table structure for order_product
-- ----------------------------
DROP TABLE IF EXISTS `order_product`;
CREATE TABLE `order_product`  (
  `order_id` int(11) NOT NULL COMMENT '联合主键，订单id',
  `product_id` int(11) NOT NULL COMMENT '联合主键，商品id',
  `counts` int(11) NOT NULL COMMENT '商品数量',
  `delete_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`, `order_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of order_product
-- ----------------------------
INSERT INTO `order_product` VALUES (11, 2, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (13, 2, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (14, 3, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (17, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (18, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (19, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (20, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (21, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (22, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (23, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (24, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (25, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (26, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (27, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (28, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (29, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (30, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (31, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (32, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (33, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (34, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (35, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (36, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (37, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (38, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (39, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (40, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (41, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (42, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (43, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (44, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (45, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (46, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (47, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (48, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (49, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (50, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (51, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (52, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (53, 4, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (60, 5, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (5, 6, 2, NULL, NULL);
INSERT INTO `order_product` VALUES (6, 6, 2, NULL, NULL);
INSERT INTO `order_product` VALUES (7, 6, 2, NULL, NULL);
INSERT INTO `order_product` VALUES (8, 6, 2, NULL, NULL);
INSERT INTO `order_product` VALUES (9, 6, 2, NULL, NULL);
INSERT INTO `order_product` VALUES (10, 6, 2, NULL, NULL);
INSERT INTO `order_product` VALUES (12, 6, 3, NULL, NULL);
INSERT INTO `order_product` VALUES (54, 6, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (55, 6, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (56, 6, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (57, 6, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (58, 6, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (59, 6, 2, NULL, NULL);
INSERT INTO `order_product` VALUES (15, 10, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (59, 10, 9, NULL, NULL);
INSERT INTO `order_product` VALUES (60, 11, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (16, 13, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (6, 25, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (7, 25, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (8, 25, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (9, 25, 1, NULL, NULL);
INSERT INTO `order_product` VALUES (10, 25, 1, NULL, NULL);

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '商品名称',
  `price` decimal(6, 2) NOT NULL COMMENT '价格,单位：分',
  `stock` int(11) NOT NULL DEFAULT 0 COMMENT '库存量',
  `delete_time` int(11) NULL DEFAULT NULL,
  `category_id` int(11) NULL DEFAULT NULL,
  `main_img_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '主图ID号，这是一个反范式设计，有一定的冗余',
  `from` tinyint(4) NOT NULL DEFAULT 1 COMMENT '图片来自 1 本地 ，2公网',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` int(11) NULL DEFAULT NULL,
  `summary` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '摘要',
  `img_id` int(11) NULL DEFAULT NULL COMMENT '图片外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 34 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '芹菜 半斤', 0.01, 0, NULL, 3, '/product-vg@1.png', 1, NULL, NULL, NULL, 13);
INSERT INTO `product` VALUES (2, '梨花带雨 3个', 0.01, 984, NULL, 2, '/product-dryfruit@1.png', 1, NULL, NULL, NULL, 10);
INSERT INTO `product` VALUES (3, '素米 327克', 0.01, 996, NULL, 7, '/product-rice@1.png', 1, NULL, NULL, NULL, 31);
INSERT INTO `product` VALUES (4, '红袖枸杞 6克*3袋', 0.01, 998, NULL, 6, '/product-tea@1.png', 1, NULL, NULL, NULL, 32);
INSERT INTO `product` VALUES (5, '春生龙眼 500克', 0.01, 995, NULL, 2, '/product-dryfruit@2.png', 1, NULL, NULL, NULL, 33);
INSERT INTO `product` VALUES (6, '小红的猪耳朵 120克', 0.01, 997, NULL, 5, '/product-cake@2.png', 1, NULL, NULL, NULL, 53);
INSERT INTO `product` VALUES (7, '泥蒿 半斤', 0.01, 998, NULL, 3, '/product-vg@2.png', 1, NULL, NULL, NULL, 68);
INSERT INTO `product` VALUES (8, '夏日芒果 3个', 0.01, 995, NULL, 2, '/product-dryfruit@3.png', 1, NULL, NULL, NULL, 36);
INSERT INTO `product` VALUES (9, '冬木红枣 500克', 0.01, 996, NULL, 2, '/product-dryfruit@4.png', 1, NULL, NULL, NULL, 37);
INSERT INTO `product` VALUES (10, '万紫千凤梨 300克', 0.01, 996, NULL, 2, '/product-dryfruit@5.png', 1, NULL, NULL, NULL, 38);
INSERT INTO `product` VALUES (11, '贵妃笑 100克', 0.01, 994, NULL, 2, '/product-dryfruit-a@6.png', 1, NULL, NULL, NULL, 39);
INSERT INTO `product` VALUES (12, '珍奇异果 3个', 0.01, 999, NULL, 2, '/product-dryfruit@7.png', 1, NULL, NULL, NULL, 40);
INSERT INTO `product` VALUES (13, '绿豆 125克', 0.01, 999, NULL, 7, '/product-rice@2.png', 1, NULL, NULL, NULL, 41);
INSERT INTO `product` VALUES (14, '芝麻 50克', 0.01, 999, NULL, 7, '/product-rice@3.png', 1, NULL, NULL, NULL, 42);
INSERT INTO `product` VALUES (15, '猴头菇 370克', 0.01, 999, NULL, 7, '/product-rice@4.png', 1, NULL, NULL, NULL, 43);
INSERT INTO `product` VALUES (16, '西红柿 1斤', 0.01, 999, NULL, 3, '/product-vg@3.png', 1, NULL, NULL, NULL, 69);
INSERT INTO `product` VALUES (17, '油炸花生 300克', 0.01, 999, NULL, 4, '/product-fry@1.png', 1, NULL, NULL, NULL, 44);
INSERT INTO `product` VALUES (18, '春泥西瓜子 128克', 0.01, 997, NULL, 4, '/product-fry@2.png', 1, NULL, NULL, NULL, 45);
INSERT INTO `product` VALUES (19, '碧水葵花籽 128克', 0.01, 999, NULL, 4, '/product-fry@3.png', 1, NULL, NULL, NULL, 46);
INSERT INTO `product` VALUES (20, '碧螺春 12克*3袋', 0.01, 999, NULL, 6, '/product-tea@2.png', 1, NULL, NULL, NULL, 47);
INSERT INTO `product` VALUES (21, '西湖龙井 8克*3袋', 0.01, 998, NULL, 6, '/product-tea@3.png', 1, NULL, NULL, NULL, 48);
INSERT INTO `product` VALUES (22, '梅兰清花糕 1个', 0.01, 997, NULL, 5, '/product-cake-a@3.png', 1, NULL, NULL, NULL, 54);
INSERT INTO `product` VALUES (23, '清凉薄荷糕 1个', 0.01, 998, NULL, 5, '/product-cake-a@4.png', 1, NULL, NULL, NULL, 55);
INSERT INTO `product` VALUES (25, '小明的妙脆角 120克', 0.01, 999, NULL, 5, '/product-cake@1.png', 1, NULL, NULL, NULL, 52);
INSERT INTO `product` VALUES (26, '红衣青瓜 混搭160克', 0.01, 999, NULL, 2, '/product-dryfruit@8.png', 1, NULL, NULL, NULL, 56);
INSERT INTO `product` VALUES (27, '锈色瓜子 100克', 0.01, 998, NULL, 4, '/product-fry@4.png', 1, NULL, NULL, NULL, 57);
INSERT INTO `product` VALUES (28, '春泥花生 200克', 0.01, 999, NULL, 4, '/product-fry@5.png', 1, NULL, NULL, NULL, 58);
INSERT INTO `product` VALUES (29, '冰心鸡蛋 2个', 0.01, 999, NULL, 7, '/product-rice@5.png', 1, NULL, NULL, NULL, 59);
INSERT INTO `product` VALUES (30, '八宝莲子 200克', 0.01, 999, NULL, 7, '/product-rice@6.png', 1, NULL, NULL, NULL, 14);
INSERT INTO `product` VALUES (31, '深涧木耳 78克', 0.01, 999, NULL, 7, '/product-rice@7.png', 1, NULL, NULL, NULL, 60);
INSERT INTO `product` VALUES (32, '土豆 半斤', 0.01, 999, NULL, 3, '/product-vg@4.png', 1, NULL, NULL, NULL, 66);
INSERT INTO `product` VALUES (33, '青椒 半斤', 0.01, 999, NULL, 3, '/product-vg@5.png', 1, NULL, NULL, NULL, 67);

-- ----------------------------
-- Table structure for product_image
-- ----------------------------
DROP TABLE IF EXISTS `product_image`;
CREATE TABLE `product_image`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `img_id` int(11) NOT NULL COMMENT '外键，关联图片表',
  `delete_time` int(11) NULL DEFAULT NULL COMMENT '状态，主要表示是否删除，也可以扩展其他状态',
  `order` int(11) NOT NULL DEFAULT 0 COMMENT '图片排序序号',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_image
-- ----------------------------
INSERT INTO `product_image` VALUES (4, 19, NULL, 1, 11);
INSERT INTO `product_image` VALUES (5, 20, NULL, 2, 11);
INSERT INTO `product_image` VALUES (6, 21, NULL, 3, 11);
INSERT INTO `product_image` VALUES (7, 22, NULL, 4, 11);
INSERT INTO `product_image` VALUES (8, 23, NULL, 5, 11);
INSERT INTO `product_image` VALUES (9, 24, NULL, 6, 11);
INSERT INTO `product_image` VALUES (10, 25, NULL, 7, 11);
INSERT INTO `product_image` VALUES (11, 26, NULL, 8, 11);
INSERT INTO `product_image` VALUES (12, 27, NULL, 9, 11);
INSERT INTO `product_image` VALUES (13, 28, NULL, 11, 11);
INSERT INTO `product_image` VALUES (14, 29, NULL, 10, 11);
INSERT INTO `product_image` VALUES (18, 62, NULL, 12, 11);
INSERT INTO `product_image` VALUES (19, 63, NULL, 13, 11);

-- ----------------------------
-- Table structure for product_property
-- ----------------------------
DROP TABLE IF EXISTS `product_property`;
CREATE TABLE `product_property`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '详情属性名称',
  `detail` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '详情属性',
  `product_id` int(11) NOT NULL COMMENT '商品id，外键',
  `delete_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product_property
-- ----------------------------
INSERT INTO `product_property` VALUES (1, '品名', '杨梅', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (2, '口味', '青梅味 雪梨味 黄桃味 菠萝味', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (3, '产地', '火星', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (4, '保质期', '180天', 11, NULL, NULL);
INSERT INTO `product_property` VALUES (5, '品名', '梨子', 2, NULL, NULL);
INSERT INTO `product_property` VALUES (6, '产地', '金星', 2, NULL, NULL);
INSERT INTO `product_property` VALUES (7, '净含量', '100g', 2, NULL, NULL);
INSERT INTO `product_property` VALUES (8, '保质期', '10天', 2, NULL, NULL);

-- ----------------------------
-- Table structure for theme
-- ----------------------------
DROP TABLE IF EXISTS `theme`;
CREATE TABLE `theme`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专题名称',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '专题描述',
  `topic_img_id` int(11) NOT NULL COMMENT '主题图，外键',
  `delete_time` int(11) NULL DEFAULT NULL,
  `head_img_id` int(11) NOT NULL COMMENT '专题列表页，头图',
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme
-- ----------------------------
INSERT INTO `theme` VALUES (1, '专题栏位一', '美味水果世界', 16, NULL, 49, NULL);
INSERT INTO `theme` VALUES (2, '专题栏位二', '新品推荐', 17, NULL, 50, NULL);
INSERT INTO `theme` VALUES (3, '专题栏位三', '做个干物女', 18, NULL, 18, NULL);

-- ----------------------------
-- Table structure for theme_product
-- ----------------------------
DROP TABLE IF EXISTS `theme_product`;
CREATE TABLE `theme_product`  (
  `theme_id` int(11) NOT NULL COMMENT '主题外键',
  `product_id` int(11) NOT NULL COMMENT '商品外键',
  PRIMARY KEY (`theme_id`, `product_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '主题所包含的商品' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of theme_product
-- ----------------------------
INSERT INTO `theme_product` VALUES (1, 2);
INSERT INTO `theme_product` VALUES (1, 5);
INSERT INTO `theme_product` VALUES (1, 8);
INSERT INTO `theme_product` VALUES (1, 10);
INSERT INTO `theme_product` VALUES (1, 12);
INSERT INTO `theme_product` VALUES (2, 1);
INSERT INTO `theme_product` VALUES (2, 2);
INSERT INTO `theme_product` VALUES (2, 3);
INSERT INTO `theme_product` VALUES (2, 5);
INSERT INTO `theme_product` VALUES (2, 6);
INSERT INTO `theme_product` VALUES (2, 16);
INSERT INTO `theme_product` VALUES (2, 33);
INSERT INTO `theme_product` VALUES (3, 15);
INSERT INTO `theme_product` VALUES (3, 18);
INSERT INTO `theme_product` VALUES (3, 19);
INSERT INTO `theme_product` VALUES (3, 27);
INSERT INTO `theme_product` VALUES (3, 30);
INSERT INTO `theme_product` VALUES (3, 31);

-- ----------------------------
-- Table structure for third_app
-- ----------------------------
DROP TABLE IF EXISTS `third_app`;
CREATE TABLE `third_app`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用app_id',
  `app_secret` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用secret',
  `app_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '应用程序描述',
  `scope` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '应用权限',
  `scope_description` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限描述',
  `delete_time` int(11) NULL DEFAULT NULL,
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '访问API的各应用账号密码表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of third_app
-- ----------------------------
INSERT INTO `third_app` VALUES (1, 'starcraft', '777*777', 'CMS', '32', 'Super', NULL, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `openid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `extend` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `delete_time` int(11) NULL DEFAULT NULL,
  `create_time` int(11) NULL DEFAULT NULL COMMENT '注册时间',
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `openid`(`openid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'oxYe35WAdEkd6QS20VnJo238_zFg', NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '收获人姓名',
  `mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '手机号',
  `province` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '省',
  `city` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '市',
  `country` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '区',
  `detail` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '详细地址',
  `delete_time` int(11) NULL DEFAULT NULL,
  `user_id` int(11) NOT NULL COMMENT '外键',
  `update_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (2, '张聪', '15935412153', '浙江省', '杭州市', '拱墅区', '景瑞申花郡', NULL, 1, NULL);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` bigint(255) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 1, '1');

SET FOREIGN_KEY_CHECKS = 1;
