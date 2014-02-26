/*
Navicat MySQL Data Transfer

Source Server         : m127.0.0.1
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : spouse

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2014-02-22 22:59:51
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sm_account
-- ----------------------------
DROP TABLE IF EXISTS `sm_account`;
CREATE TABLE `sm_account` (
  `id` varchar(32) NOT NULL,
  `account` varchar(200) NOT NULL,
  `pass` varchar(200) DEFAULT NULL,
  `title` varchar(500) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `id_card` varchar(100) DEFAULT NULL,
  `menofirst` varchar(500) DEFAULT NULL,
  `menosecond` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sm_account
-- ----------------------------

-- ----------------------------
-- Table structure for sm_album
-- ----------------------------
DROP TABLE IF EXISTS `sm_album`;
CREATE TABLE `sm_album` (
  `seq` decimal(10,0) DEFAULT NULL COMMENT 'order',
  `main_id` varchar(32) DEFAULT NULL COMMENT '封面',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `author_id` varchar(32) DEFAULT NULL COMMENT 'author_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='album';

-- ----------------------------
-- Records of sm_album
-- ----------------------------

-- ----------------------------
-- Table structure for sm_diary
-- ----------------------------
DROP TABLE IF EXISTS `sm_diary`;
CREATE TABLE `sm_diary` (
  `time` datetime DEFAULT NULL COMMENT 'time',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `author_id` varchar(32) DEFAULT NULL COMMENT 'author_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='diary';

-- ----------------------------
-- Records of sm_diary
-- ----------------------------

-- ----------------------------
-- Table structure for sm_favorite
-- ----------------------------
DROP TABLE IF EXISTS `sm_favorite`;
CREATE TABLE `sm_favorite` (
  `url` varchar(300) DEFAULT NULL COMMENT 'url',
  `description` varchar(500) DEFAULT NULL COMMENT 'description',
  `pid` varchar(32) DEFAULT NULL COMMENT 'pid',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `seq` int(32) DEFAULT NULL COMMENT 'author_id',
  `creater` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='favorite';

-- ----------------------------
-- Records of sm_favorite
-- ----------------------------
INSERT INTO `sm_favorite` VALUES ('xxx', '我', 'cy', '23232', '2121', null, null, '2014-01-29 19:54:59', '0', 'cy');
INSERT INTO `sm_favorite` VALUES ('说好的', '你累了', '368a83858c4447bb37014447bb377e00', '364028e4bb444a624801444a62485f00', '错了', null, null, '2014-02-19 21:42:39', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('11', '11', '368a83858c4447bb37014447bb377e00', '364028e4bb444a624801444a63e39100', '11222', null, null, '2014-02-19 21:44:24', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('1111', '1111', '364028e4bb444a624801444a62485f00', '364028e4bb444a624801444a78804c00', '怎么', null, null, '2014-02-19 22:06:55', '11', 'cy');
INSERT INTO `sm_favorite` VALUES ('111', '111', '364028e4bb444a624801444a627b4700', '364028e4bb444a624801444a7cfcd400', 'test', null, null, '2014-02-19 22:11:49', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('fighting', '加油', '364028e4bb444a624801444a62485f00', '364028e4bb444f034801444f0348d900', '前四', null, null, '2014-02-20 19:16:59', '12', 'cy');
INSERT INTO `sm_favorite` VALUES ('哈哈哈', '不知道啊', '23232', '364028e4bb4459675f014459675fb400', '怎么了', null, null, '2014-02-22 19:42:31', '12', 'cy');
INSERT INTO `sm_favorite` VALUES ('1111', 'test', '368a83858c4447bb37014447bb377e00', '364028e4bb4459675f01445968f9a300', '不号', null, null, '2014-02-22 19:44:16', '11', 'cy');
INSERT INTO `sm_favorite` VALUES (null, null, 'cy', '364028e4bb4459cf02014459cf025f00', null, null, null, '2014-02-22 21:35:43', '3', null);
INSERT INTO `sm_favorite` VALUES ('www.xxx', 'git', '23232', '368a83858c4447bb37014447bb377e00', '你号码', null, null, '2014-02-19 09:20:56', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('我我', 'nonono', '23232', '368a83858c4447bb37014447bce12900', '什么11', null, null, '2014-02-19 09:22:45', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('我我我', '哈哈哈', 'cy', '368a83858c4447bb37014447bf3aaf00', 'win', null, null, '2014-02-19 09:25:19', '1', 'cy');
INSERT INTO `sm_favorite` VALUES ('333', '333', 'cy', '368a83858c4447bb37014447bf6e5600', '111', null, null, '2014-02-19 09:25:32', '2', 'cy');
INSERT INTO `sm_favorite` VALUES ('我', '222', '23232', '368a83858c4447bb37014447c0958d00', '我11', null, null, '2014-02-19 09:26:47', '11', 'cy');
INSERT INTO `sm_favorite` VALUES ('xfxmcy.com', '我们的官网', null, 'cy', 'xfxmcy', null, null, '2014-01-16 11:39:56', '0', 'cy');
INSERT INTO `sm_favorite` VALUES ('xfxmcy.com', '我们的官网', null, 'xx', 'xfxmcy', null, null, '2014-01-30 11:40:00', '0', 'xx');

-- ----------------------------
-- Table structure for sm_material
-- ----------------------------
DROP TABLE IF EXISTS `sm_material`;
CREATE TABLE `sm_material` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `author_id` varchar(32) DEFAULT NULL COMMENT 'author_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='basic material';

-- ----------------------------
-- Records of sm_material
-- ----------------------------

-- ----------------------------
-- Table structure for sm_memo
-- ----------------------------
DROP TABLE IF EXISTS `sm_memo`;
CREATE TABLE `sm_memo` (
  `time` datetime DEFAULT NULL COMMENT 'time',
  `description` text COMMENT 'description',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `author_id` varchar(32) DEFAULT NULL COMMENT 'author_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='memo';

-- ----------------------------
-- Records of sm_memo
-- ----------------------------

-- ----------------------------
-- Table structure for sm_note
-- ----------------------------
DROP TABLE IF EXISTS `sm_note`;
CREATE TABLE `sm_note` (
  `content` text COMMENT 'content',
  `book_id` varchar(32) DEFAULT NULL COMMENT 'book_id',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `author_id` varchar(32) DEFAULT NULL COMMENT 'author_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='note';

-- ----------------------------
-- Records of sm_note
-- ----------------------------

-- ----------------------------
-- Table structure for sm_notebook
-- ----------------------------
DROP TABLE IF EXISTS `sm_notebook`;
CREATE TABLE `sm_notebook` (
  `seq` decimal(10,0) DEFAULT NULL COMMENT 'order',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `author_id` varchar(32) DEFAULT NULL COMMENT 'author_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='noteBook';

-- ----------------------------
-- Records of sm_notebook
-- ----------------------------

-- ----------------------------
-- Table structure for sm_photo
-- ----------------------------
DROP TABLE IF EXISTS `sm_photo`;
CREATE TABLE `sm_photo` (
  `url` varchar(300) DEFAULT NULL COMMENT 'url',
  `album_id` varchar(32) DEFAULT NULL COMMENT 'album_id',
  `id` varchar(32) NOT NULL COMMENT 'id',
  `title` varchar(300) DEFAULT NULL COMMENT 'title',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memoFirst',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `author_id` varchar(32) DEFAULT NULL COMMENT 'author_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='photo';

-- ----------------------------
-- Records of sm_photo
-- ----------------------------

-- ----------------------------
-- Table structure for sp_employer
-- ----------------------------
DROP TABLE IF EXISTS `sp_employer`;
CREATE TABLE `sp_employer` (
  `id` varchar(32) NOT NULL,
  `s_account` varchar(50) DEFAULT NULL,
  `s_password` varchar(50) DEFAULT NULL,
  `role` char(1) DEFAULT NULL COMMENT '0 gril 1 boy',
  `image` varchar(200) DEFAULT NULL COMMENT '首页显示',
  `path` varchar(400) DEFAULT NULL,
  `memoFirst` varchar(300) DEFAULT NULL,
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memoSecond',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='人员表';

-- ----------------------------
-- Records of sp_employer
-- ----------------------------
INSERT INTO `sp_employer` VALUES ('cy', 'cy', 'd447f46e940ecd45d75ee51ee1d0cf8a', '1', '', '', null, null);
INSERT INTO `sp_employer` VALUES ('xx', 'xx', 'd447f46e940ecd45d75ee51ee1d0cf8a', '0', '', '', null, null);

-- ----------------------------
-- Table structure for sy_menu
-- ----------------------------
DROP TABLE IF EXISTS `sy_menu`;
CREATE TABLE `sy_menu` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `iconCls` varchar(100) DEFAULT NULL COMMENT 'style',
  `seq` int(11) DEFAULT NULL COMMENT 'order',
  `text` varchar(300) DEFAULT NULL COMMENT 'text',
  `url` varchar(300) DEFAULT NULL COMMENT 'url',
  `pid` varchar(32) DEFAULT NULL COMMENT 'pid',
  `memoFirst` varchar(300) DEFAULT NULL COMMENT 'memo',
  `memoSecond` varchar(300) DEFAULT NULL COMMENT 'memo',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

-- ----------------------------
-- Records of sy_menu
-- ----------------------------
INSERT INTO `sy_menu` VALUES ('0', 'icon-child', '0', 'me', '', null, null, null);
INSERT INTO `sy_menu` VALUES ('1', 'icon-child', '0', 'main', '', null, null, null);
INSERT INTO `sy_menu` VALUES ('10', 'icon-child', '1', 'video', '', '9', null, null);
INSERT INTO `sy_menu` VALUES ('11', 'icon-child', '0', 'user', '', '9', null, null);
INSERT INTO `sy_menu` VALUES ('12', 'icon-child', '2', 'notice', '', '9', null, null);
INSERT INTO `sy_menu` VALUES ('13', 'icon-child', '0', 'guest', '', null, null, null);
INSERT INTO `sy_menu` VALUES ('14', 'icon-child', '3', 'account', null, '2', null, null);
INSERT INTO `sy_menu` VALUES ('2', 'icon-connector', '0', 'my', '', null, null, null);
INSERT INTO `sy_menu` VALUES ('3', 'icon-child', '0', 'notebook', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('4', 'icon-save', '1', 'memo', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('5', 'icon-child', '2', 'favorite', '/favorite/manage/main.do', '2', null, null);
INSERT INTO `sy_menu` VALUES ('6', 'icon-child', '4', 'dairy', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('7', 'icon-child', '5', 'my photo', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('8', 'icon-child', '6', 'its photo', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('9', 'icon-connector', '0', 'family', '', null, null, null);
