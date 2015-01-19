/**
 * PrefaceController.java
 * com.xfxmcy.spouse.controller.ours
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月11日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.ours;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.OurService;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.util.SpouseUtil;
import com.xfxmcy.spouse.vo.SMPreface;
import com.xfxmcy.spouse.vo.Tasks;

/**
 * ClassName:PrefaceController
 * Function: preface controller
 * Reason:	 preface controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月11日		下午4:29:27
 *
 * @see 	 
 */
@Controller  
@RequestMapping("/preface")
public class PrefaceController {
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(OurController.class);
	/*service*/
	@Resource
	private OurService<SMPreface> ourServiceImpl ;
	
	 
	
	
	/**
	 * 
	 * doPersistentPreface:persistence a preface 
	 *
	 * @param smPreface
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月16日 		cy
	 */
	@RequestMapping("/prefacePersistent")
	@ResponseBody
	public SystemicInfo doPersistentPreface(SMPreface smPreface,SystemicInfo info,HttpServletRequest request){
		try{
			smPreface.setId(IdUtil.generaterThrityTwo());
			smPreface.setUserId(SpouseUtil.getSessionUser(request).getUserId());			
			SMPreface result = ourServiceImpl.persistOurs(smPreface , smPreface.getQueryType());
			info.setSuccess(true, "success");
			info.setResult(result);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	/**
	 * 
	 * doMergePreface: merge preface
	 *
	 * @param smPreface	preface
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月17日 		cy
	 */
	@RequestMapping("/prefaceMerge")
	@ResponseBody
	public SystemicInfo doMergePreface(SMPreface smPreface,SystemicInfo info,HttpServletRequest request){
		try{
			SMPreface result = ourServiceImpl.mergeOurs(smPreface,smPreface.getQueryType());
			info.setSuccess(true, "success");
			info.setResult(result);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	
	/**
	 * 
	 * doDeletePreface:delete a preface 
	 *
	 * @param key
	 * @param info
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月17日 		cy
	 */
	@RequestMapping("/prefaceDelete/{key}")
	@ResponseBody
	public SystemicInfo doDeletePreface(@PathVariable String key,SystemicInfo info,QueryParam param){
		try{
			ourServiceImpl.deleteOurs(key, param);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	/**
	 * 
	 * doOpenPreface:open preface
	 *
	 * @param key	key
	 * @param info
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月18日 		cy
	 */
	@RequestMapping("/prefaceOpen/{key}")
	@ResponseBody
	public SystemicInfo doOpenPreface(@PathVariable String key,SystemicInfo info,QueryParam param){
		try{
			String result = ourServiceImpl.openOurs(key, param);
			if("1".equals(result))
				info.setSuccess(true, "启用成功");
			if("0".equals(result))
				info.setSuccess(false, "该model下已经启用,请先停用");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}  
	/**
	 * 
	 * doClosePreface:close a preface
	 *
	 * @param key
	 * @param info
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月19日 		cy
	 */
	@RequestMapping("/prefaceClose/{key}")
	@ResponseBody
	public SystemicInfo doClosePreface(@PathVariable String key,SystemicInfo info,QueryParam param){
		try{
			String result = ourServiceImpl.closeOurs(key, param);
			info.setSuccess(true, "停用成功");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}  
}

