package com.xfxmcy.spouse.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.dao.SMAccountMapper;
import com.xfxmcy.spouse.dao.SMPrefaceMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.model.SpouseGrid;
import com.xfxmcy.spouse.service.AccountService;
import com.xfxmcy.spouse.vo.SMAccount;
import com.xfxmcy.spouse.vo.SMMemory;
/**
 * ClassName:AccountServiceImpl
 * Function: implements account model
 * Reason:	 AccountServiceImpl
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
public class AccountServiceImpl implements AccountService {
	
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(AccountServiceImpl.class);

	/*mapper*/
	@Resource
	private SMAccountMapper accountMapper;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public SpouseGrid queryAccountPaged(QueryParam param) {
		SpouseGrid grid = new SpouseGrid();
		List<SMAccount> list = accountMapper.queryAccountPaged(param);
		grid.setGrid(accountMapper.queryCountAccount(param), list);
		return grid;
	}

	@Override
	public SMAccount persistAccount(SMAccount account) {
		accountMapper.insertSelective(account);
		return account;
	}

	@Override
	public SMAccount mergeAccount(SMAccount account) {
		accountMapper.updateByPrimaryKey(account);
		return account;
	}

	@Override
	public void deleteAccount(String key) {
		accountMapper.deleteByPrimaryKey(key);
	}

}
