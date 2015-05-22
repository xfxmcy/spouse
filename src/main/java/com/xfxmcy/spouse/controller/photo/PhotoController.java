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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.PhotoService;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.util.SpouseUtil;
import com.xfxmcy.spouse.vo.SMPhoto;

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
	/**
	 * 
	 * queryPhotosInHisModel:query admin's photo in his model at front
	 *
	 * @param param			param
	 * @param grid			result
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月19日 		cy
	 */
	@RequestMapping("/queryHisPhotoInFront")
	@ResponseBody
	public SpouseGrid queryPhotosInHisModel(QueryParam param ,SpouseGrid grid,HttpServletRequest request){
		try{
			param.setOwner(ResourceUtil.getAdminId());
			grid = photoServiceImpl.doQueryMyPhoto(param);	
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	} 
	/**
	 * 
	 * queryPhotosInHerModel:query administrator's photo in his model at front
	 *
	 * @param param		param 
	 * @param grid		result
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月19日 		cy
	 */
	@RequestMapping("/queryHerPhotoInFront")
	@ResponseBody
	public SpouseGrid queryPhotosInHerModel(QueryParam param ,SpouseGrid grid,HttpServletRequest request){
		try{
			param.setOwner(ResourceUtil.getSuperAdminId());
			grid = photoServiceImpl.doQueryMyPhoto(param);	
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	} 
	/**
	 * 
	 * saveMyPhoto:save my photo
	 *
	 * @param param	param
	 * @param info  response  info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月18日 		cy
	 */
	@RequestMapping("/photoPersistent")
	@ResponseBody
	public SystemicInfo saveMyPhoto(SMPhoto smPhoto,SystemicInfo info,HttpServletRequest request){
		try{
			SessionUser user = SpouseUtil.getSessionUser(request);
			if(null != user){
				smPhoto.setAuthorId(user.getUserId());
				photoServiceImpl.doSaveMyPhoto(smPhoto);
				info.setSuccess(true, "success");
			}else
				info.setSuccess(false, "用户session失效,请重新登录后继续上传!");
			
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
	
	/**
	 * 
	 * updateMyPhoto: update my photo about title
	 *
	 * @param smPhoto smPhoto
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月22日 		cy
	 */
	@RequestMapping("/photoMerge")
	@ResponseBody
	public SystemicInfo updateMyPhoto(SMPhoto smPhoto,SystemicInfo info,HttpServletRequest request){
		try{
			SessionUser user = SpouseUtil.getSessionUser(request);
			if(null != user){
				photoServiceImpl.doUpdateMyPhoto(smPhoto);
				info.setSuccess(true, "success");
			}else
				info.setSuccess(false, "用户session失效,请重新登录后继续上传!");
			
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
	/**
	 * 
	 * deleteMyPhoto:delete my photo
	 *
	 * @param key		id	pk
	 * @param info
	 * @param request	request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月22日 		cy
	 */
	@RequestMapping("/photoRemove/{key}")
	@ResponseBody
	public SystemicInfo deleteMyPhoto(@PathVariable String key,QueryParam param ,SystemicInfo info,HttpServletRequest request){
		try{
			SessionUser user = SpouseUtil.getSessionUser(request);
			if(null != user){
				param.setId(key);
				param.setQueryType(SpouseConstant.SIMPLE_DELETE);
				photoServiceImpl.doDeleteMyPhoto(param);
				info.setSuccess(true, "success");
			}else
				info.setSuccess(false, "用户session失效,请重新登录后继续上传!");
			
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
	/**
	 * 
	 * topMyPhoto:top for the photo
	 *
	 * @param key
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年5月22日 		cy
	 */
	@RequestMapping("/photoTop/{key}")
	@ResponseBody
	public SystemicInfo topMyPhoto(@PathVariable String key,QueryParam param ,SystemicInfo info,HttpServletRequest request){
		try{
			SessionUser user = SpouseUtil.getSessionUser(request);
			if(null != user){
				param.setId(key);
				param.setQueryType(SpouseConstant.SIMPLE_UPDATE);
				photoServiceImpl.doTopMyPhoto(param);
				info.setSuccess(true, "success");
			}else
				info.setSuccess(false, "用户session失效,请重新登录后继续上传!");
			
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
}

