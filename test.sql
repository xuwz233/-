/*
Navicat MySQL Data Transfer

Source Server         : lyrsql
Source Server Version : 50621
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50621
File Encoding         : 65001

Date: 2022-07-19 11:23:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for address
-- ----------------------------
DROP TABLE IF EXISTS `address`;
CREATE TABLE `address` (
  `a_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) NOT NULL,
  `area_code` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `county` varchar(255) NOT NULL,
  `u_id` int(11) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of address
-- ----------------------------
INSERT INTO `address` VALUES ('2', 'lky2', '12312312312', '110101', '北京市东城区666号', '北京市', '北京市', '东城区', '1');
INSERT INTO `address` VALUES ('3', 'lky3', '12312313212', '110101', '北京市东城区东城大道666号', '北京市', '北京市', '东城区', '1');
INSERT INTO `address` VALUES ('4', 'lky4', '12312313212', '140214', '山西省大同市云冈区云岗大道666号', '山西省', '大同市', '云冈区', '1');
INSERT INTO `address` VALUES ('5', 'lky5', '12312313212', '110101', '北京市东城区123', '北京市', '北京市', '东城区', '1');
INSERT INTO `address` VALUES ('6', 'lky6', '12312312312', '110102', '北京市西城区阳光大道666号', '北京市', '北京市', '西城区', '1');
INSERT INTO `address` VALUES ('7', 'lky666', '12312312312', '140105', '山西省小店区幸福大道666号', '山西省', '太原市', '小店区', '1');
INSERT INTO `address` VALUES ('8', 'lky777', '12312312312', '110101', '北京市东城区快乐大道777号', '北京市', '北京市', '东城区', '1');
INSERT INTO `address` VALUES ('9', 'lky333', '12312312312', '130102', '河北省长安区阳光大道333号', '河北省', '石家庄市', '长安区', '1');
INSERT INTO `address` VALUES ('10', 'lky111', '12312313212', '120102', '天津市河东区阳关大道111号', '天津市', '天津市', '河东区', '1');
INSERT INTO `address` VALUES ('12', '小黄鸭', '15179542036', '360902', '江西省袁州区幸福街666号', '江西省', '宜春市', '袁州区', '6');
INSERT INTO `address` VALUES ('24', 'tqt', '18283674093', '360203', '江西省景德镇市珠山区的v给v豆瓣广告', '江西省', '景德镇市', '珠山区', '1');
INSERT INTO `address` VALUES ('45', '李咏然', '13246960115', '420502', '湖北省西陵区三峡大学欣苑', '湖北省', '宜昌市', '西陵区', '3');

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `c_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) NOT NULL,
  `s_id` int(11) NOT NULL,
  PRIMARY KEY (`c_id`),
  UNIQUE KEY `categoryName` (`category_name`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', '特色果茶', '1');
INSERT INTO `category` VALUES ('2', '招牌水果茶', '1');
INSERT INTO `category` VALUES ('3', '水果新鲜奶茶', '1');
INSERT INTO `category` VALUES ('4', '肉松小贝', '2');
INSERT INTO `category` VALUES ('5', '点心系列', '2');
INSERT INTO `category` VALUES ('6', '甜甜圈区', '2');
INSERT INTO `category` VALUES ('7', '方糕系列', '2');
INSERT INTO `category` VALUES ('8', '另加小料', '1');
INSERT INTO `category` VALUES ('9', '季节限定', '4');
INSERT INTO `category` VALUES ('10', '时令鲜果', '4');
INSERT INTO `category` VALUES ('11', '特制纯茶', '4');
INSERT INTO `category` VALUES ('12', '精选套餐', '4');
INSERT INTO `category` VALUES ('13', '当家仙草', '4');
INSERT INTO `category` VALUES ('16', '严选套餐', '3');
INSERT INTO `category` VALUES ('17', '丝苗白米饭', '3');
INSERT INTO `category` VALUES ('18', '特色小吃', '3');
INSERT INTO `category` VALUES ('20', '快乐水', '5');
INSERT INTO `category` VALUES ('21', '快乐吃', '5');

-- ----------------------------
-- Table structure for delivery
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `d_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `total_num` int(11) NOT NULL DEFAULT '0',
  `number` varchar(255) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`d_id`),
  UNIQUE KEY `phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES ('1', 'lky6', '15179510163', '6', '123123123', '1');
INSERT INTO `delivery` VALUES ('2', '李咏然', '13246960115', '3', '123123123', '1');

-- ----------------------------
-- Table structure for good
-- ----------------------------
DROP TABLE IF EXISTS `good`;
CREATE TABLE `good` (
  `g_id` int(11) NOT NULL AUTO_INCREMENT,
  `good_name` varchar(255) NOT NULL,
  `good_pic` varchar(255) DEFAULT NULL,
  `price` varchar(255) NOT NULL,
  `c_id` int(255) NOT NULL,
  `sales` int(11) NOT NULL DEFAULT '0',
  `s_id` int(11) NOT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`g_id`),
  UNIQUE KEY `goodName` (`good_name`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of good
-- ----------------------------
INSERT INTO `good` VALUES ('1', '霸气芒果', '/upload/霸气芒果_20210901171704.jpg', '8', '2', '3', '1', '满满的芒果果肉');
INSERT INTO `good` VALUES ('2', '草莓乌龙水果茶', '/upload/草莓乌龙水果茶_20210901171554.jpg', '8', '2', '1', '1', '酸甜的草莓与乌龙产生碰撞');
INSERT INTO `good` VALUES ('3', '超级水果茶', '/upload/超级水果茶_20210901171624.jpg', '10', '2', '0', '1', '丰富多汁水果茶');
INSERT INTO `good` VALUES ('4', '草莓脏脏茶', '/upload/草莓脏脏茶_20210901171744.jpg', '8', '3', '3', '1', '悠悠果茶-草莓脏脏茶');
INSERT INTO `good` VALUES ('5', '百香柠檬茶', '/upload/百香柠檬茶_20210901171830.jpg', '10', '2', '0', '1', '百香柠檬、酸酸甜甜');
INSERT INTO `good` VALUES ('6', '珍珠奶茶', '/upload/珍珠奶茶_20210901171917.jpg', '8', '3', '3', '1', '奶香味配上一颗颗圆润的珍珠');
INSERT INTO `good` VALUES ('7', '抹茶曲奇奶茶', '/upload/抹茶曲奇奶茶_20210901171946.jpg', '12', '3', '0', '1', '抹茶曲奇奶茶');
INSERT INTO `good` VALUES ('8', '海苔肉松小贝', '/upload/海苔肉松小贝_20210901144807.png', '32', '4', '1', '2', '肉松海苔爱好者');
INSERT INTO `good` VALUES ('9', '原味肉松小贝', '/upload/原味肉松小贝_20210901145424.png', '40', '4', '2', '2', '满满肉松');
INSERT INTO `good` VALUES ('10', '蟹黄肉松小贝', '/upload/蟹黄肉松小贝_20210901145603.png', '38', '4', '0', '2', '独家秘制');
INSERT INTO `good` VALUES ('11', '肉松小贝套餐', '/upload/肉松小贝套餐_20210901145652.png', '26', '4', '0', '2', '套餐搭配');
INSERT INTO `good` VALUES ('12', '爆浆肉松小贝', '/upload/爆浆肉松小贝_20210901145759.png', '26', '4', '0', '2', '爆浆肉松');
INSERT INTO `good` VALUES ('13', '咸蛋黄肉松小贝', '/upload/咸蛋黄肉松小贝_20210901145837.png', '26', '4', '0', '2', '咸蛋黄配肉松');
INSERT INTO `good` VALUES ('14', '蛋挞', '/upload/蛋挞_20210901145951.png', '14', '5', '0', '2', '美食传奇，蛋挞流心');
INSERT INTO `good` VALUES ('15', '抹茶蛋糕', '/upload/抹茶蛋糕_20210901150110.png', '13.5', '5', '0', '2', '当抹茶恋上奶油');
INSERT INTO `good` VALUES ('16', '桃酥', '/upload/桃酥_20210901150258.png', '13.5', '5', '0', '2', '香酥化渣，酥而不腻');
INSERT INTO `good` VALUES ('17', '草莓甜甜圈', '/upload/草莓甜甜圈_20210901150358.png', '11', '6', '1', '2', '草莓盛宴，世界共享');
INSERT INTO `good` VALUES ('18', '巧克力甜甜圈', '/upload/巧克力甜甜圈_20210901150438.png', '12', '6', '1', '2', '给最亲爱的你，品最真挚的情');
INSERT INTO `good` VALUES ('19', '紫薯方糕', '/upload/紫薯方糕_20210901150538.png', '19', '7', '1', '2', '赢在舌尖上的方糕');
INSERT INTO `good` VALUES ('20', '原味方糕', '/upload/原味方糕_20210901150611.png', '17', '7', '0', '2', '畅享甜蜜');
INSERT INTO `good` VALUES ('21', '珍珠', '/upload/珍珠_20210901172142.jpg', '5', '8', '2', '1', '鲜香圆润');
INSERT INTO `good` VALUES ('22', '西瓜啵啵', '/upload/西瓜啵啵_20210905134524.jpg', '22', '1', '1', '1', '悠悠果茶-特色西瓜汁');
INSERT INTO `good` VALUES ('23', '蜜桃荔枝水果茶', '/upload/蜜桃荔枝水果茶_20210905134603.jpg', '22', '1', '1', '1', '悠悠果茶-特色水果茶');
INSERT INTO `good` VALUES ('31', '乌龙奶茶', '/upload/水果奶茶_20210905140231.jpg', '15', '11', '0', '3', '水果奶茶');
INSERT INTO `good` VALUES ('32', '双杯轻芒芒', '/upload/双杯轻芒芒_20210905140310.jpg', '15', '12', '0', '3', '双杯轻芒芒');
INSERT INTO `good` VALUES ('33', '鲜美水果茶', '/upload/鲜美水果茶_20210905140342.jpg', '15', '12', '1', '3', '鲜美水果茶');
INSERT INTO `good` VALUES ('34', '奶茶全家桶', '/upload/奶茶全家桶_20210905140357.jpg', '5', '12', '0', '3', '奶茶全家桶');
INSERT INTO `good` VALUES ('35', '芋圆仙草奶茶', '/upload/芋圆仙草奶茶_20210905140431.jpg', '12', '13', '0', '3', '芋圆仙草奶茶');
INSERT INTO `good` VALUES ('36', '珍珠波霸仙草奶茶', '/upload/珍珠波霸仙草奶茶_20210905140531.jpg', '5', '13', '0', '3', '珍珠波霸仙草奶茶');
INSERT INTO `good` VALUES ('37', '仙草奶冻', '/upload/仙草奶冻_20210905140918.png', '8', '13', '0', '3', '当仙草遇上奶冻');
INSERT INTO `good` VALUES ('38', '多肉桃李', '/upload/多肉桃李_20210905170416.jpg', '25', '10', '0', '3', '多肉+桃李');
INSERT INTO `good` VALUES ('39', '多肉车厘莓', '/upload/多肉车厘莓_20210905170434.jpg', '25', '10', '0', '3', '多肉车厘莓');
INSERT INTO `good` VALUES ('40', '麻团', '/upload/麻团_20210905193147.jpg', '6', '14', '1', '4', '益佳小厨店-麻团');
INSERT INTO `good` VALUES ('41', '桂花方糕', '/upload/桂花方糕_20210905193404.jpg', '6', '14', '0', '4', '益佳小厨店-桂花方糕');
INSERT INTO `good` VALUES ('42', '咸蛋黄炒南瓜', '/upload/咸蛋黄炒南瓜_20210905193433.jpg', '6', '14', '0', '4', '益佳小厨店-咸蛋黄炒南瓜');
INSERT INTO `good` VALUES ('43', '农家白米饭', '/upload/农家白米饭_20210905193506.jpg', '7', '17', '1', '4', '益佳小厨店-农家白米饭');
INSERT INTO `good` VALUES ('44', '红糖糍粑', '/upload/红糖糍粑_20210905193556.jpg', '6', '14', '0', '4', '益佳小厨店-红糖糍粑');
INSERT INTO `good` VALUES ('45', '招牌烧腊斩料', '/upload/招牌烧腊斩料_20210905193634.jpg', '7', '15', '0', '4', '益佳小厨店--招牌烧腊斩料');
INSERT INTO `good` VALUES ('46', '芝麻米饭', '/upload/芝麻米饭_20210905193711.jpg', '5', '17', '1', '4', '益佳小厨店-芝麻米饭');
INSERT INTO `good` VALUES ('47', '驴打滚', '/upload/驴打滚_20210905193738.jpg', '7', '14', '0', '4', '益佳小厨店-驴打滚');
INSERT INTO `good` VALUES ('48', '烧腊拼盘', '/upload/烧腊拼盘_20210905193802.jpg', '7', '15', '0', '4', '益佳小厨店--烧腊拼盘');
INSERT INTO `good` VALUES ('49', '蔬菜沙拉', '/upload/蔬菜沙拉_20210905193912.jpg', '6', '16', '1', '4', '益佳小厨店-蔬菜沙拉');
INSERT INTO `good` VALUES ('50', '艾草青团', '/upload/艾草青团_20210905193951.jpg', '7', '14', '0', '4', '益佳小厨店-艾草青团');
INSERT INTO `good` VALUES ('51', '香煎牛排套餐', '/upload/香煎牛排套餐_20210905194051.jpg', '7', '16', '0', '4', '益佳小厨店-香煎牛排套餐');
INSERT INTO `good` VALUES ('53', '芝芝莓莓', '/upload/芝芝莓莓奶昔.png', '20', '20', '0', '5', '+冰淇淋+超多脆波波，好喝到转圈圈');
INSERT INTO `good` VALUES ('54', '桂花雪芙', '/upload/桂花飘飘奶芙.png', '18', '20', '0', '5', '桂花香气谁闻谁不迷糊！！');
INSERT INTO `good` VALUES ('55', '芋泥波波奶茶', '/upload/芋泥波波奶茶.png', '21', '20', '0', '5', '芋圆chao多，芋泥也qiao细腻哦！');
INSERT INTO `good` VALUES ('56', '熔岩巧克力燕麦拿铁', '/upload/熔岩巧克力脏脏拿铁.png', '25', '20', '0', '5', '巧克力与燕麦的碰撞，咖啡控的最爱');
INSERT INTO `good` VALUES ('57', '芒果生椰雪酪', '/upload/芒果生椰雪酪.png', '24', '20', '0', '5', '芒果果肉+生椰冰沙，层次口感丰富，仿佛穿越到海边！');
INSERT INTO `good` VALUES ('58', '草莓抹茶卷', '/upload/草莓抹茶卷.jpg', '30', '21', '0', '5', '吃起来不同口感，qiao好吃');
INSERT INTO `good` VALUES ('59', '芒果塔', '/upload/芒果塔.jpg', '30', '21', '0', '5', '酥脆的塔皮加上香甜的卡仕达酱，再加上新鲜的芒果，一口下去让人回味无穷');
INSERT INTO `good` VALUES ('60', '草莓芝士蛋糕卷', '/upload/草莓奶油蛋糕卷.jpg', '25', '21', '0', '5', '芝士口感的奶油配上草莓口感的酸甜蛋糕卷');
INSERT INTO `good` VALUES ('61', '黑森林蛋糕', '/upload/黑森林蛋糕.jpg', '35', '21', '0', '5', '经典口感，传统黑森林该有的样子');
INSERT INTO `good` VALUES ('62', '巴斯克芝士蛋糕', '/upload/巴斯克芝士蛋糕.jpg', '35', '21', '0', '5', '顺滑好吃，duangduang的');
INSERT INTO `good` VALUES ('63', '草莓三色慕斯蛋糕', '/upload/草莓三色慕斯蛋糕.jpg', '35', '21', '0', '5', '酸甜可口，超好吃！！！');
INSERT INTO `good` VALUES ('64', '草莓酸奶蛋糕慕斯', '/upload/草莓酸奶蛋糕.jpg', '32', '21', '0', '5', '把草莓留在慕斯里，酸甜的味道，这个味道可以吃上整个春天');

-- ----------------------------
-- Table structure for order
-- ----------------------------
DROP TABLE IF EXISTS `order`;
CREATE TABLE `order` (
  `o_id` int(11) NOT NULL AUTO_INCREMENT,
  `order_Number` varchar(255) NOT NULL,
  `total_price` decimal(11,2) NOT NULL,
  `u_id` int(11) NOT NULL,
  `s_id` int(11) NOT NULL,
  `a_id` int(11) NOT NULL,
  `create_time` varchar(255) NOT NULL COMMENT '下单时间',
  `order_Stat` int(255) NOT NULL DEFAULT '1',
  `good_total_price` decimal(10,2) NOT NULL,
  `delivery_price` varchar(255) NOT NULL,
  `d_id` int(11) DEFAULT NULL,
  `order_time` varchar(255) DEFAULT NULL COMMENT '接单时间',
  `pick_time` varchar(255) DEFAULT NULL COMMENT '取货时间',
  `arrive_time` varchar(255) DEFAULT NULL COMMENT '送达时间',
  PRIMARY KEY (`o_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order
-- ----------------------------
INSERT INTO `order` VALUES ('10', 'DM202109052111398490006', '28.50', '6', '4', '12', '2021-09-05 21:11:39', '4', '24.00', '4.5', '1', '2021-09-05 21:12:06', '2021-09-05 21:12:31', '2021-09-05 21:12:54');
INSERT INTO `order` VALUES ('11', 'DM202109052114239670006', '113.00', '6', '2', '12', '2021-09-05 21:14:23', '4', '103.00', '10', '1', '2021-09-05 21:15:00', '2021-09-05 21:15:07', '2021-09-05 21:15:11');
INSERT INTO `order` VALUES ('12', 'DM202109060910560470006', '25.00', '6', '1', '12', '2021-09-06 09:10:56', '3', '21.00', '4', '1', '2022-07-18 09:14:09', '2022-07-18 09:14:30', null);
INSERT INTO `order` VALUES ('13', 'DM202109061115411000006', '28.00', '6', '1', '12', '2021-09-06 11:15:41', '4', '24.00', '4', '1', '2021-09-06 11:17:13', '2021-09-06 11:18:06', '2021-09-06 11:18:36');
INSERT INTO `order` VALUES ('14', 'DM202109092214266660006', '33.00', '6', '1', '12', '2021-09-09 22:14:26', '4', '29.00', '4', '1', '2021-09-09 22:15:03', '2021-09-09 22:15:54', '2021-09-09 22:16:07');
INSERT INTO `order` VALUES ('17', 'DM202207180933306620003', '56.00', '3', '1', '45', '2022-07-18 09:33:30', '4', '52.00', '4', '2', '2022-07-18 09:53:46', '2022-07-18 09:58:03', '2022-07-18 10:01:41');

-- ----------------------------
-- Table structure for order_good
-- ----------------------------
DROP TABLE IF EXISTS `order_good`;
CREATE TABLE `order_good` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `o_id` int(11) NOT NULL,
  `g_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_good
-- ----------------------------
INSERT INTO `order_good` VALUES ('1', '1', '9', '1');
INSERT INTO `order_good` VALUES ('2', '1', '17', '1');
INSERT INTO `order_good` VALUES ('3', '2', '1', '1');
INSERT INTO `order_good` VALUES ('4', '2', '4', '1');
INSERT INTO `order_good` VALUES ('5', '2', '6', '1');
INSERT INTO `order_good` VALUES ('6', '2', '21', '1');
INSERT INTO `order_good` VALUES ('7', '3', '8', '1');
INSERT INTO `order_good` VALUES ('8', '3', '18', '1');
INSERT INTO `order_good` VALUES ('9', '4', '11', '1');
INSERT INTO `order_good` VALUES ('10', '4', '14', '1');
INSERT INTO `order_good` VALUES ('11', '4', '20', '1');
INSERT INTO `order_good` VALUES ('12', '5', '22', '1');
INSERT INTO `order_good` VALUES ('13', '5', '2', '1');
INSERT INTO `order_good` VALUES ('14', '5', '7', '1');
INSERT INTO `order_good` VALUES ('15', '5', '21', '1');
INSERT INTO `order_good` VALUES ('16', '6', '40', '1');
INSERT INTO `order_good` VALUES ('17', '6', '45', '1');
INSERT INTO `order_good` VALUES ('18', '6', '49', '1');
INSERT INTO `order_good` VALUES ('19', '6', '46', '1');
INSERT INTO `order_good` VALUES ('20', '7', '40', '2');
INSERT INTO `order_good` VALUES ('21', '7', '41', '1');
INSERT INTO `order_good` VALUES ('22', '8', '41', '1');
INSERT INTO `order_good` VALUES ('23', '8', '47', '1');
INSERT INTO `order_good` VALUES ('24', '8', '45', '1');
INSERT INTO `order_good` VALUES ('25', '9', '42', '1');
INSERT INTO `order_good` VALUES ('26', '9', '47', '1');
INSERT INTO `order_good` VALUES ('27', '9', '50', '1');
INSERT INTO `order_good` VALUES ('28', '10', '40', '1');
INSERT INTO `order_good` VALUES ('29', '10', '49', '1');
INSERT INTO `order_good` VALUES ('30', '10', '43', '1');
INSERT INTO `order_good` VALUES ('31', '10', '46', '1');
INSERT INTO `order_good` VALUES ('32', '11', '8', '1');
INSERT INTO `order_good` VALUES ('33', '11', '9', '1');
INSERT INTO `order_good` VALUES ('34', '11', '18', '1');
INSERT INTO `order_good` VALUES ('35', '11', '19', '1');
INSERT INTO `order_good` VALUES ('36', '12', '1', '1');
INSERT INTO `order_good` VALUES ('37', '12', '4', '1');
INSERT INTO `order_good` VALUES ('38', '12', '21', '1');
INSERT INTO `order_good` VALUES ('39', '13', '1', '1');
INSERT INTO `order_good` VALUES ('40', '13', '4', '1');
INSERT INTO `order_good` VALUES ('41', '13', '6', '1');
INSERT INTO `order_good` VALUES ('42', '14', '1', '1');
INSERT INTO `order_good` VALUES ('43', '14', '2', '1');
INSERT INTO `order_good` VALUES ('44', '14', '4', '1');
INSERT INTO `order_good` VALUES ('45', '14', '21', '1');
INSERT INTO `order_good` VALUES ('46', '15', '22', '1');
INSERT INTO `order_good` VALUES ('47', '15', '23', '5');
INSERT INTO `order_good` VALUES ('48', '16', '24', '1');
INSERT INTO `order_good` VALUES ('49', '16', '25', '1');
INSERT INTO `order_good` VALUES ('50', '16', '29', '1');
INSERT INTO `order_good` VALUES ('51', '17', '22', '1');
INSERT INTO `order_good` VALUES ('52', '17', '23', '1');
INSERT INTO `order_good` VALUES ('53', '17', '6', '1');
INSERT INTO `order_good` VALUES ('54', '18', '40', '1');
INSERT INTO `order_good` VALUES ('55', '18', '41', '1');
INSERT INTO `order_good` VALUES ('56', '18', '42', '1');
INSERT INTO `order_good` VALUES ('57', '18', '47', '1');
INSERT INTO `order_good` VALUES ('58', '19', '24', '1');
INSERT INTO `order_good` VALUES ('59', '19', '25', '1');
INSERT INTO `order_good` VALUES ('60', '19', '29', '1');
INSERT INTO `order_good` VALUES ('61', '20', '24', '1');
INSERT INTO `order_good` VALUES ('62', '20', '25', '1');
INSERT INTO `order_good` VALUES ('63', '20', '29', '1');
INSERT INTO `order_good` VALUES ('64', '20', '33', '1');
INSERT INTO `order_good` VALUES ('65', '21', '22', '3');
INSERT INTO `order_good` VALUES ('66', '22', '22', '2');
INSERT INTO `order_good` VALUES ('67', '23', '24', '1');
INSERT INTO `order_good` VALUES ('68', '23', '25', '1');
INSERT INTO `order_good` VALUES ('69', '24', '9', '1');
INSERT INTO `order_good` VALUES ('70', '25', '10', '1');

-- ----------------------------
-- Table structure for rider_order
-- ----------------------------
DROP TABLE IF EXISTS `rider_order`;
CREATE TABLE `rider_order` (
  `r_o_id` int(11) NOT NULL AUTO_INCREMENT,
  `u_id` int(11) NOT NULL,
  `o_id` int(11) NOT NULL,
  PRIMARY KEY (`r_o_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of rider_order
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `r_id` int(11) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(255) NOT NULL,
  `perms` varchar(255) NOT NULL,
  PRIMARY KEY (`r_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', 'user', 'user');
INSERT INTO `role` VALUES ('2', 'shop_owner', 'owner');
INSERT INTO `role` VALUES ('3', 'admin', 'admin');

-- ----------------------------
-- Table structure for shop
-- ----------------------------
DROP TABLE IF EXISTS `shop`;
CREATE TABLE `shop` (
  `s_id` int(11) NOT NULL AUTO_INCREMENT,
  `logo_src` varchar(255) NOT NULL,
  `shop_name` varchar(255) NOT NULL,
  `u_id` int(11) NOT NULL,
  `license` varchar(255) NOT NULL,
  `stat` int(11) NOT NULL DEFAULT '0',
  `delivery_cost` varchar(255) NOT NULL,
  `min_cost` varchar(255) NOT NULL,
  `total_sales` varchar(255) NOT NULL DEFAULT '0',
  `phone` varchar(255) NOT NULL,
  `address_detail` varchar(255) NOT NULL,
  `delivery_time` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  UNIQUE KEY `shopName` (`shop_name`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop
-- ----------------------------
INSERT INTO `shop` VALUES ('1', '/upload/悠悠果茶_20210818164655.png', '悠悠果茶', '2', '88688', '1', '4', '20', '4', '12312345612', '中关村大道123号', '40', '悠闲地喝果茶');
INSERT INTO `shop` VALUES ('2', '/upload/快乐糕点_20210901143053.jfif', '快乐糕点', '4', '88687', '1', '10', '10', '2', '12312345612', '龙冠置业店19694', '40', '好吃的糕点令人快乐');
INSERT INTO `shop` VALUES ('3', '/upload/益佳小厨店_20210812213306.jpg', '益佳小厨店', '3', '3652148754', '1', '5', '20', '0', '15423652145', '中关村大道666号', '45', '一家益于健康的厨房');
INSERT INTO `shop` VALUES ('4', '/upload/柠檬柚子茶_20210905175244.png', '柠檬柚子茶', '5', '88686', '1', '4.5', '15', '3', '15179854023', '北京市昌平区回龙观西大街35号院4号楼1层120', '40', '柠檬与茶');
INSERT INTO `shop` VALUES ('5', '/upload/HappyTime.jpg', 'Happy Time', '6', '226624', '1', '0', '20', '0', '15271482442', '湖北省宜昌市三峡大学', '50', '我们的宗旨是给顾客带来满');

-- ----------------------------
-- Table structure for shop_manager
-- ----------------------------
DROP TABLE IF EXISTS `shop_manager`;
CREATE TABLE `shop_manager` (
  `s_m_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `identity_number` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `stat` int(255) NOT NULL DEFAULT '1',
  `r_id` int(11) NOT NULL DEFAULT '2',
  PRIMARY KEY (`s_m_id`),
  UNIQUE KEY `username` (`user_name`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `identity_number` (`identity_number`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shop_manager
-- ----------------------------
INSERT INTO `shop_manager` VALUES ('1', 'boss', '123', '12312312313', '362202200002144052', 'lky', '1', '2');
INSERT INTO `shop_manager` VALUES ('2', 'boss1', '123', '15428754951', '362154215779845126', 'boss', '1', '2');
INSERT INTO `shop_manager` VALUES ('3', 'lky', '123', '12545632514', '362201254123652200', 'lky', '1', '2');
INSERT INTO `shop_manager` VALUES ('4', 'lky1', '123', '15421365213', '362154214779845126', 'lky1', '1', '2');
INSERT INTO `shop_manager` VALUES ('5', 'bob', '123', '15179548562', '362201254201254900', 'bob', '1', '2');
INSERT INTO `shop_manager` VALUES ('6', 'lyr', '226624lyr', '15271482442', '430422200103226600', '李咏然', '1', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `r_id` int(11) NOT NULL DEFAULT '1',
  `picSrc` varchar(255) DEFAULT NULL,
  `score` int(11) NOT NULL DEFAULT '0',
  `stat` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'lky', '15123456789', 'tqt', '156', '1', '/upload/小狐狸_20210905195612.png', '4', '1');
INSERT INTO `user` VALUES ('3', 'lyr', '13246960115', 'lyr', '226624', '3', '/upload/88.png', '1', '1');
INSERT INTO `user` VALUES ('5', 'lky1', '15179845215', 'lky1', '123', '1', '/upload/小狗_20210905195633.png', '0', '1');
INSERT INTO `user` VALUES ('6', 'xiaohuangya', '15176458295', '小黄鸭超爱吃', '123', '1', '/upload/小黄鸭_20210909221632.png', '4', '1');
