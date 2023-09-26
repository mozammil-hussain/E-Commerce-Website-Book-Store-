package com.user.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.UserDAOImpl;
import com.DB.DBConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			response.setContentType("text.html");
			PrintWriter writer = response.getWriter();
			writer.println(DBConnect.getConn());
			
			String name = request.getParameter("fname");
			String email= request.getParameter("email");
			String phno = request.getParameter("phno");
			String password= request.getParameter("password");
			String check= request.getParameter("check");
			System.out.println(name+" "+email+" "+phno+" "+password+" " +check);
			
			User us = new User();
			us.setName(name);
			us.setEmail(email);
		 	us.setPhno(phno);
			us.setPassword(password);
			
		   //session generated
			HttpSession session=request.getSession();
			UserDAOImpl dao =new UserDAOImpl(DBConnect.getConn());
			System.out.println(DBConnect.getConn());
			boolean f= dao.userRegister(us);
			System.out.println("User Impl returning value "+f);
			if(f)
			{
				
				System.out.println("Registered Success");
				session.setAttribute("successMsg", "Registration successfully Done..");
				response.sendRedirect("register.jsp"); 
			}
			else
			{
				System.out.println("SOmething went wrong on server");
			    session.setAttribute("failedMsg","Something went wrong");
			    response.sendRedirect("register.jsp"); 
			}  
		}catch (Exception e) {
			e.printStackTrace();
			
		}	
	}
}
