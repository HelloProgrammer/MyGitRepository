package com.community.dao;

import java.util.List;

import com.community.model.Shop;
import com.community.model.Shopman;
import com.community.model.Warehouse;

public interface ShopDao {

	public void deleteShops(Warehouse warehouse);
	public List<Shop> findShops(Warehouse warehouse);
	public List<Shop> findShopsBywarehouseId(String warehouseId);
	public List<Shop> findShopByName(Shop shop);
	
	public List<Shop> findShopById(String shopId);
	//亮神
	public void addShop(Shop shop);
	public List<Shop> getAllShop();
	public void deleteShop(Shop shop);
	public void deleteShopman(Shop shop);
	public void modifyShop(Shop shop);
	public List<Shop> findShop(Shop shop);
}
