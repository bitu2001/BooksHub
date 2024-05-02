package com.datao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class userdataimpl {
private Connection conn;

public userdataimpl(Connection conn) {
	super();
	this.conn = conn;
}
public boolean userRegister(User us) {
    boolean f = false;
    
    try {
        String sql = "insert into user(name,email,phno,password) values(?,?,?,?)";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setString(1, us.getName());
        ps.setString(2, us.getEmail());
        ps.setString(3, us.getPhno());
        ps.setString(4, us.getPassword());

        int i = ps.executeUpdate();
        if (i == 1) {
            f = true;
        }

    } catch (Exception e) {
        e.printStackTrace();
    }

    return f; // Return the actual value of 'f' instead of hardcoding 'false'
}
public User login(String email,String password){
User us=null;
    try {
        String sql="select * from user where email=? and password=?";
        PreparedStatement ps=conn.prepareStatement(sql);
        ps.setString(1, email);
        ps.setString(2, password);

        ResultSet rs=ps.executeQuery();

        while (rs.next()) {
        us=new User();
        us.setId(rs.getInt(1));
        us.setName(rs.getString(2));            
        us.setEmail(rs.getString(3));
        us.setPhno(rs.getString(4));
        us.setPassword(rs.getString(5));
        us.setAddress(rs.getString(6));
        us.setLandmark(rs.getString(7));
        us.setCity(rs.getString(8));
        us.setState(rs.getString(9));
        us.setPincode(rs.getString(10));
        }
    } catch (Exception e) {
        // TODO: handle exception
    }
return us;
}
public  boolean checkPassword(int id, String ps) {
	boolean f=false;
	
	try {
		
		String sql="select * from user where id=? and password=?";
		
        PreparedStatement ps1=conn.prepareStatement(sql);
        ps1.setInt(1, id);
        ps1.setString(2, ps);
        
        ResultSet rs=ps1.executeQuery();
        while(rs.next()) {
        	f=true;
        }
		
		
		
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	return f;
}

public boolean updateProfile(User us) {
	 boolean f = false;
	    
	    try {
	        String sql = "update user set name=?,email=?,phno=?where id=?";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setString(1, us.getName());
	        ps.setString(2, us.getEmail());
	        ps.setString(3, us.getPhno());
	        ps.setInt(4, us.getId());

	        int i = ps.executeUpdate();
	        if (i == 1) {
	            f = true;
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	
}

public  boolean checkUser(String em) {
	
	boolean f=true;
	
	try {
		 String sql = "select * from user where email=?";
	        PreparedStatement ps = conn.prepareStatement(sql);

            ps.setString(1, em);

            ResultSet rs=ps.executeQuery();

            while (rs.next()) {
                f=false;
            }

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
	return f;
}


}
