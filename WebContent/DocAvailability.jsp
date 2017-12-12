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
<link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.3.1026/styles/kendo.common-material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.3.1026/styles/kendo.material.min.css" />
    <link rel="stylesheet" href="https://kendo.cdn.telerik.com/2017.3.1026/styles/kendo.material.mobile.min.css" />

    <script src="https://kendo.cdn.telerik.com/2017.3.1026/js/jquery.min.js"></script>
    <script src="https://kendo.cdn.telerik.com/2017.3.1026/js/kendo.all.min.js"></script>
    
<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0">
<script>
                $(document).ready(function() {
                    function startChange() {
                        var startTime = start.value();

                        if (startTime) {
                            startTime = new Date(startTime);

                            end.max(startTime);

                            startTime.setMinutes(startTime.getMinutes() + this.options.interval);

                            end.min(startTime);
                            end.value(startTime);
                        }
                    }

                    //init start timepicker
                    var start = $("#start").kendoTimePicker({
                        change: startChange
                    }).data("kendoTimePicker");

                    //init end timepicker
                    var end = $("#end").kendoTimePicker().data("kendoTimePicker");

                    //define min/max range
                    start.min("8:00 AM");
                    start.max("6:00 PM");

                    //define min/max range
                    end.min("8:00 AM");
                    end.max("7:30 AM");
                });
            </script>

           
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

<form class= "form-group margin-right-5" action="docAvailability" method="post">
 <h2 class="text-center">Provide Info</h2>
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="hidden" class="form-control" name = "uname" value="${uname}">
        
  </div>

  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="email" placeholder="Email" value="${email}">
        
  </div>
  
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="degree" placeholder="Degree" value="${degree}">
 
  </div>
  
  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="department" placeholder="Degree" value="${depart}">
 
  </div>
  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="location" placeholder="Location">
 
  </div>
  
  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
         <input type="text" class="form-control" name="day" placeholder="Available Day">
 
  </div>
 
 
  <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
          
          <input id="start" name="start"  placeholder="Start time" style="width: 100%;" />

 </div>
 <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
          <input id="end"  name="end"  placeholder="End time" style="width: 100%;" />
 </div>
 
 
  
 
   <div class="form-group margin-right-5 col-sm-4 col-sm-offset-4">
       <button class="btn btn-lg btn-primary btn-block" type="submit">Send</button>  
   </div>
</form>

</div>

</div>
<footer>
        <div class="footer-content width">
            
            <div class="clear"></div>
        </div>
        <div class="footer-bottom">
            <p>&copy; OurSite 2017. <a href="#">OnlineAppointmentSystem</a></p>
         </div>
</footer>
</body>

</html>