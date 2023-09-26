package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;

/**
 * Servlet implementation class DeleteOldBook
 */

@WebServlet("/delete_old_book")
public class DeleteOldBook extends HttpServlet {
	
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String email=request.getParameter("em");
		int id=Integer.parseInt(request.getParameter("id"));
		
		BookDAOImpl dao =new BookDAOImpl(DBConnect.getConn());
		
		boolean f=dao.oldBookDelete(email, "old book",id);
		
		HttpSession session=request.getSession();
		if(f)
		{
			session.setAttribute("succMsg", "Book Deleted Successfully");
			response.sendRedirect("old_book.jsp");
		}
		else
		{
			session.setAttribute("failedMsg", "Something went wrong on server");
			response.sendRedirect("old_book.jsp");
		}
		
		
	}

	

}
