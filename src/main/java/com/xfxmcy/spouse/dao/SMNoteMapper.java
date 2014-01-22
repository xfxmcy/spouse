package com.xfxmcy.spouse.dao;

import com.xfxmcy.spouse.vo.SMNote;

public interface SMNoteMapper {
    int deleteByPrimaryKey(String id);

    int insert(SMNote record);

    int insertSelective(SMNote record);

    SMNote selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SMNote record);

    int updateByPrimaryKeyWithBLOBs(SMNote record);

    int updateByPrimaryKey(SMNote record);
}