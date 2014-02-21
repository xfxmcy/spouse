/**
 * SpouseConstant.java
 * com.xfxmcy.spouse.constant
 *
 * Function：  constant 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月4日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.constant;
/**
 * ClassName:SpouseConstant
 * Function: saving constant
 * Reason:	 saving constant
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月4日		下午5:32:17
 *
 * @see 	 
 */
public final class SpouseConstant {
	
	/*simple save */
	public final static String SIMPLE_SAVE = "simpleSave";
	/*simple delete*/
	public final static String SIMPLE_DELETE = "simpleDelete";
	/*simple update */
	public final static String SIMPLE_UPDATE = "simpleUpdate";
	/*simple query only */
	public final static String SIMPLE_QUERY_ONLY = "simpleQueryOnly";
	/*simle query list*/
	public final static String SIMPLE_QUERY_LIST = "simpleQueryList";
	/*simple query paged*/
	public final static String SIMPLE_QUERY_PAGED = "simpleQueryPaged";
	
	
	/*SQL  primaty key*/
	public final static String SQL_PRIMARY_KEY = "id";
	/*SQL  parent key*/
	public final static String SQL_PARENT_KEY = "pid";
	
	/**
	 * 
	 * ClassName:SystemicPage
	 * Function: saving SystemicPage constant
	 * Reason:	 saving SystemicPage constant
	 *
	 * @author   cy
	 * @version  SpouseConstant
	 * @since    Ver 1.1
	 * @Date	 2014	2014年1月4日		下午5:33:08
	 *
	 * @see
	 */
	public class SystemicPage {
		/*entire system*/
		  /*management index*/
		  public final static String MANAGEMENT_INDEX = "/xfxmcy/index";
		  /*spouse index*/
		  public final static String SPOUSE_INDEX = "/index";
		  /*spouse about_us*/
		  public final static String SPOUSE_ABOUT_US = "/about_us";
		  /*spouse her*/
		  public final static String SPOUSE_HER = "/her";
		  /*spouse him*/
		  public final static String SPOUSE_HIM = "/him";
		  /*spouse contact_us*/
		  public final static String SPOUSE_CONTACT_US = "/contact_us";
		/*favorite*/  
		  /*management index*/
		  public final static String FAVORITE_INDEX = "/xfxmcy/my/favorite/manageFavorite";
		  
		
	}
	/**
	 * 
	 * ClassName:System
	 * Function: saving general operator constant 
	 * Reason:	 saving general operator constant
	 *
	 * @author   cy
	 * @version  SpouseConstant
	 * @since    Ver 1.1
	 * @Date	 2014	2014年1月9日		下午5:16:57
	 *
	 * @see
	 */
	public class System {
		/*login by admin*/
		public final static String ADMIN_LOGIN = "loginAdmin";
		
		/*Query constant*/
			/*account*/
			public final static String QUERY_ACCOUNT = "saccount";	
			/*password*/
			public final static String QUERY_PASSWORD = "spassword";
	}
	/**
	 * 
	 * ClassName:Menu
	 * Function: saving menu's constant
	 * Reason:	 saving menu's constant
	 *
	 * @author   cy
	 * @version  SpouseConstant
	 * @since    Ver 1.1
	 * @Date	 2014	2014年1月9日		下午5:15:58
	 *
	 * @see
	 */
	public class Menu {
		/*simple control*/
		public final static String SIMEPLE_CONTROL = "simple";
		
	}
	/**
	 * 
	 * ClassName:Favorite
	 * Function: favorite constant
	 * Reason:	 favorite constant
	 *
	 * @author   cy
	 * @version  SpouseConstant
	 * @since    Ver 1.1
	 * @Date	 2014	2014年1月12日		下午8:00:56
	 *
	 * @see
	 */
	public class Favorite {
		
		/*query tree grid paged*/
		public final static String QUERY_TREEGRID_PAGED = "queryTreegrid";
		/*filter query tree grid paged*/
		public final static String QUERY_TREEGRID_FILTER = "filterTreegrid";
	}
}

