package com.datao;

import java.util.List;

import com.entity.Cart;

public interface CartData {
	public boolean addCart(CartData c);
	public List<Cart> getBookByUser(int userId);
	public boolean deleteBook(int bid, int uid,int cid);
}
