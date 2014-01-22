/**
 * MenuService.java
 * com.xfxmcy.spouse.service
 *
 * Function： service served   
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月5日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import java.util.List;

import com.xfxmcy.spouse.model.Menu;
import com.xfxmcy.spouse.util.SessionUser;

/**
 * ClassName:MenuService
 * Function: service served menu
 * Reason:	 service served menu
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月5日		下午9:23:01
 *
 * @see 	 
 */
public interface MenuService {
	
	/**
	 * 
	 * doCtrl: control tree following menu
	 *
	 * @return	menu's tree
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2013-9-30 		cy
	 */
	List<Menu> doCtrl(String operator,String id, SessionUser sessionUser);
	
	
}

