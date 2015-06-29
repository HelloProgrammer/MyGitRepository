package com.community.service;

import com.community.model.Good;
import com.community.model.OrderGood;

import java.util.List;

public interface GoodService {
	public boolean addGood(Good good);
	public List<Good> getAllGood();
	public List<Good> getAllGoodBySaleNum();
	
	public Good getOneGood(String goodId);
	public boolean deleteGood(Good good);
	public boolean delSelectGoods(String[] ids);
	public boolean updateGood(Good good);
	
	public List<Good> findGoodById(Good good);
	public void modifyGoodNum(OrderGood orderGood);
	public List<Good> getGoodsByKindId(String kindId);

	
}
