package com.community.action;

import java.net.URLDecoder;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;

import com.community.model.Shop;
import com.community.model.Shopman;
import com.community.model.Warehouse;
import com.community.service.ShopService;
import com.community.service.ShopmanService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("shopmanAction")
public class ShopmanAction extends ActionSupport {

	ShopmanService shopmanService;
	ShopService shopService;
	
	public ShopService getShopService() {
		return shopService;
	}
	@Resource(name="shopService")
	public void setShopService(ShopService shopService) {
		this.shopService = shopService;
	}

	Shopman shopman;
	private List<Shopman> shopmans;
	
	private String name;
	private Shop shop;
	private List<Shop> shops;
	String result;
	String result1;
	private String shopmanName;
	
	
	
	
	public String Register(){
		try {
			shopman.setName(URLDecoder.decode(name, "UTF-8"));
			shopman.setShop(new Shop(shopman.getShop().getShopId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		shopmanService.addShopman(shopman);
		return "register success";
	}

	public String showOneShopman() {
		shopmans = shopmanService.findShopman(shopman);
		for (int i = 0; i < shopmans.size(); i++) {
			shopmans.get(i).getShop().setShopId
					(shopService.findShopByName(shopmans.get(i).getShop())
							.get(0).getName());
		}
		return "shopman";
	}
	
	public String listShops()
	{
		shop= shopmanService.findShopmanByName(shopmanName).get(0).getShop();
		
		shops=shopService.findShopsBywarehouseId(shop.getWarehouse().getWarehouseId());
		JSONArray jsonArray = new JSONArray();
		for (Iterator iterator = shops.iterator(); iterator.hasNext();) {
			Shop shop = (Shop) iterator.next();
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("shopId", shop.getShopId());
			jsonObject.put("name",shop.getName());
			jsonArray.add(jsonObject);
		}
		result = jsonArray.toString();
		return "list";
	}
	
	public String showOneWarehouse()
	{
		shop= shopmanService.findShopmanByName(shopmanName).get(0).getShop();
		Warehouse warehouse = shop.getWarehouse();
		
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("warehouseId", warehouse.getWarehouseId());
		jsonObject.put("name",warehouse.getName());
		result1 = jsonObject.toString();
		return "warehouse";
	}
	
	public String updateShopman() {
		try {
			shopman.setName(URLDecoder.decode(name, "UTF-8"));
			shopman.setShop(new Shop(shopman.getShop().getShopId()));
		} catch (Exception e) {
			e.printStackTrace();
		}
		shopmanService.modifyShopman(shopman);
		return "update";
	}
	
	public String getAllShopman() {
		shopmans = shopmanService.getShopman();
		return "shopmans";
	}
	
	public String getOneShopman() {
		shopmans = shopmanService.findShopman(shopman);
		return "shopman";
	}
	
	public List<Shopman> getShopmans() {
		return shopmans;
	}

	public void setShopmans(List<Shopman> shopmans) {
		this.shopmans = shopmans;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Shop getShop() {
		return shop;
	}

	public void setShop(Shop shop) {
		this.shop = shop;
	}

	
	public ShopmanService getShopmanService() {
		return shopmanService;
	}
	@Resource(name="shopmanService")
	public void setShopmanService(ShopmanService shopmanService) {
		this.shopmanService = shopmanService;
	}

	public Shopman getShopman() {
		return shopman;
	}

	public void setShopman(Shopman shopman) {
		this.shopman = shopman;
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
	public String getShopmanName() {
		return shopmanName;
	}
	public void setShopmanName(String shopmanName) {
		this.shopmanName = shopmanName;
	}
	public String getResult1() {
		return result1;
	}
	public void setResult1(String result1) {
		this.result1 = result1;
	}
	
	
	
}
