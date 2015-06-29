package com.community.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.ShopDao;
import com.community.model.Shop;
import com.community.service.ShopService;



@Service("shopService")
public class ShopServiceImpl implements ShopService{

	ShopDao shopDao;
	
	@Resource(name="shopDao")
	public void setShopDao(ShopDao shopDao) {
		this.shopDao = shopDao;
	}

	@Override
	public void addShop(Shop shop) {
		shopDao.addShop(shop);
	}

	@Override
	public List<Shop> getShop() {
		// TODO Auto-generated method stub
		List<Shop> shops = new ArrayList<Shop>();
		shops = shopDao.getAllShop();
		return shops;
	}

	@Override
	public void deleteShop(Shop shop) {
		// TODO Auto-generated method stub
		shopDao.deleteShopman(shop);
		shopDao.deleteShop(shop);
	}

	@Override
	public void updateShop(Shop shop) {
		// TODO Auto-generated method stub
		shopDao.modifyShop(shop);
	}

	@Override
	public List<Shop> findShop(Shop shop) {
		List<Shop> shops = new ArrayList<Shop>();
		shops = shopDao.findShop(shop);
		return shops;
	}

	@Override
	public List<Shop> findShopsBywarehouseId(String warehouseId) {
		// TODO Auto-generated method stub
		List<Shop> shops = new ArrayList<Shop>();
		shops = shopDao.findShopsBywarehouseId(warehouseId);
		
		return shops;
	}

	@Override
	public List<Shop> findShopByName(Shop shop) {
		// TODO Auto-generated method stub
		List<Shop> shops = shopDao.findShopByName(shop);
		return shops;
	}

	@Override
	public List<Shop> findShopById(String shopId) {
		// TODO Auto-generated method stub
		List<Shop> shops = new ArrayList<Shop>();
		shops = shopDao.findShopById(shopId);
		return shops;
	}
	
	
	
    /*


	@Override
	public List<User> findUser(User user) {
		List<User> users = new ArrayList<User>();
		users = userDao.findUser(user);
		return users;
	}
	
	@Override
	public void updateUser(User user) {
		userDao.modifyUser(user);
	}

	@Resource(name="userDao")
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
     */
     
}

