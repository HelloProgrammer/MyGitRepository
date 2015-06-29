package com.community.service;

import java.util.List;

import com.community.model.Shop;
import com.community.model.Shopman;


public interface ShopService {
	public void addShop(Shop shop);
	public List<Shop> getShop();
	public void deleteShop(Shop shop);
	public void updateShop(Shop shop);
	public List<Shop> findShop(Shop shop);
	public List<Shop> findShopById(String shopId);
	
	public List<Shop> findShopsBywarehouseId(String warehouseId);
	public List<Shop> findShopByName(Shop shop);
	
	//public List<User> getUser();
	//public void deleteUser(User user);
	//public List<User> findUser(User user);
	//public void updateUser(User user);

}




	

