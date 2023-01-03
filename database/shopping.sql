/*
 Navicat MySQL Data Transfer

 Source Server         : newone
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : shopping

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 03/01/2023 16:46:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for buy_history
-- ----------------------------
DROP TABLE IF EXISTS `buy_history`;
CREATE TABLE `buy_history`  (
  `user_id` int NOT NULL COMMENT '用户id',
  `goods_id` int NOT NULL COMMENT '商品id',
  `time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '购买时间'
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of buy_history
-- ----------------------------

-- ----------------------------
-- Table structure for goods
-- ----------------------------
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品名称',
  `goods_info` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '商品信息',
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品类别',
  `price` decimal(10, 2) NOT NULL COMMENT '商品价格',
  `count` int NULL DEFAULT NULL COMMENT '商品数量',
  `hot` enum('是','否') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '否' COMMENT '是否为热门商品',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '商品图片',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100227 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES (10001, 'Apple 苹果14promax', 'iPhone 14 Pro Max是苹果公司于2022年9月8日发布的手机产品。iPhone 14 Pro Max搭载6.7英寸OLED材质屏幕，配有深空黑色、银色、金色、暗紫色四款颜色，长度约160.7毫米，宽度约77.6毫米，厚度约7.85毫米，重量约240g。', '电子数码', 16999.00, 100, '否', 'digital/i14.png');
INSERT INTO `goods` VALUES (10002, '洽洽坚果', '炒货零食大礼包A款锅巴瓜子花生怪味蚕豆恰休闲小吃食品', '食品', 101.30, 90, '否', 'food/洽洽坚果.png');
INSERT INTO `goods` VALUES (10004, '友臣肉松饼', '\r\n友臣散装肉松饼500g营养早餐面包糕点心零食充饥小吃休闲食品整箱', '食品', 15.90, 200, '否', 'food/友臣肉松饼.png');
INSERT INTO `goods` VALUES (10005, '《神雕侠侣》', '首版未删减【 神雕侠侣 】全四册 顺丰发货 金庸经典武侠小说正版现货共4册 暑期畅销 朗声旧版 三联版内容书籍全集', '书籍', 94.25, 222, '否', 'book/神雕侠侣.png');
INSERT INTO `goods` VALUES (10006, 'Redmi K50', '【购机享6期免息】Redmi K50至尊版骁龙8+旗舰处理器红米k50游戏智能5G手机小米手机官方旗舰店', '电子数码', 2999.00, 300, '否', 'digital/红米.png');
INSERT INTO `goods` VALUES (10007, '联想笔记本电脑ThinkBook14+', '联想笔记本电脑ThinkBook14+/16+新品12代酷睿i7/i5轻薄便携商务游戏办公学生ThinkPad官方旗舰店', '电子数码', 5299.00, 56, '否', 'digital/thinkbook14.png');
INSERT INTO `goods` VALUES (10008, '黑人牙膏', 'Darlie好来黑人双重薄荷牙膏家庭装家用225g*1支装去牙渍清新口气', '日用品', 6.90, 500, '否', 'daily/黑人牙膏.png');
INSERT INTO `goods` VALUES (10009, '美汁源果粒橙', '美汁源果味饮料果粒橙橙汁1.25Lx12瓶果汁饮品饮料整箱', '食品', 88.90, 42, '否', 'drink/美汁源.png');
INSERT INTO `goods` VALUES (10010, '植护抽纸', '植护抽纸餐巾纸抽家用实惠装整箱批婴儿面巾纸卫生纸巾小包擦手纸', '日用品', 34.99, 400, '否', 'daily/纸巾.png');
INSERT INTO `goods` VALUES (10011, '加厚羽绒服', '加厚羽绒服女东北哈尔滨保暖冬中长款连帽鸭绒毛领潮防风防寒外套', '服装', 220.00, 11, '否', 'clothing/羽绒服.png');
INSERT INTO `goods` VALUES (10012, 'OFF-WTEDB联名卫衣', 'OFF-WTEDB联名款2022秋季新款连帽卫衣情侣上衣圆领男女同款卫衣\r\n', '服装', 149.88, 5, '否', 'clothing/卫衣.png');
INSERT INTO `goods` VALUES (10013, '361运动裤男裤', '361运动裤男裤2022秋冬加绒男士直筒束脚卫裤针织裤保暖长裤裤子', '服装', 129.00, 77, '否', 'clothing/361长裤.png');
INSERT INTO `goods` VALUES (10014, '可口可乐', '可口可乐含汽饮料摩登罐330mlx24罐整箱汽水官方出品经典口味', '食品', 68.99, 78, '否', 'drink/可乐.png');
INSERT INTO `goods` VALUES (10015, '海飞丝洗发水', '海飞丝洗发水套装清爽去油500g×2瓶+80g×1瓶去屑止痒男女', '日用品', 77.89, 54, '否', 'daily/海飞丝.png');
INSERT INTO `goods` VALUES (10016, 'LUX 力士沐浴露', '正品LUX 力士沐浴露幽莲魅肤沐浴乳薰衣草香720ml持久留香家庭装', '日用品', 32.90, 88, '否', 'daily/力士.png');
INSERT INTO `goods` VALUES (10017, '摩可纳咖啡', '荷兰摩可纳8号5无蔗糖学生提神美式咖啡冻干moccona速溶黑咖啡粉', '食品', 79.00, 233, '否', 'food/咖啡.png');
INSERT INTO `goods` VALUES (10018, '华为 P50', '【优惠550元】HUAWEI/华为 P50 直屏影像旗舰新款智能手机鸿蒙手机拍照游戏通话新款华为官方旗舰店正品官网', '电子数码', 4488.00, 100, '否', 'digital/华为.png');
INSERT INTO `goods` VALUES (10019, '《天龙八部》', '正版现货 天龙八部全集(共5册) 金庸武侠小说 2020彩图平装朗声旧版 广州出版社 三联版文本 经典文学', '书籍', 135.00, 99, '否', 'book/天龙八部.png');
INSERT INTO `goods` VALUES (10020, '《解忧杂货店》', '解忧杂货店东野圭吾正版精装继白夜行疾风回旋曲之后又一新书文学', '书籍', 29.99, 55, '否', 'book/解忧杂货店.png');
INSERT INTO `goods` VALUES (10021, '《Java从入门到精通》', 'Java从入门到精通第六版 明日科技 清华大学出版社java语言程序设计计算机电脑基础编程教程零基础自学全套书籍', '书籍', 47.88, 65, '否', 'book/java.png');
INSERT INTO `goods` VALUES (10022, '耐克顿外套', '耐克顿外套男士2022新款潮流秋冬男装夹克上衣春秋季运动休闲风衣', '服装', 633.00, 21, '否', 'clothing/nike.png');
INSERT INTO `goods` VALUES (10023, '《Java核心编程技术》', 'Java概述；Java编程基础；类与对象；JavaAPI实用类；继承和多态性；抽象类与接口；异常处理；文件与输入输出流；图形用户界面设计；数据库编程；多线程与网络编程；Junit。', '书籍', 56.80, 34, '否', 'book/java核心编程.jpg');

-- ----------------------------
-- Table structure for ordertable
-- ----------------------------
DROP TABLE IF EXISTS `ordertable`;
CREATE TABLE `ordertable`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '订单号',
  `user_id` int NOT NULL COMMENT '用户id',
  `goods_id` int NOT NULL COMMENT '商品id',
  `goods_num` int NULL DEFAULT NULL COMMENT '商品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30036 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ordertable
-- ----------------------------
INSERT INTO `ordertable` VALUES (30012, 20001, 10022, 1);
INSERT INTO `ordertable` VALUES (30013, 20001, 10009, 1);
INSERT INTO `ordertable` VALUES (30014, 20001, 10023, 1);
INSERT INTO `ordertable` VALUES (30026, 20001, 10023, 1);
INSERT INTO `ordertable` VALUES (30027, 20001, 10020, 3);
INSERT INTO `ordertable` VALUES (30028, 20017, 10014, 5);
INSERT INTO `ordertable` VALUES (30029, 20017, 10023, 2);
INSERT INTO `ordertable` VALUES (30030, 20001, 10021, 1);
INSERT INTO `ordertable` VALUES (30031, 20001, 10015, 1);
INSERT INTO `ordertable` VALUES (30032, 20001, 10023, 1);
INSERT INTO `ordertable` VALUES (30033, 20001, 10021, 3);
INSERT INTO `ordertable` VALUES (30034, 20018, 10023, 3);
INSERT INTO `ordertable` VALUES (30035, 20018, 10009, 1);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户密码',
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户手机号码',
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户收货地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20034 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (20001, '张三', '123', '13533988743', '广东广州');
INSERT INTO `user` VALUES (20002, '李四', '456', '13979341620', '四川成都\r\n\r\n\r\n');
INSERT INTO `user` VALUES (20003, '王五', '789', '15933023377', '江西赣州');
INSERT INTO `user` VALUES (20015, 'qqq', '123', '13577890987', NULL);
INSERT INTO `user` VALUES (20018, 'aaa', '123', '13577890987', NULL);

SET FOREIGN_KEY_CHECKS = 1;
