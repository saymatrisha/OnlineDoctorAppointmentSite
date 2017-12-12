package com.appoinment;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;


public class PatiUpdateValidation implements Filter {

   
   
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		String fn = request.getParameter("fname");
		String ln = request.getParameter("lname");
		
		Pattern pattern = Pattern.compile("[A-Za-z]+");
		
		String email = request.getParameter("email");
		Pattern pattern1 = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				 + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		String pass = request.getParameter("pass");
		Pattern pattern2 = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9\\s]).{6,}");
		
		String repass = request.getParameter("retypepass");
		String con = request.getParameter("contact");
		Pattern pattern3 = Pattern.compile("^(?:\\+?88)?01[15-9]\\d{8}$");
		
		if(fn.equals("")|| fn.equals(null)) {
			request.setAttribute("msg","Enter Your First Name" );
		}
		else if(!pattern.matcher(fn).matches()) {
			request.setAttribute("msg","Enter Valid Name" );
		}
		if(ln.equals("")|| ln.equals(null)) {
			request.setAttribute("msg1","Enter Your Last Name");
		}
		else if(!pattern.matcher(ln).matches()) {
			request.setAttribute("msg1","Enter Valid Name" );
		}
		if(email.equals("")||email.equals(null)) {
			request.setAttribute("msg2","Enter Email" );
		}
		else if(!pattern1.matcher(email).matches()) {
			request.setAttribute("msg2","Enter Valid Email" );
		}
		if(pass.equals("")|| pass.equals(null)) {
			request.setAttribute("msg3","Enter Password" );
		}
		else if(!pattern2.matcher(pass).matches()) {
			request.setAttribute("msg3","Password at must contain one digit, one character, min length 6" );
		}
		if(repass.equals("")|| repass.equals(null)) {
			request.setAttribute("msg4","Retype Password");
		}
		if(!pass.equals(repass)) {
			request.setAttribute("msg4","they must be equal");
		}
		if(con.equals("")||con.equals(null)) {
			request.setAttribute("msg5","Enter Contact No");
		}
		else if(!pattern3.matcher(con).matches()) {
			request.setAttribute("msg5","Enter Valid Mob No");
		}
		if(fn.equals("")|| fn.equals(null)||!pattern.matcher(fn).matches()||ln.equals("")|| ln.equals(null)|| !pattern.matcher(ln).matches()||
		 email.equals("")||email.equals(null)||!pattern1.matcher(email).matches()||pass.equals("")|| pass.equals(null) ||!pattern2.matcher(pass).matches()||repass.equals("")|| repass.equals(null)
		 ||!pass.equals(repass)||con.equals("")||con.equals(null)||!pattern3.matcher(con).matches()) {
			 request.getRequestDispatcher("PatiUpdate.jsp").forward(request, response);
		}
		else {
		chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
