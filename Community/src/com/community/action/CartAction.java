package com.community.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.community.model.Cart;
import com.community.model.Customer;
import com.community.model.Good;
import com.community.service.CartService;
import com.community.service.GoodService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Controller("cartAction")
public class CartAction extends ActionSupport {

	private Cart cart;
	private CartService cartService;
	private GoodService goodService;
	private List<Cart> carts;
	private List<Good> goods;
	
	public String addCart() {
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		cart.setCustomer(new Customer(userId));
		if (cartService.findAllCartByUserandGood(cart).isEmpty()) {
			cartService.addCart(cart);
		} else {
			cartService.updateCartGoodNum(cart);
		}
		return "add success";
	}
	
	public String showAllCartByUser() {
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		List<Good> goodtmp = new ArrayList<Good>();
		carts = cartService.findAllCartByUserId(userId);
		for (int i = 0; i < carts.size(); i++) {
			goodtmp.add(goodService.getOneGood(carts.get(i).getGood().getGoodId()));
		}
		this.setGoods(goodtmp);
		return "carts";
	}
	
	public String deleteCart() {
		ActionContext actionContext = ActionContext.getContext();
		Map session = actionContext.getSession();
		String userId = (String)session.get("USER_ID");
		cart.setCustomer(new Customer(userId));
		cartService.deleteCart(cart);
		return "delete";
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
	public List<Good> getGoods() {
		return goods;
	}
	public void setGoods(List<Good> goods) {
		this.goods = goods;
	}
	public GoodService getGoodService() {
		return goodService;
	}
    @Resource(name="goodService")
	public void setGoodService(GoodService goodService) {
		this.goodService = goodService;
	}
}
