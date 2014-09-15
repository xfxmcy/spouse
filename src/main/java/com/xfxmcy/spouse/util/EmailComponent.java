/**
 * EmailComponent.java
 * com.xfxmcy.spouse.util
 *
 * Function： TODO 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2014年7月16日 		cy
 *
 * Copyright (c) 2014, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.util;

import java.util.Properties;

import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Component;

import com.sun.mail.util.MailSSLSocketFactory;
import com.xfxmcy.spouse.pojo.SJWish;

/**
 * ClassName:EmailComponent
 * Function: email component
 * Reason:	 email component
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2014年7月16日		上午8:42:05
 *
 * @see 	 
 */
@Component
public class EmailComponent {
	
	private static final String EMAIL_PROTOCOL_SMTP = "smtp";
	
	private static final String EMAIL_PROTOCOL_POP3 = "pop3";
	
	private static final String MAIL_STMP_AUTH = "mail.smtp.auth";
	
	private static final String MAIL_TRANSPORT_PROTOCOL = "mail.transport.protocol";
	
	private static final String MAIL_SMTP_SSL_ENABLE = "mail.smtp.ssl.enable"; 
	
	private static final String MAIL_STMP_SSL_SOCKET= "mail.smtp.ssl.socketFactory";
	
	private Session session = null ;
	
	private Message msg = null ;
	
	private Transport transport = null ; 
	/**
 	 * Logger for this class
	 */
	private static final Logger logger = Logger.getLogger(EmailComponent.class);
	
	private Properties props = null ;
	
	private MailSSLSocketFactory mailSslSf = null ;
	
	
	
	@SuppressWarnings("static-access")
	public void sendSimpleEmail(SJWish wish){
		props = new Properties();
		props.setProperty(this.MAIL_STMP_AUTH, ResourceUtil.getMailSmtpAuth());
		props.setProperty(this.MAIL_TRANSPORT_PROTOCOL, this.EMAIL_PROTOCOL_SMTP);
		try {
			mailSslSf = new MailSSLSocketFactory();
			mailSslSf.setTrustAllHosts(true);
			props.put(this.MAIL_SMTP_SSL_ENABLE, "true");
			props.put(this.MAIL_STMP_SSL_SOCKET, mailSslSf);
			session = Session.getDefaultInstance(props);
			msg = new MimeMessage(session); // 建立一个要发送的信息
			msg.setText(wish.getText()+"\n\n\n   静,happy birthday 祝小静 心想事成,万事如意... 愿望 一定会实现 ,让我们一起见证");// 设置简单的发送内容
			msg.setFrom(new InternetAddress(ResourceUtil.getMailAuthor()));// 发件人邮箱号
			msg.setSubject(wish.getSubject());
			transport = session.getTransport();// 发送信息的工具
			transport.connect(ResourceUtil.getMailSmtpServer(), ResourceUtil.getSmtpPort(), ResourceUtil.getMailAuthor(), ResourceUtil.getMailAuthorPasswd());
			
																					// 和密码
			// transport.connect("smtp.exmail.qq.com", 25,
			// "wenjian_332401890@qq.com", "MEIY0Umima");// 发件人邮箱号
			/*transport.sendMessage(msg, new Address[] { new InternetAddress(
					ResourceUtil.getMailSender()) ,  new InternetAddress(
					ResourceUtil.getMailSenderSecond())});*/
			transport.sendMessage(msg, new Address[] { new InternetAddress(
					ResourceUtil.getMailSender())});
			transport.close();
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			
		}
		
		
	}

	
	@SuppressWarnings("static-access")
	public void sendEmailForUs(SJWish wish){
		props = new Properties();
		props.setProperty(this.MAIL_STMP_AUTH, ResourceUtil.getMailSmtpAuth());
		props.setProperty(this.MAIL_TRANSPORT_PROTOCOL, this.EMAIL_PROTOCOL_SMTP);
		try {
			mailSslSf = new MailSSLSocketFactory();
			mailSslSf.setTrustAllHosts(true);
			props.put(this.MAIL_SMTP_SSL_ENABLE, "true");
			props.put(this.MAIL_STMP_SSL_SOCKET, mailSslSf);
			session = Session.getDefaultInstance(props);
			msg = new MimeMessage(session); // 建立一个要发送的信息
			msg.setText(wish.getName()+"	给您发的信息...\n\n\n"+wish.getText()+"	...\n\n\n....他的eamil ..." + wish.getEmailForm());// 设置简单的发送内容
			msg.setFrom(new InternetAddress(ResourceUtil.getMailSecondAuthor()));// 发件人邮箱号
			msg.setSubject(wish.getSubject());
			transport = session.getTransport();// 发送信息的工具
			transport.connect(ResourceUtil.getMailSmtpServer(), ResourceUtil.getSmtpPort(), ResourceUtil.getMailSecondAuthor(), ResourceUtil.getMailSecondAuthorPasswd());
			
																					// 和密码
			// transport.connect("smtp.exmail.qq.com", 25,
			// "wenjian_332401890@qq.com", "MEIY0Umima");// 发件人邮箱号
			/*transport.sendMessage(msg, new Address[] { new InternetAddress(
					ResourceUtil.getMailSender()) ,  new InternetAddress(
					ResourceUtil.getMailSenderSecond())});*/
			transport.sendMessage(msg, new Address[] { new InternetAddress(
					ResourceUtil.getMailAuthor())});
			transport.close();
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			
		}
		
		
	}
	
}

