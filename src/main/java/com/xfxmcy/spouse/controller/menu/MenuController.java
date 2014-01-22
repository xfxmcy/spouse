/**
 * MenuController.java
 * com.xfxmcy.spouse.controller.menu
 *
 * Function： the controller serving menu 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月4日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.controller.menu;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.Menu;
import com.xfxmcy.spouse.service.MenuService;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.util.SpouseUtil;


/**
 * ClassName:MenuController
 * Function: the controller serving menu
 * Reason:	 the controller serving menu
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月4日		下午7:36:57
 *
 * @see 	 
 */
@Controller  
@RequestMapping("/menu")  
public class MenuController {
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(MenuController.class);

	/*menu service*/
	@Resource
	private MenuService menuServiceImpl;
	
	/**
	 * 
	 * doCtrl: control tree following menu
	 *
	 * @return	menu's tree
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2013-9-30 		cy
	 */
	@RequestMapping("/menuCtrlTree/{operator}")
	@ResponseBody
	public List<Menu> doCtrl(@PathVariable String operator,String id , HttpServletRequest request){
		logger.trace("menu is loaded");
		return menuServiceImpl.doCtrl(operator,id ,SpouseUtil.getSessionUser(request));
	}
	
}

