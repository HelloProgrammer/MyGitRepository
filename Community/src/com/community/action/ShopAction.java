package com.community.action;

import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.community.dao.ManagerDao;
import com.community.dao.ShopDao;
import com.community.model.Manager;
import com.community.model.Shop;
import com.community.model.Warehouse;
import com.community.service.ManagerService;
import com.community.service.ShopService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("shopAction")
public class ShopAction extends ActionSupport{
	
	ShopDao shopDao;
	ShopService shopService;
	Shop shop;
	
	String warehouseId;
	private String result;//用于json数据传送
	private List<Shop> sList;//用于显示下拉列表
	
	private List<Shop> shops;
	
	
	
	public String Register(){
		shopService.addShop(shop);
		return "register success";
	}
	
	public String findShopByWarehouseId() {
		
		sList = shopService.findShopsBywarehouseId(warehouseId);
		JSONArray jsonArray = new JSONArray();
		for (Iterator iterator = sList.iterator(); iterator.hasNext();) {
			Shop shop = (Shop) iterator.next();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("shopId", shop.getShopId());
			jsonObject.put("name",shop.getName());
			jsonArray.add(jsonObject);
		}
		result = jsonArray.toString();
		return "sList";
	}
	
	
	public String getAllShop() {
		shops = shopService.getShop();
		return "shops";
	}
	
	public String deleteShop() {
		shopService.deleteShop(shop);
		return "delete";
	}
	
	public String updateShop() {
		shopService.updateShop(shop);
		return "update";
	}
	public String getOneShop() {
		shops = shopService.findShop(shop);
		return "shop";
	}
	
	public ShopDao getShopDao(){
		return shopDao;
	}
	@Resource(name="shopDao")
	public void setShopDao(ShopDao shopDao){
		this.shopDao = shopDao;
	}
	
	public ShopService getShopService() {
		return shopService;
	}
	@Resource(name="shopService")
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}
	
	public Shop getShop() {
		return shop;
	}
	public void setShop(Shop shop) {
		this.shop = shop;
	}
	
	public List<Shop> getShops() {
		return shops;
	}
	public void setShops(List<Shop> shops) {
		this.shops = shops;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public List<Shop> getsList() {
		return sList;
	}

	public void setsList(List<Shop> sList) {
		this.sList = sList;
	}

	public String getWarehouseId() {
		return warehouseId;
	}

	public void setWarehouseId(String warehouseId) {
		this.warehouseId = warehouseId;
	}
	
	
}
