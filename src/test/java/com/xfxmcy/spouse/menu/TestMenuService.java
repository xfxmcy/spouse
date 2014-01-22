/**
 * TestMenuService.java
 * com.xfxmcy.mhxy.menu
 *
 * Function： test menu's serive
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2013-10-1 		李丛阳
 *
 * Copyright (c) 2013, XFXMCY All Rights Reserved.
*/

package com.xfxmcy.spouse.menu;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.model.Menu;
import com.xfxmcy.spouse.service.MenuService;



/**
 * ClassName:TestMenuService
 * Function:  test menu's serive 
 * Reason:	  test menu's serive 
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2013-10-1		下午7:04:11
 *
 * @see 	 
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})// 配置文件
public class TestMenuService {
	/*logger*/
	private static final Logger logger = Logger.getLogger(TestMenuService.class);
	/*service*/
	@Resource
	private MenuService menuServiceImpl;
	
	/**
	 * 
	 * testDoCtrl:  test method for controling menu
	 *
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月9日 		cy
	 */
	@Test
	public void testDoCtrl(){
		List<Menu> list = menuServiceImpl.doCtrl(SpouseConstant.Menu.SIMEPLE_CONTROL,null, null);
		logger.debug("菜单长度" + list.size());
	} 
	
}

