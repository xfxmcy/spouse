/**
 * SystemServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： implement for system
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月7日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.dao.SPEmployerMapper;
import com.xfxmcy.spouse.service.SystemService;
import com.xfxmcy.spouse.util.Encrypt;
import com.xfxmcy.spouse.vo.SPEmployer;

/**
 * ClassName:SystemServiceImpl
 * Function: implement for system
 * Reason:	 implement for system
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月7日		下午2:25:17
 *
 * @see 	 
 */

@Transactional
@Service
public class SystemServiceImpl implements SystemService {

	/*employer mapper*/
	@Resource 
	private SPEmployerMapper employerMapper;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SPEmployer doLogin(String operator,SPEmployer employer) {
		/*param*/
		Map<String,String> map = new HashMap<String, String>();
		/*result*/
		SPEmployer spEmployer = null ;
		if(SpouseConstant.System.ADMIN_LOGIN.equals(operator)){
			map.put(SpouseConstant.System.QUERY_ACCOUNT, employer.getsAccount());
			if(null != employer.getsPassword()){
				map.put(SpouseConstant.System.QUERY_PASSWORD, Encrypt.md5(employer.getsPassword()));	
			}
			spEmployer = employerMapper.doLogin(map);
		}
		return spEmployer;
	}
	
	
}

