package com.xfxmcy.spouse.dao;

import java.util.List;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SMPhoto;

public interface SMPhotoMapper {
    int deleteByPrimaryKey(String id);

    int insert(SMPhoto record);

    int insertSelective(SMPhoto record);

    SMPhoto selectByPrimaryKey(String id);
    
    List<SMPhoto> selectPhotosBySelective(QueryParam param);

    int updateByPrimaryKeySelective(SMPhoto record);

    int updateByPrimaryKey(SMPhoto record);
    /**
     * 
     * selectPhotosBySelectivePages: queryPhotosByPage
     *
     * @param param
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2015年5月13日 		cy
     */
    List<SMPhoto> selectPhotosBySelectivePages(QueryParam param);
    /**
     * 
     * doQueryMyPhoto:query My photo
     *
     * @param param		param
     * @return
     *   ver     date      		author
     * ──────────────────────────────────
     *   		 2015年5月14日 		cy
     */
	List<SMPhoto> doQueryMyPhoto(QueryParam param);
	/**
	 * 
	 * doQueryTotalMyPhoto:query total my photo
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月14日 		cy
	 */
	Long doQueryTotalMyPhoto(QueryParam param);
	/**
	 * 
	 * doQueryMyMaxSeq: query Max sequence
	 *
	 * @param record	param
	 * @return			max sequence
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月18日 		cy
	 */
	Long doQueryMyMaxSeq(SMPhoto record);
	
	/**
	 * 
	 * doQueryHisPhoto:do query  about his photo
	 *
	 * @param param		param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月21日 		cy
	 */
	List<SMPhoto> doQueryHisPhoto(QueryParam param);
	/**
	 * 
	 * doQueryTotalHisPhoto:do query total about his photo
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月21日 		cy
	 */
	Long doQueryTotalHisPhoto(QueryParam param);
}