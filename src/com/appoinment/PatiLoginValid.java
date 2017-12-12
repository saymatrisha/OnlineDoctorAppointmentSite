package com.appoinment;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class PatiLoginValid implements Filter {

    
   
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		String patiid = request.getParameter("patiid");
		String pass = request.getParameter("password");
		HttpSession session = ((HttpServletRequest) request).getSession();
		if(patiid.equals("")||patiid.equals(null)) {
			request.setAttribute("msg", "Enter your registration id");
		}
		if(pass.equals("")||pass.equals(null)) {
			request.setAttribute("msg1", "Enter your password");
		}
		if(session == null||patiid.equals("")||patiid.equals(null)||pass.equals("")||pass.equals(null)) {
			request.getRequestDispatcher("PatiLogin.jsp").forward(request, response);
		}
		else {
		chain.doFilter(request, response);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
