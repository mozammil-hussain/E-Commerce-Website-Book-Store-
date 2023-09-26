package com.user.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAO;
import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

/**
 * Servlet implementation class UpdateUserProfile
 */

@WebServlet("/updateProfile")
public class UpdateUserProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			int id=Integer.parseInt(request.getParameter("id"));
			String name = request.getParameter("fname");
			String email= request.getParameter("email");
			String phno = request.getParameter("phno");
			String password= request.getParameter("password");
			
			User user= new User();
			user.setId(id);
			user.setName(name);
			user.setEmail(email);
			user.setPhno(phno);
			user.setPassword(password);
			
			HttpSession session = request.getSession();
			
			UserDAOImpl dao = new UserDAOImpl(DBConnect.getConn());
			boolean f=dao.checkPassword(id, password);
			
			if(f)
			{
				boolean b=dao.updateProfile(user);
				if(b)
				{
					session.setAttribute("succMsg", "profile updated successfully");
					response.sendRedirect("edit_profile.jsp");
				}else {
					session.setAttribute("failedMsg", "something went wrong");
					response.sendRedirect("edit_profile.jsp");
				}
				
			}else {
				System.out.println("Wrong Password entered");
				session.setAttribute("failedMsg", "Invalid password try again..");
				response.sendRedirect("edit_profile.jsp");
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
