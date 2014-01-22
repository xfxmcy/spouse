package com.xfxmcy.spouse.dao;

import java.util.List;
import java.util.Map;

import com.xfxmcy.spouse.vo.SYMemu;

public interface SYMemuMapper {
	/**
	 * 
	 * insert: save a menu
	 *
	 * @param record	menu
	 * @return			response
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月9日 		cy
	 */
    int insert(SYMemu record);
    /**
     * 
     * insertSelective: save selectively a menu
     *	
     * @param record	record
     * @return			response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月9日 		cy
     */
    int insertSelective(SYMemu record);
    /**
     * 
     * doQueryMenu: query menus
     *
     * @param map	param
     * @return		menus
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月9日 		cy
     */
	List<SYMemu> doQueryMenu(Map<String, String> map);
}