/**
 * SMPreface.java
 * com.xfxmcy.spouse.vo
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月10日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.vo;


/**
 * ClassName:SMPreface
 * Function: sm_preface
 * Reason:	 sm_preface		前言 右下侧
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月10日		下午3:20:51
 *
 * @see
 * 
 *   `id` varchar(32) NOT NULL COMMENT 'id',
	 `title` varchar(100) DEFAULT NULL COMMENT 'title',
	 `image` varchar(500) DEFAULT NULL COMMENT 'image',
	 `content` text DEFAULT NULL COMMENT 'description',
	 `flag` varchar(1) DEFAULT NULL COMMENT '启用标识,每个model只能启用一个',
	 `model` varchar(1) DEFAULT NULL COMMENT 'model,ours,her,him,schedule',
	 `userId` varchar(32) DEFAULT NULL COMMENT '添加人'	 
 */
public class SMPreface {
	private String id;
	private String title;
	private String image;
	private String content;
	private String flag;
	private String model;
	private String userId;
	public SMPreface() {

		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
}

