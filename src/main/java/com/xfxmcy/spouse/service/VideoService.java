/**
 * VideoService.java
 * com.xfxmcy.spouse.service
 *
 * Function： video service 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年7月27日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.vo.SMVideo;

/**
 * ClassName:VideoService
 * Function: video service
 * Reason:	 video service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年7月27日		下午8:46:45
 *
 * @see 	 
 */
public interface VideoService {
	/**
	 * 
	 * persistVideo:persist a video
	 *
	 * @param smVideo
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	public SMVideo persistVideo(QueryParam param , SMVideo smVideo);
	/**
	 * 
	 * mergeVideo:merge a video
	 *
	 * @param smVideo
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	public SMVideo mergeVideo(QueryParam param , SMVideo smVideo);
	/**
	 * 
	 * deleteVideo:delete a video
	 *
	 * @param smVideo
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	public void deleteVideo(QueryParam param , String id);
	/**
	 * 
	 * queryVideoPaged:query video paged
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	public SpouseGrid queryVideoPaged(QueryParam param);
	/**
	 * 
	 * queryVideoByPK:query video by primary key
	 *
	 * @param id	primary key
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	public SMVideo queryVideoByPK(QueryParam param , String id);
}

