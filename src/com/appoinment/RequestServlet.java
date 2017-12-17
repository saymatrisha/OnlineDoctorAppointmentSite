package com.appoinment;

import java.io.IOException;

import java.sql.PreparedStatement;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

public class RequestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		
		HttpSession session = request.getSession();
		
		
		try {
			int docId = (Integer)session.getAttribute("docID");
			int timeId =(Integer)session.getAttribute("timeID");
			String patiId = (String)session.getAttribute("pati_id");
			
			String req ="pending";
			
			PreparedStatement pSt = ds.getConnection().prepareStatement("insert into approve(time_id,doc_id,pati_id,request) VALUES(?,?,?,?)");
			pSt.setInt(1, timeId);
			pSt.setInt(2, docId);
			pSt.setString(3, patiId);
			pSt.setString(4, req);
			
			 int status =  pSt.executeUpdate();
	          if(status>0) {
	        	 session.setAttribute("tID",timeId );
	        	 session.setAttribute("dID", docId);
	        	  request.setAttribute("requestMsg", "Your request has been submitted!");
	              request.getRequestDispatcher("PatiHomePage.jsp").forward(request, response);
	        	  
	          }
	          else {
	        	  response.sendRedirect("error.jsp");
	          }
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
