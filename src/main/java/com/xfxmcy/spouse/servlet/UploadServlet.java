/**
 * UploadServlet.java
 * com.xfxmcy.spouse.servlet
 *
 * Function： upload operation 
 *
 *   ver     date      		author
 * ──────────────────────────────────
 *   		 2013年12月22日 		cy
 *
 * Copyright (c) 2013, xfxmcy All Rights Reserved.
*/

package com.xfxmcy.spouse.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.UUID;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * ClassName:UploadServlet
 * Function: upload operation
 * Reason:	 upload operation
 *
 * @author   cy
 * @version  
 * @since    Ver 1.1
 * @Date	 2013年12月22日		下午3:11:32
 *
 * @see 	 
 */
public class UploadServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private String fileUploadPath;
    private Set<String> includedFileTypes = new HashSet<String>();
    protected final Log logger = LogFactory.getLog(getClass());

    /**
     * Default constructor.
     */
    public UploadServlet() {

    }

    public void init(ServletConfig cfg) {
        fileUploadPath = cfg.getServletContext().getRealPath("") + cfg.getServletContext().getInitParameter("upload_path");
        if (fileUploadPath != null) {
            File file = new File(this.fileUploadPath);
            if (!file.exists()) {
                file.mkdirs();
            }
        }
        // 可以上传的文件格式
        String strIncludedTypes = cfg.getServletContext().getInitParameter("includedFileType");

        if (strIncludedTypes != null) {
            String[] includedTypes = StringUtils.split(strIncludedTypes, "|");
            for (String type : includedTypes) {
                if (null != type) {
                    includedFileTypes.add(type.trim());
                }
            }
        }

    }

    static final int BYTELEN = 1024;

    /**
     * 上传文件处理
     * 
     * @param request
     *            .
     * @param response
     *            .
     * @throws ServletException .
     * @throws IOException .
     */

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getParameter("getfile") != null && !request.getParameter("getfile").isEmpty()) {
            String getfile = request.getParameter("getfile");
            logger.debug("getfile1:" + getfile);
            // getfile = new String(getfile.getBytes("ISO8859-1"), "UTF-8");
            // logger.debug("getfile2:"+getfile);
            File file = new File(fileUploadPath, getfile);

            if (file.exists()) {
                int bytes = 0;
                ServletOutputStream op = response.getOutputStream();

                response.setCharacterEncoding("UTF-8");
                response.setContentLength((int) file.length());
                response.addHeader("Connection", "Keep-Alive");
                response.setContentType("application/octet-stream");

                String fileName = request.getParameter("fileName");
                logger.debug("fileName1:" + fileName);
                // fileName = new String(fileName.getBytes("ISO8859-1"),
                // "UTF-8");
                // logger.debug("fileName2:"+fileName);
                if (request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {
                    fileName = URLEncoder.encode(fileName, "UTF-8");// IE
                } else {
                    fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
                }

                response.addHeader("Content-Disposition", "attachment;filename=" + fileName);

                /* 创建输入流 */
                InputStream inStream = new FileInputStream(file);
                byte[] buf = new byte[4096];
                /* 创建输出流 */
                ServletOutputStream servletOS = response.getOutputStream();
                int readLength;
                while (((readLength = inStream.read(buf)) != -1)) {
                    servletOS.write(buf, 0, readLength);
                }
                inStream.close();
                servletOS.flush();
                servletOS.close();
            } else {
                response.setCharacterEncoding("UTF-8");

                PrintWriter writer = response.getWriter();
                writer.write("<script type='text/javascript' charset='utf-8'>alert('您所请求的文件不存在。');</script>");
            }
        } else if (request.getParameter("delfile") != null && !request.getParameter("delfile").isEmpty()) {
            File file = new File(fileUploadPath, request.getParameter("delfile"));
            if (file.exists()) {
                file.delete();
            }
        } else {
            PrintWriter writer = response.getWriter();
            writer.write("call POST with multipart form data");
        }
    }

    /**
     * 上传文件处理
     * 
     * @param request
     *            .
     * @param response
     *            .
     * @throws ServletException .
     * @throws IOException .
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException,
            IOException {
        String folderName = request.getParameter("folder");
        //是否转换文件为PDF
        boolean isPdfCoverter =false;
        if(request.getParameter("isPdfCoverter") != null){
            isPdfCoverter=Boolean.parseBoolean(request.getParameter("isPdfCoverter"));
        }
        folderName = this.createSubfolder(folderName);
        request.setCharacterEncoding("utf-8");
        if (!ServletFileUpload.isMultipartContent(request)) {
            throw new IllegalArgumentException(
                    "Request is not multipart, please 'multipart/form-data' enctype for your form.");
        }
        ServletFileUpload uploadHandler = new ServletFileUpload(new DiskFileItemFactory());
        PrintWriter writer = response.getWriter();
        response.setContentType("text/html;charset=utf-8");
        JSONArray json = new JSONArray();
        try {
            List<FileItem> items = uploadHandler.parseRequest(request);
            for (FileItem item : items) {
                if (!item.isFormField()) {
                    String fileName = this.getFileName(item.getName());
                    String fileType = this.getFileType(fileName);
                    if (!includedFileTypes.contains(fileType)) {
                        throw new Exception("不允许上传此文件类型（*." + fileType + "）的文件。");
                    }
                    String renamedName = this.renameFileName(fileName);
                    File file = new File(fileUploadPath + folderName, renamedName);

                    if (!file.exists()) {
                        file.createNewFile();
                    }
                    item.write(file);
                    //是否转换文件为PDF
                    if (isPdfCoverter) {
                       // PDFConverter pdfConverter = (PDFConverter) SdcContextHelper.getBean(PDFConverter.class);
                      //  pdfConverter.convert2PDFByOpenOffice(file.getPath(), renamedName);
                    }
                    JSONObject jsono = new JSONObject();
                    jsono.put("name", fileName);
                    jsono.put("size", item.getSize());
                    jsono.put("filePath", file.getCanonicalPath());
                    jsono.put("fileName", folderName + "/" + renamedName);
                    json.add(jsono);
                }
            }
            writer.write(json.toString());
        } catch (Exception e) {
            JSONObject jo = new JSONObject();
            jo.put("hasError", true);
            jo.put("errorMsg", e.getMessage());
            writer.write(jo.toString());
            throw new RuntimeException(e);
        } finally {
            writer.close();
        }
    }

    /**
     * 获取文件名
     * 
     * @param fileName
     *            文件名
     * @return .
     */
    private String getFileName(String fileName) {

        if (fileName.indexOf("\\") > -1) {
            fileName = fileName.replaceAll("\\\\", "/");
            int lastIndexOfSlash = fileName.lastIndexOf("/");
            if (lastIndexOfSlash != -1) {
                fileName = fileName.substring(lastIndexOfSlash + 1);
            }
        }
        return fileName;// +fileName;
    }

    /**
     * 获取文件类型
     * 
     * @param fileName
     *            文件名
     * @return .
     */
    private String getFileType(String fileName) {
        int dotIndex = fileName.lastIndexOf(".");
        String fileType = "";
        if (dotIndex > -1) {
            fileType = fileName.substring(dotIndex + 1);
        }
        return fileType;
    }

    /**
     * 从命名文件名
     * 
     * @param fileName
     *            文件名
     * @return .
     */
    private String renameFileName(String fileName) {
        return UUID.randomUUID().toString() + "." + this.getFileType(fileName);
    }

    /**
     * 建立文件夹
     * 
     * @param folderName
     *            文件夹名
     * @return .
     */
    private String createSubfolder(String folderName) {
        if (StringUtils.isNotEmpty(folderName) && !"/".equals(folderName)) {
            folderName = folderName.replaceAll("\\\\", "/");
            if (!folderName.startsWith("/")) {
                folderName = "/" + folderName;
            }
            String fullFloderPath = this.fileUploadPath + folderName;
            File file = new File(fullFloderPath);
            if (!file.exists()) {
                file.mkdirs();
            }
        } else {
            folderName = "";
        }

        return folderName;
    }

}

