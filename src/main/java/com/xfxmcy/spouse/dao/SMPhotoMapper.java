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
}