package com.xfxmcy.spouse.vo;

import java.util.Date;

public class SMVideo {
	private String id ;
	private String name ;
	private String url ;
	private String description ;
	private String flag ;
	private Date createTime;
	private String type ;
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public SMVideo() {
		// TODO Auto-generated constructor stub
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	public String getFlag() {
		return flag;
	}
	public void setFlag(String flag) {
		this.flag = flag;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	
}	
