<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home Page</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

</head>
<body>



	<%
		String authentication = (String) session.getAttribute("authentication");
		if (authentication == null) {
	%>


	<div id="login_in">
		<form name="Home_Page" action="Controller" method="Post">
			<div class="container pull-right">
				<div class="form-group">
					<label for="userName">Username:</label> <input type="text"
						class="form-control" name="login_name" /> <label for="password">Password:</label>
					<input type="password" class="form-control" name="login_password" />
					<button type="submit" value="submit" name="login_submit"
						class="btn btn-default" onclick="return form_validation()">Sign
						in</button>

					<a href="./registration.jsp" class="btn btn-default">Register</a>
				</div>


			</div>
		</form>


		<%
			}
			if (authentication != null) {
				if (authentication.equals("Auth_Success")) {
		%>

		<div id="user_info">
			<span style="color: cyan"> <i> Welcome ! <%=(session.getAttribute("name"))%>
			</i>
			</span>
		</div>

		<form name="logout" action="Controller" method="Post">
			<input class="form-group btn btn-default pull-right" type="submit"
				name="signout" value="Logout">
		</form>
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
							class="form-control" name="login_name" /> <label for="password">Password:</label>
						<input type="password" class="form-control" name="login_password" />
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


		<div class="page-header">
			<nav id="links">
				<ul>
					<li><a href="#"> Home </a></li>
					<li><a href="seller.jsp"> Add Your Product </a></li>
					<li><a href="about_us.jsp"> About Us </a></li>
					<li><a href="contact_us.jsp">Contact Me </a></li>
				</ul>

			</nav>
		</div>





		<footer class="text-center">
			<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
				<strong>Copyright &copy; 2017 <a>Deependra</a>.
				</strong> All rights reserved.
			</div>
		</footer>

	</div>
</body>
</html>