package com.xfxmcy.spouse.dao;

import com.xfxmcy.spouse.vo.SMAlbum;

public interface SMAlbumMapper {
	/**
	 * 
	 * deleteByPrimaryKey: delete album by primary key
	 *
	 * @param id		  key	
	 * @return			  response	
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月10日 		cy
	 */
    int deleteByPrimaryKey(String id);
    /**
     * 
     * insert:  add a album
     *
     * @param record	record
     * @return			response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int insert(SMAlbum record);
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
    int insertSelective(SMAlbum record);
    /**
     * 
     * selectByPrimaryKey: select by primary key
     *
     * @param id		   primary key
     * @return			   result	
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    SMAlbum selectByPrimaryKey(String id);
    /**
     * 
     * updateByPrimaryKeySelective: update selectively
     *
     * @param record				record
     * @return						result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int updateByPrimaryKeySelective(SMAlbum record);
    /**
     * 
     * updateByPrimaryKey: update by primary key
     *
     * @param record		record
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int updateByPrimaryKey(SMAlbum record);
}