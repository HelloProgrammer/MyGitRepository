package com.community.action;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Controller;

import com.community.model.Warehouse;
import com.community.service.WarehouseService;
import com.opensymphony.xwork2.ActionSupport;

@Controller("warehouseAction")
public class WarehouseAction extends ActionSupport {

	private WarehouseService warehouseService;
	private List<Warehouse> warehouses;
	private Warehouse warehouse;
	
	public String Register() {
		warehouseService.addWareHouse(warehouse);
		return "register success";
	}
	
	
	public String getAllWarehouse() {
		warehouses = warehouseService.getAllWarehouse();
		return "warehouses";
	}
	
	public String deleteWarehouse() {
		warehouseService.deleteWarehouse(warehouse);
		return "delete";
	}
	public String delSelectWarehouse()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		String sd[] = request.getParameterValues("checkname");
		warehouseService.delSelectWarehouse(sd);
		return "delSelect success";
	}
	
	public String getOneWarehouse() {
		warehouses = warehouseService.findWarehouse(warehouse);
		return "warehouse";
	}
	
	public String updateWarehouse() {
		warehouseService.modifyWarehouse(warehouse);
		return "update";
	}
	
	public WarehouseService getWarehouseService() {
		return warehouseService;
	}
	@Resource(name="warehouseService")
	public void setWarehouseService(WarehouseService warehouseService) {
		this.warehouseService = warehouseService;
	}
	public Warehouse getWarehouse() {
		return warehouse;
	}
	public void setWarehouse(Warehouse warehouse) {
		this.warehouse = warehouse;
	}
	
	public List<Warehouse> getWarehouses() {
		return warehouses;
	}
	public void setWarehouses(List<Warehouse> warehouses) {
		this.warehouses = warehouses;
	}
	
}
