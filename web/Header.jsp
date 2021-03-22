<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>JustCall</title>
		<meta charset="utf`-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body>
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1 style="color:white;font-size:30px;">JustCall.com</h1>
					<nav id="nav">
						<ul>
							<li><a href="Home.jsp">Home</a></li>


                     <%

                            if(session.getAttribute("role")!=null && session.getAttribute("role").toString().equals("Admin")==true)
                            {
                                    %>
                                                        <li>
								<a href="#" class="icon fa-angle-down">Admin</a>
								<ul>
                                                                        <li>
										<a href="#">Show<i class="fa fa-angle-double-right" style="float:right;"></i></a>
										<ul>
                                                                                    <li><a href="ShowUsers.jsp">Show Users</a></li>
                                                                                    <li><a href="ShowBusiness.jsp">Show Businesses</a></li>
										</ul>
									</li>
                                                                        <li>
										<a href="#">Block<i class="fa fa-angle-double-right" style="float:right;"></i></a>
										<ul>
                                                                                    <!--<li><a href="BlockUser.jsp">Block User</a></li>-->
                                                                                    <li><a href="BlockBusiness.jsp">Block Business</a></li>
										</ul>

                                                                                                                                                <li>
										<a href="#">Unblock<i class="fa fa-angle-double-right" style="float:right;"></i></a>
										<ul>
                                                                                    <!--<li><a href="UnBlockUser.jsp">Unblock User</a></li>-->
                                                                                    <li><a href="UnBlockBusiness.jsp">Unblock Business</a></li>
										</ul>


                                                                        
                                                                        
								</ul>
							</li>
                     
                                                        
                                                        <%                                    
                                    
                            }        
                                    
                    %>
                                                        
                                                        
                                                        

                                                        <li><a href="Search.jsp">Search</a></li>
                                                        <li><a href="AddBusiness.jsp">Add Business</a></li>
                                                        <li><a href="ContactUs.jsp">Contact</a></li>
                                                        <li><a href="AboutUs.jsp">About Us</a></li>


                     <%

                            if(session.getAttribute("unm")==null)
                                    out.print("<li><a href='Login.jsp' class='button'>Sign Up</a></li>");
                            else
                            {
                                out.print("<li><a href='UpdateProfile.jsp'>Update Profile</a></li>");
                                out.print("<li><a href='UpdateBusiness.jsp'>Update Business</a></li>");    
                                out.print("<li><a href='LogOut.jsp' class='button'>Sign out</a></li>");
                            }
                            

                    %>
                                                        
                                                        
                                                        
						</ul>
					</nav>
				</header>

			<!-- Main -->
				<section id="main" class="container">
					
                                    
                                    
                                    
