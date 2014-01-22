package com.xfxmcy.spouse.dao;

import com.xfxmcy.spouse.vo.SMPhoto;

public interface SMPhotoMapper {
    int deleteByPrimaryKey(String id);

    int insert(SMPhoto record);

    int insertSelective(SMPhoto record);

    SMPhoto selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SMPhoto record);

    int updateByPrimaryKey(SMPhoto record);
}