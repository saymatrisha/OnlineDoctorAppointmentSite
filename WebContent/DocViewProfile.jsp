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
<header> 
	<div class="width">

    		<h1><a href="#">We Care</a></h1>

		<nav>
	
    			<ul class="sf-menu dropdown sf-js-enabled sf-shadow">

			
        			<li class="selected"><a href="DocHomePage.jsp">Home</a></li>
        			
                  <li><a href="DocUpdate.jsp">Edit Profile</a></li>
                     
				<li><a href="DocLogoutServlet">LogOut</a></li>
       			</ul>

			
			<div class="clear"></div>
    		</nav>
       	</div>

	<div class="clear"></div>

       
    </header>
<div id="body">

	<div class="width">

	<section id="content" class="two-column with-right-sidebar">

	    <article>
				
            <h3>My Profile</h3>

            <table cellspacing="0">
                <tbody><tr>
                    <td>First Name</td>
                     <td>${fname}</td>
                    </tr>
                    <tr>
                    <td>Last Name</td>
                     <td>${lname}</td>
                    </tr>
                    <tr>
                     <td>User Name</td>
                     <td>${uname}</td>
                    </tr>
                    <tr>
                     <td>Email</td>
                     <td>${email}</td>
                    </tr>
                    <tr>
                     <td>Password</td>
                     <td>${pass}</td>
                    </tr>
                    <tr>
                     <td>Degree</td>
                     <td>${degree}</td>
                    </tr>
                    <tr>
                     <td>Department</td>
                     <td>${depart}</td>
                    </tr>
                    <tr>
                     <td>Contact No</td>
                     <td>${conno}</td>
                    </tr>
                    <tr>
                     <td>Gender</td>
                     <td>${gender}</td>
                    </tr>
                    
                    <tr>
                     <td>Id</td>
                     <td>${id}</td>
                    </tr>
              

            </tbody></table>


		</article>
        </section>
        
        
    	<div class="clear"></div>
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