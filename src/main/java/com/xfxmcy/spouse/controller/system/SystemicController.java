/**
 * SystemicController.java
 * com.xfxmcy.spouse.controller.system
 *
 * Function： systemic controller 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月4日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.system;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.SystemService;
import com.xfxmcy.spouse.util.IpUtil;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.vo.SPEmployer;


/**
 * ClassName:SystemicController
 * Function: systemic controller
 * Reason:	 systemic controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月4日		下午5:23:55
 *
 * @see 	 
 */
@Controller
@RequestMapping("/spouse")
public class SystemicController {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(SystemicController.class);
	/*systemic service*/
	@Resource
	private SystemService systemServiceImpl;
	/**
	 * 
	 * systemicPageTransforming: transform the path
	 *
	 * @param path		the path which gona	arrive
	 * @return			path transformed
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月4日 		cy
	 */
	@RequestMapping("/managerment/{path}")
	public String systemicPageTransforming(@PathVariable String path) {
		String returnPath = "/index";
		/*enter managing page*/
		if("host".equals(path)){
			returnPath = SpouseConstant.SystemicPage.MANAGEMENT_INDEX;
			logger.trace("sb wanna enter managerment");
		}
		/*enter index.jsp*/
		else if("guest".equals(path)){
			returnPath = SpouseConstant.SystemicPage.SPOUSE_INDEX;
		}
		/*enter her.jsp*/
		else if("hers".equals(path)){
			returnPath = SpouseConstant.SystemicPage.SPOUSE_HER;
		}
		/*enter him.jsp*/
		else if("his".equals(path)){
			returnPath = SpouseConstant.SystemicPage.SPOUSE_HIM;
		}
		/*enter about_us.jsp*/
		else if("ours".equals(path)){
			returnPath = SpouseConstant.SystemicPage.SPOUSE_ABOUT_US;
		}
		/*enter contact_us.jsp*/
		else if("message".equals(path)){
			returnPath = SpouseConstant.SystemicPage.SPOUSE_CONTACT_US;
		}
		/*favorite index*/
		else if("favorite".equals(path)){
			returnPath = SpouseConstant.SystemicPage.FAVORITE_INDEX;
		}
		/*main index*/
		else if("main".equals(path)){
			returnPath = SpouseConstant.SystemicPage.MAIN_INDEX;
		}
		/*me index*/
		else if("me".equals(path)){
			returnPath = SpouseConstant.SystemicPage.ME_INDEX;
		}
		/*romantic index*/
		else if("romantic".equals(path)){
			returnPath = SpouseConstant.SystemicPage.ROMANTIC_INDEX;
		}
		/*schedule index in front*/
		else if("schedule".equals(path)){
			returnPath = SpouseConstant.SystemicPage.SCHEDULE_INDEX;
		}
		/*schedule index*/
		else if("mySchedule".equals(path)){
			returnPath = SpouseConstant.SystemicPage.SCHEDULE_MANA_INDEX;
		}
		/*meeting index*/
		else if("meeting".equals(path)){
			returnPath = SpouseConstant.SystemicPage.MEETING_INDEX;
		}
		/*video index*/
		else if("video".equals(path)){
			returnPath = SpouseConstant.SystemicPage.VIDEO_INDEX;
		}
		return returnPath;
	}
	
	/**
	 * 
	 * systemicLogin: administrator login
	 *
	 * @param path    path
	 * @param employer  administrator
	 * @parma sysInfo   response 
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月9日 		cy
	 */
	@RequestMapping("/login/{path}")
	@ResponseBody
	public SystemicInfo systemicLogin(@PathVariable String path , SPEmployer employer,SystemicInfo sysInfo,HttpServletRequest request) {
		SPEmployer result = systemServiceImpl.doLogin(path,employer);
		/*result*/
		if(null != result){
			sysInfo.setSuccess(true,"you are logining"); 
			SessionUser user = getSessionUser(result, request);
			request.getSession().setAttribute(ResourceUtil.getSessionInfo(), user);
			sysInfo.setResult(user);
			
		}else{
			sysInfo.setSuccess(false,"password is error");
		}
		logger.trace("sb wanna login");
		return sysInfo;
	}
	/**
	 * 
	 * systemicLogout: administrator logout 
	 *
	 * @param sysInfo	response
	 * @param request	request	
	 * @return			result
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月10日 		cy
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public SystemicInfo systemicLogout(SystemicInfo sysInfo,HttpServletRequest request) {
		
		/*result*/
		sysInfo.setSuccess(true, "logout success"); 
		request.getSession().removeAttribute(ResourceUtil.getSessionInfo());
		logger.trace("sb wanna logout");
		return sysInfo;
	}
	/**
	 * 
	 * getMhEmployer:	acquire a new sessional user
	 *
	 * @param request  request
	 * @return      	user
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2013-10-1 		cy
	 */
	public SessionUser getSessionUser(SPEmployer employer ,HttpServletRequest request){
		/* create session info*/
		SessionUser sessionInfo = new SessionUser();
		sessionInfo.setUserId(employer.getId());
		sessionInfo.setLoginName(employer.getsAccount());
		sessionInfo.setIp(IpUtil.getIpAddr(request));
		return sessionInfo;
	}
	
}

