package com.xfxmcy.spouse.dao;

import com.xfxmcy.spouse.vo.SMDiary;

public interface SMDiaryMapper {
	
	/**
	 * 
	 * deleteByPrimaryKey: delete by primary key
	 *
	 * @param id			id
	 * @return				result
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月10日 		cy
	 */
    int deleteByPrimaryKey(String id);
    /**
     * 
     * insert: insert diary
     *
     * @param record	record
     * @return			response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int insert(SMDiary record);
    /**
     * 
     * insertSelective: insert selectively
     * 
     * @param record	record
     * @return			response	
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int insertSelective(SMDiary record);
    /**
     * 
     * selectByPrimaryKey: query by primary key
     *
     * @param id		   primary key	
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    SMDiary selectByPrimaryKey(String id);
    /**
     * 
     * updateByPrimaryKeySelective: update selectively
     *
     * @param record			record
     * @return					response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int updateByPrimaryKeySelective(SMDiary record);
    /**
     * 
     * updateByPrimaryKey: update by primary key
     *
     * @param record		record
     * @return				response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int updateByPrimaryKey(SMDiary record);
}