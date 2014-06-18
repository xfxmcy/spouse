/**
 * RomanticService.java
 * com.xfxmcy.spouse.service
 *
 * Function： romantic service 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年5月2日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.service;

import com.xfxmcy.spouse.model.QueryParam;
import com.xfxmcy.spouse.vo.SrRomanticWithBLOBs;

/**
 * ClassName:RomanticService
 * Function: romantic service
 * Reason:	 romantic service
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年5月2日		下午12:43:33
 *
 * @see 	 
 */
public  interface RomanticService {
	
	
	/**
	 * 
	 * doPersistRomantic: persist romantic
	 *
	 * @param param
	 * @param bloBs
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月2日 		cy
	 */
	public SrRomanticWithBLOBs doPersistRomantic(QueryParam param,SrRomanticWithBLOBs bloBs);
	/**
	 * 
	 * doUpdateRomantic: update romantic
	 *
	 * @param param
	 * @param romanticBLOBS
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月2日 		cy
	 */
	public SrRomanticWithBLOBs doUpdateRomantic(QueryParam param,SrRomanticWithBLOBs romanticBLOBS);
	/**
	 * 
	 * doDeleteRomantic: delete romantic
	 *
	 * @param param
	 * @param romanticBLOBS
	 * @return
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年5月2日 		cy
	 */
	public void doDeleteRomantic(QueryParam param,String key);
	
}

