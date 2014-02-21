/**
 * TestMaterialService.java
 * com.xfxmcy.spouse.menu
 *
 * Function： test material's service 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年2月18日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.menu;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.service.FavoriteService;
import com.xfxmcy.spouse.vo.SMFavorite;

/**
 * ClassName:TestMaterialService
 * Function: test material's service
 * Reason:	 test material's service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年2月18日		下午10:31:58
 *
 * @see 	 
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath:spring.xml","classpath:spring-mybatis.xml"})// 配置文件
public class TestMaterialService {
	/*logger*/
	private static final Logger logger = Logger.getLogger(TestMenuService.class);
	/*service*/
	@Resource
	private FavoriteService service ;
	
	@Test
	public void testMaxSequence(){
		QueryParam param = new QueryParam();
		param.setQueryType(SpouseConstant.SIMPLE_SAVE);
		SMFavorite favorite = new SMFavorite();
		favorite.setPid("cy");
		service.persistenceFavorite(param, favorite);
	}
}

