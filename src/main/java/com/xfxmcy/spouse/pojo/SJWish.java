/**
 * SJWish.java
 * com.xfxmcy.spouse.pojo
 *
 * Function： birthday wish 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年7月21日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.pojo;
/**
 * ClassName:SJWish
 * Function: birthday wish
 * Reason:	 birthday wish
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年7月21日		下午2:18:06
 *
 * @see 	 
 */
public class SJWish {
	public SJWish() {

		// TODO Auto-generated constructor stub

	}
	private String text ; 
	private String subject ;
	private String name ;
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	private String emailForm;
	
	public String getEmailForm() {
		return emailForm;
	}
	public void setEmailForm(String emailForm) {
		this.emailForm = emailForm;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
}

