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
	
	private static final ResourceBundle bundle = java.util.ResourceBundle.getBundle("config");

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
}

