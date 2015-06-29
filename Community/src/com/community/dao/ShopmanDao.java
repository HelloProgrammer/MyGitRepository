package com.community.dao;

import java.util.List;

import com.community.model.Shop;
import com.community.model.Shopman;
import com.community.model.Warehouse;

public interface ShopmanDao {

	public void deleteShopmans(Warehouse warehouse);
	public void addShopman(Shopman shopman);
	public void modifyShopman(Shopman shopman);
	
	public List<Shopman> getAllShopman();
	public List<Shopman> findShopman(Shopman shopman);
	public List<Shopman> findShopmanByName(String shopmanName);
	
}
