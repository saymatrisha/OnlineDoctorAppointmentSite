package com.appoinment;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class DocRegValidation implements Filter {

	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		String fn = request.getParameter("firstname");
		String ln = request.getParameter("lastname");
		
		Pattern pattern = Pattern.compile("[A-Za-z]+");
		
		String un = request.getParameter("username");
		Pattern pattern1 = Pattern.compile("^[a-zA-Z0-9._-]{3,}$");
		
		String email = request.getParameter("email");
		Pattern pattern2 = Pattern.compile("^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@"
				 + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$");
		
		String pass = request.getParameter("password");
		Pattern pattern3 = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[^a-zA-Z0-9\\s]).{6,}");
		
		String repass = request.getParameter("retypePass");
		String deg = request.getParameter("degree");
		String depart = request.getParameter("department");
		String con = request.getParameter("contact");
		Pattern pattern4 = Pattern.compile("^(?:\\+?88)?01[15-9]\\d{8}$");
		
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
		if(un.equals("")|| un.equals(null)) {
			request.setAttribute("msg2","Enter User Name" );
		}
		else if(!pattern1.matcher(un).matches()) {
			request.setAttribute("msg2","User name contain only digit,letter,underscore");
		}
		if(email.equals("")||email.equals(null)) {
			request.setAttribute("msg3","Enter Email" );
		}
		else if(!pattern2.matcher(email).matches()) {
			request.setAttribute("msg3","Enter Valid Email" );
		}
		if(pass.equals("")|| pass.equals(null)) {
			request.setAttribute("msg4","Enter Password" );
		}
		else if(!pattern3.matcher(pass).matches()) {
			request.setAttribute("msg4","Password at must contain one digit, one character, min length 6" );
		}
		if(repass.equals("")|| repass.equals(null)) {
			request.setAttribute("msg5","Retype Password");
		}
		if(!pass.equals(repass)) {
			request.setAttribute("msg5","they must be equal");
		}
		if(deg.equals("")|| deg.equals(null)) {
			request.setAttribute("msg6","Enter Degree");
		}
		if(depart.isEmpty()) {
			request.setAttribute("msg7","Enter Department");
		}
		
		if(con.equals("")||con.equals(null)) {
			request.setAttribute("msg8","Enter Contact No");
		}
		else if(!pattern4.matcher(con).matches()) {
			request.setAttribute("msg8","Enter Valid Mob No");
		}
		
		
		if(fn.equals("")|| fn.equals(null)||!pattern.matcher(fn).matches()||ln.equals("")|| ln.equals(null)||!pattern.matcher(ln).matches()||
				!pattern2.matcher(email).matches()||un.equals("")|| un.equals(null)||!pattern1.matcher(un).matches()||pass.equals("")|| pass.equals(null)||
				!pattern3.matcher(pass).matches()||repass.equals("")|| repass.equals(null)||!pass.equals(repass)||deg.equals("")|| deg.equals(null)||
				depart.isEmpty()||con.equals("")||con.equals(null)||!pattern4.matcher(con).matches()){
			     
			    request.getRequestDispatcher("/DocReg.jsp").forward(request, response);
		}
		else {
		chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
