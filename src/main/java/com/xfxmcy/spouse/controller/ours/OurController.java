/**
 * OurController.java
 * com.xfxmcy.spouse.controller.ours
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月9日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.ours;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.vo.SMFavorite;
import com.xfxmcy.spouse.vo.SPEmployer;

/**
 * ClassName:OurController
 * Function: ours controller
 * Reason:	 ours controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月9日		上午11:21:49
 *
 * @see 	 
 */
@Controller  
@RequestMapping("/ours")
public class OurController {
	
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(OurController.class);
	
	
	/**
	 * 
	 * doUpdateEmployerInfo: update Our info
	 *
	 * @param param	param
	 * @param employer	employer
	 * @param info		result
	 * @param request	request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月9日 		cy
	 */
	@RequestMapping("/employInfoMerge")
	@ResponseBody
	public SystemicInfo doUpdateEmployerInfo(QueryParam param , SPEmployer employer ,SystemicInfo info,HttpServletRequest request){
		
		return info;
	}
	
	/**
	 * 
	 * doQueryPrefaces:query prefaces
	 *
	 * @param param
	 * @param grid
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月9日 		cy
	 */
	@RequestMapping("/prefaceQuery")
	@ResponseBody
	public SpouseGrid doQueryPrefaces(QueryParam param , SpouseGrid grid ,HttpServletRequest request){
		
		return grid;
	}
	/**
	 * 
	 * doQueryMemory:query preMemory
	 *
	 * @param param
	 * @param grid
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月9日 		cy
	 */
	@RequestMapping("/memoryQuery")
	@ResponseBody
	public SpouseGrid doQueryMemory(QueryParam param , SpouseGrid grid ,HttpServletRequest request){
		
		return grid;
	}
	
	
}

