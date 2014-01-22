/**
 * SpouseGrid.java
 * com.xfxmcy.spouse.model
 *
 * Function： spouse grid
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月10日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.model;

import java.util.ArrayList;
import java.util.List;

/**
 * ClassName:SpouseGrid
 * Function: spouse grid
 * Reason:	 spouse grid
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月10日		下午5:31:59
 *
 * @see 	 
 */
@SuppressWarnings("rawtypes")
public class SpouseGrid {

	public SpouseGrid() {

		// TODO Auto-generated constructor stub

	}
	public SpouseGrid(Long total, List rows) {
		super();
		this.total = total;
		this.rows = rows;
	}
	
	/*total*/
	private Long total = 0L;
	/*data*/
	private List rows = new ArrayList();
	
	
	public void setGrid(Long total,List rows){
		this.total = total;
		this.rows = rows;
	}
	public Long getTotal() {
		return total;
	}
	public void setTotal(Long total) {
		this.total = total;
	}
	public List getRows() {
		return rows;
	}
	public void setRows(List rows) {
		this.rows = rows;
	}
	
}

