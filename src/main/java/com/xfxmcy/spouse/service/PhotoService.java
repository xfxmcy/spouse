/**
 * PhotoService.java
 * com.xfxmcy.spouse.service
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月20日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.model.QueryParam;

/**
 * ClassName:PhotoService
 * Function: photo service
 * Reason:	 photo service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年4月20日		上午9:43:38
 *
 * @see 	 
 */
public interface PhotoService {
	/**
	 * 
	 * queryMyPhotosForBackGround:query my photos at backGround
	 *
	 * @param param
	 * @return	json for photoes
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年4月20日 		cy
	 */
	public String queryMyPhotosForBackGround(QueryParam param);
	
	
	/**
	 * 
	 * queryHisPhotosForBackGround:query his photos at backGround
	 *
	 * @param param
	 * @return	json for photoes
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年4月20日 		cy
	 */
	public String queryHisPhotosForBackGround(QueryParam param);
}

