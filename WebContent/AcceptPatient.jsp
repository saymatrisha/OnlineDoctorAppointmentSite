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

</head>

<body>
<div id="container"> 
<header> 
	<div class="width">
    		<h1><a href="#">We Care</a></h1>
	    	<nav>
    			<ul class="sf-menu dropdown sf-js-enabled sf-shadow">
        			
        			<li class="selected"><a href="DocHomePage.html">Home</a></li>
                  
                     
				<li><a href="#">LogOut</a></li>
       			</ul>
			<div class="clear"></div>
    		</nav>
       	</div>

	<div class="clear"></div>   
 </header>
 <%String id = (String)session.getAttribute("pati_id"); %>  
 <div class="wrapper">

  
<form class= "form-group margin-right-5" action="acceptPatiServlet" method="post">
<div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
          
        
          
  </div>
  <div class="table-responsive" align="center">
 <table class="table table-bordered table-striped" style="width: 50%" align="center">
 <tr>
 <th style="width: 15%">First Name</th>
 <th style="width: 15%">Last Name</th>
 <th style="width: 15%">Email</th>
 <th style="width: 15%">DOB</th>
 <th style="width: 50%">Gender</th>
 <th style="width: 15%">Day</th>
 <th style="width: 15%">From</th>
 <th style="width: 15%">To</th>
 <th style="width: 15%">Request</th>

 </tr>
 <%
      try{
    	  String accept = (String)session.getAttribute("req");
    	
    	  int timeId = (Integer)session.getAttribute("timeID");
    	  InitialContext initialContext = new InitialContext();
          Context context = (Context) initialContext.lookup("java:comp/env");
          //The JDBC Data source that we just created
          DataSource ds = (DataSource) context.lookup("connection");
          Connection conn = ds.getConnection();

          if (conn == null)
          {
              throw new SQLException("Error establishing connection!");
          }
            PreparedStatement pSt = ds.getConnection().prepareStatement("SELECT patient_reg.firstname, patient_reg.lastname, patient_reg.email, patient_reg.dob, patient_reg.gender,patient_reg.pati_id, approve.pati_id, approve.doc_id, approve.time_id,approve.request, doctors_info.doc_id,doctors_info.day, doctors_info.start_time,doctors_info.end_time, doctors_info.time_id FROM patient_reg INNER JOIN approve ON approve.pati_id = patient_reg.pati_id INNER JOIN doctors_info ON doctors_info.doc_id = approve.doc_id WHERE approve.time_id=?");
		    pSt.setInt(1, timeId);
			ResultSet rset = pSt.executeQuery();

            while (rset.next())
            {
            
            %>
              
             <tr>
               <td><%=rset.getString("firstname") %></td>
               <td><%=rset.getString("lastname") %></td>
               <td><%=rset.getString("email") %></td>
               <td><%=rset.getString("dob") %></td>
               <td><%=rset.getString("gender") %></td>
               <td><%=rset.getString("day") %></td>
               <td><%=rset.getString("start_time") %></td>
               <td><%=rset.getString("end_time") %></td>
               <td>${accept}</td>
               
               
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
 
</div>
<footer>
        <div class="footer-content width">
            
            <div class="clear"></div>
        </div>
        <div class="footer-bottom">
            <p>&copy; OurSite 2017. <a href="#">OnlineAppointmentSystem</a></p>
         </div>
    </footer>
</div>

</body>

</html>