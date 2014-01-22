/**
 * Menu.java
 * com.xfxmcy.spouse.model
 *
 * Function： a model served menu
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月5日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.model;

import java.util.HashMap;
import java.util.Map;

/**
 * ClassName:Menu
 * Function: a model served menu
 * Reason:	 a model served menu
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月5日		下午9:25:28
 *
 * @see 	 
 */
public class Menu {
	
	private String pid;
	private String pname;
	private Map<String, Object> attributes = new HashMap<String, Object>();

	public Map<String, Object> getAttributes() {
		return attributes;
	}

	public void setAttributes(Map<String, Object> attributes) {
		this.attributes = attributes;
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid;
	}

	public String getPname() {
		return pname;
	}

	public void setPname(String pname) {
		this.pname = pname;
	}

	private String id;
	private String text;
	private String url;
	private String iconCls;
	
	private Integer seq;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}
}

