/**
 * XmlComponent.java
 * com.xfxmcy.spouse.util
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年11月16日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.util;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import org.apache.log4j.Logger;
import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.io.OutputFormat;
import org.dom4j.io.XMLWriter;
import org.springframework.stereotype.Component;

import com.xfxmcy.spouse.vo.SMVideo;


/**
 * ClassName:XmlComponent
 * Function: making xml document
 * Reason:	 making xml document
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年11月16日		上午8:04:13
 *
 * @see 	 
 */
@Component
public class XmlComponent {
	/*media.xml root*/
	private static final String MEDIA_TAG_ROOT = "player";
	/*media.xml playlist*/
	private static final String MEDIA_TAG_LIST = "playlist";
	/*music*/
	private static final String MEDIA_TAG_MUSIC = "track";
	/*music*/
	private static final String MEDIA_TAG_MUSIC_FILE = "file";
	private static final String MEDIA_TAG_MUSIC_FILE_BAICURL = "http://www.xfxmcy.com";
	private static final String MEDIA_TAG_MUSIC_TITLE = "title";
	private static final String MEDIA_TAG_MUSIC_ARTIST = "artist";
	private static final String MEDIA_TAG_MUSIC_ALBUM = "album";
	
	
	private static final Logger logger = Logger.getLogger(XmlComponent.class);
	
	@SuppressWarnings("static-access")
	public Document createDocument(List<SMVideo> list){
		if(null == list || 0 == list.size())
			return null;
		Element root = DocumentHelper.createElement(this.MEDIA_TAG_ROOT);
        Document document = DocumentHelper.createDocument(root);
        Element musicList = root.addElement(this.MEDIA_TAG_LIST);
        Element music , fileDoc , titleDoc , artistDoc ,albumDoc ;
        /*each music*/
        for (SMVideo smVideo : list) {
        	smVideo.setArtist("周杰伦");
        	smVideo.setAlbum("依然范特西");
        	music = musicList.addElement(this.MEDIA_TAG_MUSIC);
			fileDoc = music.addElement(this.MEDIA_TAG_MUSIC_FILE);
			fileDoc.setText(MEDIA_TAG_MUSIC_FILE_BAICURL + smVideo.getUrl());
			titleDoc = music.addElement(this.MEDIA_TAG_MUSIC_TITLE);
			titleDoc.setText(smVideo.getName());
			artistDoc = music.addElement(this.MEDIA_TAG_MUSIC_ARTIST);
			artistDoc.setText(smVideo.getArtist());
			albumDoc = music.addElement(this.MEDIA_TAG_MUSIC_ALBUM);
			albumDoc.setText(smVideo.getAlbum());
		}
        return document;
	}
	
	public void writeXmlFile(Document doc , String path){
		OutputFormat format = new OutputFormat("    ", true);
		// 设置缩进为4个空格，并且另起一行为true
        try {
        	/*删除原配置文件*/
        	File origin = new File(path);
        	if(null != origin && origin.exists()){
        		origin.delete();
        	}
			XMLWriter xmlWriter2 = new XMLWriter(
			        new FileOutputStream(path), format);
			xmlWriter2.write(doc);
			xmlWriter2.flush();
			xmlWriter2.close();
		} catch (Exception e) {
			logger.error(e.getMessage());
			
		}
	}
	
}

