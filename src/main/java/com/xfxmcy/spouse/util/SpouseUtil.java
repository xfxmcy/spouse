/**
 * SpouseUtil.java
 * com.xfxmcy.spouse.util
 *
 * Function： provide some static method 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月11日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.util;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:SpouseUtil
 * Function: provide some static method
 * Reason:	 provide some static method
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月11日		上午10:36:26
 *
 * @see 	 
 */
public class SpouseUtil {

	
	/**
	 * 
	 * getMhEmployer:	acquire current user
	 *
	 * @param request  request
	 * @return      	user
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2013-10-1 		cy
	 */
	public static SessionUser getSessionUser(HttpServletRequest request){
		return (null != request.getSession().getAttribute(ResourceUtil.getSessionInfo())?(SessionUser) request.getSession().getAttribute(ResourceUtil.getSessionInfo()) : null);
	}
}

