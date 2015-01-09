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
INSERT INTO `sr_romantic` VALUES ('1', '1994-06-14 00:00:00', '232', '幼儿园', '/romantic/827d026e-9621-4847-8e94-895951af62f0.jpg', '/romantic/91078425-e9b7-49f7-8fa0-8cf847f8d774.png', '最可爱的', '嘿嘿', '0', 'list_show');
INSERT INTO `sr_romantic` VALUES ('10', '2011-06-06 00:00:00', '23', '帅', '/romantic/1a765676-08e3-491f-9a92-b0ea91da54e9.jpg', '/romantic/16994147-1988-4c60-9b8e-4b57b5e03dba.jpg', '哪有不服的', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('11', '2011-10-03 00:00:00', '23', 'wedding', '/romantic/1dcce637-b397-442f-906a-7b262edbad87.jpg', '/romantic/55a54335-0be9-45f2-beb9-b6bcd5c73f4f.jpg', '祝幸福', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('12', '2011-10-03 00:00:00', '23', '主角', '/romantic/473120d2-c287-4857-857c-13c7fc9ec7b4.jpg', '/romantic/52bacd85-7366-4659-82d5-749f1b909c45.jpg', '我不是主角', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('13', '2013-06-07 00:00:00', '23', '闺蜜', '/romantic/3a296cca-4e6f-4da1-ac24-973336bbb065.jpg', '/romantic/images/chengdu.jpg', '我的闺蜜', '', '1', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('14', '2013-07-01 00:00:00', '23', '友情', '/romantic/6708c467-ec66-4477-81eb-18f5ca92fabd.jpg', '/romantic/1a31d1ac-635b-4ac8-8a7d-324293fab361.jpg', '让时间证明', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('15', '2013-07-18 00:00:00', '3232', '闺蜜', '/romantic/570b2f81-2270-4bd5-b9df-3b1406079684.jpg', '/romantic/c697f299-a446-4521-8b99-99af3d734dba.jpg', '我的闺蜜们', '3232', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('16', '2013-07-18 00:00:00', '2232', '闺蜜', '/romantic/b2426d9c-b9c9-4e02-927c-fcb88f260c88.jpg', '/romantic/2c107e0b-716c-4175-ae6c-dde35ea40c57.jpg', '我的闺蜜们', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('364028e4bb45bb82fa0145bb82fae600', '2010-09-10 00:00:00', '323', '人生的下个阶段', '/romantic/81d4f438-1afb-4308-800c-a99a02fa9437.jpg', '/romantic/0e5d4b40-ecee-40bd-be1a-718dc81c7495.jpg', '', '洗洗', '1', 'list_show');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1345bd31f60145c1b2a95000', '1992-01-01 00:00:00', '', '垚', '/romantic/c94d32ec-b601-4564-81a5-fa5169e872cb.jpg', '', '垚', '', '1', 'list_show');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1345bd31f60145c1ba4b1c00', '1992-04-02 00:00:00', '', '农历二月三十', '/romantic/53f15317-b4ec-473c-a936-722ce312be98.jpg', '', '有个小可爱出生了', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff68869f00', '2011-04-27 00:00:00', '', '裘英俊 & 穆岩', '/romantic/a278c482-918b-40f3-811d-f2f912ec33a1.jpg', '/romantic/d816c6f3-772a-46e1-9a7f-020b25fde9af.jpg', '台下变了个人', '', '0', 'list_show');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff7c2cc500', '2013-07-19 00:00:00', '', '写作业', '/romantic/df7e01da-a3d8-4336-aa4b-bcd930d71c19.jpg', '/romantic/d82d551e-3c84-4f0a-92e3-205394774bbc.jpg', '认真不', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff7d226000', '2013-07-19 00:00:00', '', '认真偶', '/romantic/36e9cbc0-9975-4216-8ee4-c2da8c91b6fb.jpg', '/romantic/20545c70-54a7-4f5c-b211-a1f51ad48c89.jpg', '不会写啊', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff8c24e800', '2014-06-05 00:00:00', '', '跆拳道社团', '/romantic/c4ff9767-b3e8-4c6d-8322-b8163d8f3d06.jpg', '/romantic/9e47b3db-3be4-47db-9a86-318999d0f825.jpg', '看我的厉害', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff8d1fe200', '2014-06-05 00:00:00', '', '湖面', '/romantic/cba2daa2-cdce-4819-8b94-00c2c46a1072.jpg', '/romantic/c1163ca3-8ff5-4567-a434-25d4f0c1544f.jpg', '小鸭子的故事', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff92611900', '2014-06-08 00:00:00', '', '大家庭', '/romantic/ddc2609d-1145-4716-8d24-00965d202edd.jpg', '/romantic/83320759-7a76-4faf-ae20-12cc6f7319f1.jpg', '大家庭', '开心', '0', 'list_show show5');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff9ac68300', '2014-06-09 00:00:00', '', '成果', '/romantic/b964e1ca-4425-4f19-a062-1c396c25e6cd.jpg', '/romantic/9d2512e4-69e0-4646-a552-29168dae6fc3.jpg', '练出来了', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ff9c998d00', '2014-06-10 00:00:00', '', '控腿', '/romantic/f7489b9f-08d4-4dae-972b-110bd69820f7.jpg', '/romantic/6729d8dd-e0dc-4886-a6bc-e3b2f4b6495b.jpg', '美好的时光', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffa3db7600', '2014-02-04 00:00:00', '', '大四了', '/romantic/2b8a5012-a1d3-4f29-818c-f2d84e3792b3.jpg', '/romantic/b32fba1e-8a25-47c2-aef6-7af98fb10a52.jpg', '最后一年', '', '1', 'list_show show3');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffa6135500', '2014-06-20 00:00:00', '', '毕业了', '/romantic/3c62753b-d430-40a4-8489-600f08de3144.jpg', '/romantic/3a21ecb3-2dfc-4764-92ee-c34d51cf6ea1.jpg', '证书到手', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffb258a100', '2014-06-21 00:00:00', '', '宿舍', '/romantic/08d88945-b1f7-4092-b4aa-102aaee4b8b8.jpg', '/romantic/5637e881-e8dd-4185-8129-0ab157360b62.jpg', '美好的404', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffb2db8d00', '2014-06-22 00:00:00', '', '404记忆', '/romantic/fff04fd9-e582-4d39-b1ab-70564971c24d.jpg', '/romantic/2dceaa98-a62c-4d6d-a805-79433dcb0b39.jpg', '404记忆', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffb3976b00', '2014-06-22 00:00:00', '', '404记忆', '/romantic/098f83ca-652c-47b8-917a-41c2f8994a8a.jpg', '/romantic/8c253a21-3a10-4c07-95ce-e5d6278f6b69.jpg', '404记忆', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffb505df00', '2014-06-22 00:00:00', '', '毕业典礼', '/romantic/10fdfeb0-9d4a-4b7c-aa38-b205599d007b.jpg', '/romantic/e07ad818-4290-459c-a01a-06ad2cd1e876.jpg', '毕业典礼', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffb6bb5f00', '2014-06-23 00:00:00', '', 'certificate', '/romantic/252187b9-21d8-4526-900b-67d1a44edd2c.jpg', '/romantic/70d2fe2e-94e9-4be3-9a44-267634a66b6e.jpg', 'certificate', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffb8a1a300', '2014-06-24 00:00:00', '', '我们毕业了', '/romantic/420a95b8-481c-49a2-8d71-d77b017d8e0a.jpg', '/romantic/535f2558-8a7e-48ee-8895-7fe7168dd19b.jpg', '我们毕业了', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffbb611200', '2014-06-25 00:00:00', '', '再见了', '/romantic/5e497f90-edc4-46b6-b56c-c7327650b423.jpg', '/romantic/6a154fc2-9817-412f-bba1-52fe1a40256c.jpg', '有缘再见', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffbc212500', '2014-06-26 00:00:00', '', '誓词', '/romantic/6c0f2cf7-db58-46a7-bc5a-30b52a85707a.jpg', '/romantic/75b5b520-04df-43b0-8ced-d3d58500cbfe.jpg', '誓词', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffbe9dfd00', '2014-06-27 00:00:00', '', '师范', '/romantic/cba1e3bd-7d4a-494c-a88e-a8f90346d4ff.jpg', '/romantic/2eeb17fa-7ca5-4de3-9c5c-3c101f778400.jpg', '再见', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffd48d3900', '2011-07-15 00:00:00', '', 'MQY', '/romantic/5655c25c-8c86-401d-9660-163ef1750b72.jpg', '/romantic/9c188686-fc76-4202-ab3a-9de304016a36.jpg', 'MQY', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('3652b8bb1548ff68860148ffd5361b00', '2011-07-14 00:00:00', '', '所谓佳人', '/romantic/a2dc9e33-218e-4b8c-84b7-9703a9fd498d.jpg', '/romantic/c88a159f-e75a-4c99-bf4d-6287abc9ebca.jpg', '在水一方', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('4', '2010-10-01 00:00:00', '232', '我的大学', '/romantic/36ff57aa-428b-4b8d-b053-723974dde900.jpg', '/romantic/76f8e1d8-64a1-43a2-a2e4-f830f47d1c34.jpg', '勤奋严谨', '', '0', 'list_show show3');
INSERT INTO `sr_romantic` VALUES ('5', '2010-10-02 00:00:00', '23', '校车', '/romantic/e390beca-4df2-4593-8feb-5c73a361ad1a.jpg', '/romantic/534b63e9-565b-471b-acb9-a7883b8d7c5b.jpg', '不给行吗...呜呜', '师傅说 不行...', '0', 'list_show show3');
INSERT INTO `sr_romantic` VALUES ('6', '2010-10-03 00:00:00', '23', '小逛一下', '/romantic/2ef3df83-ce86-48a2-b51c-838deb58105a.jpg', '/romantic/f19a8e66-2c0d-4f24-963b-4999c75c67ba.jpg', '自树树人', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('7', '2011-06-01 00:00:00', '23', '塘沽行', '/romantic/a93daeb2-0418-4af7-a090-1c2e461e50f4.jpg', '/romantic/images/chengdu.jpg', '塘沽 我来了', '', '1', 'list_show');
INSERT INTO `sr_romantic` VALUES ('8', '2011-06-05 00:00:00', '23', '幸福就是这样', '/romantic/1a65f5ef-0e0c-44f5-9318-19bbd2019bd1.jpg', '/romantic/1d045e99-3b0e-4cac-97b0-c7469ab73c38.jpg', 'happiness', '', '0', 'list_show show4');
INSERT INTO `sr_romantic` VALUES ('9', '2011-06-06 00:00:00', '23', '潇洒不', '/romantic/059aba32-9513-414e-8e26-440865b1ed5d.jpg', '/romantic/7e8cb507-0c4f-4247-a25c-b06de8040de0.jpg', '后面的小孩别抢镜', '', '0', 'list_show show4');

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
