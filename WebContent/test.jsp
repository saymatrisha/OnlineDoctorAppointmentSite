<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Doctor Appointment System</title>
</head>
<body>
<p>Hello</p>
<form class= "form-group margin-right-5" action="test.jsp" method="post">
 <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
 <% 
 String pid = (String)session.getAttribute("pati_id"); 
 
 try{
	 InitialContext initialContext = new InitialContext();
     Context context = (Context) initialContext.lookup("java:comp/env");
     //The JDBC Data source that we just created
     DataSource ds = (DataSource) context.lookup("connection");
     Connection connection = ds.getConnection();

     if (connection == null)
     {
         throw new SQLException("Error establishing connection!");
     }
     String id = request.getParameter("ID");
     
     PreparedStatement pSt = ds.getConnection().prepareStatement("update patient_reg set doc_id=? WHERE pati_id=?");
     pSt.setString(1, request.getParameter("ID"));
     pSt.setString(2, "pid");
     int update = pSt.executeUpdate();
     if(update > 0) {
    	response.sendRedirect("welcome.jsp");
     }
     else{
    	 response.sendRedirect("error.jsp");
     }
     connection.close();
	 
 }catch(Exception e){
	 e.printStackTrace();
 }
 
 %>
 </div>
</form>


<%
try{
	
String id = request.getParameter("ID");
out.println(id);
}catch(Exception e){
	System.out.println("Wrong");
}
%>
</body>
</html>