/**
 * EmployerService.java
 * com.xfxmcy.spouse.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月12日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.vo.SPEmployer;

/**
 * ClassName:EmployerService
 * Function: employer service
 * Reason:	 employer service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月12日		下午4:44:25
 *
 * @see 	 
 */
public interface EmployerService {
	/**
	 * 
	 * mergeEmployer:merge employer
	 *
	 * @param employer	employer
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月12日 		cy
	 */
	public 	SPEmployer mergeEmployer(SPEmployer employer);
	/**
	 * 
	 * mergeEmployerPassWd:merge passWd
	 *
	 * @param employer
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月13日 		cy
	 */
	public SPEmployer mergeEmployerPassWd(SPEmployer employer);
}

