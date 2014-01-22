package com.xfxmcy.spouse.vo;

import java.util.Date;

public class SMMemo {
	
    private String id;

    private Date time;

    private String title;

    private String memofirst;

    private String memosecond;

    private Date createtime;

    private String authorId;

    private String description;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
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

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId == null ? null : authorId.trim();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description == null ? null : description.trim();
    }
}