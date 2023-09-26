package com.admin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

@WebServlet("/editBook")
public class EditBooks extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			String bookName = request.getParameter("book_name");
			String bookAuthor = request.getParameter("book_author");
			String price =  request.getParameter("book_price");
			
			String status = request.getParameter("book_status");
			
			BookDetails b= new BookDetails();
			b.setBookId(id);
			b.setBookname(bookName);
			
			b.setAuthor(bookAuthor);
			b.setPrice(price);
			b.setStatus(status);
			
			
			BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());
			boolean f =dao.updateBookInfo(b);
			
			HttpSession session =request.getSession();
			if(f)
			{
				session.setAttribute("success_msg", "Book info updated successfullt");
				response.sendRedirect("admin/all_books.jsp");
				
			}
			else 
			{
				session.setAttribute("failed_msg", "something wrong unable to update");
				response.sendRedirect("admin/all_books.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
