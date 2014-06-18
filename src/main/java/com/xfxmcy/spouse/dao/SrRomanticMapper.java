package com.xfxmcy.spouse.dao;

import java.util.List;
import java.util.Map;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SrRomantic;
import com.xfxmcy.spouse.vo.SrRomanticWithBLOBs;

public interface SrRomanticMapper {
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
     * insert:insert a record
     *
     * @param record	record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年5月30日 		cy
     */
    int insert(SrRomanticWithBLOBs record);
    /**
     * 
     * insertSelective: insert selective
     *
     * @param record	record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年5月30日 		cy
     */
    int insertSelective(SrRomanticWithBLOBs record);
    /**
     * 
     * selectByPrimaryKey: select by id
     *
     * @param id		   id
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年5月30日 		cy
     */
    SrRomanticWithBLOBs selectByPrimaryKey(String id);
    /**
     * 
     * updateByPrimaryKeySelective:update selective by id
     *
     * @param record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年5月30日 		cy
     */
    int updateByPrimaryKeySelective(SrRomanticWithBLOBs record);
    /**
     * 
     * updateByPrimaryKeyWithBLOBs: update with blob
     *
     * @param record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年5月30日 		cy
     */
    int updateByPrimaryKeyWithBLOBs(SrRomanticWithBLOBs record);
    /**
     * 
     * updateByPrimaryKey:update simple 
     *
     * @param record
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年5月30日 		cy
     */
    int updateByPrimaryKey(SrRomantic record);
    /**
     * 
     * selectByCondition: selected paged by condition
     *
     * @param mapParam	  param
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年4月30日 		cy
     */
	List<SrRomanticWithBLOBs> selectByCondition(Map<String,Object> mapParam);
	/**
	 * 
	 * countByCondition: select count by condition
	 *
	 * @param mapParam	mapParam
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年4月30日 		cy
	 */
	Long countByCondition(Map<String,Object> mapParam);
}