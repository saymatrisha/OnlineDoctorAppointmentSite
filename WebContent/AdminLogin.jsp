<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<body>
<div id="container">
<header> 
	<div class="width">
    		<h1><a href="#">We Care</a></h1>
		<nav>
    			<ul class="sf-menu dropdown sf-js-enabled sf-shadow">

			
        			<li class="selected"><a href="index.html">Home</a></li>

	     			<li><a href="#">Services</a></li>
            
				<li><a href="#">Contact</a></li>
       			</ul>

			<div class="clear"></div>
    		</nav>
       	</div>

	<div class="clear"></div>

    </header>
 
    <div class="wrapper">  
    
    <form class="form-group margin-right-5" action="adminServlet" method="post">       
      <h2 class="text-center">Login</h2>
      <div class="form-group margin-right-5 col-md-4 col-md-offset-4">
         <input type="text" class="form-control" name="username" placeholder="username">
  </div>
      <div class="form-group margin-right-5 col-md-4 col-md-offset-4">
        <input type="password" class="form-control" name="password" placeholder="Password">
  
  </div>
      
      <div class="form-group margin-right-5 col-md-4 col-md-offset-4">
            <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>  
            
      </div>
      </form>
    
 </div>
</div>
</body>
</html>