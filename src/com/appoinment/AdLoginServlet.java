package com.appoinment;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class AdLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		
		try {
			  PreparedStatement pSt = ds.getConnection().prepareStatement("select * from admin_log  where name=? and password=?");
			  pSt.setString(1, name);
			  pSt.setString(2, pass);
			  ResultSet rs = pSt.executeQuery();
			  if(rs.next()) {
					 session.setAttribute("fname", rs.getString(1));
					 session.setAttribute("lname", rs.getString(2));
					 response.sendRedirect("AdminHomePage.jsp");
			  }
			  
			  else {
				  response.sendRedirect("error.jsp");
			  }
			  
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

}
