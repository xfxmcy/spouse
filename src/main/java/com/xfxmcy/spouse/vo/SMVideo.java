package com.xfxmcy.spouse.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SMVideo {
	private String id;
	private String name;
	private String url;
	private String description;
	private String flag;
	private Date createTime;
	private String type;
	private String artist;
	private String album;

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	private String formattedCreateTime;

	public void setFormattedCreateTime(String formattedCreateTime) {
		this.formattedCreateTime = formattedCreateTime;
	}

	public String getFormattedCreateTime() {
		if (null != getCreateTime()) {
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			return df.format(getCreateTime());
		}
		if (null != formattedCreateTime) {
			return formattedCreateTime;
		}
		return "";
	}

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
