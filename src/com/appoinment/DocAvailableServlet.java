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

public class DocAvailableServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//int docId = (Integer)session.getAttribute("doc_id");
		String uName = (String) session.getAttribute("uname");
		String eMail = (String)session.getAttribute("email");
		String degree = (String)session.getAttribute("degree");
		String Location = request.getParameter("location");
		String day = request.getParameter("day");
		String Start = request.getParameter("start");
		String End = request.getParameter("end");
		//String depart =(String)session.getAttribute("department");
		
		
		try {
			PreparedStatement pStat = ds.getConnection().prepareStatement("select doc_id,department from doctors_reg where UserName=?");
			pStat.setString(1, uName);
		
			  
			ResultSet rs = pStat.executeQuery();
			if(rs.next()) {
			PreparedStatement pSt = ds.getConnection().prepareStatement("insert into doctors_info (doc_id,email,degree,department,location,day,start_time,end_time) values(?,?,?,?,?,?,?,?)");
			pSt.setInt(1, rs.getInt("doc_id"));
			pSt.setString(2, eMail);
			pSt.setString(3, degree);
			pSt.setString(4, rs.getString("department"));
			pSt.setString(5, Location);
			pSt.setString(6, day);
			pSt.setString(7, Start);
			pSt.setString(8, End);
			
			
			 int status =  pSt.executeUpdate();
	          if(status>0) {
	        	  response.sendRedirect("DocHomePage.jsp");
	          }
	          else {
	        	  response.sendRedirect("error.jsp");
	          }
				 
			}
			rs.close();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
		
	}

}
