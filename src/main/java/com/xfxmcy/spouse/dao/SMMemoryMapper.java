/**
 * SMMemoryMapper.java
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
import com.xfxmcy.spouse.vo.SMMemory;

/**
 * ClassName:SMMemoryMapper
 * Function: memory mapper
 * Reason:	 memory mapper
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月11日		下午4:59:31
 *
 * @see 	 
 */
public interface SMMemoryMapper {
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
	 * @param smMemory
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年7月27日 		cy
	 */	
	int insertSelective(SMMemory smMemory);
	/**
	 * 
	 * updateByPrimaryKeySelective:update smMemory by pk
	 *
	 * @param smMemory
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月21日 		cy
	 */
	int updateByPrimaryKeySelective(SMMemory smMemory);
	/**
	 * 
	 * queryMemoryPaged:query memory paged
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月12日 		cy
	 */
	List<SMMemory> queryMemoryPaged(QueryParam param);
	/**
	 * 
	 * queryCountMemory:query count(*) memory
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月12日 		cy
	 */
	Long queryCountMemory(QueryParam param);
}

