/**
 * TaskController.java
 * com.xfxmcy.spouse.controller.task
 *
 * Function： task controller 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年5月30日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.task;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.TaskService;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.vo.Tasks;

/**
 * ClassName:TaskController
 * Function: task controller
 * Reason:	 task controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月30日		下午3:47:35
 *
 * @see 	 
 */
@Controller
@RequestMapping("/task")
public class TaskController {
	
	private static final Logger logger = Logger.getLogger(TaskController.class);
	
	@Resource
	private TaskService taskServiceImpl;
	/**
	 * 
	 * queryTasks:query tasks
	 *
	 * @param param	param 
	 * @param tasks
	 * @return	tasks
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月30日 		cy
	 */
	@RequestMapping("/queryTasks")
	@ResponseBody
	public List<Tasks> queryTasks(QueryParam param , ArrayList<Tasks> tasks,HttpServletRequest request){
		Object result = request.getSession().getAttribute(ResourceUtil.getSessionInfo());
		SessionUser user = null;
		if(null != result){
			user = (SessionUser) result;
			param.setOwner(user.getUserId());
		}
		tasks = taskServiceImpl.doQuery(param);
		return tasks;
	}
	
	/**
	 * 
	 * doPersistentTask: persistence  special task  
	 *
	 * @param param		
	 * @param task
	 * @param info
	 * @param request
	 * @return	info
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年9月30日 		cy
	 */
	@RequestMapping("/taskPersistent")
	@ResponseBody
	public SystemicInfo doPersistentTask(Tasks task,SystemicInfo info,HttpServletRequest request){
		try{
			info.setSuccess(true, "success");
			info.setResult(task);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	/**
	 * 
	 * doUpdateTask: update a specific task
	 *
	 * @param param
	 * @param task
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年9月30日 		cy
	 */
	@RequestMapping("/taskUpdate")
	@ResponseBody
	public SystemicInfo doUpdateTask(QueryParam param , Tasks task,SystemicInfo info,HttpServletRequest request){
		try{
			info.setSuccess(true, "success");
			info.setResult(task);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
	/**
	 * 
	 * doDeleteTask:delete a task
	 *
	 * @param key
	 * @param param
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年9月30日 		cy
	 */
	@RequestMapping("/taskDelete/{key}")
	@ResponseBody
	public SystemicInfo doDeleteTask(@PathVariable String key,QueryParam param ,SystemicInfo info,HttpServletRequest request){
		try{
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	}
	
}

