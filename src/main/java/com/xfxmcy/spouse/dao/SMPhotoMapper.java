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
}