<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>index</title>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-resource.js"></script>
<!-- Bootstrap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

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
								// out.println("authentication = " + authentication);
					%>
					<div id="user_info">
						Welcome <span style="color: green"> <i> </i>
						</span>
					</div>
					<form name="logout" action="Controller" method="Post">
						<div class="logmeout">
							<input type="submit" class=" btn btn-default pull-right"
								name="signout" value=" Logout ">
						</div>
					</form>


					<%
						} else {
					%>

					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<br />
					<div id="wrong_user" align="center">
						<span style="color: red"> Username  is wrong! </span>
					</div>



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
									}
								%>

							</div>
						</div>
					</div>


					<footer class="text-center">
						<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
							<strong>Copyright &copy; 2017 <a>Deependra</a>.
							</strong> All rights reserved.
						</div>
					</footer>
</body>
</html>