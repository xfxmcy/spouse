/**
 * TaskService.java
 * com.xfxmcy.spouse.service
 *
 * Function： task service 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年5月30日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import java.util.ArrayList;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.vo.Tasks;

/**
 * ClassName:TaskService
 * Function: task service
 * Reason:	 task service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月30日		下午3:49:40
 *
 * @see 	 
 */
public interface TaskService {
	
	/**
	 * 
	 * doQuery: query service
	 *
	 * @param param	param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月30日 		cy
	 */
	public ArrayList<Tasks> doQuery(QueryParam param);
	
	/**
	 * 
	 * persistenceTask:persisten a task
	 *
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年9月30日 		cy
	 */
	Tasks persistenceTask(Tasks task);
	
	/**
	 * 
	 * mergeTask:merge a task
	 *
	 * @param param
	 * @param task
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年9月30日 		cy
	 */
	Tasks mergeTask(Tasks task);
	
	/**
	 * 
	 * deleteFavorite: delete tasks
	 *
	 * @param param	   query param	
	 * @param key	   primary 	key
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月17日 		cy
	 */
	void deleteTask(QueryParam param,String key);

	/**
	 * 
	 * resizeTask:resize a task
	 *
	 * @param param
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月3日 		cy
	 */
	void resizeTask(QueryParam param);
}

