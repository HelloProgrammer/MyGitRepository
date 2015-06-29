package com.community.service;

import java.util.List;

import com.community.model.Shop;
import com.community.model.Shopman;

public interface ShopmanService {

	public void addShopman(Shopman shopman);
	
	public List<Shopman> getShopman();
	public List<Shopman> findShopman(Shopman shopman);
	
	public List<Shopman> findShopmanByName(String shopmanName);
	
	public void modifyShopman(Shopman shopman);
}
