/**
 * SMPrefaceMapper.java
 * com.xfxmcy.spouse.dao
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月11日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.dao;

import java.util.List;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SMPreface;

/**
 * ClassName:SMPrefaceMapper
 * Function: preface mapper
 * Reason:	 preface mapper
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月11日		下午5:00:41
 *
 * @see 	 
 */
public interface SMPrefaceMapper {
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
	 * @param preface
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */
	int insertSelective(SMPreface preface);

	/**
	 * 
	 * queryPrefacePaged:query preface paged
	 *
	 * @param param		param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月12日 		cy
	 */
	List<SMPreface> queryPrefacePaged(QueryParam param);
	/**
	 * 
	 * queryCountPreface:query count in preface
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月12日 		cy
	 */
	Long queryCountPreface(QueryParam param);
}

