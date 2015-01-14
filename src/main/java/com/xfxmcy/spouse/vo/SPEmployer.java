package com.xfxmcy.spouse.vo;

import java.io.Serializable;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class SPEmployer implements Serializable{
    private String id;

    private String sAccount;

    private String sPassword,sPasswordNew;
    
    public String getsPasswordNew() {
		return sPasswordNew;
	}

	public void setsPasswordNew(String sPasswordNew) {
		this.sPasswordNew = sPasswordNew;
	}

	private String role;

    private String image;

    private String path;

    private String memofirst;

    private String memosecond;
    
    private String queryType;
    
    public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getsAccount() {
        return sAccount;
    }

    public void setsAccount(String sAccount) {
        this.sAccount = sAccount == null ? null : sAccount.trim();
    }

    public String getsPassword() {
        return sPassword;
    }

    public void setsPassword(String sPassword) {
        this.sPassword = sPassword == null ? null : sPassword.trim();
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public String getPath() {
        return path;
    }

    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
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

	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.SIMPLE_STYLE);
	}
    
}