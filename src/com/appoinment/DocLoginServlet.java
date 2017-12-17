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


public class DocLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = request.getParameter("username");
		String pass = request.getParameter("password");
		HttpSession session = request.getSession();
		
		try{
			  PreparedStatement pSt = ds.getConnection().prepareStatement("select * from doctors_reg where username=? and Password=?");
			  pSt.setString(1, name);
			  pSt.setString(2, pass);
			  ResultSet rs = pSt.executeQuery();
			 if(rs.next()) {
				 session.setAttribute("fname", rs.getString(1));
				 session.setAttribute("lname", rs.getString(2));
				 session.setAttribute("uname", rs.getString(3));
				 session.setAttribute("email", rs.getString(4));
				 session.setAttribute("pass", rs.getString(5));
				 session.setAttribute("repass",rs.getString(6));
				 session.setAttribute("degree", rs.getString(7));
				 session.setAttribute("depart", rs.getString(8));
				 session.setAttribute("conno", rs.getString(9));
				 session.setAttribute("gender", rs.getString(10));
				
				 session.setAttribute("doc_id", rs.getString(11));
				 response.sendRedirect("DocHomePage.jsp?Id="+rs.getString(11)+"");
			 }
			 else {
					 request.setAttribute("msg","Enter valid username" );
					 request.setAttribute("msg1","Password donot match" );
					 request.getRequestDispatcher("DocLogin.jsp").forward(request, response);
				
			 }
			 rs.close();
		
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
