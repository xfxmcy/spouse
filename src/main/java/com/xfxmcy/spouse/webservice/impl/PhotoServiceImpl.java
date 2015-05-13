/**
 * PhotoServiceImpl.java
 * com.xfxmcy.spouse.webservice
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年5月7日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.webservice.impl;

import java.util.List;

import com.xfxmcy.spouse.dao.SMPhotoMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SMPhoto;
import com.xfxmcy.spouse.webservice.PhotoWService;

import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebParam;
import javax.jws.soap.SOAPBinding.Style;
import javax.jws.soap.SOAPBinding;
/**
 * ClassName:PhotoServiceImpl
 * Function: TODO ADD FUNCTION
 * Reason:	 TODO ADD REASON
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年5月7日		下午1:22:12
 *
 * @see 	 
 */
@WebService(endpointInterface = "com.xfxmcy.spouse.webservice.PhotoWService")
public class PhotoServiceImpl implements PhotoWService {

	
	
	@Resource
	private SMPhotoMapper photoMapper;
	
	



	@Override
	public List<SMPhoto> queryMyPhotos(QueryParam param) {
		
		return photoMapper.selectPhotosBySelectivePages(param);
		
	}



	@Override
	public List<SMPhoto> queryHisPhotos(QueryParam param) {
		
		// TODO Auto-generated method stub
		return null;
		
	}

	

}

