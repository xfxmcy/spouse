/**
 * VideoServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： implement of video service 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年7月27日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SMVideoMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.service.VideoService;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.util.XmlComponent;
import com.xfxmcy.spouse.vo.SMVideo;

/**
 * ClassName:VideoServiceImpl
 * Function: implement of video service
 * Reason:	 implement of video service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年7月27日		下午8:57:25
 *
 * @see 	 
 */
@Transactional
@Service
public class VideoServiceImpl implements VideoService {

	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(VideoServiceImpl.class);
	
	/*mapper*/
	@Resource
	private SMVideoMapper smVideoMapper ;
	
	@Resource
	private XmlComponent xmlComponent;
	
	
	@Override
	public SMVideo persistVideo(QueryParam param , SMVideo smVideo) {
		if(SpouseConstant.SIMPLE_SAVE.equals(param.getQueryType())){
			smVideo.setId(IdUtil.generaterThrityTwo());
			smVideo.setCreateTime(new Date());
			smVideoMapper.insertSelective(smVideo);
		}
		return smVideo;

	}

	@Override
	public SMVideo mergeVideo(QueryParam param , SMVideo smVideo) {
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			smVideoMapper.updateSelective(smVideo);
		}
		return smVideo;

	}

	@Override
	public void deleteVideo(QueryParam param , String id) {
		if(SpouseConstant.SIMPLE_DELETE.equals(param.getQueryType())){
			smVideoMapper.deleteByPrimaryKey(id);
		}

	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SpouseGrid queryVideoPaged(QueryParam param) {
		SpouseGrid grid = new SpouseGrid();
		List<SMVideo> list = null ;
		if(SpouseConstant.SIMPLE_QUERY_PAGED.equals(param.getQueryType())){
			list = smVideoMapper.queryVideoPaged(param);
			grid.setGrid(smVideoMapper.queryCountVideo(param), list);
		}
		return grid;

	}

	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SMVideo queryVideoByPK(QueryParam param , String id) {
		if(SpouseConstant.SIMPLE_QUERY_ONLY.equals(param.getQueryType())){
			return smVideoMapper.selectByPrimaryKey(id);
		}
		return null ;
	}

	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public void contractMusicialTemplate(QueryParam param) {
		
		if(SpouseConstant.SIMPLE_QUERY_ONLY.equals(param.getQueryType())){
			 List<SMVideo> list = smVideoMapper.queryVideoPaged(param);
			 if(null == list || 0 == list.size())
				 return ;
			 Document doc = xmlComponent.createDocument(list);
			 xmlComponent.writeXmlFile(doc, param.getBaseUrl() + ResourceUtil.getMediaTempaltePath());
		}
		
	}

}

