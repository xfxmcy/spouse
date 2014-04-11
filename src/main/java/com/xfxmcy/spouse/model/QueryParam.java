/**
 * QueryParam.java
 * com.xfxmcy.spouse.model
 *
 * Function：  manual query param 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月10日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.model;

import java.util.Date;

/**
 * ClassName:QueryParam
 * Function: manual query param
 * Reason:	 manual query param
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月10日		下午6:27:15
 *
 * @see 	 
 */
public class QueryParam {
	
	/*using in paged*/
	
	private Integer rows = 5,page =1;
	
	private String queryType ;
	/*favorite treegrid*/
	private String treeRootId  ;
	/*owner*/
	private String owner ;
	
	private String likeNameFirst ;
	
	private String isFilter  = "false";
	
	public String getIsFilter() {
		return isFilter;
	}
	public void setIsFilter(String isFilter) {
		this.isFilter = isFilter;
	}
	public String getLikeNameFirst() {
		return  likeNameFirst ;
	}
	public void setLikeNameFirst(String likeNameFirst) {
		this.likeNameFirst = likeNameFirst;
	}
	private String beginDate , endDate;
	/*just a memo*/
	private String memoFirst,memoSecond;
	
	public String getMemoFirst() {
		return memoFirst;
	}
	public void setMemoFirst(String memoFirst) {
		this.memoFirst = memoFirst;
	}
	public String getMemoSecond() {
		return memoSecond;
	}
	public void setMemoSecond(String memoSecond) {
		this.memoSecond = memoSecond;
	}
	/*column be ordered*/
	private String colOrdered;
	
	public Integer getStartPoint(){
		return (page-1)*rows;
	}
	public String getOwner() {
		return owner;
	}

	public void setOwner(String owner) {
		this.owner = owner;
	}

	public String getColOrdered() {
		return colOrdered;
	}

	public void setColOrdered(String colOrdered) {
		this.colOrdered = colOrdered;
	}

	public String getQueryType() {
		return queryType;
	}

	public String getTreeRootId() {
		return treeRootId;
	}

	public void setTreeRootId(String treeRootId) {
		this.treeRootId = treeRootId;
	}

	public void setQueryType(String queryType) {
		this.queryType = queryType;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}
	public QueryParam() {

		// TODO Auto-generated constructor stub

	}
	
}

