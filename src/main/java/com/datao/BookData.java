package com.datao;

import java.util.List;

import com.entity.Bookdetails;

public interface BookData {
public boolean addBooks(Bookdetails b);
public List<Bookdetails> getAllBookdetails();
public Bookdetails getBookById(int id);
public boolean UpdateEditBooks(Bookdetails b);

public boolean deletebooks(int id);
public List<Bookdetails> getNewBook();

public List<Bookdetails> getRecentbook();

public List<Bookdetails> getOldbooks();
public List<Bookdetails> getAllRecentBooks();
public List<Bookdetails> getAllNewBooks();
public List<Bookdetails> getAllOldBooks();
public List<Bookdetails> getBookByOld(String email,String cate);

public boolean OldBookDelete(String email,String cate,int id);

public List<Bookdetails> getBookBySearch(String ch);

}
