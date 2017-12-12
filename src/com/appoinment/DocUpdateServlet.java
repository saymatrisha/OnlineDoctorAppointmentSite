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

public class DocUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   HttpSession session = request.getSession();
		   //PrintWriter out = response.getWriter();
		 
		   String docId = (String)session.getAttribute("doc_id");
		  // out.println(docId);
		   
		   
		    String fname = request.getParameter("fname");
		    String lname= request.getParameter("lname");
		    String uname = request.getParameter("uname");
			String email = request.getParameter("email");
			String pass = request.getParameter("pass");
			String repass = request.getParameter("rePass");
			String degree = request.getParameter("degree");
			String department = request.getParameter("department");
			String con = request.getParameter("conno");
			String gender = request.getParameter("gender");
			
		
		try {
			PreparedStatement pSt = ds.getConnection().prepareStatement("update doctors_reg set firstname=?,lastname=?,email=?,password=?,retypepassword=?,degree=?,department=?,contactNo=?,gender=? where username=?");
			 pSt.setString(1, fname);
			 pSt.setString(2, lname);
			 pSt.setString(3, email);
			 pSt.setString(4, pass);
			 pSt.setString(5, repass);
			 pSt.setString(6, degree);
			 pSt.setString(7, department);
			 pSt.setString(8, con);
			 pSt.setString(9, gender);
			
			 pSt.setString(10,uname );
			
			 
			 int update = pSt.executeUpdate();
			 
			 if(update > 0) {
				 session.setAttribute("doc_id", docId);
				 session.setAttribute("fname", fname);
				 session.setAttribute("lname", lname);
				 session.setAttribute("uname", uname);
				 session.setAttribute("email", email);
				 session.setAttribute("pass", pass);
				 session.setAttribute("repass",repass);
				 session.setAttribute("degree", degree);
				 session.setAttribute("depart", department);
				 session.setAttribute("conno", con);
				 session.setAttribute("gender", gender);
				 
				request.setAttribute("sumsg", "Data updated successfully");
				request.getRequestDispatcher("DocHomePage.jsp").forward(request, response);
			 }
			 else {
				 request.setAttribute("upmsg", "Something Mess");
				 request.getRequestDispatcher("DocUpdate.jsp").forward(request, response);
			 }
			
		 }catch(Exception ex) {
		   ex.printStackTrace();
		 }
	}

}
