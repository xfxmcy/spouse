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
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.vo.SMPhoto;

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
	 * doQueryMyPhoto:query my photo
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月14日 		cy
	 */
	public SpouseGrid doQueryMyPhoto(QueryParam param);
	/**
	 * 
	 * doQueryHisPhoto:query his photo
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月14日 		cy
	 */
	public SpouseGrid doQueryHisPhoto(QueryParam param);
	/**
	 * 
	 * doSaveMyPhoto: save my photo
	 *
	 * @param smPhoto the smPhoto
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月18日 		cy
	 */
	public SMPhoto doSaveMyPhoto(SMPhoto smPhoto);
}

