package com.xfxmcy.spouse.dao;

import java.util.List;
import java.util.Map;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SYHome;

public interface SYHomeMapper {
	
	/**
	 * 
	 * insert: insert a syHome
	 *
	 * @param record	 record	
	 * @return			 rows influenced
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年3月1日 		cy
	 */
    int insert(SYHome record);
    /**
     * 
     * insertSelective: insert selectivly
     *
     * @param record		record
     * @return				rows influenced
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年3月1日 		cy
     */
    int insertSelective(SYHome record);
    /**
     * 
     * updateSelective:update selectivly
     *
     * @param record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年6月19日 		cy
     */
    int updateSelective(SYHome record);
    /**
     * 
     * deleteByCondition:delete by condition
     *
     * @param record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年6月19日 		cy
     */
    int deleteByCondition(SYHome record);
    /**
     * 
     * selectByCondition:select by condition
     *
     * @param map	param
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年3月3日 		cy
     */
    List<SYHome> selectByCondition(Map<String,Object> map);
    /**
     * 
     * countByCondition: select count by condition
     *
     * @param map				param
     * @return					result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年4月16日 		cy
     */
    long countByCondition(Map<String,Object> map);
}