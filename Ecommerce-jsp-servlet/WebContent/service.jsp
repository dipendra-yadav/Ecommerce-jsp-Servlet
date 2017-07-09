<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
<title>Services</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<!-- client side Validation -->
	<script type="text/javascript">
		function form_validation() {
			var name = document.Login_Form.login_name.value;
			var password = document.Login_Form.login_password.value;
			var flag = true;
			if (name == "") {
				document.getElementById("invalid_login").style.color = "red";
				document.getElementById('invalid_login').innerHTML = "UserName is mandatory!";
				flag = false;
			}
			if (password == "") {
				document.getElementById("invalid_login").style.color = "red";
				document.getElementById('invalid_login').innerHTML = "Password is mandatory!";
				flag = false;
			}
			return flag;
		}
	</script>


	<div class="container">
		<div class="navbar-top navbar navbar-inverse navbar-fixed-top">
			<div class="container">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#navbar" aria-expanded="false"
						aria-controls="navbar">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#">Ecommerce </a>
				</div>
				<div id="navbar" class="navbar-collapse collapse">
					<ul class="nav navbar-nav navbar-right">
						<li><a href="#"></a></li>
				</div>
			</div>
		</div>


		<%
			String authentication = (String) session.getAttribute("authentication");
			if (authentication == null) {
		%>
		<br /> <br /> <br /> <br />

		<div id="login_in">
			<div class="container">
				<!-- To print client Side Errors -->
				<div id="invalid_login" align="center"></div>




				<div class="row">
					<div id="login_block" class="col-sm-4 col-sm-offset-4"
						style="background-color: #ffffff; opacity: 0.9;">
						<h3 align="center">Log In</h3>
						<form name="Login_Form" action="Controller" method="Post">
							<div class="form-group">
								<label for="userName">Username:</label> <input type="text"
									class="form-control" name="login_name" /> <label
									for="password">Password:</label> <input type="password"
									class="form-control" name="login_password" />
							</div>

							<div class="form-group">
								<button type="submit" value="submit" name="login_submit"
									class="btn btn-default" onclick="return form_validation()">Sign
									in</button>

								<a href="./registration.jsp" class="btn btn-default">Register</a>
							</div>
						</form>
					</div>

					<%
						}
						if (authentication != null) {
							if (authentication.equals("Auth_Success")) {
					%>

					<!-- Navigation -->
					<nav class="navbar navbar-inverse navbar-fixed-top"
						role="navigation">
						<div class="container">
							<!-- Brand and toggle get grouped for better mobile display -->
							<div class="navbar-header">
								<button type="button" class="navbar-toggle"
									data-toggle="collapse"
									data-target="#bs-example-navbar-collapse-1">
									<span class="sr-only">Toggle navigation</span> <span
										class="icon-bar"></span> <span class="icon-bar"></span> <span
										class="icon-bar"></span>
								</button>
								<a class="navbar-brand" href="#">Ecommerce</a>
							</div>
							<!-- Collect the nav links, forms, and other content for toggling -->
							<div class="collapse navbar-collapse"
								id="bs-example-navbar-collapse-1">
								<ul class="nav navbar-nav">
									<li><a href="user_cart.jsp">Home</a></li>
									<li><a href="about_us.jsp">About Us</a></li>
									<li><a href="seller.jsp"> Add Your Product </a></li>

									<li><a href="service.jsp">Provide Services</a></li>
									<li><a href="contact_us.jsp">Contact Us </a></li>
								</ul>
							</div>
							<!-- /.navbar-collapse -->
						</div>
						<!-- /.container -->
					</nav>
					<br /> <br /> <br />

					<form name="admin" action="Controller" method="post">
						<div class="logmeout">
							<input type="submit" name="signout"
								class="form-group btn btn-default pull-right" value="Logout ">
						</div>
					</form>



					<!-- Page Content -->
					<div class="container">

						<!-- Introduction Row -->
						<div class="row">
							<div class="col-lg-12">
								<h2 class="page-header">
									Provide Services <small></small>
								</h2>
								<p>This website provides online shoping facility.</p>
								<div class="col-lg-4 col-sm-4 text-center">
									<h3>
										Order Products<br> <small>Online shopping</small>
									</h3>
								</div>


								<div class="col-lg-4 col-sm-4 text-center">
									<h3>
										select Product<br> <small>Select your choice
											Product</small>
									</h3>
								</div>


								<div class="col-lg-4 col-sm-4 text-center">
									<h3>
										Online Payment<br> <small>Online payment services
										</small>
									</h3>
								</div>


							</div>
						</div>

						<!-- Team Members Row -->
						<div class="row">
							<div class="col-lg-12">
								<h3 class="page-header">Our Team</h3>
							</div>
							<div class="col-lg-4 col-sm-4 text-center">
								<img class="img-thumbnail img-thumbnail img-center"
									src="/Ecommerce-jsp-servlet/WebContent/images/20150913_193443.jpg"
									alt="member1" width="150px" height="100px">
								<p></p>
							</div>
							<div class="col-lg-4 col-sm-6 text-center">
								<img class="img-thumbnail img-thumbnail img-center"
									src="/Ecommerce-jsp-servlet/WebContent/images/20150913_193443.jpg"
									alt="member2" width="150px" height="100px">
								<p></p>
							</div>
							<div class="col-lg-4 col-sm-6 text-center">
								<img class="img-thumbnail img-thumbnail img-center"
									src="/Ecommerce-jsp-servlet/WebContent/images/20150913_193443.jpg"
									alt="member3" width="125px" height="100px">
								<p></p>
							</div>


							<%
								} else {
							%>
							<div id="wrong_user">
								<span style="color: red"> Username/Password is wrong! </span>
							</div>
							<form name="Home_Page" action="Controller" method="Post">
								<div id="login_in">
									<div class="container pull-right">
										<div class="form-group">
											<label for="userName">Username:</label> <input type="text"
												class="form-control" name="login_name" /> <label
												for="password">Password:</label> <input type="password"
												class="form-control" name="login_password" />
											<button type="submit" value="submit" name="login_submit"
												class="btn btn-default" onclick="return form_validation()">Sign
												in</button>

											<a href="./registration.jsp" class="btn btn-default">Register</a>
										</div>


									</div>
								</div>
							</form>
							<%
								}
								}
							%>

							<br /> <br /> <br /> <br />





							<hr>

							<!-- Footer -->
							<footer class="text-center">
								<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
									<strong>Copyright &copy; 2017 <a>Deependra</a>.
									</strong> All rights reserved.
								</div>
							</footer>
						</div>
					</div>
					<!-- /.container -->
</body>
</html>
