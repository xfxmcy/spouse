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

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.dao.SMPhotoMapper;
import com.xfxmcy.spouse.dao.SPEmployerMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.service.PhotoService;
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
public class PhotoServiceImpl implements PhotoService {
	
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PhotoServiceImpl.class);
	
	@Resource
	private SMPhotoMapper photoMapper;
	
	@Override
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	public String queryMyPhotosForBackGround(QueryParam param) {
		
		List<SMPhoto> result = photoMapper.selectPhotosBySelective(param);
		
		return null;
		
	}
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public String queryHisPhotosForBackGround(QueryParam param) {
		
		
		return null;
		
	}
	
	
}

