<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Online Doctor Appointment System</title>


<link rel="stylesheet" href="css/reset.css" type="text/css" />
<link rel="stylesheet" href="css/styles.css" type="text/css" />
<link href="http://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">



<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/slider.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>

<script type="text/javascript" src="js/custom.js"></script>

<meta name="viewport" content="width=device-width, minimum-scale=1.0, maximum-scale=1.0" />


</head>

<body>
<div id="container">
<header> 
 
	<div class="width">

    		<h1><a href="#">We Care</a></h1>

		<nav>
	
    			<ul class="sf-menu dropdown sf-js-enabled sf-shadow">

			
        			<li class="selected"><a href="index.html">Home</a></li>
                  <li>

					<a href="#">My Profile</a>
            				
					<ul>
                				<li><a href="DocViewProfile.jsp">View Profile</a></li>
                   				<li><a href="DocUpdate.jsp">Edit Profile</a></li>
                   				
                			</ul></li>
                     
				<li><a href="DocLogoutServlet">LogOut</a></li>
       			</ul>

			<div class="clear"></div>
    		</nav>
       	</div>

	<div class="clear"></div>

    </header>
    <div>
 <% 
 String message =(String)request.getAttribute("sumsg");
  if(message!=null){
	out.println(message);
  }
	%>
 </div>
<%String username = (String)session.getAttribute("uname"); %>   

<div id="body">
  <center><h4>Welcome :: <%=username%></h4></center>
   <center><h3><% 
 String message1 =(String)request.getAttribute("msg");
if(message1!=null){
	out.println(message1);
}
%>
<%String doc_id = (String)session.getAttribute("doc_id"); %>
</h3></center>
</div>
<div class="clear"></div>

 
 <aside class="sidebar big-sidebar right-sidebar">

            <ul>	
               <li class="color-bg">
                    <ul class="blocklist">
                        <li><a class="selected" href="#">Messages</a></li>
                        <li><a href="DocAvailability.jsp">Provide Additional Information</a></li>
                        <li><a href="ViewDoctorsSchedule.jsp">View My schedule</a></li>
                        <li><a href="ViewPatiList.jsp">View Patient List</a></li>
                    </ul>
                </li>
      
            </ul>
		
        </aside>
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


