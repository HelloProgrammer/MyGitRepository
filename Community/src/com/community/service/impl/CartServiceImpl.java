package com.community.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.community.dao.CartDao;
import com.community.model.Cart;
import com.community.service.CartService;

@Service("cartService")
public class CartServiceImpl implements CartService {

	private CartDao cartDao;
	
	public CartDao getCartDao() {
		return cartDao;
	}
    @Resource(name="cartDao")
	public void setCartDao(CartDao cartDao) {
		this.cartDao = cartDao;
	}

	@Override
	public void addCart(Cart cart) {
		cartDao.addCart(cart);
	}
	@Override
	public void updateCartGoodNum(Cart cart) {
		cartDao.updateCartGoodNum(cart);
	}
	@Override
	public List<Cart> findAllCartByUserandGood(Cart cart) {
		List<Cart> carts = cartDao.findAllCartByUserandGood(cart);
		return carts;
	}
	@Override
	public List<Cart> findAllCartByUser(Cart cart) {
		List<Cart> carts = cartDao.findAllCartByUser(cart);
		return carts;
	}
	@Override
	public List<Cart> findAllCartByUserId(String userId) {
		List<Cart> carts = cartDao.findAllCartByUserId(userId);
		return carts;
	}
	@Override
	public void deleteCart(Cart cart) {
		cartDao.deleteCart(cart);
	}

}
