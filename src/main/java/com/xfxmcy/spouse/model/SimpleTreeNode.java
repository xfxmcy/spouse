/**
 * SimpleTreeNode.java
 * com.xfxmcy.spouse.model
 *
 * Function： simple treeNode 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年1月11日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.model;
/**
 * ClassName:SimpleTreeNode
 * Function: simple treeNode
 * Reason:	 simple treeNode
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年1月11日		上午9:39:36
 *
 * @see 	 
 */
public class SimpleTreeNode implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private String id;
	private String parentId;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
}

