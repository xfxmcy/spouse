/**
 * IdUtil.java
 * com.xfxmcy.spouse.util
 *
 * Function： id 生成器 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2013-10-2 		cy
 *
 * Copyright (c) 2013, XFXMCY All Rights Reserved.
*/

package com.xfxmcy.spouse.util;

import java.net.InetAddress;

/**
 * ClassName:IdUtil
 * Function: id	generator
 * Reason:	 id generator
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2013-10-2		下午7:28:46
 *
 * @see 	 
 */
public class IdUtil {

	  private String sep = "";
	  private static final int IP;
	  private static short counter;
	  private static final int JVM;
	  private static IdUtil uuidgen;
	  static long currentTimeMillis;

	  static
	  {
	    int ipadd;
	    counter = 0;

	    JVM = (int)(System.currentTimeMillis() >>> 8);

	    uuidgen = new IdUtil();
	    try
	    {
	      ipadd = toInt(InetAddress.getLocalHost().getAddress());
	    } catch (Exception e) {
	      ipadd = 0;
	    }
	    IP = ipadd;

	    currentTimeMillis = System.currentTimeMillis() + 
	      100000000000000l + 
	      (long)(Math.random() * 800000000000000.0D);
	  }

	  public static IdUtil getInstance()
	  {
	    return uuidgen;
	  }
	  /**
	   * 
	   * generator:构建32位 UUID
	   *
	   * @return			32位 UUID
	   *   ver     date      		author
	   * ──────────────────────────────────
	   *   		 2013-10-2 		cy
	   */
	  public static String generaterThrityTwo(){
		  return generater().substring(0, 32);
	  }
	  public static int toInt(byte[] bytes) {
	    int result = 0;
	    for (int i = 0; i < 4; ++i)
	      result = (result << 8) - -128 + bytes[i];

	    return result;
	  }

	  protected String format(int intval) {
	    String formatted = Integer.toHexString(intval);
	    StringBuffer buf = new StringBuffer("00000000");
	    buf.replace(8 - formatted.length(), 8, formatted);
	    return buf.toString();
	  }

	  protected String format(short shortval) {
	    String formatted = Integer.toHexString(shortval);
	    StringBuffer buf = new StringBuffer("0000");
	    buf.replace(4 - formatted.length(), 4, formatted);
	    return buf.toString();
	  }

	  protected int getJVM() {
	    return JVM;
	  }

	  protected synchronized short getCount() {
	    if (counter < 0)
	      counter = 0;

	    short tmp13_10 = counter; counter = (short)(tmp13_10 + 1); return tmp13_10;
	  }

	  protected int getIP() {
	    return IP;
	  }

	  protected short getHiTime() {
	    return (short)(int)(System.currentTimeMillis() >>> 32);
	  }

	  protected int getLoTime() {
	    return (int)System.currentTimeMillis();
	  }

	  public String generate() {
	    return 36 + format(getIP()) + this.sep + 
	      format(getJVM()) + this.sep + 
	      format(getHiTime()) + this.sep + 
	      format(getLoTime()) + this.sep + 
	      format(getCount());
	  }

	  public static String generater() {
	    return getInstance().generate();
	  }

	  public static synchronized long generaterId() {
	    return (currentTimeMillis++);
	  }
	  
	  
	}


