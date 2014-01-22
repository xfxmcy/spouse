package com.xfxmcy.spouse.dao;

import java.util.List;
import java.util.Map;

import com.xfxmcy.spouse.vo.SPEmployer;

public interface SPEmployerMapper {
	/**
	 * 
	 * deleteByPrimaryKey:delete employer by primaryKey
	 *
	 * @param id				key
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月7日 		cy
	 */
    int deleteByPrimaryKey(String id);
    /**
     * 
     * insert: add a employer but not using
     *
     * @param record		record
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月7日 		cy
     */
    int insert(SPEmployer record);
    /**
     * 
     * insertSelective:add selectively a emplyer but not using
     *
     * @param record		record
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月7日 		cy
     */
    int insertSelective(SPEmployer record);
    /**
     * 
     * selectByPrimaryKey:query employer by primaryKey
     *
     * @param id				key
     * @return					employer
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月7日 		cy
     */
    SPEmployer selectByPrimaryKey(String id);
    /**
     * 
     * updateByPrimaryKeySelective:update selectively employer  
     *
     * @param record				record	
     * @return						employer
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月7日 		cy
     */
    int updateByPrimaryKeySelective(SPEmployer record);
    /**
     * 
     * updateByPrimaryKey:update employer 
     *
     * @param record		record	
     * @return				employer
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月7日 		cy
     */
    int updateByPrimaryKey(SPEmployer record);
    /**
     * 
     * doLogin: login  
     *
     * @param map	param
     * @return		result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月9日 		cy
     */
	SPEmployer doLogin(Map<String, String> map);
}