package com.community.action;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.aspectj.weaver.ast.Or;
import org.springframework.stereotype.Controller;

import com.community.model.Cart;
import com.community.model.Customer;
import com.community.model.Good;
import com.community.model.Order;
import com.community.model.OrderGood;
import com.community.service.CartService;
import com.community.service.GoodService;
import com.community.service.OrderGoodService;
import com.community.service.UserOrderService;
import com.community.util.GetNewId;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("userOrderAction")
public class UserOrderAction extends ActionSupport {

	private Order order;
	private UserOrderService userOrderService;
	private OrderGoodService orderGoodService;
	private GoodService goodService;
	private OrderGood orderGood;
	private List<OrderGood> orderGoods;
	private Cart cart = new Cart();
	private CartService cartService;
	private List<Cart> carts = new ArrayList<Cart>();
	
	public String transferData() {
		return "transfer success";
	}
	
	public String transData() {
		return "trans success";
	}
	
	public String addOrder() {
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		order.setCustomer(new Customer(userId));
		order.setOrderId(GetNewId.getNewOrderId()+"");
		orderGood.setOrder(new Order(order.getOrderId()));
		userOrderService.addOrder(order);
		orderGoodService.addOrderGood(orderGood);
		goodService.modifyGoodNum(orderGood);
		return "add success";
	}
	
	public String addCartOrder() {
		ActionContext actionContext = ActionContext.getContext();
        Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		order.setCustomer(new Customer(userId));
		order.setOrderId(GetNewId.getNewOrderId()+"");
		userOrderService.addOrder(order);
		for (int i = 0; i < orderGoods.size(); i++) {
			orderGoods.get(i).setOrder(new Order(order.getOrderId()));
			orderGoodService.addOrderGood(orderGoods.get(i));
			goodService.modifyGoodNum(orderGoods.get(i));
			cart.setCustomer(new Customer(order.getCustomer().getUserId()));
			cart.setGood(new Good(orderGoods.get(i).getGood().getGoodId()));
			cartService.deleteCart(cart);
		}
		return "addc success";
	}
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public UserOrderService getUserOrderService() {
		return userOrderService;
	}
	@Resource(name="userOrderService")
	public void setUserOrderService(UserOrderService userOrderService) {
		this.userOrderService = userOrderService;
	}
	public OrderGood getOrderGood() {
		return orderGood;
	}
	public void setOrderGood(OrderGood orderGood) {
		this.orderGood = orderGood;
	}
	public OrderGoodService getOrderGoodService() {
		return orderGoodService;
	}
    @Resource(name="orderGoodService")
	public void setOrderGoodService(OrderGoodService orderGoodService) {
		this.orderGoodService = orderGoodService;
	}
	public GoodService getGoodService() {
		return goodService;
	}
    @Resource(name="goodService")
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}

	public List<OrderGood> getOrderGoods() {
		return orderGoods;
	}

	public void setOrderGoods(List<OrderGood> orderGoods) {
		this.orderGoods = orderGoods;
	}

	public Cart getCart() {
		return cart;
	}

	public void setCart(Cart cart) {
		this.cart = cart;
	}

	public CartService getCartService() {
		return cartService;
	}
    @Resource(name="cartService")
	public void setCartService(CartService cartService) {
		this.cartService = cartService;
	}

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

}
