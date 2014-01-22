/**
 * SystemService.java
 * com.xfxmcy.spouse.service
 *
 * Function： systemic service 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月7日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.vo.SPEmployer;

/**
 * ClassName:SystemService
 * Function: systemic service
 * Reason:	 systemic service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月7日		下午2:23:35
 *
 * @see 	 
 */

public interface SystemService {
	
	/**
	 * 
	 * doLogin: login 
	 * @param operator operator
	 * @param employer	employer
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月9日 		cy
	 */
	SPEmployer doLogin(String operator,SPEmployer employer);
	
	
}

