/**
 * MemoryController.java
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
import com.xfxmcy.spouse.util.SpouseUtil;
import com.xfxmcy.spouse.vo.SMMemory;
import com.xfxmcy.spouse.vo.SMPreface;

/**
 * ClassName:MemoryController
 * Function: memory controller
 * Reason:	 memory controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月11日		下午4:30:11
 *
 * @see 	 
 */
@Controller  
@RequestMapping("/memory")
public class MemoryController {
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(OurController.class);
	/*service*/
	@Resource
	private OurService<SMMemory> ourServiceImpl ;
	
	/**
	 * 
	 * doPersistentMemory:save a memory 
	 *
	 * @param smMemory
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月21日 		cy
	 */
	@RequestMapping("/memoryPersistent")
	@ResponseBody
	public SystemicInfo doPersistentMemory(SMMemory smMemory,SystemicInfo info,HttpServletRequest request){
		try{
			smMemory.setId(IdUtil.generaterThrityTwo());
			smMemory.setUserId(SpouseUtil.getSessionUser(request).getUserId());			
			SMMemory result = ourServiceImpl.persistOurs(smMemory ,smMemory.getQueryType());
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
	 * doMergeMemory:merge a memory 
	 *
	 * @param smMemory memory
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月21日 		cy
	 */
	@RequestMapping("/memoryMerge")
	@ResponseBody
	public SystemicInfo doMergeMemory(SMMemory smMemory,SystemicInfo info,HttpServletRequest request){
		try{
			SMMemory result = ourServiceImpl.mergeOurs(smMemory,smMemory.getQueryType());
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
	 * doDeleteMemory:delete a memory
	 *
	 * @param key
	 * @param info
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月21日 		cy
	 */
	@RequestMapping("/memoryDelete/{key}")
	@ResponseBody
	public SystemicInfo doDeleteMemory(@PathVariable String key,SystemicInfo info,QueryParam param){
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
	 * doOpenMemory:启	Memory
	 *
	 * @param key
	 * @param info
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月21日 		cy
	 */
	@RequestMapping("/memoryOpen/{key}")
	@ResponseBody
	public SystemicInfo doOpenMemory(@PathVariable String key,SystemicInfo info,QueryParam param){
		try{
			ourServiceImpl.openOurs(key, param);
			info.setSuccess(true, "操作成功");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}  
	
	/**
	 * 
	 * doCloseMemory:停	Memory
	 *
	 * @param key
	 * @param info
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月21日 		cy
	 */
	@RequestMapping("/memoryClose/{key}")
	@ResponseBody
	public SystemicInfo doCloseMemory(@PathVariable String key,SystemicInfo info,QueryParam param){
		try{
			ourServiceImpl.closeOurs(key, param);
			info.setSuccess(true, "操作成功");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}  
}

