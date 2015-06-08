/**
 * PhotoServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月20日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SMPhotoMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.service.PhotoService;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.vo.SMPhoto;

/**
 * ClassName:PhotoServiceImpl
 * Function: the implements of photo service
 * Reason:	 the implements of photo service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年4月20日		上午9:45:20
 *
 * @see 	 
 */
@Transactional
@Service
public class PhotoServiceImpl implements PhotoService {
	
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PhotoServiceImpl.class);
	
	@Resource
	private SMPhotoMapper photoMapper;

	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SpouseGrid doQueryMyPhoto(QueryParam param) {
		SpouseGrid grid = new SpouseGrid();
		List<SMPhoto> result = null;
		/**
		 *  query my photo paged 
		 */
		if(SpouseConstant.Photo.QUERY_MYPHOTO_PAGED_BG.equals(param.getQueryType())){
			result = photoMapper.doQueryMyPhoto(param);
			grid.setGrid(photoMapper.doQueryTotalMyPhoto(param),result);
		} 
		
		return grid;
		
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SpouseGrid doQueryHisPhoto(QueryParam param) {
		SpouseGrid grid = new SpouseGrid();
		List<SMPhoto> result = null;
		/**
		 *  query my photo paged 
		 */
		if(SpouseConstant.Photo.QUERY_MYPHOTO_PAGED_BG.equals(param.getQueryType())){
			result = photoMapper.doQueryHisPhoto(param);
			grid.setGrid(photoMapper.doQueryTotalHisPhoto(param),result);
		} 
		return grid;
		
	}

	@Override
	public SMPhoto doSaveMyPhoto(SMPhoto smPhoto) {
		
		if(SpouseConstant.SIMPLE_SAVE.equals(smPhoto.getQueryType())){
			smPhoto.setId(IdUtil.generaterThrityTwo());
			smPhoto.setCreatetime(new Date());
			smPhoto.setTitle("");
			smPhoto.setSeq((photoMapper.doQueryMyMaxSeq(smPhoto)+1)+"");
			photoMapper.insertSelective(smPhoto);
		} 
		return smPhoto;
		
	}

	@Override
	public void doTopMyPhoto(QueryParam param) {
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			photoMapper.topByPrimaryKey(param);
		}
		
	}

	@Override
	public void doDeleteMyPhoto(QueryParam param) {
		if(SpouseConstant.SIMPLE_DELETE.equals(param.getQueryType())){
			photoMapper.deleteByPrimaryKey(param.getId());
		}
		
		
	}

	@Override
	public void doUpdateMyPhoto(SMPhoto smPhoto) {
		
		if(SpouseConstant.SIMPLE_UPDATE.equals(smPhoto.getQueryType())){
			photoMapper.updateByPrimaryKeySelective(smPhoto);
		}
		
	}
	
	
	
	
}

