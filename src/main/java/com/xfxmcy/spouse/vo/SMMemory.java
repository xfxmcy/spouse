/**
 * SMMemory.java
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

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * ClassName:SMMemory
 * Function: sm_memory
 * Reason:	 sm_memory   记忆 左侧
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月10日		下午3:20:12
 *	
 * @see
 * 	 `id` varchar(32) NOT NULL COMMENT 'id',
	 `title` varchar(100) DEFAULT NULL COMMENT 'title',
	 `description` text DEFAULT NULL COMMENT 'description',
	 `currentTime` datetime DEFAULT NULL COMMENT '发生时间',
	 `flag` varchar(1) DEFAULT NULL COMMENT '启用标识',
	 `model` varchar(1) DEFAULT NULL COMMENT 'model,ours,her,him,schedule',
	 `userId` varchar(32) DEFAULT NULL COMMENT '添加人' 	 
 */
public class SMMemory {
	
	private String id;
	private String title;
	private String description;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date currentTime;
	private String flag;
	private String model;
	private String userId;
	private String href ;
	public String getHref() {
		return href;
	}
	public void setHref(String href) {
		this.href = href;
	}
	public SMMemory() {

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
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getCurrentTime() {
		return currentTime;
	}
	public void setCurrentTime(Date currentTime) {
		this.currentTime = currentTime;
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
	public String getFormattedDate(){
		if(null != getCurrentTime())
    	{
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    		return df.format(getCurrentTime());
    	}
    	return "";
	}
	String queryType;
	
	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
	public String getQueryType() {
		
		// TODO Auto-generated method stub
		return queryType;
		
	} 
}

