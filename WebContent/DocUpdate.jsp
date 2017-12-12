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

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>

<script type="text/javascript" src="js/custom.js"></script>

<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
</head>
<%String uname =(String)session.getAttribute("uname"); %>
<body>
<div id="container"> 
<header> 
	<div class="width">
    		<h1><a href="#">We Care</a></h1>
	    	<nav>
    			<ul class="sf-menu dropdown sf-js-enabled sf-shadow">
        			<li class="selected"><a href="DocHomePage.jsp">Home</a></li>
        			<li><a href="#">Services</a></li>
				<li><a href="#">Logout</a></li>
       			</ul>
			<div class="clear"></div>
    		</nav>
       	</div>

	<div class="clear"></div>   
 </header>
 <div class="wrapper">

<form class= "form-group margin-right-5" action="docupdateServlet" method="post">
 <h2 class="text-center">Update Profile</h2>

   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <label>${uname}</label>
         <input type="hidden" class="form-control" name="uname" value="${uname}">
  </div>
  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
    <input type="text" class="form-control" name="fname" placeholder="First Name" value="${fname}">
     <%
 String msg = (String)request.getAttribute("msg");
 if(msg!=null){
 out.println(msg);
 }
 %> 
  </div>

  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="lname" placeholder="Last Name" value="${lname}">
 <%
 String msg1 = (String)request.getAttribute("msg1");
 if(msg1!=null){
 out.println(msg1);
 }
 %>   
   
  </div>
 
  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="email" placeholder="Email" value="${email}">
         <%
 String msg3 = (String)request.getAttribute("msg3");
 if(msg3!=null){
 out.println(msg3);
 }
 %> 

  </div>
  
  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="password" class="form-control" name="pass" placeholder="Password" value="${pass}">
         <%
 String msg4 = (String)request.getAttribute("msg4");
 if(msg4!=null){
 out.println(msg4);
 }
 %>  
  
  </div>
  
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">

      <input type="password" class="form-control" name="rePass" placeholder="Retype Password" value="${repass}">
 <%
 String msg5 = (String)request.getAttribute("msg5");
 if(msg5!=null){
 out.println(msg5);
 }
 %>     
  </div>
   
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="degree" placeholder="Degree" value="${degree}">
 <%
 String msg6 = (String)request.getAttribute("msg6");
 if(msg6!=null){
 out.println(msg6);
 }
 %>   
  </div>
  
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
          <select class="form-control" name="department">
          <option value="${depart}">Select Department</option>
         <% 
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
        	 
             String query = "SELECT * FROM doc_dept";
             PreparedStatement statement = connection.prepareStatement(query);
             ResultSet rs = statement.executeQuery();

             while (rs.next())
             {
               %>
               <option value="<%= rs.getString("dept_name") %>"><%= rs.getString("dept_name")%></option>
               
               <% 
             }

         }catch(Exception ex){
        	 ex.printStackTrace();
         }
     
         %>
          </select>
<%
 String msg7 = (String)request.getAttribute("msg7");
 if(msg7!=null){
 out.println(msg7);
 }
 %>  
  </div>
  
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="conno" placeholder="Contact No" value="${conno}">
 <%
 String msg8 = (String)request.getAttribute("msg8");
 if(msg8!=null){
 out.println(msg8);
 }
 %>    
  </div>
  
   <div class="form-group col-sm-4 col-sm-offset-4">
        <label class="col-sm-4 control-label">Enter Gender</label>
        <div class="col-sm-8">
            <label class="radio-inline"> <input type="radio" name="gender" value="Male">Male</label>
            <label class="radio-inline"> <input type="radio" name="gender"value="Female">Female</label>
        </div>
       
    </div>
    
 
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
       <button class="btn btn-lg btn-primary btn-block" type="submit">Send</button>  
   </div>
</form>
</div>
</div>
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