package com.xfxmcy.spouse.vo;

public class SYMemu {
    private String id;

    public String iconCls ;

    private Integer seq;

    private String text;

    private String url;

    private String pid;

    private String memofirst;

    private String memosecond;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
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

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text == null ? null : text.trim();
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getPid() {
        return pid;
    }

    public void setPid(String pid) {
        this.pid = pid == null ? null : pid.trim();
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
}