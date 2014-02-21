package com.xfxmcy.spouse.dao;

import java.util.List;
import java.util.Map;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SMFavorite;

public interface SMFavoriteMapper {
	/**
	 * 	
	 * deleteByPrimaryKey: delete by primary key
	 *
	 * @param param		   param 
	 * @return			   result	
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月10日 		cy
	 */
    int deleteByPrimaryKey(Map param);
    /**
     * 
     * insert: insert favorite
     *
     * @param record	record
     * @return			response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int insert(SMFavorite record);
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
    int insertSelective(SMFavorite record);
    /**
     * 
     * selectByPrimaryKey: query by key
     *
     * @param id			key
     * @return				result
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    SMFavorite selectByPrimaryKey(String id);
    /**
     * 
     * updateByPrimaryKeySelective: update selectively
     *
     * @param record				record
     * @return						response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int updateByPrimaryKeySelective(SMFavorite record);
    /**
     * 
     * updateByPrimaryKey: update
     *
     * @param record		record
     * @return				response
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    int updateByPrimaryKey(SMFavorite record);
    
    /**
     * 
     * queryFavoritePaged:query favorite paged
     *
     * @param param		  param
     * @return			  result	
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月10日 		cy
     */
    List<SMFavorite> queryFavoritePaged(QueryParam param);
    /**
     * 
     * queryTotalFavorite: query the total of favorite
     * @param  				param
     * @return				total
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2014年1月11日 		cy
     */
	Long queryTotalFavorite(QueryParam param);
	/**
	 * 
	 * queryMaxSeq: query Max Seq to +1
	 *
	 * @param map	param
	 * @return		result
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年2月18日 		cy
	 */
	Long queryMaxSeq(Map<String, Object> map);
	
}