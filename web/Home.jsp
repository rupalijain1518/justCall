<!DOCTYPE HTML>
<!--
	Alpha by HTML5 UP
	html5up.net | @n33co
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>JustCall</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="landing">
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1><a href="index.html">Alpha</a> by HTML5 UP</h1>
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
                                                                                    
                                                                                    <li><a href="BlockBusiness.jsp">Block Business</a></li>
										</ul>

                                                                                                                                                <li>
										<a href="#">Unblock<i class="fa fa-angle-double-right" style="float:right;"></i></a>
										<ul>
                                                                                    
                                                                                    <li><a href="UnblockBusiness.jsp">Unblock Business</a></li>
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
                                    out.print("<li><a href='LogOut.jsp' class='button'>Sign out</a></li>");

                    %>
                                                        
                                                        
                                                        
						</ul>
					</nav>
				</header>
			<!-- Banner -->
                        
                        
                        
				<section id="banner">
                                    <div style="margin-left: -500px;">
					<h2>JustCall.com</h2>
					<p>Promote your business with us.</p>
					<ul class="actions">
                                                        <%

                                                               if(session.getAttribute("unm")==null)
                                                                       out.print("<li><a href='Login.jsp' class='button'>Sign Up</a></li>");
                                                               else
                                                                       out.print("<li><a href='LogOut.jsp' class='button'>Sign out</a></li>");

                                                       %>

						<li><a href="Search.jsp" class="button special">Search</a></li>
					</ul>
                                    </div>
				</section>

			<!-- Main -->
				<section id="main" class="container"  style="margin-top: -150px;">

					<section class="box special">
						<header class="major">
							<h2>Introducing the ultimate mobile app
							<br />
							for doing stuff with your phone</h2>
							<p>Blandit varius ut praesent nascetur eu penatibus nisi risus faucibus nunc ornare<br />
							adipiscing nunc adipiscing. Condimentum turpis massa.</p>
						</header>
						<span class="image featured"><img src="images/pic01.jpg" alt="" /></span>
					</section>
					
				
				</section>

			<!-- CTA -->
				<section id="cta">

					<h2>Search Business</h2>

                                        <form action="Search.jsp" method="get">
						<div class="row uniform 50%">
							<div class="8u 12u(mobilep)">
								<input type="text" name="srch" placeholder="Enter business name" />
							</div>
							<div class="4u 12u(mobilep)">
								<input type="submit" value="Search" class="fit" />
							</div>
						</div>
					</form>

				</section>

			<!-- Footer -->
				<footer id="footer">
					<ul class="icons">
						<li><a href="#" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
						<li><a href="#" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
						<li><a href="#" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
						<li><a href="#" class="icon fa-github"><span class="label">Github</span></a></li>
						<li><a href="#" class="icon fa-dribbble"><span class="label">Dribbble</span></a></li>
						<li><a href="#" class="icon fa-google-plus"><span class="label">Google+</span></a></li>
					</ul>
					<ul class="copyright">
						<li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
					</ul>
				</footer>

		</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/jquery.scrollgress.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
			<script src="assets/js/main.js"></script>

	</body>
</html>