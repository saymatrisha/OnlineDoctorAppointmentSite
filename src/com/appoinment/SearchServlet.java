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


public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	  try {
		    PreparedStatement pSt = ds.getConnection().prepareStatement("SELECT  doctors_info.doc_id, doctors_info.email, doctors_info.degree, doctors_info.department, doctors_info.location from doctors_info INNER JOIN doc_dept ON doctors_info.department=doc_dept.dept_name WHERE department=?");
			pSt.setString(1, request.getParameter("department"));
			
			 ResultSet rs = pSt.executeQuery();
			 if(rs.next()) {
				
				 session.setAttribute("doc_email", rs.getString(2));
				 session.setAttribute("degree", rs.getString(3));
				 session.setAttribute("department", rs.getString(4));
				 session.setAttribute("location", rs.getString(5));
				 session.setAttribute("doc_id", rs.getString(1));
				 response.sendRedirect("PatiHomePage.jsp");
				 
			 }
			 else {
				 response.sendRedirect("error.jsp");
			 }
		  
	  }catch(Exception e) {
		  e.printStackTrace();
	  }
	}

}
