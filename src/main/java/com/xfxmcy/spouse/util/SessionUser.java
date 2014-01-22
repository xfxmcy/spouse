/**
 * SessionUser.java
 * com.xfxmcy.spouse.util
 *
 * Function： information which saving current user 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2013-10-1 		cy
 *
 * Copyright (c) 2013, XFXMCY All Rights Reserved.
*/

package com.xfxmcy.spouse.util;
/**
 * ClassName:SessionUser
 * Function: information which saving current user
 * Reason:	 information which saving current user
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2013-10-1		下午2:06:13
 *
 * @see 	 
 */
public class SessionUser {
	/*当前登录人id*/
	private String userId;
	/*当前登录人 name*/
	private String loginName;
	/*当前登录人ip*/
	private String ip;
	/*当前登录角色*/
	private String role;
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public SessionUser() {

		// TODO Auto-generated constructor stub

	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getLoginName() {
		return loginName;
	}

	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public SessionUser(String userId, String loginName, String ip) {
		super();
		this.userId = userId;
		this.loginName = loginName;
		this.ip = ip;
	}
	
	
}

