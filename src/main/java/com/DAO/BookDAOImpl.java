package com.DAO;

import java.awt.print.Book;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List; 

import com.entity.BookDetails;

public class BookDAOImpl implements BooksDAO{
	
	private Connection conn;
	
	public BookDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}
	
	

	@Override
	public boolean addBooks(BookDetails b) {
		boolean f=false;
		try {
			String sql = "insert into book_details(bookname,author,price,bookCategory,status,photo,user_email) values(?,?,?,?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getBookCategory());
			ps.setString(5, b.getStatus());
			ps.setString(6, b.getPhoto_name());
			ps.setString(7, b.getUser_email());
			int i=ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		return f;
	}



	@Override
	public List<BookDetails> getAllBooks() {       //list for multiple books
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b =null;
		try {
			String sql = "select * from book_details";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto_name(rs.getString(7));
				b.setUser_email(rs.getString(8));
				list.add(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}



	@Override
	public BookDetails getBookById(int id) {
		BookDetails b=null;
		
		try {
			String sql = "select * from book_details where book_id=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				b= new BookDetails();
				b.setBookId(rs.getInt(1));
				b.setBookname(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto_name(rs.getString(7));
				b.setUser_email(rs.getString(8));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return b;
	}



	@Override
	public boolean updateBookInfo(BookDetails b) {
		boolean f= false;
		try {
			String sql = "update book_details set bookname=?,author=?,price=?,status=? where book_id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, b.getBookname());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());
			
			int i= ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}



	@Override
	public boolean deleteBooks(int id) {
		boolean f=false;
		
		try {
			String sql = "delete from book_details where book_id=?";
			PreparedStatement ps =conn.prepareStatement(sql);
			
			ps.setInt(1, id);
			
			int i =ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public List<BookDetails> getNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by book_id desc";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1,"New book" );
			ps.setString(2, "Active" );
			ResultSet set=ps.executeQuery();
			int i=0;
			while(set.next() && i<4)
			{
				b=new BookDetails();
				b.setBookId(set.getInt(1));
				b.setBookname(set.getString(2));
				b.setAuthor(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto_name(set.getString(7));
				b.setUser_email(set.getString(8));
				list.add(b);
				i++;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<BookDetails> getRecentBooks() {
		List<BookDetails> list =new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql = "select * from book_details where status=? order by book_id desc";
			PreparedStatement ps =conn.prepareStatement(sql);
		
			ps.setString(1, "Active" );
			ResultSet set=ps.executeQuery();
			int i=0;
			while(set.next() && i<4)
			{
				b=new BookDetails();
				b.setBookId(set.getInt(1));
				b.setBookname(set.getString(2));
				b.setAuthor(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto_name(set.getString(7));
				b.setUser_email(set.getString(8));
				list.add(b);
				i++;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<BookDetails> getOldBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by book_id desc";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, "Old book" );
			ps.setString(2, "Active" );
			
			ResultSet set=ps.executeQuery();
			int i=0;
			while(set.next() && i<4)
			{
				b=new BookDetails();
				b.setBookId(set.getInt(1));
				b.setBookname(set.getString(2));
				b.setAuthor(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto_name(set.getString(7));
				b.setUser_email(set.getString(8));
				list.add(b);
				i++;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<BookDetails> getAllRecentBooks() {
		List<BookDetails> list =new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql = "select * from book_details where status=? order by book_id desc";
			PreparedStatement ps =conn.prepareStatement(sql);
			
			
			
			
			
			
			ps.setString(1, "Active" );
			ResultSet set=ps.executeQuery();
			int i=0;
			while(set.next())
			{
				b=new BookDetails();
				b.setBookId(set.getInt(1));
				b.setBookname(set.getString(2));
				b.setAuthor(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto_name(set.getString(7));
				b.setUser_email(set.getString(8));
				list.add(b);
				i++;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<BookDetails> getAllNewBooks() {
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by book_id desc";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1,"New book" );
			ps.setString(2, "Active" );
			ResultSet set=ps.executeQuery();
			int i=0;
			while(set.next())
			{
				b=new BookDetails();
				b.setBookId(set.getInt(1));
				b.setBookname(set.getString(2));
				b.setAuthor(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto_name(set.getString(7));
				b.setUser_email(set.getString(8));
				list.add(b);
				i++;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public List<BookDetails> getAllOldBooks() {
		List<BookDetails> list=new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql = "select * from book_details where bookCategory=? and status=? order by book_id desc";
			PreparedStatement ps =conn.prepareStatement(sql);
			ps.setString(1, "old book" );
			ps.setString(2, "Active" );
			
			ResultSet set=ps.executeQuery();
			int i=0;
			while(set.next())
			{
				b=new BookDetails();
				b.setBookId(set.getInt(1));
				b.setBookname(set.getString(2));
				b.setAuthor(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto_name(set.getString(7));
				b.setUser_email(set.getString(8));
				list.add(b);
				i++;
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list; 
	}



	@Override               
	public List<BookDetails> getBookByOld(String email, String category) {
		List<BookDetails> list =new ArrayList<BookDetails>();
		BookDetails b=null;
		try {
			String sql="select * from book_details where bookCategory=? and user_email=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, category );
			ps.setString(2,email);
			ResultSet set=ps.executeQuery();
			while(set.next())
			{
				b=new BookDetails();
				b.setBookId(set.getInt(1));
				b.setBookname(set.getString(2));
				b.setAuthor(set.getString(3));
				b.setPrice(set.getString(4));
				b.setBookCategory(set.getString(5));
				b.setStatus(set.getString(6));
				b.setPhoto_name(set.getString(7));
				b.setUser_email(set.getString(8));
				list.add(b);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}



	@Override
	public boolean oldBookDelete(String email, String cat,int id) {
		
		
		boolean f=false;
		
		try {
			String sql ="delete from book_details where bookCategory=? and user_email=? and book_id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1, cat );
			ps.setString(2,email);
			ps.setInt(3,id);
			
			int i =ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		return f;
	}
	
	
	
}
