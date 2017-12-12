package com.appoinment;

import java.io.IOException;
import java.sql.PreparedStatement;

import java.util.Random;
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;



public class PatiRegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String fName = request.getParameter("firstname");
			String lName= request.getParameter("lastname");
			String eMail = request.getParameter("email");
			String pass = request.getParameter("password");
			String rePass = request.getParameter("retypepass");
			String connNo = request.getParameter("contact");
			String dateofBirth = request.getParameter("dob");
			String gender = request.getParameter("gender");
 			
		    Random rand=new Random();
 			 
			int patiId = 1000 + rand.nextInt(4999);
			
			String patiid = "XYZ".concat(Integer.toString(patiId));
			/*PreparedStatement preSt = ds.getConnection().prepareStatement("select max(pati_id) from patients_reg");
			ResultSet rs = preSt.executeQuery();
			
			if(rs.next()) {
				
			}*/
			HttpSession session = request.getSession();
			PreparedStatement pSt = ds.getConnection().prepareStatement("insert into patient_reg (pati_id,firstname,lastname,email,password,retypePass,conntactNo,dob,gender) values(?,?,?,?,?,?,?,?,?)");
			pSt.setString(1, patiid);
			pSt.setString(2, fName);
			pSt.setString(3, lName);
			pSt.setString(4, eMail);
			pSt.setString(5, pass);
			pSt.setString(6, rePass);
			pSt.setString(7, connNo);
			pSt.setString(8, dateofBirth);
			pSt.setString(9, gender);
			
			
			
			int status = pSt.executeUpdate();
			if(status > 0) {
				session.setAttribute("patiId", patiid);
				
				response.sendRedirect("PatiLogin02.jsp");
			}
			else {
				response.sendRedirect("error.jsp");
			}
			    
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		
		
	}

}
