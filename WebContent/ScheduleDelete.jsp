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
<title>Insert title here</title>
</head>
<body>
<form class= "form-group margin-right-5" action="ScheduleDelete.jsp" method="post">
<% 
try{
	InitialContext initialContext = new InitialContext();
    Context context = (Context) initialContext.lookup("java:comp/env");
    //The JDBC Data source that we just created
    DataSource ds = (DataSource) context.lookup("connection");
    Connection conn = ds.getConnection();

    if (conn == null)
    {
        throw new SQLException("Error establishing connection!");
    }
    
    int tID = (Integer)session.getAttribute("timeID");
  
    PreparedStatement pSt = ds.getConnection().prepareStatement("DELETE from doctors_info WHERE time_id=?");
    pSt.setInt(1, tID);
    int res = pSt.executeUpdate();
    if(res > 0){
    	response.sendRedirect("ViewDoctorsSchedule.jsp");
    	
    }
    else{
    	response.sendRedirect("error.jsp");
    }
    
    conn.close();
    
}catch(Exception e){
	e.printStackTrace();
}

%>
</form>
</body>
</html>