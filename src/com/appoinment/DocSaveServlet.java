package com.appoinment;

import java.io.IOException;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.ServletException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

public class DocSaveServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String fName= request.getParameter("firstname");
			String lName= request.getParameter("lastname");
			String uName = request.getParameter("username");
			String eMail = request.getParameter("email");
			String pass = request.getParameter("password");
			String rePass = request.getParameter("retypePass");
			String degree = request.getParameter("degree");
			String department = request.getParameter("department");
			String con = request.getParameter("contact");
			String gender = request.getParameter("gender");
			
	          PreparedStatement preSts = ds.getConnection().prepareStatement("select count(*) from doctors_reg where username = ?");
	          preSts.setString(1, uName);
	          int unique = 0;
				 ResultSet rs = preSts.executeQuery();
				 if(rs.next()) {
					
					unique = rs.getInt(1);
					if(unique > 0) {
				    request.setAttribute("msgun","This user name already exists");
					request.getRequestDispatcher("DocReg.jsp").forward(request, response);
					}
				
				 
			 else {
				 PreparedStatement pSt = ds.getConnection().prepareStatement("insert into doctors_reg(firstname, lastname, username, email, password, retypepassword , degree, department, contactNo, gender) values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
				  pSt.setString(1,fName );
		          pSt.setString(2,lName);
		          pSt.setString(3,uName );
		          pSt.setString(4,eMail);
		          pSt.setString(5,pass );
		          pSt.setString(6,rePass);
		          pSt.setString(7,degree );
		          pSt.setString(8,department );
		          pSt.setString(9,con);
		          pSt.setString(10,gender);
		         
	         
	          int status =  pSt.executeUpdate();
	          if(status>0) {
	        	  response.sendRedirect("DocLogin.jsp");
	          }
	          else {
	        	  response.sendRedirect("error.jsp");
	          }
				 }  
				    }
				 rs.close();
				 

		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
}

