package com.community.action;
/**
 * 二级类别下的商品
 * 
 */

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.community.model.Good;
import com.community.service.GoodService;
import com.opensymphony.xwork2.ActionSupport;
@Controller("catAction")
public class CatAction extends ActionSupport {
	
	private GoodService goodService;
	private List<Good> gslist;
	
	/**
	 * 显示二级类别下的商品
	 * @return
	 */
	public String showShop(){
		gslist = goodService.getAllGood();
		
		return "show result";
	}

	public GoodService getGoodService() {
		return goodService;
	}
	@Resource(name="goodService")
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

	public List<Good> getGslist() {
		return gslist;
	}

	public void setGslist(List<Good> gslist) {
		this.gslist = gslist;
	}
}
