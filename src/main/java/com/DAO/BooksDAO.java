package com.DAO;

import java.util.List;

import com.entity.BookDetails;

public interface BooksDAO {
	public boolean addBooks(BookDetails b);
	public List<BookDetails> getAllBooks();
	public BookDetails getBookById(int id); 
	public boolean updateBookInfo(BookDetails b);
	public boolean deleteBooks(int id);
	
	
	public List<BookDetails> getNewBooks(); 
	public List<BookDetails> getRecentBooks(); 
	
	public List<BookDetails> getOldBooks(); 
	
	public List<BookDetails> getAllRecentBooks();
	public List<BookDetails> getAllNewBooks(); 
	public List<BookDetails> getAllOldBooks();
	
	public List<BookDetails> getBookByOld(String email,String category);
	
	
	public boolean oldBookDelete(String email, String cat,int id);
	
	
}
 