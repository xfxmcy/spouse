/**
 * PhotoService.java
 * com.xfxmcy.spouse.webservice
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2015年5月7日 		cy
 *
 * Copyright (c) 2015, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.webservice;

import javax.jws.WebService;
import javax.jws.WebParam;
import javax.jws.soap.SOAPBinding.Style;
import javax.jws.soap.SOAPBinding;

/**
 * ClassName:PhotoService
 * Function: query for photo 
 * Reason:	 query for photo
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2015年5月7日		下午1:17:14
 *
 * @see 	 
 */
@WebService
@SOAPBinding(style = Style.RPC)
public interface PhotoWService {
	
	public void queryUser(@WebParam(name = "name") String userName);
}

