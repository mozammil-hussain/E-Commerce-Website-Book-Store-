package com.user.servlet;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.DAO.BookDAOImpl;
import com.DB.DBConnect;
import com.entity.BookDetails;

/**
 * Servlet implementation class AddOldBookServlet
 */
@WebServlet("/add_old_book")
@MultipartConfig
public class AddOldBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Inside AddBooks Servlets");

		String bookName = request.getParameter("book_name");
		String bookAuthor = request.getParameter("book_author");
		String price = request.getParameter("book_price");
		String category = "Old book";
		String status = "Active";
		Part p = request.getPart("book_img");
 
		String filename = p.getSubmittedFileName();
		System.out.println("filename is: " + filename + " and image is " + p);
		
		
		System.out.println(status);
		PrintWriter writer = response.getWriter();
		response.setContentType("text/html");

		writer.println(status);
		//Part part = request.getPart ("book_img");
		//String fileName=part.getSubmittedFileName();
		//String email = "admin@gmail.com";
		String useremail = request.getParameter("user");

		BookDetails b = new BookDetails(bookName, bookAuthor, price, category, status,filename, useremail);
		System.out.println(b);
		
		
		
		
		
		System.out.println(b.getBookname());

		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		boolean f = dao.addBooks(b);

		HttpSession session = request.getSession();

		if (f) {
			String path=getServletContext().getRealPath("")+"books";
			System.out.println(path);
			File file = new File(path);
			p.write(path+File.separator+ filename);
			session.setAttribute("success_msg", "book added successfully");
			response.sendRedirect("sell_books.jsp");
		} else {
			session.setAttribute("failed_msg", "something went wrong");
			response.sendRedirect("sell_books.jsp");
		}
	}

}
