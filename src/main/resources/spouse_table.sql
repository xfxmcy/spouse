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
  `creater` varchar(300) DEFAULT NULL COMMENT 'creater',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='favorite';

create table sy_home
(
   id                   varchar(32) comment 'id',
   name                 varchar(200),
   path                 varchar(500),
   type                 varchar(10) comment '1.大图滚动2.小图',
   pre_count            integer,
   is_big               char(1),
   ph_order             int comment '大图的顺序 0 不展示',
   descri               varchar(300),
   is_small             char(1),
   show_location        char(1) comment '小图:0左1中2右'
);

alter table sy_home comment '前台展示的3个图像和1个集合，统计赞的数量';



drop table if exists sr_romantic;

/*==============================================================*/
/* Table: sr_romantic                                           */
/*==============================================================*/
create table sr_romantic
(
   id                   varchar(32) not null comment 'id',
   date                 varchar(50) comment 'varchar类型的时间',
   dateClass            varchar(50) comment '时间的class',
   title                text comment 'title',
   imageFirst           varchar(300) comment '照片first',
   imageSecond          varchar(300) comment '照片second',
   contentFirst         text comment '内容first',
   contentSecond        text comment '内容second',
   isYear               char(1) comment '是否是年',
   primary key (id)
);
/*tasks*/
DROP TABLE IF EXISTS `b_tasks`;
CREATE TABLE `b_tasks` (
  `id` varchar(32) NOT NULL COMMENT '主键',
  `title` varchar(100) NOT NULL COMMENT '任务标题',
  `allDay` char(2) DEFAULT NULL COMMENT '是否全天',
  `start` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '任务开始时间',
  `end` timestamp NULL DEFAULT NULL COMMENT '任务结束时间',
  `url` varchar(100) DEFAULT NULL COMMENT '任务跳转地址',
  `userid` varchar(32) DEFAULT NULL COMMENT '所属用户id',
  `business_id` varchar(32) DEFAULT NULL COMMENT '业务id',
  `task_from` varchar(100) DEFAULT NULL COMMENT '任务来源',
  `task_status` char(2) DEFAULT NULL COMMENT '任务状态:0未开始、1已开始未完成、2已完成、3延期完成、4已关闭',
  `flag` char(2) DEFAULT NULL COMMENT '启用标识',
  `status` char(2) DEFAULT NULL COMMENT '删除标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `sm_video`;
CREATE TABLE `sm_video` (
  `id` varchar(32) NOT NULL COMMENT 'id',
  `url` varchar(300) DEFAULT NULL COMMENT 'url',
  `name` varchar(50) DEFAULT NULL COMMENT 'name',
  `type` varchar(2) DEFAULT NULL COMMENT 'type',
  `description` varchar(500) DEFAULT NULL COMMENT 'description',
  `createTime` datetime DEFAULT NULL COMMENT 'createTime',
  `artist` varchar(100) DEFAULT NULL COMMENT 'artist',
  `album` varchar(100) DEFAULT NULL COMMENT 'album',
  `flag` varchar(1) DEFAULT NULL COMMENT '启用标识',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='video';


CREATE TABLE  `sm_memory`(
 `id` varchar(32) NOT NULL COMMENT 'id',
 `title` varchar(100) DEFAULT NULL COMMENT 'title',
 `description` text DEFAULT NULL COMMENT 'description',
 `currentTime` datetime DEFAULT NULL COMMENT '发生时间',
 `flag` varchar(1) DEFAULT NULL COMMENT '启用标识',
 `model` varchar(1) DEFAULT NULL COMMENT 'model,ours,her,him,schedule',
 `userId` varchar(32) DEFAULT NULL COMMENT '添加人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='memory';
alter table sm_memory comment '左侧提示表';

CREATE TABLE  `sm_preface`(
 `id` varchar(32) NOT NULL COMMENT 'id',
 `title` varchar(100) DEFAULT NULL COMMENT 'title',
 `image` varchar(500) DEFAULT NULL COMMENT 'image',
 `content` text DEFAULT NULL COMMENT 'description',
 `flag` varchar(1) DEFAULT NULL COMMENT '启用标识,每个model只能启用一个',
 `model` varchar(1) DEFAULT NULL COMMENT 'model,ours,her,him,schedule',
 `userId` varchar(32) DEFAULT NULL COMMENT '添加人'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='preface';
alter table sm_preface comment '下侧提示表';