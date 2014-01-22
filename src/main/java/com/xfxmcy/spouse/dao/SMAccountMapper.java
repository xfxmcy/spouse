package com.xfxmcy.spouse.dao;

import com.xfxmcy.spouse.vo.SMAccount;

public interface SMAccountMapper {
	/**
	 * 
	 * deleteByPrimaryKey:delete by primary key
	 *
	 * @param id		primary key
	 * @return			info	
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月18日 		cy
	 */
    int deleteByPrimaryKey(String id);
    /**
     * 
     * insert:insert
     *
     * @param record	entity
     * @return			info
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月18日 		cy
     */
    int insert(SMAccount record);
    /**
     * 
     * insertSelective:insert selectively
     *
     * @param record	entity	
     * @return			code
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月18日 		cy
     */
    int insertSelective(SMAccount record);
    /**
     * 
     * selectByPrimaryKey: select by primary key
     *
     * @param id			key
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月18日 		cy
     */
    SMAccount selectByPrimaryKey(String id);
    /**
     * 
     * updateByPrimaryKeySelective: update selectively
     *
     * @param record		record
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月18日 		cy
     */
    int updateByPrimaryKeySelective(SMAccount record);
    /**
     * 
     * updateByPrimaryKey: update
     *
     * @param record		key
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月18日 		cy
     */
    int updateByPrimaryKey(SMAccount record);
}