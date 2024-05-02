package com.datao;
import java.util.ArrayList;
import java.util.List;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.Bookdetails;
import com.entity.Cart;
public class BookDataImpl implements BookData {
	

	
	

@Override
	public boolean OldBookDelete(String email, String cate,int id) {
	boolean f=false;
	
	try {
		String sql="delete from book_details where bookcatagory=? and user_email=? and bookid=?";
		
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, cate);
		ps.setString(2, email);
		ps.setInt(3, id);
		
		int i=ps.executeUpdate();
		if(1==1) {
			f=true;
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		return f;
	}

@Override
	public List<Bookdetails> getBookByOld(String email, String cate) {
	List<Bookdetails> list=new ArrayList<Bookdetails>();
	Bookdetails b=null;
	
	try {
		
		String sql="select * from book_details where bookcatagory=? and user_email=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, cate);
		ps.setString(2, email);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			b=new Bookdetails();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcatagory(rs.getString(5));
			b.setstatus(rs.getString(6));
			b.setPhotoName(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
		return list;
	}

@Override
	public List<Bookdetails> getAllRecentBooks() {
	List<Bookdetails> list=new ArrayList<Bookdetails>();
	Bookdetails b=null;
	
	try {
		String sql="select * from book_details where status=? order by bookid DESC ";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1, "Active");
		ResultSet rs=ps.executeQuery();

		while(rs.next() ) {
			b=new Bookdetails();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcatagory(rs.getString(5));
			b.setstatus(rs.getString(6));
			b.setPhotoName(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
			
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return list;
	}

	@Override
	public List<Bookdetails> getAllNewBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql="select * from book_details where bookcatagory=? and status=? order by bookid DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "New");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcatagory(rs.getString(5));
				b.setstatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
				
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			return list;
	}

	@Override
	public List<Bookdetails> getAllOldBooks() {
		List<Bookdetails> list=new ArrayList<Bookdetails>();
		Bookdetails b=null;
		
		try {
			String sql="select * from book_details where bookcatagory=? and status=? order by bookid DESC ";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ps.setString(1, "Old");
			ps.setString(2, "Active");
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcatagory(rs.getString(5));
				b.setstatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
			}

		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
			return list;
	}

@Override
	public List<Bookdetails> getNewBook() {
	
	List<Bookdetails> list=new ArrayList<Bookdetails>();
	Bookdetails b=null;
	
	try {
		String sql="select * from book_details where bookcatagory=? and status=? order by bookid DESC ";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1, "New");
		ps.setString(2, "Active");
		ResultSet rs=ps.executeQuery();
		int i=1;
		while(rs.next() && i<=3) {
			b=new Bookdetails();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcatagory(rs.getString(5));
			b.setstatus(rs.getString(6));
			b.setPhotoName(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
			i++;
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		return list;
	}

@Override
public List<Bookdetails> getRecentbook() {
	List<Bookdetails> list=new ArrayList<Bookdetails>();
	Bookdetails b=null;
	
	try {
		String sql="select * from book_details where status=? order by bookid";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1, "Active");
		ResultSet rs=ps.executeQuery();
		int i=1;
		while(rs.next() && i<=3) {
			b=new Bookdetails();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcatagory(rs.getString(5));
			b.setstatus(rs.getString(6));
			b.setPhotoName(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
			i++;
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	return list;
}

@Override
public List<Bookdetails> getOldbooks() {
	List<Bookdetails> list=new ArrayList<Bookdetails>();
	Bookdetails b=null;
	
	try {
		String sql="select * from book_details where bookcatagory=? and status=? order by bookid DESC ";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ps.setString(1, "Old");
		ps.setString(2, "Active");
		ResultSet rs=ps.executeQuery();
		int i=1;
		while(rs.next() && i<=3) {
			b=new Bookdetails();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcatagory(rs.getString(5));
			b.setstatus(rs.getString(6));
			b.setPhotoName(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
			i++;
		}

	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		return list;
	}

@Override
	public boolean deletebooks(int id) {
	boolean f=false;
	try {
		String sql="delete from book_details where bookid=?";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setInt(1, id);
		int i=ps.executeUpdate();

		if(i==1) {
			f=true;
		}

	} catch (Exception e) {
e.printStackTrace();	}
		return f;
	}

@Override
	public boolean UpdateEditBooks(Bookdetails b) {
	boolean f=false;
	
	try {
		String sql="update book_details set bookname=?, author=?, price=?,status=? where bookid=?";
		
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, b.getBookname());
		ps.setString(2, b.getAuthor());
		ps.setString(3, b.getPrice());
		ps.setString(4, b.getstatus());
		ps.setInt(5, b.getBookid());
		
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

@Override
	public Bookdetails getBookById(int id) {
		Bookdetails b=null;
		
		try {
			String sql="select * from book_details where bookid=?";
			
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs=ps.executeQuery();
			while(rs.next()) {
				b=new Bookdetails();
				b.setBookid(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookcatagory(rs.getString(5));
				b.setstatus(rs.getString(6));
				b.setPhotoName(rs.getString(7));
				b.setUser_email(rs.getString(8));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		return b;
	}

@Override
	public List<Bookdetails> getAllBookdetails() {
	List<Bookdetails> list =new ArrayList<Bookdetails>();
	Bookdetails b=null;
	
	
	try {
		String sql="select * from book_details";
		PreparedStatement ps=conn.prepareStatement(sql);
		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			b=new Bookdetails();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcatagory(rs.getString(5));
			b.setstatus(rs.getString(6));
			b.setPhotoName(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
		
		return list;
	}

private Connection conn;
public BookDataImpl(Connection conn){
    super();
    this.conn=conn;
}

public boolean addBooks (Bookdetails b){
    boolean f=false;
try {
	String sql = "INSERT INTO book_details (bookname, author, price, bookcatagory, status, photo, user_email) VALUES (?, ?, ?, ?, ?, ?, ?)";
    PreparedStatement ps=conn.prepareStatement(sql);
    ps.setString(1, b.getBookname());
    ps.setString(2, b.getAuthor());
    ps.setString(3, b.getPrice());
    ps.setString(4, b.getBookcatagory());
    ps.setString(5, b.getstatus());
    ps.setString(6, b.getPhotoName());
    ps.setString(7, b.getUser_email());

    int i=ps.executeUpdate();
    if (i==1) {
        f=true;
    }

} catch (Exception e) {
    // TODO: handle exception
	e.printStackTrace();
}


    return f;
}

@Override
public List<Bookdetails> getBookBySearch(String ch) {
	List<Bookdetails> list=new ArrayList<Bookdetails>();
	Bookdetails b=null;
	
	try {
		
		String sql="select * from book_details where bookname like ? or author like ? or bookcatagory like ? and status=? ";
		PreparedStatement ps=conn.prepareStatement(sql);
		ps.setString(1, "%"+ch+"%");
		ps.setString(2, "%"+ch+"%");
		ps.setString(3, "%"+ch+"%");
		ps.setString(4, "Active");

		
		ResultSet rs=ps.executeQuery();
		while(rs.next()) {
			b=new Bookdetails();
			b.setBookid(rs.getInt(1));
			b.setBookname(rs.getString(2));
			b.setAuthor(rs.getString(3));
			b.setPrice(rs.getString(4));
			b.setBookcatagory(rs.getString(5));
			b.setstatus(rs.getString(6));
			b.setPhotoName(rs.getString(7));
			b.setUser_email(rs.getString(8));
			list.add(b);
		}
	} catch (Exception e) {
		// TODO: handle exception
		e.printStackTrace();
	}
	
		return list;
}



}
