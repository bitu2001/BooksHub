package com.datao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.BookOrder;

public class BookOrderDataImpl implements BookOrderData {

	private Connection conn;

	public BookOrderDataImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public boolean SaveOrder(List<BookOrder> blist) {
		boolean f = false;
		try {

			String sql = "insert into bookorder(orderid,username,email,address,phone,bookname,author,price,payment) values(?,?,?,?,?,?,?,?,?)";

			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);

			for (BookOrder b : blist) {
				ps.setString(1, b.getOrderid());
				ps.setString(2, b.getUsername());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getFulladd());
				ps.setString(5, b.getPhno());
				ps.setString(6, b.getBookname());
				ps.setString(7, b.getAuthor());
				ps.setString(8, b.getPrice());
				ps.setString(9, b.getPaymenttype());
				ps.addBatch();

			}

			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookOrder> getBook(String email) {

		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder o;

		try {

			String sql = "select * from bookorder where email=?";

			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymenttype(rs.getString(10));
				list.add(o);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public List<BookOrder> getAllOrderBook() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder o;

		try {

			String sql = "select * from bookorder";

			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				o = new BookOrder();
				o.setId(rs.getInt(1));
				o.setOrderid(rs.getString(2));
				o.setUsername(rs.getString(3));
				o.setEmail(rs.getString(4));
				o.setFulladd(rs.getString(5));
				o.setPhno(rs.getString(6));
				o.setBookname(rs.getString(7));
				o.setAuthor(rs.getString(8));
				o.setPrice(rs.getString(9));
				o.setPaymenttype(rs.getString(10));
				list.add(o);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return list;
	}
	
	

}
