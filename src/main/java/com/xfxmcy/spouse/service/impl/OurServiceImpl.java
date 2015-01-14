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
}

