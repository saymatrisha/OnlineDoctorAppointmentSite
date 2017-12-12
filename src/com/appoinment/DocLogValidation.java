package com.appoinment;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class DocLogValidation implements Filter {

    
	public void destroy() {
		// TODO Auto-generated method stub
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		    
	        String name = request.getParameter("username");
	        String pass = request.getParameter("password");
	        if(name.equals("")||name.equals(null)) {
	        	 request.setAttribute("msg","User name empty" );
	        }
	       
	        if(pass.equals("")||pass.equals(null)) {
	        	 request.setAttribute("msg1","User password empty" );
	        }
	       
	        if(name.equals("")||name.equals(null)||pass.equals("")||pass.equals(null)) {
	        	 request.getRequestDispatcher("DocLogin.jsp").forward(request, response);
	        }
	        else {
	        
		    chain.doFilter(request, response);
	        }
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
