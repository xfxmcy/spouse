package com.xfxmcy.spouse.dao;

import com.xfxmcy.spouse.vo.SMMemo;

public interface SMMemoMapper {
    int deleteByPrimaryKey(String id);

    int insert(SMMemo record);

    int insertSelective(SMMemo record);

    SMMemo selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SMMemo record);

    int updateByPrimaryKeyWithBLOBs(SMMemo record);

    int updateByPrimaryKey(SMMemo record);
}