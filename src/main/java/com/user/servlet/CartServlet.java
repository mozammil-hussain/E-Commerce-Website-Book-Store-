package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DAO.CartDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;
import com.entity.*;

@WebServlet("/cart")
public class CartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 try {
			 System.out.println(request.getParameter("uid"));
			System.out.println("We are inside CardServlet");
			int bid=Integer.parseInt(request.getParameter("bid"));
			int uid=Integer.parseInt(request.getParameter("uid"));
			System.out.println("Book id and user id is"+bid+" "+uid);
			System.out.println("We are inside CardServlet");
			BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());  
			
			BookDetails b=dao.getBookById(bid);
			System.out.println(b);
			 
			System.out.println(b.toString());
			System.out.println("Book id and user id is"+bid+" "+uid);  
			
			Cart c =new Cart();
			c.setBid(bid);
			
			c.setUid(uid);
			c.setBookName(b.getBookname());
			
			c.setAuthor(b.getAuthor());
			c.setPrice(Double.parseDouble(b.getPrice()));
			
			c.setTotalPrice(Double.parseDouble(b.getPrice()));
			
			CartDAOImpl dao1 =new CartDAOImpl(DBConnect.getConn());
			boolean f=dao1.addCart(c); 
			
			HttpSession session=request.getSession();
			
			
			if(f)
			{
				session.setAttribute("addCart", "Added to Cart");
				response.sendRedirect("all_new.jsp");

			}
			else
			{
				session.setAttribute("failed", "Something wrong");
				response.sendRedirect("all_new.jsp");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

	

}
