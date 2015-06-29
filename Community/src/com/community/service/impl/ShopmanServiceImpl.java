package com.community.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.ShopDao;
import com.community.dao.ShopmanDao;
import com.community.model.Shop;
import com.community.model.Shopman;
import com.community.service.ShopmanService;

@Service("shopmanService")
public class ShopmanServiceImpl implements ShopmanService {

	ShopmanDao shopmanDao;

	@Resource(name="shopmanDao")
	public void setShopmanDao(ShopmanDao shopmanDao) {
		this.shopmanDao = shopmanDao;
	}

	@Override
	public void addShopman(Shopman shopman) {
		// TODO Auto-generated method stub		
		shopmanDao.addShopman(shopman);		
	}

	@Override
	public List<Shopman> getShopman() {
		// TODO Auto-generated method stub
		List<Shopman> shopmans = new ArrayList<Shopman>();
		shopmans = shopmanDao.getAllShopman();
		return shopmans;
	}

	@Override
	public List<Shopman> findShopman(Shopman shopman) {
		// TODO Auto-generated method stub
		List<Shopman> shopmans = new ArrayList<Shopman>();
		shopmans = shopmanDao.findShopman(shopman);
		return shopmans;
	}

	@Override
	public List<Shopman> findShopmanByName(String shopmanName) {
		// TODO Auto-generated method stub
		List<Shopman> shopmans = new ArrayList<Shopman>();
		shopmans = shopmanDao.findShopmanByName(shopmanName);
		return shopmans;
	}

	@Override
	public void modifyShopman(Shopman shopman) {
		// TODO Auto-generated method stub
		
		shopmanDao.modifyShopman(shopman);
	}
	
	
	

}
