package com.community.service;

import java.util.List;

import com.community.model.Warehouse;

public interface WarehouseService {

	public void addWareHouse(Warehouse warehouse);
	public List<Warehouse> getAllWarehouse();
	public void deleteWarehouse(Warehouse warehouse);
	public List<Warehouse> findWarehouse(Warehouse warehouse);
	public void modifyWarehouse(Warehouse warehouse);
	public boolean delSelectWarehouse(String []wst);
}
