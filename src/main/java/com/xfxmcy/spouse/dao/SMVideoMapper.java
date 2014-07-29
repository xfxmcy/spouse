/**
 * SMVideoMapper.java
 * com.xfxmcy.spouse.dao
 *
 * Function： video controller 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年7月27日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.dao;

import java.util.List;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SMVideo;

/**
 * ClassName:SMVideoMapper
 * Function: video controller
 * Reason:	 video controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年7月27日		下午8:24:31
 *
 * @see 	 
 */
public  interface SMVideoMapper {
	
	/**
	 * 
	 * deleteByPrimaryKey:delete by pk
	 *
	 * @param id
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	int deleteByPrimaryKey(String id);
	/**
	 * 
	 * insertSelective: insert selective
	 *
	 * @param smVideo
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	int insertSelective(SMVideo smVideo);
	/**
	 * 
	 * updateSelective: update selective
	 *
	 * @param smVideo
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	int updateSelective(SMVideo smVideo);
	/**
	 * 
	 * queryVideoPaged:query video paged
	 *
	 * @param param		param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	List<SMVideo> queryVideoPaged(QueryParam param);
	/**
	 * 
	 * selectByPrimaryKey:select video by pk
	 *
	 * @param id
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	SMVideo selectByPrimaryKey(String id);
	/**
	 * 
	 * queryCountVideo:query count for video
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	Long queryCountVideo(QueryParam param);
}

