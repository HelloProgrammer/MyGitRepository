package com.community.dao;

import java.util.List;

import com.community.model.Warehouse;

public interface WarehouseDao {

	public void addWarehouse(Warehouse warehouse);
	public List<Warehouse> getAllWarehouse();
	public void deleteWarehouse(Warehouse warehouse);
	public List<Warehouse> findWarehouse(Warehouse warehouse);
	public void modifyWarehouse(Warehouse warehouse);
	public void deleteWarehouse(String id);
	
}
