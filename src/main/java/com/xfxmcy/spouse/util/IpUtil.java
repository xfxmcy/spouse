/**
 * IpUtil.java
 * com.xfxmcy.spouse.util
 *
 * Function： IP util 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2013-10-1 		cy
 *
 * Copyright (c) 2013, XFXMCY All Rights Reserved.
*/

package com.xfxmcy.spouse.util;

import javax.servlet.http.HttpServletRequest;

/**
 * ClassName:IpUtil
 * Function:  IP util
 * Reason:	  IP util
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2013-10-1		下午5:25:59
 *
 * @see 	 
 */
public class IpUtil {
	
	/**
	 * 
	 * getIpAddr: acquire Ip address
	 *
	 * @param request  request  object
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2013-10-1 		cy
	 */
	public static String getIpAddr(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		if (ip.equals("0:0:0:0:0:0:0:1")) {
			ip = "本地";
		}
		return ip;
	}
}

