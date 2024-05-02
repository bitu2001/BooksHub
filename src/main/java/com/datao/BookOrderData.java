package com.datao;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderData {

	
	
//	public int getOrderNum();
	public boolean SaveOrder(List<BookOrder> b);
	
	public List<BookOrder> getBook(String email);
	
	
	public List<BookOrder> getAllOrderBook();

}
