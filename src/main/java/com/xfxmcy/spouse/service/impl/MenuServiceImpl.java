/**
 * MenuServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： menu's implement 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月7日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SYMemuMapper;
import com.xfxmcy.spouse.model.Menu;
import com.xfxmcy.spouse.service.MenuService;
import com.xfxmcy.spouse.util.SessionUser;
import com.xfxmcy.spouse.vo.SYMemu;

/**
 * ClassName:MenuServiceImpl
 * Function:  menu's implement 
 * Reason:	  menu's implement 
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月7日		下午2:07:16
 *
 * @see 	 
 */
@Transactional
@Service
public class MenuServiceImpl implements MenuService {
	
	/*menu mapper*/
	@Resource
	private SYMemuMapper menuMapper;
	
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public List<Menu> doCtrl(String operator,String id, SessionUser sessionUser) {
		/*param*/
		Map<String,String> map = new HashMap<String, String>();
		/*result*/
		List<Menu> menus = new ArrayList<Menu>();
		if(SpouseConstant.Menu.SIMEPLE_CONTROL.equals(operator)){
			/*query menus*/
			List<SYMemu> mhMenus = menuMapper.doQueryMenu(map);
			
			if (mhMenus != null && mhMenus.size() > 0) {
				for (SYMemu mhMenu : mhMenus) {
					Menu menu = new Menu();
					/*copy properties*/
					BeanUtils.copyProperties(mhMenu, menu);
					/*pid*/
					if (mhMenu.getPid() != null) {
						/*as it is extended in the page , the pid is useful*/
						menu.setPid(mhMenu.getPid());
					}
					Map<String, Object> attributes = new HashMap<String, Object>();
					if(null != mhMenu.getUrl()){
						attributes.put("url", mhMenu.getUrl());
					}
					menu.setAttributes(attributes);
					menus.add(menu);
				}
		    }
		}
		return menus;
	}

}

