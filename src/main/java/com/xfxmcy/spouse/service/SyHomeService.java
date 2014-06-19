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
import com.xfxmcy.spouse.vo.SYHome;

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
	/**
	 * 
	 * doPersistentHomePhoto:persistent homePhoto
	 *
	 * @param param	   param
	 * @param syHome   entity
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年6月19日 		cy
	 */
	SYHome persistentHomePhoto(QueryParam param, SYHome syHome);
	/**
	 * 
	 * mergeHomePhoto:merge home photo
	 *
	 * @param param
	 * @param syHome
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年6月19日 		cy
	 */
	SYHome mergeHomePhoto(QueryParam param, SYHome syHome); 
	/**
	 * 
	 * deleteHomePhoto:delete home photo
	 *
	 * @param param
	 * @param syHome
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年6月19日 		cy
	 */
	void deleteHomePhoto(QueryParam param, SYHome syHome); 
}

