package com.DAO;
import java.util.*;

import com.entity.BookDetails;
import com.entity.Cart;

public interface CartDAO {
	public boolean addCart(Cart c);
	
	public List<Cart> getBookByUser(int userId);
	
	boolean deleteBook(int bid, int uid,int cid);
}