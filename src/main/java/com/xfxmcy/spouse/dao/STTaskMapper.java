/**
 * STTaskMapper.java
 * com.xfxmcy.spouse.dao
 *
 * Function： task mapper 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年5月30日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.dao;

import java.util.ArrayList;
import java.util.Map;

import com.xfxmcy.spouse.vo.Tasks;

/**
 * ClassName:STTaskMapper
 * Function: task mapper
 * Reason:	 task mapper
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月30日		下午4:02:49
 *
 * @see 	 
 */
public interface STTaskMapper {
	/**
	 * 
	 * selectByCondition:(这里用一句话描述这个方法的作用)
	 *
	 * @param mapParam
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月30日 		cy
	 */
	ArrayList<Tasks> selectByCondition(Map<String,Object> mapParam); 
	
	/**
	 * 
	 * deleteByPrimaryKey:delete by id
	 *
	 * @param id
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月30日 		cy
	 */
    int deleteByPrimaryKey(String id);
    /**
     * 
     * insertSelective:insert a record
     *
     * @param record	record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年5月30日 		cy
     */
    int insertSelective(Tasks record);

}

