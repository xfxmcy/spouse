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

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xfxmcy.spouse.service.OurService;

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
	private OurService ourServiceImpl ;
}

