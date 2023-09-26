package com.user.servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.CartDAOImpl;
import com.DB.DBConnect;

/**
 * Servlet implementation class RemoveBookServlet
 */
@WebServlet("/remove_book")
public class RemoveBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bid=Integer.parseInt(request.getParameter("bid"));
		int uid=Integer.parseInt(request.getParameter("uid"));
		int cid=Integer.parseInt(request.getParameter("cid"));
		
		try {
			CartDAOImpl dao=new CartDAOImpl(DBConnect.getConn());
			
			boolean f=dao.deleteBook(bid,uid,cid);
			
			HttpSession session=request.getSession();
			if(f)
			{
				session.setAttribute("succMsg", "Removed from cart");
				response.sendRedirect("cart.jsp");
			}
			else
			{
				session.setAttribute("failedMsg", "Something went wrong on server");
				response.sendRedirect("cart.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		
	}

	

}
