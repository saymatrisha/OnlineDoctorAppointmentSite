package com.appoinment;

import java.io.IOException;


import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import javax.sql.DataSource;


public class ViewPatiListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@Resource(name="connection")
	private DataSource ds;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}

}
