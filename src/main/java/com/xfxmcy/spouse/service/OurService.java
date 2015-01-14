/**
 * OurService.java
 * com.xfxmcy.spouse.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月11日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;

/**
 * ClassName:OurService
 * Function: Ours Service
 * Reason:	 Ours Service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月11日		下午4:32:26
 *
 * @see 	 
 */
public interface OurService {
	/**
	 * 
	 * queryOursPaged:query ours model paged
	 *
	 * @param param		param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月12日 		cy
	 */
	public SpouseGrid queryOursPaged(QueryParam param);
}

