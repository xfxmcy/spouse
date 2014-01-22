/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2014/1/7 15:47:57                            */
/*==============================================================*/


drop table if exists SP_Employer;

drop table if exists SY_menu;

/*==============================================================*/
/* Table: SP_Employer                                           */
/*==============================================================*/
create table SP_Employer
(
   id                   varchar(32) not null,
   s_account            varchar(50),
   s_password           varchar(50),
   role                 char(1) comment '0 gril 1 boy',
   image                varchar(200) comment '首页显示',
   path                 varchar(400),
   memoFirst            varchar(300),
   memoSecond           varchar(300) comment 'memoSecond',
   primary key (id)
);

alter table SP_Employer comment '人员表';

/*==============================================================*/
/* Table: SY_menu                                               */
/*==============================================================*/
create table SY_menu
(
   id                   varchar(32) comment 'id',
   circoncls            varchar(100) comment 'style',
   seq                  int comment 'order',
   text                 varchar(300) comment 'text',
   url                  varchar(300) comment 'url',
   pid                  varchar(32) comment 'pid',
   memoFirst            varchar(300) comment 'memo',
   memoSecond           varchar(300) comment 'memo'
);

alter table SY_menu comment '后台菜单表';

/*
Navicat MySQL Data Transfer

Source Server         : m127.0.0.1
Source Server Version : 50615
Source Host           : localhost:3306
Source Database       : spouse

Target Server Type    : MYSQL
Target Server Version : 50615
File Encoding         : 65001

Date: 2014-01-11 11:31:43
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `seq` int DEFAULT NULL COMMENT 'seq',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='favorite';
