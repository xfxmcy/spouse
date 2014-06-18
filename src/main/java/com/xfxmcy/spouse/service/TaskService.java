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
}

