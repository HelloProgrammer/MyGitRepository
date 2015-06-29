package com.community.dao;

import java.util.List;

import com.community.model.Cart;

public interface CartDao {

	public void addCart(Cart cart);
	public void updateCartGoodNum(Cart cart);
	public List<Cart> findAllCartByUserandGood(Cart cart);
	public List<Cart> findAllCartByUser(Cart cart);
	public List<Cart> findAllCartByUserId(String userId);
	public void deleteCart(Cart cart);
}
