/**
 * SyHomeService.java
 * com.xfxmcy.spouse.service
 *
 * Function： syHome service
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年3月3日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;

/**
 * ClassName:SyHomeService
 * Function: syHome service
 * Reason:	 syHome service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年3月3日		下午10:53:02
 *
 * @see 	 
 */

public interface SyHomeService {
	/**
	 * 
	 * constructPageTemplate : constructPageTemplate
	 *
	 * @param param		queryParam
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年3月3日 		cy
	 */
	void constructPageTemplate(QueryParam param);
	/**
	 * 
	 * doQuery: doQuery  home 's page
	 *
	 * @param param		param
	 * @return			grid
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年4月16日 		cy
	 */
	SpouseGrid doQuery(QueryParam param); 
}

