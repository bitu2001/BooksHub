package com.datao;

import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.Dbconnect;
import com.entity.Bookdetails;
import com.entity.Cart;

import java.util.ArrayList;
import java.util.List;

public class CartDataImpl implements CartData {
    @Override
	public boolean deleteBook(int bid,int uid,int cid) {
    	
    	boolean f=false;
    	try {

        	String sql="delete from cart where bid=? and uid=? and cid=?";
        	
        	PreparedStatement ps=conn.prepareStatement(sql);
        	ps.setInt(1, bid);
        	ps.setInt(2, uid);
        	ps.setInt(3, cid);
        	int i=ps.executeUpdate();
        	if(i==1) {
        		f=true;
        	}
        	
        	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return f;
	}

	private Connection conn;
    
    public CartDataImpl(Connection conn) {
        this.conn = conn;
    }

    public boolean addCart(Cart c) {
        boolean f = false;
        
        try {
            String sql = "insert into cart(bid,uid,bookname,author,price,total_price) values(?,?,?,?,?,?)";
            
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, c.getBid());
            ps.setInt(2, c.getUserId());
            ps.setString(3, c.getBookname());
            ps.setString(4, c.getAuthor());
            ps.setDouble(5, c.getPrice());
            ps.setDouble(6, c.getTotal_price());
            
            int i = ps.executeUpdate();
            if (i == 1) {
                f = true;
            }
            
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }
        
        return f;
    }

	@Override
	public boolean addCart(CartData c) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Cart> getBookByUser(int userId) {
		List<Cart> list=new ArrayList<>();
		Cart c=null;
		double totalPrice = 0;
		
		try {
			String sql="select * from cart where uid=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1,userId);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				c=new Cart();
				c.setCid(rs.getInt(1));
				c.setBid(rs.getInt(2));
				c.setUserId(rs.getInt(3));
				c.setBookname(rs.getString(4));
				c.setAuthor(rs.getString(5));
				c.setPrice(rs.getDouble(6));
				
				totalPrice =totalPrice+rs.getDouble(7);
				
				c.setTotal_price(totalPrice);
				list.add(c);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return list;
	}
	}

	
		
	
	

