/**
 * FavoriteServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： implement for favorite service
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月10日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SMFavoriteMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.service.FavoriteService;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.vo.SMFavorite;

/**
 * ClassName:FavoriteServiceImpl
 * Function: implement for favorite service
 * Reason:	 implement for favorite service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月10日		下午10:49:22
 *
 * @see 	 
 */
@Transactional
@Service
public class FavoriteServiceImpl implements FavoriteService {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FavoriteServiceImpl.class);
	
	/*mapper*/
	@Resource
	private SMFavoriteMapper favoriteMapper; 
	
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SpouseGrid queryTreeGridFavorite(QueryParam param ,SessionUser user) {
		SpouseGrid grid = new SpouseGrid();
		List<SMFavorite> list = null ;
		List<SMFavorite> result = null ;
		/*query treegrid*/
		if(SpouseConstant.Favorite.QUERY_TREEGRID_PAGED.equals(param.getQueryType()) && "false".equals( param.getIsFilter())){
			/*filter*/
			if(null != user && null != user.getUserId() && !"".equals(user.getUserId())){
				param.setTreeRootId(user.getUserId());
			}
			/*query paged the direct children for the root*/
			list = favoriteMapper.queryFavoritePaged(param);
			/*null  only show the root*/
			if(null == list || 0 == list.size()){
				list = new ArrayList<SMFavorite>();
				/*root*/
				SMFavorite sm = favoriteMapper.selectByPrimaryKey(param.getTreeRootId());
				if(null != sm){
					list.add(sm);
				}
				grid.setGrid(1l,list);
			}
			/*append parent and children*/
			else{
				result = new ArrayList<SMFavorite>();
				/*赋值*/
				for(SMFavorite smFavorite : list){
					result.add(smFavorite);
				}
				for (SMFavorite smFavorite : list) {
					result = this.appendChildren(result , smFavorite);
				}
				result = this.appendParent(result);
				grid.setGrid(favoriteMapper.queryTotalFavorite(param),result);
			}
			//this.convertFavoriteTreeNode(list);
			logger.info("favorite constucted successfully");
		}
		/*filter search*/
		else if(SpouseConstant.Favorite.QUERY_TREEGRID_PAGED.equals(param.getQueryType()) && "true" .equals( param.getIsFilter())){
			if(null != user && null != user.getUserId() && !"".equals(user.getUserId())){
				param.setOwner(user.getUserId());
			}
			param.setLikeNameFirst("%"+param.getLikeNameFirst()+"%");
			/*filtered query was setted 1 temporary*/
			param.setRows(1);
			/*query paged the direct children for the root*/
			list = favoriteMapper.queryFavoritePaged(param);
			/*null  only show the root*/
			if(null == list || 0 == list.size()){
				list = new ArrayList<SMFavorite>();
				/*root*/
				SMFavorite sm = favoriteMapper.selectByPrimaryKey(user.getUserId());
				if(null != sm){
					list.add(sm);
				}
				grid.setGrid(1l,list);
			}
			/*append parent */
			else{
				/*赋值*/
				list = this.appendParent(list);
				grid.setGrid(favoriteMapper.queryTotalFavorite(param),list);
			}
		}
		return grid;
	}

	
	/**
	 * 
	 * appendParent: append the parent for all the children
	 *
	 * @param list	 children
	 * @return		 list	
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月11日 		cy
	 */
	private List<SMFavorite> appendParent(List<SMFavorite> list) {
		
		/*null or root*/
		if(null == list||0 == list.size()||null == list.get(0).getPid())
		{
			return list;
		}
		/*append parent*/
		else{
			/*the parent for the first point*/
			SMFavorite sm = favoriteMapper.selectByPrimaryKey(list.get(0).getPid());
			/* add prior parent*/
			list.add(0, sm);
			/*since the list of the point already is the direct child for the root,
			 * no need to use follows code*/
			//this.appendParent(list);
		}
		
		return this.appendParent(list);
		
	}



	/**
	 * 
	 * appendChildren: append all the children for a parent
	 *
	 * @param list	   the list of the point
	 * @param smFavorite	parent
	 * @return				list
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月11日 		cy
	 */
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	private List<SMFavorite> appendChildren(List<SMFavorite> list,
			SMFavorite smFavorite) {
		if(null == smFavorite)  
			return null;
		/*param*/
		QueryParam param = new QueryParam();
		param.setPage(null);
		/*set rootId*/
		param.setTreeRootId(smFavorite.getId());
		List<SMFavorite> smFavoriteList = favoriteMapper.queryFavoritePaged(param);
		/*no child*/
		if(null == smFavoriteList || 0 == smFavoriteList.size()){
			return list;
		}
		else{
			for (SMFavorite sm : smFavoriteList) {
				/*add*/
				list.add(sm);
				/*iterate the list*/
				this.appendChildren(list, sm);
			}
		}
		return list;
		
	}

	
	@Override
	public SMFavorite persistenceFavorite(QueryParam param, SMFavorite favorite) {
		Map<String,Object> map = new HashMap<String,Object>();
		/*simple save*/
		if(SpouseConstant.SIMPLE_SAVE.equals(param.getQueryType())){
			favorite.setId(IdUtil.generaterThrityTwo());
			favorite.setCreatetime(new Date());
			/*select max seq*/
			map.put(SpouseConstant.SQL_PARENT_KEY, favorite.getPid());
			Integer result = 9;
			try{
				result = favoriteMapper.queryMaxSeq(map).intValue();
			}catch(RuntimeException e){
			}	
			favorite.setSeq(result+1);
			favoriteMapper.insertSelective(favorite);
		}
		return favorite;
		
	}


	@Override
	public SMFavorite mergeFavorite(QueryParam param, SMFavorite favorite) {
		/*simple update*/
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			favoriteMapper.updateByPrimaryKeySelective(favorite);
		}
		return favorite;
		
	}


	@Override
	public void deleteFavorite(QueryParam param, String key) {
		/*param*/
		Map<String,Object> mapParam = new HashMap<String,Object>();
		/*simple delete*/
		if(SpouseConstant.SIMPLE_DELETE.equals(param.getQueryType())){
			mapParam.put(SpouseConstant.SQL_PRIMARY_KEY, key);
			favoriteMapper.deleteByPrimaryKey(mapParam);
		}
		
	}
	
	
}

