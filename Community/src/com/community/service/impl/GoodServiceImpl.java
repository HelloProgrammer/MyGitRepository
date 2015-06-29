package com.community.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import javax.annotation.Resource;

import com.community.dao.GoodDao;
import com.community.model.Good;
import com.community.model.OrderGood;
import com.community.service.GoodService;
@Service("goodService")
public class GoodServiceImpl implements GoodService {

	private GoodDao goodDao;
	@Resource(name="goodDao")
	public void setGoodDao(GoodDao goodDao)
	{
		this.goodDao = goodDao;
	}
	@Override
	public boolean addGood(Good good) {
		// TODO Auto-generated method stub
		Good goodtmp = goodDao.getOneGood(good.getGoodId());
		if(goodtmp==null)
		{
			goodDao.addGood(good);
			return true;
		}
		else
		{
			return false;
		}
		

	}
	@Override
	public List<Good> getAllGood() {
		// TODO Auto-generated method stub
		List<Good> goodlist = new ArrayList<Good>();
		goodlist = goodDao.getAllGood();
		return goodlist;
	}
	@Override
	public Good getOneGood(String goodId) {
		// TODO Auto-generated method stub
		
		Good goodtmp = goodDao.getOneGood(goodId);
		return goodtmp;
		
	}
	@Override
	public boolean deleteGood(Good good) {
		goodDao.deleteGood(good);
		// TODO Auto-generated method stub
		return true;
	}
	
	
	@Override
	public boolean delSelectGoods(String[] ids) {
		// TODO Auto-generated method stub
		for(int i=0;i<ids.length;i++)
		{
			goodDao.deleteGood(ids[i]);
		}
		
		return true;
	}
	@Override
	public boolean updateGood(Good good) {
		// TODO Auto-generated method stub
		try
		{
			goodDao.updateGood(good);
		}
		catch(Exception e)
		{
			System.out.println("service fun");
			return false;
		}
		
		return true;
	}
	
	
	@Override
	public List<Good> findGoodById(Good good) {
		List<Good> goods = goodDao.findGoodById(good);
		return goods;
	}
	@Override
	public void modifyGoodNum(OrderGood orderGood) {
		goodDao.modifyGoodNum(orderGood);
	}
	public List<Good> getGoodsByKindId(String kindId) {
		// TODO Auto-generated method stub
		List<Good> goodlist = new ArrayList<Good>();
		goodlist = goodDao.getGoodsByKindId(kindId);
		return goodlist;
	}
	@Override
	public List<Good> getAllGoodBySaleNum() {
		// TODO Auto-generated method stub
		List<Good> goodlist = new ArrayList<Good>();
		goodlist = goodDao.getAllGoodBySaleNum();
		return goodlist;
	}

}
