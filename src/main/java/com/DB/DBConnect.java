package com.DB;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnect{
	private static Connection con;
	public static Connection getConn()
	{
		
		  try{ 
	            //load driver
	             Class.forName("com.mysql.cj.jdbc.Driver");
	         
	             System.out.println("hello");
	             con= DriverManager.getConnection("jdbc:mysql://localhost:3306/ebook-app","root","mozammil");
	             System.out.println("Inside DB connectin "+con);

	        }catch (Exception ex){ 
	        	
	            ex.printStackTrace();
	             
	        } 
	     return con;
	}
}
