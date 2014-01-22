/**
 * FavoriteService.java
 * com.xfxmcy.spouse.service
 *
 * Function： favorite service 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月10日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.vo.SMFavorite;

/**
 * ClassName:FavoriteService
 * Function: favorite service
 * Reason:	 favorite service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月10日		下午10:48:11
 *
 * @see 	 
 */
public interface FavoriteService {
	
	
	/**
	 * 
	 * queryTreeGridFavorite: query favorite following treegrid
	 *
	 * @param param			param
	 * @param user			current user
	 * @return				treegrid
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月10日 		cy
	 */
	SpouseGrid queryTreeGridFavorite(QueryParam param ,SessionUser user);
	
	/**
	 * 
	 * persistenceFavorite: persistence favorite
	 *
	 * @param param		    attachment's param
	 * @param favorite		favorite
	 * @return				favorite persistenced
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月17日 		cy
	 */
	SMFavorite persistenceFavorite(QueryParam param,SMFavorite favorite);
	/**
	 * 
	 * mergeFavorite: merge favorite
	 *
	 * @param param	 attachment's param
	 * @param favorite	
	 * @return	favorite merged
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月17日 		cy
	 */
	SMFavorite mergeFavorite(QueryParam param,SMFavorite favorite);
	/**
	 * 
	 * deleteFavorite: delete favorite
	 *
	 * @param param	   attachment's favorite	
	 * @param key	   primary 	
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月17日 		cy
	 */
	void deleteFavorite(QueryParam param,String key);
}

