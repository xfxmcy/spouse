/**
 * EmployerController.java
 * com.xfxmcy.spouse.controller.system
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月12日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.system;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.EmployerService;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.vo.SPEmployer;

/**
 * ClassName:EmployerController
 * Function: employer model
 * Reason:	 employer model
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月12日		下午4:14:32
 *
 * @see 	 
 */
@Controller
@RequestMapping("/employer")
public class EmployerController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(EmployerController.class);
	
	@Resource
	private EmployerService employerServiceImpl;
	
	/**
	 * 
	 * doUpdateEmployer:update employer
	 *
	 * @param sysInfo
	 * @param employer
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月12日 		cy
	 */
	@RequestMapping("/employerMerge")
	@ResponseBody
	public SystemicInfo doMergeEmployer(SystemicInfo info,SPEmployer employer,HttpServletRequest request) {
		try{
			employer = employerServiceImpl.mergeEmployer(employer);
			Object obj = request.getSession().getAttribute((ResourceUtil.getSessionInfo()));
			if(null != obj && null != employer.getPath()){
				SessionUser sessionInfo = (SessionUser)obj;
				sessionInfo.setPhoto(request.getSession().getServletContext().getInitParameter("upload_path") + employer.getPath());
			}
			info.setSuccess(true, "success");
			info.setResult(employer);
		}catch(Exception e){
			logger.error(e.getMessage());
			info.setSuccess(false, "system busy , please have a wait");
		}
			return info;
	}
	/**
	 * 
	 * doMergePassWd:update passWd
	 *
	 * @param info
	 * @param employer
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年6月8日 		cy
	 */
	@RequestMapping("/passWdMerge")
	@ResponseBody
	public SystemicInfo doMergePassWd(SystemicInfo info,SPEmployer employer) {
		try{
			employer = employerServiceImpl.mergeEmployerPassWd(employer);
			if(null != employer){
				info.setSuccess(true, "success");
				info.setResult(employer);
			}
			else
				info.setSuccess(false,"password is error");
			
			
		}catch(Exception e){
			logger.error(e.getMessage());
			info.setSuccess(false, "system busy , please have a wait");
		}
		return info;
	}
	
	/**
	 * 
	 * queryAdministrator: query administrator for indexPage
	 *
	 * @param param
	 * @param grid
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年6月8日 		cy
	 */
	@RequestMapping("/queryAdmin")
	@ResponseBody
	public SpouseGrid queryAdministrator(QueryParam param , SpouseGrid grid){
		try{
			grid = employerServiceImpl.queryAdministrators(param);
			logger.info(grid);
		}catch(Exception e){
			logger.error(e.getMessage());
		}
		return grid;
	}
}

