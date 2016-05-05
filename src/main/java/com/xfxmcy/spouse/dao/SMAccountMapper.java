package com.xfxmcy.spouse.dao;

import java.util.List;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SMAccount;
import com.xfxmcy.spouse.vo.SMMemory;

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
    /**
     * 
     * queryAccountPaged:  分页查询account
     * 
     * @author 李丛阳
     * @param param
     * @return
     * @since 　Ver 1.1
     */
	List<SMAccount> queryAccountPaged(QueryParam param);
	/**
	 * 
	 * queryCountAccount:  query count(*) account 
	 * 
	 * @author 李丛阳
	 * @param param
	 * @return
	 * @since 　Ver 1.1
	 */
	Long queryCountAccount(QueryParam param);
}