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
import com.xfxmcy.spouse.vo.SMPreface;

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
public interface OurService<T> {
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
	
	/**
	 * 
	 * persistPreface:persist a smPreface
	 *
	 * @param smPreface
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月16日 		cy
	 */
	public T persistOurs(T t ,String queryType);
	/**
	 * 
	 * mergeOurs:merge ours
	 *
	 * @param t
	 * @param queryType
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月16日 		cy
	 */
	public T mergeOurs(T t ,String queryType);
	/**
	 * 
	 * deleteOurs:delete our
	 *
	 * @param t
	 * @param queryType
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月16日 		cy
	 */
	public void deleteOurs(String key ,QueryParam queryType);
	/**
	 * 
	 * openPreface: open a preface
	 *
	 * @param key	key
	 * @param param
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月18日 		cy
	 */
	public String openOurs(String key ,QueryParam param);
	/**
	 * 
	 * closeOurs: close a preface
	 *
	 * @param key	key
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月19日 		cy
	 */
	
	public String closeOurs(String key, QueryParam param);

}

