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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Online Doctor Appointment System</title>

<link rel="stylesheet" href="css/reset.css" type="text/css">
<link rel="stylesheet" href="css/styles.css" type="text/css">
<link rel="stylesheet" href="css/style.css">
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
<link rel="stylesheet prefetch" href="http://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>

<script type="text/javascript" src="js/custom.js"></script>

<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        
</head>

<body>
<div><center><p>View All Doctors</p></center></div>
<form class= "form-group margin-right-5" action="ManageDoc.jsp">
<div class="table-responsive" align="center">
 <table class="table table-bordered table-striped" style="width: 50%" align="center">
 <tr>
 <th style="width: 15%">Doc_id</th>
 <th style="width: 15%">Email</th>
 <th style="width: 15%">Degree</th>
 <th style="width: 15%">Department</th>
 <th style="width: 15%">Location</th>
 <th style="width: 15%">Delete Doctor</th>
 </tr>
 
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
            PreparedStatement pSt = ds.getConnection().prepareStatement("SELECT * from doctors_info");
			
			ResultSet rset = pSt.executeQuery();
            
            while (rset.next())
            {
            	int value =  rset.getInt(1);
            	String test = String.valueOf(value);
            	request.setAttribute("ID", test);
          
              %>
             <tr>
               <td><%=rset.getInt("doc_id") %></td>
               <td><%=rset.getString("email") %></td>
               <td><%=rset.getString("degree") %></td>
               <td><%=rset.getString("department") %></td>
               <td><%=rset.getString("location") %></td>
               <td><a href="DeleteDoc.jsp?ID=<%= rset.getInt(1)%>">Delete</a></td>
             </tr>
             <%  
             
            }
            rset.close();
            conn.close();
    	  
      }catch(Exception ex){
     	 ex.printStackTrace();
      }
    
    %>	
 </table>
 </div>
 </form>
</body>
<footer>
        <div class="footer-content width">
            
            <div class="clear"></div>
        </div>
        <div class="footer-bottom">
            <p>&copy; OurSite 2017. <a href="#">OnlineAppointmentSystem</a></p>
         </div>
    </footer>
</html>