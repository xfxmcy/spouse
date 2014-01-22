/**
 * FavoriteController.java
 * com.xfxmcy.spouse.controller.my
 *
 * Function： favorite controller 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月10日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.my;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.controller.menu.MenuController;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.FavoriteService;
import com.xfxmcy.spouse.util.SpouseUtil;
import com.xfxmcy.spouse.vo.SMFavorite;

/**
 * ClassName:FavoriteController
 * Function: favorite controller
 * Reason:	 favorite controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月10日		下午5:26:30
 *
 * @see 	 
 */
@Controller  
@RequestMapping("/favorite")  
public class FavoriteController {
	
	
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MenuController.class);
	
	/*service*/
	@Resource
	private FavoriteService	favoriteServiceImpl ;
	
	/**
	 * 
	 * favoritePageTransforming: favorite page's be transform
	 *
	 * @param path		virtual  path
	 * @return			real     path
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月12日 		cy
	 */
	@RequestMapping("/manage/{path}")
	public String favoritePageTransforming(@PathVariable String path) {
		String returnPath = "/index";
		/*enter managing page*/
		if("main".equals(path)){
			returnPath = SpouseConstant.SystemicPage.FAVORITE_INDEX;
			logger.trace("sb wanna enter managerment");
		}
		return returnPath;
	}
	
	
	
	/**
	 * 
	 * doQuery: query the favorite
	 *
	 * @param param		param
	 * @param grid		grid
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月10日 		cy
	 */
	@RequestMapping("/favoriteQuery")
	@ResponseBody
	public SpouseGrid doQuery(QueryParam param , SpouseGrid grid ,HttpServletRequest request){
		try{
			grid = favoriteServiceImpl.queryTreeGridFavorite(param,SpouseUtil.getSessionUser(request));
			logger.info(grid);
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	}
	/**
	 * 
	 * doPersistentFavorite: persistent favorite		
	 *
	 * @param param			 query param
	 * @param favorite		 favorite	
	 * @param info			 result
	 * @return				 info
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月17日 		cy
	 */
	@RequestMapping("/favoritePersistent")
	@ResponseBody
	public SystemicInfo doPersistentFavorite(QueryParam param , SMFavorite favorite ,SystemicInfo info){
		try{
			favorite = favoriteServiceImpl.persistenceFavorite(param,favorite);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	/**
	 * 
	 * doMergeFavorite: merge favorite 
	 *
	 * @param param		query param
	 * @param favorite	favorite
	 * @param info		inform
	 * @return			info
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月17日 		cy
	 */
	@RequestMapping("/favoriteMerge")
	@ResponseBody
	public SystemicInfo doMergeFavorite(QueryParam param , SMFavorite favorite ,SystemicInfo info){
		try{
			favorite = favoriteServiceImpl.mergeFavorite(param, favorite);
			info.setSuccess(true, "success");
		}catch(Exception e){
			logger.error(e.getMessage());
			info.setSuccess(false, "system busy , please have a wait");
		}
			return info;
		} 
	/**
	 * 
	 * doDeleteFavorite:delete favorite
	 *
	 * @param param		query param
	 * @param favorite	favorite
	 * @param info		result
	 * @return			info
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月17日 		cy
	 */
	@RequestMapping("/favoriteDelete/{key}")
	@ResponseBody
	public SystemicInfo doDeleteFavorite(@PathVariable String key,QueryParam param , SystemicInfo info){
		try{
			favoriteServiceImpl.deleteFavorite(param, key);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
}

