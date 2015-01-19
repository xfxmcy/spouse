/**
 * OurServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月11日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SMMemoryMapper;
import com.xfxmcy.spouse.dao.SMPrefaceMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.service.OurService;
import com.xfxmcy.spouse.vo.SMMemory;
import com.xfxmcy.spouse.vo.SMPreface;

/**
 * ClassName:OurServiceImpl
 * Function: service implement ours
 * Reason:	 service implement ours
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月11日		下午4:35:35
 *
 * @see 	 
 */
@Transactional
@Service
public class OurServiceImpl implements OurService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FavoriteServiceImpl.class);
	
	/*mapper*/
	@Resource
	private SMPrefaceMapper prefaceMapper;
	
	@Resource
	private SMMemoryMapper	smMemoryMapper;

	
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	public SpouseGrid queryOursPaged(QueryParam param){
		SpouseGrid grid = new SpouseGrid();
		/*preface model*/
		if(SpouseConstant.Ours.OUR_MODEL_PREFACE.equals(param.getQueryType())){
			List<SMPreface>	list = prefaceMapper.queryPrefacePaged(param);
			grid.setGrid(prefaceMapper.queryCountPreface(param), list);
		}
		/*ours model*/
		else if(SpouseConstant.Ours.OUR_MODEL_OURS.equals(param.getQueryType())){
			//list = smVideoMapper.queryVideoPaged(param);
			//grid.setGrid(smVideoMapper.queryCountVideo(param), list);
		}
		/*memory model*/
		else if(SpouseConstant.Ours.OUR_MODEL_MEMORY.equals(param.getQueryType())){
			List<SMMemory> list = smMemoryMapper.queryMemoryPaged(param);
			grid.setGrid(smMemoryMapper.queryCountMemory(param), list);
		}
		
		return grid;
	}



	@Override
	public Object persistOurs(Object t , String queryType) {
		
		if(SpouseConstant.Ours.OUR_MODEL_PREFACE.equals(queryType)){
			prefaceMapper.insertSelective((SMPreface)t);
		}
		/*ours model*/
		else if(SpouseConstant.Ours.OUR_MODEL_OURS.equals(queryType)){
		}
		/*memory model*/
		else if(SpouseConstant.Ours.OUR_MODEL_MEMORY.equals(queryType)){
		}
		
		return t ;
	}



	@Override
	public Object mergeOurs(Object t, String queryType) {
		
		if(SpouseConstant.Ours.OUR_MODEL_PREFACE.equals(queryType)){
			prefaceMapper.updateByPrimaryKeySelective((SMPreface)t);
		}
		/*ours model*/
		else if(SpouseConstant.Ours.OUR_MODEL_OURS.equals(queryType)){
		}
		/*memory model*/
		else if(SpouseConstant.Ours.OUR_MODEL_MEMORY.equals(queryType)){
		}
		return t;
		
	}



	@Override
	public void deleteOurs(String key, QueryParam queryType) {
		
		if(SpouseConstant.Ours.OUR_MODEL_PREFACE.equals(queryType.getQueryType())){
			prefaceMapper.deleteByPrimaryKey(key);
		}
		/*ours model*/
		else if(SpouseConstant.Ours.OUR_MODEL_OURS.equals(queryType.getQueryType())){
		}
		/*memory model*/
		else if(SpouseConstant.Ours.OUR_MODEL_MEMORY.equals(queryType.getQueryType())){
		}
		
	}



	@Override
	public String closeOurs(String key, QueryParam param) {
		
		if(SpouseConstant.Ours.OUR_MODEL_PREFACE.equals(param.getQueryType())){
			SMPreface preface = new SMPreface();
			preface.setId(key);
			preface.setFlag("0");
			prefaceMapper.updateByPrimaryKeySelective(preface);
			return "1";
				
		}
		/*ours model*/
		else if(SpouseConstant.Ours.OUR_MODEL_OURS.equals(param.getQueryType())){
		}
		/*memory model*/
		else if(SpouseConstant.Ours.OUR_MODEL_MEMORY.equals(param.getQueryType())){
		}
		return null ;
		
	}



	
	@Override
	public String openOurs(String key, QueryParam param) {
		
		if(SpouseConstant.Ours.OUR_MODEL_PREFACE.equals(param.getQueryType())){
			param.setId(key);
			List<SMPreface> list = prefaceMapper.selectOpenedInModel(param);
			if(null != list && list.size() > 0)
				return "0";
			SMPreface preface = new SMPreface();
			preface.setId(key);
			preface.setFlag("1");
			prefaceMapper.updateByPrimaryKeySelective(preface);
			return "1";
				
		}
		/*ours model*/
		else if(SpouseConstant.Ours.OUR_MODEL_OURS.equals(param.getQueryType())){
		}
		/*memory model*/
		else if(SpouseConstant.Ours.OUR_MODEL_MEMORY.equals(param.getQueryType())){
		}
		return null ;
		
	}






}

