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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.SyHomeService;

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
	
	@RequestMapping("/marker")
	@ResponseBody
	public SystemicInfo refreshIndexPage(QueryParam param,SystemicInfo sysInfo,HttpServletRequest request) {
		try{
			param.setMemoFirst(request.getRealPath("/"));
			syHomeServiceImpl.constructPageTemplate(param);
			sysInfo.setMessage("successful");
		}catch(RuntimeException e){
			logger.error(e.getMessage());
			sysInfo.setSuccess(false,"password is error");
		}
		return sysInfo;
	}
}

