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


public class PatiUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   
		HttpSession session = request.getSession();
		String patiId = (String)session.getAttribute("pati_id");
		
		    String fname = request.getParameter("fname");
		    String lname= request.getParameter("lname");
			String email = request.getParameter("email");
			String password = request.getParameter("pass");
			String repass = request.getParameter("retypepass");
			String con = request.getParameter("contact");
			String dob = request.getParameter("dob");
			String gender = request.getParameter("gender");
			
			
			try {
				PreparedStatement pSt = ds.getConnection().prepareStatement("update patient_reg set firstname=?,lastname=?,email=?,password=?,retypepass=?,conntactNo=?,dob=?,gender=? where pati_id=?");
				 pSt.setString(1, fname);
				 pSt.setString(2, lname);
				 pSt.setString(3, email);
				 pSt.setString(4, password);
				 pSt.setString(5, repass);
				 pSt.setString(6, con);
				 pSt.setString(7, dob);
				 pSt.setString(8, gender);
				 pSt.setString(9, patiId);
				
				 int update = pSt.executeUpdate();
				 if(update > 0) {
					
					 session.setAttribute("fname", fname);
					 session.setAttribute("lname", lname);
					 session.setAttribute("email", email);
					 session.setAttribute("pass", password);
					 session.setAttribute("repass",repass);
					 session.setAttribute("conno", con);
					 session.setAttribute("dob", dob);
					 session.setAttribute("gender", gender);
					 session.setAttribute("pati_id", patiId);
					
					request.setAttribute("sumsg", "Data updated successfully");
					request.getRequestDispatcher("PatiHomePage.jsp").forward(request, response);
				 }
				 else {
					 request.setAttribute("upmsg", "Something Mess");
					 request.getRequestDispatcher("PatiUpdate.jsp").forward(request, response);
				 }
			}catch(Exception ex) {
				ex.printStackTrace();
			}
			
	}

}
