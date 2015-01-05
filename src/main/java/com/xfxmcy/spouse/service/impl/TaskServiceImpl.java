/**
 * TaskServiceImpl.java
 * com.xfxmcy.spouse.service.impl
 *
 * Function： implement task service
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年5月30日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service.impl;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.xfxmcy.spouse.constant.SpouseConstant;
import com.xfxmcy.spouse.constant.SpouseEntityConstant;
import com.xfxmcy.spouse.dao.STTaskMapper;
import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.service.TaskService;
import com.xfxmcy.spouse.util.IdUtil;
import com.xfxmcy.spouse.util.ResourceUtil;
import com.xfxmcy.spouse.vo.Tasks;

/**
 * ClassName:TaskServiceImpl
 * Function: implement task service
 * Reason:	 implement task service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月30日		下午4:00:08
 *
 * @see 	 
 */
@Transactional
@Service
public class TaskServiceImpl implements TaskService {
	
	/**
	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(FavoriteServiceImpl.class);
	
	@Resource
	private STTaskMapper mapper;
	
	@Transactional(propagation = Propagation.NOT_SUPPORTED ,readOnly = true)
	@Override
	public ArrayList<Tasks> doQuery(QueryParam param) {
		Map<String, Object> map = new HashMap<String, Object>();
		/*for user*/
		if(null != param.getQueryType() && SpouseConstant.Task.TASK_FOR_USER.equals(param.getQueryType())){
			map.put(SpouseConstant.SQL_USERID_KEY, param.getOwner());
		}else{
			map.put(SpouseConstant.SQL_USERID_KEY, ResourceUtil.getAdminId());
		}
		map.put(SpouseConstant.SQL_START, param.getStart());
		map.put(SpouseConstant.SQL_END, param.getEnd());
		return mapper.selectByCondition(map);

	}

	@Override
	public Tasks persistenceTask(Tasks task) {
		if(SpouseConstant.SIMPLE_SAVE.equals(task.getQueryType())){
			task.setId(IdUtil.generaterThrityTwo());
			mapper.insertSelective(task);
		}
		return task;
		
	}

	@Override
	public Tasks mergeTask(Tasks task) {
		if(SpouseConstant.SIMPLE_UPDATE.equals(task.getQueryType())){
			mapper.updateSelective(task);
		}
		return task;
	}

	@Override
	public void deleteTask(QueryParam param, String key) {
		
		if(SpouseConstant.SIMPLE_DELETE.equals(param.getQueryType())){
			mapper.deleteByPrimaryKey(key);
		}
		
	}

	@Override
	public void resizeTask(QueryParam param) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			map.put(SpouseConstant.SQL_PRIMARY_KEY, param.getId());
			Tasks task = mapper.selectById(map);
			Date myDate = null ;
			Calendar calendar = Calendar.getInstance();
			if (null == task)
				return ;
			else{
				/*allday*/
				if(SpouseEntityConstant.TASK_ALLDAY.equals(task.getAllday())){
					task.setAllday(SpouseEntityConstant.TASK_ALLDAY_NOT);
					myDate = task.getStart();
					calendar.setTime(myDate);
					/*allday event change to not-allday event,no need + 1day
					 * for view
					 * */
					calendar.add(Calendar.DATE, param.getDayDelta());
				}else{
					myDate = task.getEnd();
					calendar.setTime(myDate);
					calendar.add(Calendar.DATE, param.getDayDelta());
				}
				calendar.add(Calendar.HOUR_OF_DAY,param.getMinuteDelta());
			    myDate = calendar.getTime();
			    
			    task.setEnd(myDate);
			    mapper.updateSelective(task);
			}
			
		}
		
	}

	@Override
	public void dropTask(QueryParam param) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(SpouseConstant.SIMPLE_UPDATE.equals(param.getQueryType())){
			map.put(SpouseConstant.SQL_PRIMARY_KEY, param.getId());
			Tasks task = mapper.selectById(map);
			if (null == task)
				return ;
			else{
				Date myDateEnd = task.getEnd();
				Date myDateStart = task.getStart();
				Calendar calendarStart = Calendar.getInstance();
				calendarStart.setTime(myDateStart);
				calendarStart.add(Calendar.DATE, param.getDayDelta());
				calendarStart.add(Calendar.HOUR_OF_DAY,param.getMinuteDelta());
				myDateStart = calendarStart.getTime();
				if(null != myDateEnd){
					Calendar calendar = Calendar.getInstance();
					calendar.setTime(myDateEnd);
					calendar.add(Calendar.DATE, param.getDayDelta());
					calendar.add(Calendar.HOUR_OF_DAY,param.getMinuteDelta());
					myDateEnd = calendar.getTime();	
					task.setEnd(myDateEnd);
				}
			    task.setStart(myDateStart);
			    mapper.updateSelective(task);	
			}
		}		
	}

}

