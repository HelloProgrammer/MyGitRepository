package com.community.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;

import com.community.model.Good;
import com.community.model.OrderGood;

public interface GoodDao {
	public void addGood(Good good);
	public List<Good> getAllGood();
	public List<Good> getAllGoodBySaleNum();
	
	public Good getOneGood(String goodId);
	public void deleteGood(Good good);
	public void deleteGood(String id);
	public void updateGood(Good good)throws HibernateException, SQLException ;
	public List<Good> findGoodById(Good good);
	public void modifyGoodNum(OrderGood orderGood);
	public List<Good> getGoodsByKindId(String kindId);
	public List<Good> showAllGoodDesc();
	public List<Good> showAllGoodAsc();
}
