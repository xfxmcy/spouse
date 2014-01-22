package com.xfxmcy.spouse.vo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SMFavorite {
    private String id;

    private String url;

    private String description;

    private String pid;

    private String title;

    private String memofirst;

    private String memosecond;

    private Date createtime;

    private Integer seq;

    public String get_parentId(){
    	return pid ;
    }
    private String  iconCls = "icon-child";
    
    public String getIconCls() {
		return iconCls;
	}

	public void setIconCls(String iconCls) {
		this.iconCls = iconCls;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getUrl() {
        return url;
    }
    
    public String getFormatterCreatetime(){
    	if(null != getCreatetime())
    	{
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    		return df.format(getCreatetime());
    	}
    	return "";
    }
    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getMemofirst() {
        return memofirst;
    }

    public void setMemofirst(String memofirst) {
        this.memofirst = memofirst == null ? null : memofirst.trim();
    }

    public String getMemosecond() {
        return memosecond;
    }

    public void setMemosecond(String memosecond) {
        this.memosecond = memosecond == null ? null : memosecond.trim();
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

     
}