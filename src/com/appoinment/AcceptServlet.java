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


public class AcceptServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		//PrintWriter out = response.getWriter();
		
		try {
			int timeId =(Integer)session.getAttribute("timeID");
			//out.println(timeId);
			String req1 ="YES";
			
			PreparedStatement pSt = ds.getConnection().prepareStatement("update approve set request=? where time_id=?");
			pSt.setString(1, req1);
			pSt.setInt(2, timeId);
			
			int update = pSt.executeUpdate();
			if(update > 0) {
				
				session.setAttribute("req", req1);
				session.setAttribute("timeID", timeId);
				response.sendRedirect("welcome.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
