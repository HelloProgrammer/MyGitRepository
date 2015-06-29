package com.community.action;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.io.File; 


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.community.model.Good;
import com.community.model.Kind;
import com.community.service.GoodService;
import com.community.service.KindService;
import com.opensymphony.xwork2.ActionSupport;
@Controller("goodAction")
public class GoodAction extends ActionSupport {
	/**
	 * @author Hai
	 * @version 1.0
	 */
	private GoodService goodService;
	private KindService kindService;
	private Good good;
	private Kind kind;
	private String searchId;
	private List<Good> goodlist;
	
	private List<Good> goods;
	private double goodNum;
	
	

	
	  
	private String fileTitle;  
		  
		
	private File upload;  
		  
		 
	private String uploadFileType;  
		  
		
	private String uploadFileName;  
		  
		
	private final String savePath_images = "/UploadImages/Goods";  
	private final String dataSavaPath = "/Community/UploadImages/Goods";
		
	/**
	 * add good 
	 * @return
	 */
	public String addGood()
	{
		
		if(getUploadFileName()!=null)
		{
			good.setPicture(dataSavaPath+ "/" + changeFileName());//use data SavePath to save in the database
			if(upload_images())
			{
				if(goodService.addGood(good))
				{
					
					return "add success";
				}
				else
				{
					
					return "error";
				}
			}
			else
			{
				
				return "error";
			}
		}
		else
		{
			good.setPicture(dataSavaPath+ "/" + "default.jpg");
			if(goodService.addGood(good))
			{
				return "add success";
			}
			else
			{
				
				return "error";
			}
		}
		
		
		
	}
	/**
	 * 
	 * @return true sucess or false failed
	 */
	public boolean upload_images()
	{  
		
		try 
		{  
		
			FileOutputStream fos = new FileOutputStream( getSavePath_images() + "/" +   
					changeFileName());  
			FileInputStream fis = new FileInputStream(getUpload());  
			byte[] buffer = new byte[1024];  
			int len = 0;  
			try {  
				while((len = fis.read(buffer)) > 0){  
					fos.write(buffer, 0, len);  
				}  
			} catch (IOException e) {  
				e.printStackTrace();  
				return false;
			}  
		} catch (FileNotFoundException e) {  
				e.printStackTrace(); 				
				return false;
		}  
		return true;  
	}  
		
	
	
	
	
	
	/**
	 * 
	 * @return 
	 */
	public String getAllGood()
	{
		goodlist = goodService.getAllGood();
		
		
	    return "getAll success";
		
		
	}
	public String getKindGood()
	{
		String kindId = good.getKind().getKindId();
		goodlist = goodService.getGoodsByKindId(kindId);
		
		
	    return "getKind success";
		
		
	}
	public String getOneGood()
	{
		
		System.out.print("searchID---"+searchId);
		if(searchId.equals(""))
		{
			return getAllGood();
		}
		else
		{
			good = goodService.getOneGood(searchId);
			goodlist.clear();
			goodlist.add(good);
			if(good==null)
			{
				return "error";
			}
			else
			{
				return "search success";
			}
		}
		
		
	}
	public String toUpdateGood()
	{
		good = goodService.getOneGood(good.getGoodId());
		good.getKind().setKindId(kindService.findKindById(new Kind(good.getKind().getKindId())).get(0).getKindName());

		return "to update";
	}
	public String updateGood()
	{
		
		if(getUploadFileName()!=null)
		{
			good.setPicture(dataSavaPath+ "/" + changeFileName());//use data SavePath to save in the database
			upload_images();
			
			goodService.updateGood(good);
				
			return "update success";
				
			
			
		}
		else
		{
			//System.out.println("update fun");
			goodService.updateGood(good);			
				//System.out.println("update success");
			return "update success";
			
			
		}			
		
	}
	
	
	public String deleteGood()
	{
		//System.out.println("test"+good.getGoodId());
		if(goodService.deleteGood(good))
		{
			return "delete success";
		}
		else
		{
			return "error";
		}
	}

	public String delSelectGoods()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String sd[] = request.getParameterValues("checkname");
		
		goodService.delSelectGoods(sd);
		return "delSelectGoods";
	}
	
	public String changeFileName()
	{
		String name = getUploadFileName();
		name = name.substring(name.lastIndexOf('.'));
		return good.getGoodId()+name;
	}
	
	

	public GoodService getGoodService() {
		return goodService;
	}

	
	@Resource(name="goodService")
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
	
	

	public KindService getKindService() {
		return kindService;
	}
	@Resource(name="kindService")
	public void setKindService(KindService kindService) {
		this.kindService = kindService;
	}
	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}
	
	public Kind getKind() {
		return kind;
	}
	public void setKind(Kind kind) {
		this.kind = kind;
	}
	public List<Good> getGoodlist() {
		return goodlist;
	}
	public void setGoodlist(List<Good> goodlist) {
		this.goodlist = goodlist;
	}
	public String getSearchId() {
		return searchId;
	}
	public void setSearchId(String searchId) {
		this.searchId = searchId;
	}
	
	
	

			public String getSavePath_images() {  
			return ServletActionContext.getRequest().getRealPath(savePath_images);  
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
			public List<Good> getGoods() {
				return goods;
			}
			public void setGoods(List<Good> goods) {
				this.goods = goods;
			}
			public double getGoodNum() {
				return goodNum;
			}
			public void setGoodNum(double goodNum) {
				this.goodNum = goodNum;
			}
		public String findGoodById() {
			goods = goodService.findGoodById(good);
			return "goods";
		}
	
}
