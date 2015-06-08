package com.xfxmcy.spouse.vo;

import java.io.Serializable;
import java.util.Date;

public class SMPhoto implements Serializable{
    private String id;

    private String url;

    private String albumId;

    private String title;
   
    private String memofirst;
    
    private String memosecond;

    private Date createtime;

    private String authorId;

    private String flag = "1",seq;
    
    private String queryType;
    
    public SMPhoto() {

		// TODO Auto-generated constructor stub

	}
    
    public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
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

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public String getAlbumId() {
        return albumId;
    }

    public void setAlbumId(String albumId) {
        this.albumId = albumId == null ? null : albumId.trim();
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
}