/**
 * TestSystemService.java
 * com.xfxmcy.spouse.system
 *
 * Function： test system service
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月9日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.system;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.menu.TestMenuService;
import com.xfxmcy.spouse.service.SystemService;
import com.xfxmcy.spouse.vo.SPEmployer;

/**
 * ClassName:TestSystemService
 * Function: test system service
 * Reason:	 test system service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月9日		下午5:37:41
 *
 * @see 	 
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})// 配置文件

public class TestSystemService {
	/*logger*/
	private static final Logger logger = Logger.getLogger(TestMenuService.class);
	/*service*/
	@Resource
	private SystemService systemServiceImpl;
	/**
	 * 
	 * testDoLogin:  test method for login
	 *
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年1月9日 		cy
	 */
	@Test
	public void testDoLogin(){
		SPEmployer employer = new SPEmployer();
		employer.setsAccount("cy");
		employer.setsPassword("52941221");
		SPEmployer result = systemServiceImpl.doLogin(SpouseConstant.System.ADMIN_LOGIN, employer);
		logger.info(result);
	}

}

