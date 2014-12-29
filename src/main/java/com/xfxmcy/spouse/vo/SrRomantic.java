package com.xfxmcy.spouse.vo;

import java.io.Serializable;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class SrRomantic implements Serializable{
    private String id;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date date;

    private String dateclass;

    private String imagefirst;

    private String imagesecond;

    private String isyear;
    
    private String contentclass;
    
    public String getContentclass() {
		return contentclass;
	}

	public void setContentclass(String contentclass) {
		this.contentclass = contentclass;
	}

	public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

   

    public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	public String getFormattedDate(){
		if(null != getDate())
    	{
    		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
    		return df.format(getDate());
    	}
    	return "";
	} 
	
	public String getFormattedYear(){
		if(null != getDate())
    	{
    		DateFormat df = new SimpleDateFormat("yyyy");
    		return df.format(getDate());
    	}
    	return "";
	}
	public String getFormattedTime(){
		if(null != getDate())
    	{
    		DateFormat df = new SimpleDateFormat("MM/dd");
    		return df.format(getDate());
    	}
    	return "";
	}
	
	public String getDateclass() {
        return dateclass;
    }

    public void setDateclass(String dateclass) {
        this.dateclass = dateclass == null ? null : dateclass.trim();
    }

    public String getImagefirst() {
        return imagefirst;
    }

    public void setImagefirst(String imagefirst) {
        this.imagefirst = imagefirst == null ? null : imagefirst.trim();
    }

    public String getImagesecond() {
        return imagesecond;
    }

    public void setImagesecond(String imagesecond) {
        this.imagesecond = imagesecond == null ? null : imagesecond.trim();
    }

    public String getIsyear() {
        return isyear;
    }

    public void setIsyear(String isyear) {
        this.isyear = isyear == null ? null : isyear.trim();
    }
}