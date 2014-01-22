package com.xfxmcy.spouse.dao;

import com.xfxmcy.spouse.vo.SMNoteBook;

public interface SMNoteBookMapper {
    int deleteByPrimaryKey(String id);

    int insert(SMNoteBook record);

    int insertSelective(SMNoteBook record);

    SMNoteBook selectByPrimaryKey(String id);

    int updateByPrimaryKeySelective(SMNoteBook record);

    int updateByPrimaryKey(SMNoteBook record);
}