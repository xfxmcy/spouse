/**
 * SyHomeServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： implements SyHome service
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年3月3日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SYHomeMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.service.SyHomeService;
import com.xfxmcy.spouse.util.TemplateComponent;
import com.xfxmcy.spouse.vo.SYHome;

/**
 * ClassName:SyHomeServiceImpl
 * Function: implements SyHome service
 * Reason:	 implements SyHome service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年3月3日		下午10:59:26
 *
 * @see 	 
 */
@Transactional
@Service
public class SyHomeServiceImpl implements SyHomeService {

	@Resource
	private SYHomeMapper homeMapper ;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public void constructPageTemplate(QueryParam param) {
		/*query param*/
		Map<String,Object> mapParam = new HashMap<String,Object>();
		/*template root*/
		Map<String,Object> mapTemplate = new HashMap<String,Object>();
		if(SpouseConstant.Home.CONSTRUCT_HOME_PAGED.equals(param.getQueryType())){
			mapParam.put("isBig", SpouseConstant.SQL_HOME_IS_BIG);
			List<SYHome> bigPhotos = homeMapper.selectByCondition(mapParam);
			mapParam.put("isBig",null);
			mapParam.put("isSmall", SpouseConstant.SQL_HOME_IS_SMALL);
			List<SYHome> smallPhotos = homeMapper.selectByCondition(mapParam);
			mapTemplate.put("bigPhoto", bigPhotos);
			//mapTemplate.put("smallPhoto", smallPhotos);
			TemplateComponent.getTemplateCom().filePrint(SpouseConstant.Home.MARKER_PATH_INDEX_FTL, mapTemplate, param.getMemoFirst()+SpouseConstant.Home.MARKER_PATH_INDEX);
			
		}

	}

}

