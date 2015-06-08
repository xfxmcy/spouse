/**
 * EmployerServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年1月12日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SPEmployerMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.service.EmployerService;
import com.xfxmcy.spouse.util.Encrypt;
import com.xfxmcy.spouse.vo.SPEmployer;

/**
 * ClassName:EmployerServiceImpl
 * Function: implements employer model
 * Reason:	 TODO ADD REASON
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年1月12日		下午4:47:34
 *
 * @see 	 
 */
@Transactional
@Service
public class EmployerServiceImpl implements EmployerService {

	
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FavoriteServiceImpl.class);
	
	/*mapper*/
	@Resource
	private SPEmployerMapper spEmployerMapper; 
	
	@Override
	public SPEmployer mergeEmployer(SPEmployer employer) {

		if(SpouseConstant.SIMPLE_UPDATE.equals(employer.getQueryType())){
			spEmployerMapper.updateByAccountSelective(employer);
		}
		return employer;

	}

	@Override
	public SPEmployer mergeEmployerPassWd(SPEmployer employer) {
		/*param*/
		Map<String,String> map = new HashMap<String, String>();
		if(SpouseConstant.SIMPLE_UPDATE.equals(employer.getQueryType())){
			map.put(SpouseConstant.System.QUERY_ACCOUNT, employer.getsAccount());
			if(null != employer.getsPassword() && !"".equals(employer.getsPassword().trim())){
				map.put(SpouseConstant.System.QUERY_PASSWORD, Encrypt.md5(employer.getsPassword()));	
			}
			else{
				map.put(SpouseConstant.System.QUERY_PASSWORD, employer.getsPassword());
			}
			SPEmployer result = spEmployerMapper.doLogin(map);
			if(null == result)
				return result;
			if(null != employer.getsPasswordNew() && !"".equals(employer.getsPasswordNew().trim())){
				employer.setsPassword(Encrypt.md5(employer.getsPasswordNew()));	
			}
			else
				employer.setsPassword(employer.getsPasswordNew());
			spEmployerMapper.updateByAccountSelective(employer);
		}
		return employer;
		
	}

	@Override
	public SpouseGrid queryAdministrators(QueryParam param) {
		SpouseGrid grid = new SpouseGrid();
		List<SPEmployer> lists = new ArrayList<SPEmployer>();
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			lists = spEmployerMapper.queryListPaged(param);
			grid.setGrid(0l, lists);
		}
		return grid;
		
	}

}

