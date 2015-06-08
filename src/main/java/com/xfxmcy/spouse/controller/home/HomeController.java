/**
 * HomeController.java
 * com.xfxmcy.spouse.controller.home
 *
 * Function： page controller
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年3月5日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.home;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.pojo.SJWish;
import com.xfxmcy.spouse.service.SyHomeService;
import com.xfxmcy.spouse.vo.SYHome;

/**
 * ClassName:HomeController
 * Function: page controller
 * Reason:	 page controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年3月5日		下午10:18:10
 *
 * @see 	 
 */
@Controller
@RequestMapping("/home")
public class HomeController {

	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(HomeController.class);
	/*home service*/
	@Resource
	private SyHomeService syHomeServiceImpl;
	
	/**
	 * 
	 * refreshIndexPage: refresh index
	 *
	 * @param param		param
	 * @param sysInfo	systemic info
	 * @param request	request
	 * @return			systemic info	
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年4月16日 		cy
	 */
	@RequestMapping("/marker")
	@ResponseBody
	public SystemicInfo refreshIndexPage(QueryParam param,SystemicInfo sysInfo,HttpServletRequest request) {
		try{
			param.setMemoFirst(request.getSession().getServletContext().getRealPath("/"));
			syHomeServiceImpl.constructPageTemplate(param);
			sysInfo.setMessage("successful");
		}catch(RuntimeException e){
			logger.error(e.getMessage());
			sysInfo.setSuccess(false,SpouseConstant.Alert.SYSTEM_ERROR);
		}
		return sysInfo;
	}
	
	/**
	 * 
	 * doQuery: do query homePage
	 *
	 * @param param	param
	 * @param grid	grid
	 * @return		grid
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年4月16日 		cy
	 */
	@RequestMapping("/homeQuery")
	@ResponseBody
	public SpouseGrid doQuery(QueryParam param , SpouseGrid grid ){
		try{
			grid = syHomeServiceImpl.doQuery(param);	
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	}
	
	/**
	 * 
	 * doPersistentFavorite: persistence a  home photo
	 *
	 * @param param		param
	 * @param home      home photo
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年6月19日 		cy
	 */
	@RequestMapping("/homePersistent")
	@ResponseBody
	public SystemicInfo doPersistentHomePhoto(QueryParam param , SYHome syHome ,SystemicInfo info,HttpServletRequest request){
		try{
			syHome = syHomeServiceImpl.persistentHomePhoto(param,syHome);
			info.setSuccess(true, "success");
			info.setResult(syHome);
		}catch(Exception e){
			info.setSuccess(false, SpouseConstant.Alert.SYSTEM_ERROR);
			logger.error(e.getMessage());
		}
		return info;
	} 
	/**
	 * 
	 * doMergeHomePhoto:merge a home photo
	 *
	 * @param param
	 * @param syHome
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年6月19日 		cy
	 */
	@RequestMapping("/homeMerge")
	@ResponseBody
	public SystemicInfo doMergeHomePhoto(QueryParam param , SYHome syHome ,SystemicInfo info,HttpServletRequest request){
		try{
			syHome = syHomeServiceImpl.mergeHomePhoto(param,syHome);
			info.setResult(syHome);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, SpouseConstant.Alert.SYSTEM_ERROR);
			logger.error(e.getMessage());
		}
		return info;
	}
	
	
	/**
	 * 
	 * doDeleteHomePhoto: delete a homtPhoto
	 *
	 * @param param
	 * @param syHome
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年6月19日 		cy
	 */
	@RequestMapping("/homeDelete/{key}")
	@ResponseBody
	public SystemicInfo doDeleteHomePhoto(@PathVariable String key,QueryParam param , SYHome syHome ,SystemicInfo info,HttpServletRequest request){
		try{
			syHome.setId(key);
			syHomeServiceImpl.deleteHomePhoto(param, syHome);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, SpouseConstant.Alert.SYSTEM_ERROR);
			logger.error(e.getMessage());
		}
		return info;
	}
	/**
	 * 
	 * doDreamAtBirthday:(这里用一句话描述这个方法的作用)
	 *
	 * @param param
	 * @param wish
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年9月7日 		cy
	 */
	@RequestMapping("/dreamBirthday")
	@ResponseBody
	public SystemicInfo doContactUs(QueryParam param , SJWish wish,SystemicInfo info,HttpServletRequest request){
		try{
			wish.setSubject("guest");
			syHomeServiceImpl.doContactUs(param,wish);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, SpouseConstant.Alert.SYSTEM_ERROR);
			logger.error(e.getMessage());
		}
		return info;
	}
}

