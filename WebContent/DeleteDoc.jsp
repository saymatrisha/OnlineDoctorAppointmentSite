<%@page import="javax.naming.Context"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Online Doctor Appointment System</title>
</head>
<body>
<div><center><p>View All Doctors</p></center></div>
<%
try{
	String id = request.getParameter("ID");
	//out.println(id);
	InitialContext initialContext = new InitialContext();
    Context context = (Context) initialContext.lookup("java:comp/env");
    //The JDBC Data source that we just created
    DataSource ds = (DataSource) context.lookup("connection");
    Connection conn = ds.getConnection();

    if (conn == null)
    {
        throw new SQLException("Error establishing connection!");
    }
   
    
    PreparedStatement pSt = ds.getConnection().prepareStatement("DELETE doctors_info, doctors_reg FROM doctors_info INNER JOIN doctors_reg ON doctors_info.doc_id = doctors_info.doc_id  WHERE doctors_info.doc_id="+id+" AND doctors_reg.doc_id="+id+"");
    int res = pSt.executeUpdate();
    if(res > 0){
    	System.out.println("deleted");
    }
    
    conn.close();
	

}catch(Exception e){
	e.printStackTrace();
}

%>


</body>
</html>