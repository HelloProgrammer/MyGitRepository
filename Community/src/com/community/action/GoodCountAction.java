package com.community.action;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.community.model.Good;
import com.community.model.OrderGood;
import com.community.service.GoodService;
import com.community.service.OrderGoodService;
import com.community.util.Util;
import com.opensymphony.xwork2.ActionSupport;
@Controller("goodcountAction")
public class GoodCountAction extends ActionSupport {
	/**
	 * @author Hai
	 * @version 1.0
	 */
	private GoodService goodService;
	private OrderGoodService orderGoodService;
	private Good good;
	private List<Good> goodlist;
	private List<OrderGood> orderGoodList;
	
	private String totalProfit;
	
	/**
	 * 
	 * @return 
	 */
	public String getAllGood()
	{
		goodlist = goodService.getAllGoodBySaleNum();
		double totalSalePrice = 0;
		double totalBuyPrice = 0;
		double profit = 0;
		if(goodlist.size()>0)
		{
			for(int i=0;i<goodlist.size();i++)
			{
				totalSalePrice=0;
				Good good = goodlist.get(i);
				List<OrderGood> list = orderGoodService.getOrderGoodsByGoodId(good.getGoodId());
				if(list.size() > 0)
				{
					
					for(int j=0;j<list.size();j++)
					{
						OrderGood orderGood = list.get(j);
						totalSalePrice += orderGood.getTotalPrice();
					}
				}
				else{
					totalSalePrice = 0;
				}
				totalBuyPrice = 
						good.getBuyPrice() * good.getSaleNum();
				profit = totalSalePrice - totalBuyPrice;
				good.setIshot(profit+"");	
			}
		}	
	    return "getAll success";	
	}
	
	@SuppressWarnings("unchecked")
	public String showAllGoodByProfit() {
		goodlist = goodService.getAllGoodBySaleNum();
		double totalSalePrice = 0;
		double totalBuyPrice = 0;
		double profit = 0;
		List<Good> goods = new ArrayList<Good>();
		if(goodlist.size()>0)
		{
			for(int i=0;i<goodlist.size();i++)
			{
				totalSalePrice=0;
				Good good = goodlist.get(i);
				List<OrderGood> list = orderGoodService.getOrderGoodsByGoodId(good.getGoodId());
				if(list.size() > 0)
				{
					
					for(int j=0;j<list.size();j++)
					{
						OrderGood orderGood = list.get(j);
						totalSalePrice += orderGood.getTotalPrice();
					}
				}
				else{
					totalSalePrice = 0;
				}
				totalBuyPrice = 
						good.getBuyPrice() * good.getSaleNum();
				profit = totalSalePrice - totalBuyPrice;
				good.setIshot(profit+"");	
			}
			Collections.sort(goodlist);
			Collections.reverse(goodlist);
		}	
		
	    return "getAll";
	}
	
	public String getOrderGoodByGoodId()
	{
		orderGoodList = orderGoodService.getOrderGoodsByGoodId(good.getGoodId());
		double profit = 0;
		double tProfit = 0;
		if(orderGoodList.size()>0)
		{
			for(int i=0;i<orderGoodList.size();i++)
			{
				OrderGood orderGood = orderGoodList.get(i);
				
				Good goodtem = goodService.getOneGood(good.getGoodId());
				profit = orderGood.getNum() *(orderGood.getSalePrice() - goodtem.getBuyPrice());
				orderGood.getGood().setGoodId(goodtem.getName());
				orderGood.setCommentState(goodtem.getBuyPrice()+"");
				orderGood.setComment(profit+"");
				
				tProfit += profit;
			}
		}
		totalProfit = tProfit + "";
		
		return "orderGoods";
	}
	
	

	public GoodService getGoodService() {
		return goodService;
	}

	
	@Resource(name="goodService")
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
	
	
	public OrderGoodService getOrderGoodService() {
		return orderGoodService;
	}
	
	@Resource(name="orderGoodService")
	public void setOrderGoodService(OrderGoodService orderGoodService) {
		this.orderGoodService = orderGoodService;
	}
	
	public Good getGood() {
		return good;
	}

	public void setGood(Good good) {
		this.good = good;
	}
	
	public List<Good> getGoodlist() {
		return goodlist;
	}
	public void setGoodlist(List<Good> goodlist) {
		this.goodlist = goodlist;
	}

	public List<OrderGood> getOrderGoodList() {
		return orderGoodList;
	}

	public void setOrderGoodList(List<OrderGood> orderGoodList) {
		this.orderGoodList = orderGoodList;
	}

	public String getTotalProfit() {
		return totalProfit;
	}

	public void setTotalProfit(String totalProfit) {
		this.totalProfit = totalProfit;
	}

	
	
	
		
}
