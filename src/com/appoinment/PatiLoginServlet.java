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


public class PatiLoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pati_id = request.getParameter("patiid");
		String pass = request.getParameter("password");
		HttpSession session =request.getSession();
		try {
			PreparedStatement pSt = ds.getConnection().prepareStatement("select * from patient_reg where pati_id=? and password=?");
			pSt.setString(1, pati_id);
			pSt.setString(2, pass);
			ResultSet rs = pSt.executeQuery();
			
			if(rs.next()) {
				
				 session.setAttribute("fname", rs.getString(1));
				 session.setAttribute("lname", rs.getString(2));
				 session.setAttribute("email", rs.getString(3));
				 session.setAttribute("pass", rs.getString(4));
				 session.setAttribute("repass",rs.getString(5));
				 session.setAttribute("conno", rs.getString(6));
				 session.setAttribute("dob", rs.getString(7));
				 session.setAttribute("gender", rs.getString(8));
				 session.setAttribute("pati_id", rs.getString(9));
				 response.sendRedirect("PatiHomePage.jsp?Id='"+rs.getString(9)+"'");
			}
			else {
				 request.setAttribute("msg","Enter valid username" );
				 request.setAttribute("msg1","Password does not match" );
				 request.getRequestDispatcher("PatiLogin.jsp").forward(request, response);
			}
			rs.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
	}

}
