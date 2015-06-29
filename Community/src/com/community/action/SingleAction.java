package com.community.action;
/**
 * 单个商品
 */

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.community.model.Good;
import com.community.model.Order;
import com.community.model.OrderGood;
import com.community.service.GoodService;
import com.community.service.OrderGoodService;
import com.community.service.OrderService;
import com.opensymphony.xwork2.ActionSupport;
@Controller("singleAction")
public class SingleAction extends ActionSupport {
	private String goodid;
	private Good singleGood;
	private GoodService goodService;
	
	private List<OrderGood> commentList;
	private List<Order> commentatorList;
	private OrderGoodService orderGoodService;
	private OrderService orderService;
	
	public String showSingle(){
		singleGood = goodService.getOneGood(goodid);
		commentList = orderGoodService.getOrderGoodsByGoodId(goodid);
		List<Order> commlist = new ArrayList<Order>();
		for (int i = 0; i < commentList.size(); i++) {
			Order oneOrder = orderService.getOneOrder(commentList.get(i).getOrder().getOrderId());
			commlist.add(oneOrder);
		}
		this.setCommentatorList(commlist);
		
		return "single info";
	}

	public String getGoodid() {
		return goodid;
	}

	public void setGoodid(String goodid) {
		this.goodid = goodid;
	}

	public Good getSingleGood() {
		return singleGood;
	}

	public void setSingleGood(Good singleGood) {
		this.singleGood = singleGood;
	}

	public GoodService getGoodService() {
		return goodService;
	}
	@Resource(name="goodService")
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

	public List<OrderGood> getCommentList() {
		return commentList;
	}

	public void setCommentList(List<OrderGood> commentList) {
		this.commentList = commentList;
	}

	public OrderGoodService getOrderGoodService() {
		return orderGoodService;
	}
	@Resource(name="orderGoodService")
	public void setOrderGoodService(OrderGoodService orderGoodService) {
		this.orderGoodService = orderGoodService;
	}

	public List<Order> getCommentatorList() {
		return commentatorList;
	}

	public void setCommentatorList(List<Order> commentatorList) {
		this.commentatorList = commentatorList;
	}

	public OrderService getOrderService() {
		return orderService;
	}
	@Resource(name="orderService")
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
}
