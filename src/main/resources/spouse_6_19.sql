/*
Navicat MySQL Data Transfer

Source Server         : m(5.6)127.0.0.1
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : spouse

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2014-06-19 14:23:04
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for b_tasks
-- ----------------------------
DROP TABLE IF EXISTS `b_tasks`;
CREATE TABLE `b_tasks` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '任务标题',
  `allDay` char(2) DEFAULT NULL COMMENT '是否全天',
  `tstart` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '任务开始时间',
  `tend` timestamp NULL DEFAULT NULL COMMENT '任务结束时间',
  `url` varchar(100) DEFAULT NULL COMMENT '任务跳转地址',
  `userid` varchar(32) DEFAULT NULL COMMENT '所属用户id',
  `business_id` varchar(32) DEFAULT NULL COMMENT '业务id',
  `task_from` varchar(100) DEFAULT NULL COMMENT '任务来源',
  `task_status` char(2) DEFAULT NULL COMMENT '任务状态:0未开始、1已开始未完成、2已完成、3延期完成、4已关闭',
  `flag` char(2) DEFAULT NULL COMMENT '启用标识',
  `status` char(2) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of b_tasks
-- ----------------------------
INSERT INTO `b_tasks` VALUES ('1', 'hava a date', '1', '2014-06-03 09:05:40', '2014-06-03 23:06:38', '31', 'cy', '123', '1', '1', '1', '1');

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
INSERT INTO `sm_favorite` VALUES (null, null, 'cy', '364028095a4492b22e014492b22e7d00', null, null, null, '2014-03-05 22:42:35', '5', null);
INSERT INTO `sm_favorite` VALUES ('说好的', '你累了', '368a83858c4447bb37014447bb377e00', '364028e4bb444a624801444a62485f00', '错了', null, null, '2014-02-19 21:42:39', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('11', '11', '368a83858c4447bb37014447bb377e00', '364028e4bb444a624801444a63e39100', '11222', null, null, '2014-02-19 21:44:24', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('1111', '1111', '364028e4bb444a624801444a62485f00', '364028e4bb444a624801444a78804c00', '怎么', null, null, '2014-02-19 22:06:55', '11', 'cy');
INSERT INTO `sm_favorite` VALUES ('111', '111', '364028e4bb444a624801444a627b4700', '364028e4bb444a624801444a7cfcd400', 'test', null, null, '2014-02-19 22:11:49', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('fighting', '加油', '364028e4bb444a624801444a62485f00', '364028e4bb444f034801444f0348d900', '前四', null, null, '2014-02-20 19:16:59', '12', 'cy');
INSERT INTO `sm_favorite` VALUES ('哈哈哈', '不知道啊', '23232', '364028e4bb4459675f014459675fb400', '怎么了', null, null, '2014-02-22 19:42:31', '12', 'cy');
INSERT INTO `sm_favorite` VALUES ('1111', 'test', '368a83858c4447bb37014447bb377e00', '364028e4bb4459675f01445968f9a300', '不号', null, null, '2014-02-22 19:44:16', '11', 'cy');
INSERT INTO `sm_favorite` VALUES (null, null, 'cy', '364028e4bb4459cf02014459cf025f00', null, null, null, '2014-02-22 21:35:43', '3', null);
INSERT INTO `sm_favorite` VALUES (null, null, 'cy', '364028e4bb45bb723a0145bb723ad300', null, null, null, '2014-05-02 13:39:57', '6', null);
INSERT INTO `sm_favorite` VALUES (null, null, 'cy', '368a818595446c2f1501446c2f151900', null, null, null, '2014-02-26 11:13:49', '4', null);
INSERT INTO `sm_favorite` VALUES ('我', '额', '368a83858c4447bb37014447bb377e00', '368a81859a45b1ec060145b1ec06ec00', '我', null, null, '2014-04-30 17:16:47', '12', 'cy');
INSERT INTO `sm_favorite` VALUES ('我我', '对象', '364028e4bb444f034801444f0348d900', '368a81859a469e484d01469e484d8300', '提莫', null, null, '2014-06-15 14:47:57', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('http://www.baidu.com', '大招', '364028e4bb444f034801444f0348d900', '368a81859a469e4ecc01469e4ecc1a00', '百度', '1', null, '2014-06-15 14:55:03', '10', 'cy');
INSERT INTO `sm_favorite` VALUES ('www.baidu.com', 'git', '23232', '368a83858c4447bb37014447bb377e00', '百度', '1', null, '2014-02-19 09:20:56', '10', 'cy');
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
-- Table structure for sr_romantic
-- ----------------------------
DROP TABLE IF EXISTS `sr_romantic`;
CREATE TABLE `sr_romantic` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `date` datetime DEFAULT NULL COMMENT 'varchar类型的时间',
  `dateClass` varchar(50) DEFAULT NULL COMMENT '时间的class',
  `title` text COMMENT 'title',
  `imageFirst` varchar(300) DEFAULT NULL COMMENT '照片first',
  `imageSecond` varchar(300) DEFAULT NULL COMMENT '照片second',
  `contentFirst` text COMMENT '内容first',
  `contentSecond` text COMMENT '内容second',
  `isYear` varchar(10) DEFAULT NULL COMMENT '是否是年',
  `contentClass` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sr_romantic
-- ----------------------------
INSERT INTO `sr_romantic` VALUES ('1', '2014-02-06 12:55:50', '232', '2014，开源中国快速发展的一年', '/romantic/images/event5.png', '/romantic/images/event3.png', '232', '232', '1', 'list_show');
INSERT INTO `sr_romantic` VALUES ('10', '2014-06-05 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('11', '2014-06-06 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('12', '2014-06-07 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('13', '2014-06-08 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('14', '2014-06-09 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('15', '2015-01-01 20:06:20', '3232', '2015,soga', '/romantic/images/event5.png', '/romantic/images/event3.png', '323', '3232', '1', 'list_show');
INSERT INTO `sr_romantic` VALUES ('16', '2015-01-02 20:15:56', '2232', '付清', '/romantic/images/event5.png', '/romantic/images/event3.png', '3232', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('364028e4bb45bb82fa0145bb82fae600', '2014-05-08 00:00:00', '323', '静静', '/romantic/db35ce84-16d7-4239-bf63-30c86f9bbf4b.jpg', '', '嘿嘿', '你懂的', '0', 'list_show');
INSERT INTO `sr_romantic` VALUES ('4', '2014-05-29 12:55:54', '232', '全面启用HTTPS登陆', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '彻底保护你的密码不被嗅探和盗用<br/>\r\n彻底保护你的密码不被嗅探和盗用<br/>\r\n            OSCHINA采用商业证书，值得信赖', '0', 'list_show show3');
INSERT INTO `sr_romantic` VALUES ('5', '2014-05-30 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('6', '2014-06-01 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('7', '2014-06-02 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('8', '2014-06-03 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('9', '2014-06-04 19:51:14', '23', '付清', '/romantic/images/event4.jpg', '/romantic/images/chengdu.jpg', '<a href=\"#\">全面启用HTTPS登陆</a>', '            OSCHINA采用商业证书，值得信赖', '0', 'list_show show4');

-- ----------------------------
-- Table structure for sy_home
-- ----------------------------
DROP TABLE IF EXISTS `sy_home`;
CREATE TABLE `sy_home` (
  `id` varchar(32) DEFAULT NULL COMMENT 'id',
  `name` varchar(200) DEFAULT NULL,
  `path` varchar(500) DEFAULT NULL,
  `type` varchar(10) DEFAULT NULL COMMENT '1.大图滚动2.小图',
  `pre_count` int(11) DEFAULT NULL,
  `is_big` char(1) DEFAULT NULL,
  `ph_order` int(11) DEFAULT NULL COMMENT '大图的顺序 0 不展示',
  `descri` varchar(300) DEFAULT NULL,
  `is_small` char(1) DEFAULT NULL,
  `show_location` char(1) DEFAULT NULL COMMENT '小图:0左1中2右'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='前台展示的3个图像和1个集合，统计赞的数量';

-- ----------------------------
-- Records of sy_home
-- ----------------------------
INSERT INTO `sy_home` VALUES ('111', 'LILi', '/images/xiao.png', '1', '1', '1', '2', '212121 from front to behind 迪达拉,带土,角都,飞段,小南,佩恩,大蛇丸o', '', null);
INSERT INTO `sy_home` VALUES ('312112', '3232', '/images/zhangmen.jpg', '1', '1', '1', '2', ' 弥彦 , 长门', '', null);
INSERT INTO `sy_home` VALUES ('2323', '3232', '/images/you.png', '1', '1', '1', '2', '鼬,作者', '', null);

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
INSERT INTO `sy_menu` VALUES ('0', 'icon-child', '0', 'me', '/spouse/managerment/me.do', null, null, null);
INSERT INTO `sy_menu` VALUES ('1', 'icon-child', '1', 'main', '/spouse/managerment/main.do', null, null, null);
INSERT INTO `sy_menu` VALUES ('10', 'icon-child', '1', 'video', '', '9', null, null);
INSERT INTO `sy_menu` VALUES ('11', 'icon-child', '0', 'user', '', '9', null, null);
INSERT INTO `sy_menu` VALUES ('12', 'icon-child', '2', 'notice', '', '9', null, null);
INSERT INTO `sy_menu` VALUES ('13', 'icon-child', '5', 'guest', '', null, null, null);
INSERT INTO `sy_menu` VALUES ('14', 'icon-child', '4', 'account', null, '2', null, null);
INSERT INTO `sy_menu` VALUES ('15', 'icon-child', '2', 'romantic', '/spouse/managerment/romantic.do', null, null, null);
INSERT INTO `sy_menu` VALUES ('16', 'icon-child', '0', 'schedule', '/spouse/managerment/mySchedule.do', '2', null, null);
INSERT INTO `sy_menu` VALUES ('17', 'icon-connector', '3', 'meeting', '/spouse/managerment/meeting.do', '9', null, null);
INSERT INTO `sy_menu` VALUES ('2', 'icon-connector', '3', 'my', '', null, null, null);
INSERT INTO `sy_menu` VALUES ('3', 'icon-child', '1', 'notebook', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('4', 'icon-save', '2', 'memo', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('5', 'icon-child', '3', 'favorite', '/spouse/managerment/favorite.do', '2', null, null);
INSERT INTO `sy_menu` VALUES ('6', 'icon-child', '5', 'dairy', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('7', 'icon-child', '6', 'my photo', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('8', 'icon-child', '7', 'its photo', '', '2', null, null);
INSERT INTO `sy_menu` VALUES ('9', 'icon-connector', '4', 'family', '', null, null, null);
