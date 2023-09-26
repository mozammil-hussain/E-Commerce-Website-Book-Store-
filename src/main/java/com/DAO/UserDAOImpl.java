package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDAOImpl implements UserDAO {
	private Connection conn;

	public UserDAOImpl(Connection conn) {
		super();
		this.conn = conn;
		System.out.println("Connection successfully created "+conn);
	}
	public boolean userRegister(User us)
	{
		boolean f=false;
		
		try {
			String q1 = "insert into user (name, email, phno, password) values(?,?,?,?)";
			PreparedStatement ps = conn.prepareStatement(q1);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			System.out.println("This name you are trying to insert"+us.getName());
			int i= ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
	public User login(String email, String password) {

		User us=null;
		try {
			
			String q1 = "select * from user where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(q1);
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet set = ps.executeQuery();
			
			while(set.next())
			{
				us=new User();
				us.setId(set.getInt(1));
				us.setName(set.getString(2));
				us.setEmail(set.getString(3));
				us.setPhno(set.getString(4));
				us.setPassword(set.getString(5));
				us.setAddress(set.getString(6));
				us.setLandmark(set.getString(7));
				us.setCity(set.getString(8));
				us.setState(set.getString(9));
				us.setPincode(set.getString(10));
				
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return us;
	}
	@Override
	public boolean checkPassword(int id,String password) {
		
		
		boolean f=false;
		
		try {
			String sql="select * from user where id=? and password=?";
			
			PreparedStatement ps= conn.prepareStatement(sql);
			ps.setInt(1, id);
			ps.setString(2, password);
			
			ResultSet set=ps.executeQuery();
			while(set.next())
			{
				f=true;
			}
				
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
	}
	@Override
	public boolean updateProfile(User us) {
		
		boolean f=false;
		
		try {
			String q1 = "update user set name=?, email=?, phno=?, password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(q1);
			ps.setString(1, us.getName());
			ps.setString(2, us.getEmail());
			ps.setString(3, us.getPhno());
			ps.setString(4, us.getPassword());
			ps.setInt(5, us.getId());
			System.out.println("Editing Profile Of User using userobj session "+us.getName());
			int i= ps.executeUpdate();
			if(i==1)
			{
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}
			
}
