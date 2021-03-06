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

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.constant.SpouseEntityConstant;
import com.xfxmcy.spouse.controller.home.HomeController;
import com.xfxmcy.spouse.dao.SMPrefaceMapper;
import com.xfxmcy.spouse.dao.SPEmployerMapper;
import com.xfxmcy.spouse.dao.SYHomeMapper;
import com.xfxmcy.spouse.dao.SrRomanticMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.pojo.SJWish;
import com.xfxmcy.spouse.service.SyHomeService;
import com.xfxmcy.spouse.util.EmailComponent;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.util.TemplateComponent;
import com.xfxmcy.spouse.vo.SMPreface;
import com.xfxmcy.spouse.vo.SPEmployer;
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
	private static final Logger logger = Logger.getLogger(SyHomeService.class);
	@Resource
	private SYHomeMapper homeMapper ;
	
	@Resource
	private SrRomanticMapper romanticMapper; 
	
	@Resource
	private SPEmployerMapper employerMapper; 
	
	@Resource
	private EmailComponent emailComponent ;
	
	@Resource
	private SMPrefaceMapper prefaceMapper; 

	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public void constructPageTemplate(QueryParam param) {
		/*query param*/
		Map<String,Object> mapParam = new HashMap<String,Object>();
		/*template root*/
		Map<String,Object> mapTemplate = new HashMap<String,Object>();
		if(SpouseConstant.Home.CONSTRUCT_HOME_PAGED.equals(param.getQueryType())){
			mapParam.put("isBig", SpouseConstant.SQL_FIELD_TRUE);
			mapParam.put("ph_order", SpouseConstant.SQL_FIELD_TRUE);
			/*右中大图*/
			List<SYHome> bigPhotos = homeMapper.selectByCondition(mapParam);
			mapParam.put("isBig",null);
			mapParam.put("isSmall", SpouseConstant.SQL_FIELD_TRUE);
			/*右下小图*/
			List<SYHome> smallPhotos = homeMapper.selectByCondition(mapParam);
			mapTemplate.put("bigPhoto", bigPhotos);
			mapTemplate.put("smallPhoto", smallPhotos);
			param.setQueryType("host");
			/*左中角色图*/
			List<SPEmployer> hostPhotos = employerMapper.queryListPaged(param);
			mapTemplate.put("hostPhoto", hostPhotos);
			/*右下 preface*/
			param.setModel(SpouseEntityConstant.MODEL_INDEX);
			List<SMPreface> prefaces = prefaceMapper.queryPrefacePaged(param);
			mapTemplate.put("prefaces", prefaces);
			File origin = new File(param.getMemoFirst()+SpouseConstant.Home.MARKER_PATH_INDEX);
        	if(null != origin && origin.exists()){
        		origin.delete();
        		logger.error("------/ index.jsp----------------deleted");
        	}
			TemplateComponent.getTemplateCom().filePrint(SpouseConstant.Home.MARKER_PATH_INDEX_FTL, mapTemplate, param.getMemoFirst()+SpouseConstant.Home.MARKER_PATH_INDEX);
			
		}

	}

	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SpouseGrid doQuery(QueryParam param) {
		SpouseGrid grid = new SpouseGrid();
		/*query param*/
		Map<String,Object> mapParam = new HashMap<String,Object>();
		if(param.getPage() != null){
			mapParam.put("page", param.getPage());
			mapParam.put("startPoint", param.getStartPoint());
			mapParam.put("rows", param.getRows());
		}
		if(SpouseConstant.SIMPLE_QUERY_PAGED.equals(param.getQueryType())){
			mapParam.put("photoType", param.getPhotoType());
			if(null != param.getLikeNameFirst() && !"".equals(param.getLikeNameFirst())){
				mapParam.put("descri", "%" + param.getLikeNameFirst() + "%");
			}
			grid.setRows(homeMapper.selectByCondition(mapParam));
			grid.setTotal(homeMapper.countByCondition(mapParam));
		}
		/*romantic*/
		else if(SpouseConstant.ROMANTIC_QUERY_PAGED.equals(param.getQueryType())){
			mapParam.put("isyear", param.getIsyear());
			if(null != param.getLikeNameFirst() && !"".equals(param.getLikeNameFirst())){
				mapParam.put("title", "%" + param.getLikeNameFirst() + "%");
			}
			grid.setRows(romanticMapper.selectByCondition(mapParam));
			grid.setTotal(romanticMapper.countByCondition(mapParam));
		}
		return grid;
		
	}


	@Override
	public SYHome persistentHomePhoto(QueryParam param, SYHome syHome) {
		Map<String,Object> mapParam = new HashMap<String,Object>();
		if(SpouseConstant.SIMPLE_SAVE.equals(param.getQueryType())){
			syHome.setId(IdUtil.generaterThrityTwo());
			this.initalPhotoType(syHome);
			syHome.setPreCount(SpouseEntityConstant.HOME_COUNT_START);
			homeMapper.insertSelective(syHome);
		}
		return syHome;
		
	}

	/**
	 * 
	 * initalPhotoType:initial photo 's photoType
	 *
	 * @param syHome
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年6月19日 		cy
	 */
	private void initalPhotoType(SYHome syHome) {
		if(null == syHome.getType())
			return ;
		/*slider*/
		if(SpouseEntityConstant.HOME_SLIDE.equals(syHome.getType())){
			syHome.setIsBig(SpouseConstant.SQL_FIELD_TRUE);
			syHome.setIsSmall(SpouseConstant.SQL_FIELD_FALSE);
		}
		else if(SpouseEntityConstant.HOME_IMAGE.equals(syHome.getType())){
			syHome.setIsSmall(SpouseConstant.SQL_FIELD_TRUE);
			syHome.setIsBig(SpouseConstant.SQL_FIELD_FALSE);
		}
		else if(SpouseEntityConstant.HOME_CHARACTER.equals(syHome.getType())){
			syHome.setIsSmall(SpouseConstant.SQL_FIELD_FALSE);
			syHome.setIsBig(SpouseConstant.SQL_FIELD_FALSE);
		}
		
		
	}


	@Override
	public SYHome mergeHomePhoto(QueryParam param, SYHome syHome) {
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			this.initalPhotoType(syHome);
			homeMapper.updateSelective(syHome);
		}
		return syHome;
	}


	@Override
	public void deleteHomePhoto(QueryParam param, SYHome syHome) {
		if(SpouseConstant.SIMPLE_DELETE.equals(param.getQueryType())){
			homeMapper.deleteByCondition(syHome);
		}
		
	}


	@Override
	public void doContactUs(QueryParam param, SJWish wish) {
		if(SpouseConstant.SIMPLE_SAVE.equals(param.getQueryType())){
			emailComponent.sendEmailForUs(wish);
		}
		
	}

}