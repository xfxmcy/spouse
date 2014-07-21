/**
 * RomanticServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： implements romantic 's service
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年5月2日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SrRomanticMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.pojo.SJWish;
import com.xfxmcy.spouse.service.RomanticService;
import com.xfxmcy.spouse.util.EmailComponent;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.vo.SrRomanticWithBLOBs;

/**
 * ClassName:RomanticServiceImpl
 * Function: implements romantic 's service
 * Reason:	 implements romantic 's service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月2日		下午12:48:07
 *
 * @see 	 
 */
@Transactional
@Service
public class RomanticServiceImpl implements RomanticService {
	
	@Resource
	private SrRomanticMapper mapper;
	
	@Resource
	private EmailComponent emailComponent ;
	
	@Override
	public SrRomanticWithBLOBs doPersistRomantic(QueryParam param,
			SrRomanticWithBLOBs bloBs) {
		if(SpouseConstant.SIMPLE_SAVE.equals(param.getQueryType())){
			bloBs.setId(IdUtil.generaterThrityTwo());
			mapper.insertSelective(bloBs);
		}	
		return bloBs;
		
	}


	@Override
	public SrRomanticWithBLOBs doUpdateRomantic(QueryParam param,
			SrRomanticWithBLOBs bloBs) {
		
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			mapper.updateByPrimaryKeyWithBLOBs(bloBs);
		}
		return bloBs;
		
	}


	@Override
	public void doDeleteRomantic(QueryParam param,
			String key) {

		if(SpouseConstant.SIMPLE_DELETE.equals(param.getQueryType())){
			mapper.deleteByPrimaryKey(key);
		}
		
	}


	@Override
	public void doDreamWish(QueryParam param, SJWish wish) {
		
		if(SpouseConstant.SIMPLE_SAVE.equals(param.getQueryType())){
			emailComponent.sendSimpleEmail(wish);
		}
	}

}

