/**
 * PhotoController.java
 * com.xfxmcy.spouse.controller.photo
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年4月17日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.photo;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.service.PhotoService;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.util.SpouseUtil;

/**
 * ClassName:PhotoController
 * Function: photo model controller
 * Reason:	 photo model controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年4月17日		下午2:46:50
 *
 * @see 	 
 */
@Controller  
@RequestMapping("/photo")
public class PhotoController {
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(PhotoController.class);
	
	@Resource
	private PhotoService photoServiceImpl;
	 
	
	/**
	 * 
	 * queryMyPhoto: query MyPhoto on backGround
	 *
	 * @param param	 param
	 * @param grid   grid
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月14日 		cy
	 */
	@RequestMapping("/queryMyPhoto")
	@ResponseBody
	public SpouseGrid queryMyPhoto(QueryParam param ,SpouseGrid grid,HttpServletRequest request){
		try{
			SessionUser user = SpouseUtil.getSessionUser(request);
			if(null != user)
				param.setOwner(user.getUserId());
			grid = photoServiceImpl.doQueryMyPhoto(param);	
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	} 
	
	
	/**
	 * 
	 * queryHisPhoto:query his photo on backGround
	 *
	 * @param param		param
	 * @param grid		grid
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月14日 		cy
	 */
	@RequestMapping("/queryHisPhoto")
	@ResponseBody
	public SpouseGrid queryHisPhoto(QueryParam param ,SpouseGrid grid,HttpServletRequest request){
		try{
			SessionUser user = SpouseUtil.getSessionUser(request);
			if(null != user)
				param.setOwner(user.getUserId());
			grid = photoServiceImpl.doQueryHisPhoto(param);	
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	} 
}

