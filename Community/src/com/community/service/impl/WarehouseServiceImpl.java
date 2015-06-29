package com.community.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;


import com.community.dao.ShopDao;
import com.community.dao.ShopmanDao;
import com.community.dao.WarehouseDao;
import com.community.model.Warehouse;
import com.community.service.WarehouseService;

@Service("warehouseService")
public class WarehouseServiceImpl implements WarehouseService {

	WarehouseDao warehouseDao;
	ShopDao shopDao;
	ShopmanDao shopmanDao;
	@Resource(name="warehouseDao")
	public void setWarehouseDaos(WarehouseDao warehouseDao) {
		this.warehouseDao = warehouseDao;
	}
	@Resource(name="shopDao")
	public void setShopDaos(ShopDao shopDao) {
		this.shopDao = shopDao;
	}
	@Resource(name="shopmanDao")
	public void setShopmanDaos(ShopmanDao shopmanDao) {
		this.shopmanDao = shopmanDao;
	}

	@Override
	public void addWareHouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		warehouseDao.addWarehouse(warehouse);
		
	}

	@Override
	public List<Warehouse> getAllWarehouse() {
		// TODO Auto-generated method stub
		
		List<Warehouse> warehouses = new ArrayList<Warehouse>();
		warehouses = warehouseDao.getAllWarehouse();
		return warehouses;
		
	}

	@Override
	public void deleteWarehouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		shopmanDao.deleteShopmans(warehouse);
		shopDao.deleteShops(warehouse);
		warehouseDao.deleteWarehouse(warehouse);
		
	}
	

	@Override
	public boolean delSelectWarehouse(String[] wst) {
		// TODO Auto-generated method stub
		for(int i=0;i<wst.length;i++)
		{
			warehouseDao.deleteWarehouse(wst[i]);
		}
		return true;
	}
	@Override
	public List<Warehouse> findWarehouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		List<Warehouse> warehouses = new ArrayList<Warehouse>();
		warehouses = warehouseDao.findWarehouse(warehouse);
		return warehouses;
	}

	@Override
	public void modifyWarehouse(Warehouse warehouse) {
		// TODO Auto-generated method stub
		
		warehouseDao.modifyWarehouse(warehouse);
	}


}
