package com.xfxmcy.spouse.vo;

import java.io.Serializable;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.xfxmcy.spouse.util.IdUtil;

public class Tasks implements Serializable{
    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.id
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
	private String queryType ;
	
    public String getQueryType() {
		return queryType;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}
	private String id;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.title
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String title;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.allDay
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String allday;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.start
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date start;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.end
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    private Date end;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.url
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String url;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.userid
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String userid;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.business_id
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String businessId;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.task_from
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String taskFrom;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.task_status
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String taskStatus;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.flag
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String flag;

    /**
     * This field was generated by Apache iBATIS ibator.
     * This field corresponds to the database column b_tasks.status
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    private String status;

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.id
     *
     * @return the value of b_tasks.id
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.id
     *
     * @param id the value for b_tasks.id
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.title
     *
     * @return the value of b_tasks.title
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getTitle() {
        return title;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.title
     *
     * @param title the value for b_tasks.title
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.allDay
     *
     * @return the value of b_tasks.allDay
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getAllday() {
        return allday;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.allDay
     *
     * @param allday the value for b_tasks.allDay
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setAllday(String allday) {
        this.allday = allday;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.start
     *
     * @return the value of b_tasks.start
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public Date getStart() {
        return start;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.start
     *
     * @param start the value for b_tasks.start
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setStart(Date start) {
        this.start = start;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.end
     *
     * @return the value of b_tasks.end
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public Date getEnd() {
        return end;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.end
     *
     * @param end the value for b_tasks.end
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setEnd(Date end) {
        this.end = end;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.url
     *
     * @return the value of b_tasks.url
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getUrl() {
        return url;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.url
     *
     * @param url the value for b_tasks.url
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setUrl(String url) {
        this.url = url;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.userid
     *
     * @return the value of b_tasks.userid
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getUserid() {
        return userid;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.userid
     *
     * @param userid the value for b_tasks.userid
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setUserid(String userid) {
        this.userid = userid;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.business_id
     *
     * @return the value of b_tasks.business_id
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getBusinessId() {
        return businessId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.business_id
     *
     * @param businessId the value for b_tasks.business_id
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setBusinessId(String businessId) {
        this.businessId = businessId;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.task_from
     *
     * @return the value of b_tasks.task_from
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getTaskFrom() {
        return taskFrom;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.task_from
     *
     * @param taskFrom the value for b_tasks.task_from
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setTaskFrom(String taskFrom) {
        this.taskFrom = taskFrom;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.task_status
     *
     * @return the value of b_tasks.task_status
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getTaskStatus() {
        return taskStatus;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.task_status
     *
     * @param taskStatus the value for b_tasks.task_status
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setTaskStatus(String taskStatus) {
        this.taskStatus = taskStatus;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.flag
     *
     * @return the value of b_tasks.flag
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getFlag() {
        return flag;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.flag
     *
     * @param flag the value for b_tasks.flag
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setFlag(String flag) {
        this.flag = flag;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method returns the value of the database column b_tasks.status
     *
     * @return the value of b_tasks.status
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public String getStatus() {
        return status;
    }

    /**
     * This method was generated by Apache iBATIS ibator.
     * This method sets the value of the database column b_tasks.status
     *
     * @param status the value for b_tasks.status
     *
     * @ibatorgenerated Tue Feb 11 10:10:30 CST 2014
     */
    public void setStatus(String status) {
        this.status = status;
    }
    public Tasks() {

		// TODO Auto-generated constructor stub

	}
    /**
     * 
     * Creates a new instance of Tasks.
     *
     * @param allday
     */
    public Tasks(String allday,String userid,String url) {
    	Date d=new Date();
    	SimpleDateFormat simple=new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat simple2=new SimpleDateFormat("yyyy-MM-dd 23:59:59");
    	this.allday = allday;
    	this.taskStatus = "0";
    	this.flag = "1";
    	this.status = "1";
    	this.userid = userid;
    	this.url =  url ;
    	this.setId(IdUtil.generater());
    	try {
			this.setStart(simple.parse(simple.format(d)));
			this.setEnd(simple2.parse(simple2.format(d)));
		} catch (ParseException e) {
			e.printStackTrace();
			
		}
		
	}
}