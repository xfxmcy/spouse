/**
 * TemplateComponent.java
 * com.xfxmcy.spouse.util
 *
 * Function： template component for ftl
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年3月5日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.Locale;
import java.util.Map;

import org.apache.log4j.Logger;

import com.xfxmcy.spouse.controller.romantic.RomanticController;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * ClassName:TemplateComponent
 * Function: template component for ftl
 * Reason:	 template component for ftl
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年3月5日		下午9:55:31
 *
 * @see 	 
 */

public class TemplateComponent {
	
	private static TemplateComponent component ;
	
	private TemplateComponent() {

	}
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(TemplateComponent.class);
	/**
	 * 
	 * getTemplateCom:get template component
	 *
	 * @return			   template
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年3月5日 		cy
	 */
	public static synchronized TemplateComponent getTemplateCom(){
		if(null == component)
			component = new TemplateComponent();
		return component;
	}
	
	
	/**
	 * 
	 * getTemplateByName: getTemplateByName
	 *
	 * @param ftlName	 ftl file 's name	
	 * @return			 template	
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年3月5日 		cy
	 */
	public Template getTemplateByName(String ftlName){
		Template template = null;
		/*get setting info*/
		Configuration configuration = new Configuration();
		configuration.setEncoding(Locale.CHINA, "UTF-8");
		/*get path of template through class */
		configuration.setClassForTemplateLoading(this.getClass(), "/com/xfxmcy/spouse/ftl");
		try {
			template = configuration.getTemplate(ftlName);
			return template;
		} catch (IOException e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			return template;
		}
	}
	
	/**
	 * 
	 * filePrint: dynamic construct file
	 *
	 * @param fileName		ftl fileName
	 * @param root			root
	 * @param outFile		fileName included path
	 *   ver     date      		author
	 * ──────────────────────────────────
	 *   		 2014年3月5日 		cy
	 */
	public void filePrint(String fileName,Map<String,Object> root,String outFile) {
		Writer  out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(new File(outFile)),"UTF-8"));
			Template temp = this.getTemplateByName(fileName);
			temp.process(root, out);
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				if(out!=null) out.close();
			} catch (IOException e) {
				logger.error(e.getMessage());
				e.printStackTrace();
			}
		}
	}
}

