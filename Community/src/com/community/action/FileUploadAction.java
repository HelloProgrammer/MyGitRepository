package com.community.action;

import java.io.File; 
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

import org.apache.struts2.ServletActionContext;

 

import com.opensymphony.xwork2.ActionSupport; 

public class FileUploadAction extends ActionSupport{  
	//上传文件标题  
	private String fileTitle;  
	  
	//上传文件域  
	private File upload;  
	  
	//上传文件类型  
	private String uploadFileType;  
	  
	//上传文件名  
	private String uploadFileName;  
	  
	//直接在sturts.xml文件中配置值的属性  
	private String savePath_images;  
	  
	//接受struts.xml文件配置值的方法  
	@SuppressWarnings("deprecation")  
	public String getSavePath_images() {  
	return ServletActionContext.getRequest().getRealPath(savePath_images);  
	}  
	  
	public void setSavePath_images(String savePath_images) {  
	this.savePath_images = savePath_images;  
	}  
	  
	public String getFileTitle() {  
	return fileTitle;  
	}  
	  
	public void setFileTitle(String fileTitle) {  
	this.fileTitle = fileTitle;  
	}  
	  
	public File getUpload() {  
	return upload;  
	}  
	  
	public void setUpload(File upload) {  
	this.upload = upload;  
	}  
	  
	public String getUploadFileType() {  
	return uploadFileType;  
	}  
	  
	public void setUploadFileType(String uploadFileType) {  
	this.uploadFileType = uploadFileType;  
	}  
	  
	public String getUploadFileName() {  
	return uploadFileName;  
	}  
	  
	public void setUploadFileName(String uploadFileName) {  
	this.uploadFileName = uploadFileName;  
	}  
	  
	//上传头像  
	public String upload_images(){  
		System.out.println("hehe"+getSavePath_images());
	try {  
	FileOutputStream fos = new FileOutputStream(getSavePath_images() + "\\" +   
	getUploadFileName());  
	FileInputStream fis = new FileInputStream(getUpload());  
	byte[] buffer = new byte[1024];  
	int len = 0;  
	try {  
	while((len = fis.read(buffer)) > 0){  
	fos.write(buffer, 0, len);  
	}  
	} catch (IOException e) {  
	e.printStackTrace();  
	}  
	} catch (FileNotFoundException e) {  
	e.printStackTrace();  
	}  
	return SUCCESS;  
	}  
	}  