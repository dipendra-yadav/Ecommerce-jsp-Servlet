<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.js"></script>
<script type="text/javascript"
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular-resource.js"></script>
</head>
<body>
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
				<a class="navbar-brand" href="#">Ecommerce</a>
			</div>
			<div id="navbar" class="navbar-collapse collapse">
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"></a></li>
			</div>
		</div>
	</div>


	<br />
	<br />
	<br />
	<div class="container">
		<div class="row">
			<div id="registration_block" class="col-sm-4 col-sm-offset-4"
				style="background-color: #ffffff; opacity: 0.9;">
				<h3 align="center">Registration Page</h3>
				<form action="Controller" method="Post">
					<div class="form-group">
						<label for="userName">Username:</label> <input type="text"
							class="form-control" name="registration_username" required /> <label
							for="password">Password:</label> <input type="password"
							class="form-control" name="registration_password" required />
					</div>

					<div class="form-group">
						<button type="submit" value="Register" name="registration_submit" class="btn btn-default ">Register</button>
						<button type="reset" value="Reset" class="btn btn-default ">Reset</button>


						<a href="./index.jsp" class="btn btn-default">Back</a>
					</div>
				</form>
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
