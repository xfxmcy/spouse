package com.xfxmcy.spouse.vo;

import java.io.Serializable;

public class SMAccount implements Serializable{
    private String id;

    private String account;

    private String pass;

    private String title;

    private String email;

    private String phone;

    private String idCard;

    private String menofirst;

    private String menosecond;
    
    private String type;
    
    private String url;

    public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account == null ? null : account.trim();
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass == null ? null : pass.trim();
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard == null ? null : idCard.trim();
    }

    public String getMenofirst() {
        return menofirst;
    }

    public void setMenofirst(String menofirst) {
        this.menofirst = menofirst == null ? null : menofirst.trim();
    }

    public String getMenosecond() {
        return menosecond;
    }

    public void setMenosecond(String menosecond) {
        this.menosecond = menosecond == null ? null : menosecond.trim();
    }
}