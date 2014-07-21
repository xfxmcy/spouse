/**
 * ResourceUtil.java
 * com.xfxmcy.spouse.util
 *
 * Function： resource 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2013-10-1 		cy
 *
 * Copyright (c) 2013, XFXMCY All Rights Reserved.
*/

package com.xfxmcy.spouse.util;

import java.util.ResourceBundle;

/**
 * ClassName:ResourceUtil
 * Function: resource
 * Reason:	 resource
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2013-10-1		下午4:32:23
 *
 * @see 	 
 */
public class ResourceUtil {
	
	private static final ResourceBundle bundle = ResourceBundle.getBundle("config");

	private  ResourceUtil() {
		
	}
	/**
	 * 
	 * getSessionInfo: acquire session 's name
	 *
	 * @return			property's key
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2013-10-1 		cy
	 */
	public static final String getSessionInfo() {
		
		return bundle.getString("sessionInfoName");
		
	}
	/**
	 * 
	 * getAdminId: get admin information , example default user in task
	 *
	 * @return			property's key
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2013-10-1 		cy
	 */
	public static final String getAdminId() {
		
		return bundle.getString("adminId");
		
	}
	/**
	 * 
	 * getMailSmtpAuth:mail author
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月16日 		cy
	 */
	public static final String getMailSmtpAuth() {
			
		return bundle.getString("mail.smtp.auth");
			
	}
	
	/**
	 * 
	 * getMailSslEnable: ssl enable
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月16日 		cy
	 */
	public static final String getMailSslEnable() {
			
		return bundle.getString("mail.smtp.ssl.enable");
			
	}
	/**
	 * 
	 * getMailAuthor:mail author account
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月16日 		cy
	 */
	public static final String getMailAuthor() {
		
		return bundle.getString("mail.author.account");
		
	}
	/**
	 * 
	 * getMailAuthorPasswd:mail author passwd
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月16日 		cy
	 */
	public static final String getMailAuthorPasswd() {
		
		return bundle.getString("mail.author.passwd");
		
	}
	/**
	 * 
	 * getMailSmtpServer:mail smtp server
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月16日 		cy
	 */
	public static final String getMailSmtpServer() {
		
		return bundle.getString("mail.smtp.server");
		
	}
	/**
	 * 
	 * getMailSender:mail receiver
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月16日 		cy
	 */
	public static final String getMailSender() {
		
		return bundle.getString("mail.transport.sender.account");
		
	}
	/**
	 * 
	 * getSmtpPort:get smtp port
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月19日 		cy
	 */
	public static int getSmtpPort() {
		
		return Integer.valueOf(bundle.getString("mail.smtp.port"));
		
	}
	
	/**
	 * 
	 * getMailSenderSecond:mail receiver
	 *
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月21日 		cy
	 */
	public static String getMailSenderSecond() {

		return bundle.getString("mail.transport.sender.second.account");
	}
}

