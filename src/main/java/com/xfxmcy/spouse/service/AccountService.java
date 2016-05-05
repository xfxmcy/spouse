package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.vo.SMAccount;

/**
 * ClassName:AccountService
 * Function: account service
 * Reason:	 account service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	  2016年5月3日		下午01:18:10
 *
 * @see 	 
 */
public interface AccountService {
	/**
	 * 
	 * queryAccountPaged: query accounts paged
	 * 
	 * @author 李丛阳
	 * @param param
	 * @return
	 * @since 　Ver 1.1
	 */
	SpouseGrid queryAccountPaged(QueryParam param);
	/**
	 * 
	 * persistAccount: persist an account
	 * 
	 * @author 李丛阳
	 * @param param
	 * @return
	 * @since 　Ver 1.1
	 */
	SMAccount persistAccount(SMAccount account);
	/**
	 * 
	 * persistAccount: merge an account
	 * 
	 * @author 李丛阳
	 * @param param
	 * @return
	 * @since 　Ver 1.1
	 */
	SMAccount mergeAccount(SMAccount account);
	/**
	 * 
	 * persistAccount: delete an account
	 * 
	 * @author 李丛阳
	 * @param param
	 * @return
	 * @since 　Ver 1.1
	 */
	void deleteAccount(String key);

}
