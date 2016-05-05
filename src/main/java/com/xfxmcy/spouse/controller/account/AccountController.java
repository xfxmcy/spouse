package com.xfxmcy.spouse.controller.account;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.model.SystemicInfo;
import com.xfxmcy.spouse.service.AccountService;
import com.xfxmcy.spouse.service.RomanticService;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.util.SpouseUtil;
import com.xfxmcy.spouse.vo.SMAccount;
import com.xfxmcy.spouse.vo.SMMemory;

/**
 * ClassName:AccountController
 * Function: account controller
 * Reason:	 account controller
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2016年5月3日		下午01:18:10
 *
 * @see 	 
 */
@Controller
@RequestMapping("/account")
public class AccountController {

	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AccountController.class);
	
	@Resource
	private AccountService accountServiceImpl;
	
	/**
	 * 
	 * doQuery:query account
	 *
	 * @param param
	 * @param grid
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2015年1月9日 		cy
	 */
	@RequestMapping("/accounts")
	@ResponseBody
	public SpouseGrid doQuery(QueryParam param , SpouseGrid grid ,HttpServletRequest request){
		try{
			grid = accountServiceImpl.queryAccountPaged(param);
		}catch(Exception e){
			logger.error(e.getMessage());
		}	
		return grid;
	}
	
	
	/**
	 * 
	 * accountPersistent:save a account 
	 *
	 * @param account
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2016年5月3日 		cy
	 */
	@RequestMapping("/accountPersistent")
	@ResponseBody
	public SystemicInfo doPersistentAccount(SMAccount account,SystemicInfo info,HttpServletRequest request){
		try{
			account.setId(IdUtil.generaterThrityTwo());	
			SMAccount result = accountServiceImpl.persistAccount(account);
			info.setSuccess(true, "success");
			info.setResult(result);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	/**
	 * 
	 * accountMerge:merge a account 
	 *
	 * @param smMemory account
	 * @param info
	 * @param request
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2016年5月3日 		cy
	 */
	@RequestMapping("/accountMerge")
	@ResponseBody
	public SystemicInfo accountMerge(SMAccount account,SystemicInfo info,HttpServletRequest request){
		try{
			SMAccount result = accountServiceImpl.mergeAccount(account);
			info.setSuccess(true, "success");
			info.setResult(result);
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	/**
	 * 
	 * accountDelete:delete a account
	 *
	 * @param key
	 * @param info
	 * @param param
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2016年5月3日 		cy
	 */
	@RequestMapping("/accountDelete/{key}")
	@ResponseBody
	public SystemicInfo accountDelete(@PathVariable String key,SystemicInfo info){
		try{
			accountServiceImpl.deleteAccount(key);
			info.setSuccess(true, "success");
		}catch(Exception e){
			info.setSuccess(false, "system busy , please have a wait");
			logger.error(e.getMessage());
		}
		return info;
	} 
	
	
	
	
	
	
}
