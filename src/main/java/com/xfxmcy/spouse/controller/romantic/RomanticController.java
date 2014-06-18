/**
 * RomanticController.java
 * com.xfxmcy.spouse.controller.romantic
 *
 * Function： romantic controller 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年5月2日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.romantic;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.RomanticService;
import com.xfxmcy.spouse.util.SpouseUtil;
import com.xfxmcy.spouse.vo.SMFavorite;
import com.xfxmcy.spouse.vo.SrRomanticWithBLOBs;

/**
 * ClassName:RomanticController
 * Function: romantic controller
 * Reason:	 romantic controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月2日		下午12:39:33
 *
 * @see 	 
 */
@Controller  
@RequestMapping("/romantic")
public class RomanticController {
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(RomanticController.class);
	@Resource
	private RomanticService romanticServiceImpl; 
	/**
	 * 
	 * doPersistentRomantic: persist a romantic
	 *
	 * @param param
	 * @param romanticBLOBS
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月2日 		cy
	 */
	@RequestMapping("/romanticPersistent")
	@ResponseBody
	public SystemicInfo doPersistentRomantic(QueryParam param , SrRomanticWithBLOBs romanticBLOBS,SystemicInfo info,HttpServletRequest request){
		try{
			romanticBLOBS = romanticServiceImpl.doPersistRomantic(param,romanticBLOBS);
			info.setSuccess(true, "success");
			info.setResult(romanticBLOBS);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	/**
	 * 
	 * doUpdateRomantic: update romantic
	 *
	 * @param param
	 * @param romanticBLOBS
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月2日 		cy
	 */
	@RequestMapping("/romanticUpdate")
	@ResponseBody
	public SystemicInfo doUpdateRomantic(QueryParam param , SrRomanticWithBLOBs romanticBLOBS,SystemicInfo info,HttpServletRequest request){
		try{
			romanticBLOBS = romanticServiceImpl.doUpdateRomantic(param,romanticBLOBS);
			info.setSuccess(true, "success");
			info.setResult(romanticBLOBS);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
	
	/**
	 * 
	 * doDeleteRomantic: delete romantic
	 *
	 * @param param
	 * @param romanticBLOBS
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月2日 		cy
	 */
	@RequestMapping("/romanticDelete/{key}")
	@ResponseBody
	public SystemicInfo doDeleteRomantic(@PathVariable String key,QueryParam param , SrRomanticWithBLOBs romanticBLOBS,SystemicInfo info,HttpServletRequest request){
		try{
			romanticServiceImpl.doDeleteRomantic(param,key);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
}

