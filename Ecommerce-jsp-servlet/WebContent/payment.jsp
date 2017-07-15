<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>payment</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="https://getbootstrap.com/favicon.ico">

<style type="text/css">
body { background-image:url('http://cdn.dcodes.net/2/bg_images/wood/w12.jpg'); }
</style>

</head>
<body>
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
								<li><a href="supplier.jsp">Add Your Product </a></li>
								<li><a href="service.jsp">Services</a></li>
								<li><a href="contact_us.jsp">Contact Us </a></li>
							</ul>
						</div>
						<!-- /.navbar-collapse -->
					</div>
					<!-- /.container -->
				</nav>
				<br /> <br /> <br /> <br />


	<br />
	<br />
	<form name="logout" action="Controller" method="Post">
		<input class="form-group btn btn-default pull-right" type="submit"
			name="signout" value="Logout">
	</form>


	<div class="container text-center">
		<%
			String Confirmation = (String) session.getAttribute("Order_Confirmation");
			if (Confirmation == null) {
		%>
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4"
					style="background-color: #ffffff; opacity: 0.9;">

					<form action="Controller" method="Post">
						<h2 for="Author">Payment Information</h2>
						<br /> <br /> 
						<label for="Name">Card Type/Bank</label> 
						<select name="card_type" class="form-control" required>
							<option>State Bank of India</option>
							<option>Citi Bank</option>
							<option>Kotak mahindra</option>
							<option>Punjab National Bank</option>
						</select> 
						<label for="Name">Card Number</label> 
						<input type="number" value="" maxlength="16" class="form-control" name="card_number" required /> 
						<label for="Name">Card Name</label> 
						<input type="text" value="" maxlength="20" class="form-control" name="card_name" required />
						<label for="Name">Expiration Month</label>
						<select name="expiration_month" class="form-control" required>
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
							<option>11</option>
							<option>12</option>
						</select> 
						<label for="Name">Expiration Year</label>
						<select name="expiration_year"  class="form-control" required>
							<option>2017</option>
							<option>2018</option>
							<option>2019</option>
							<option>2020</option>
						</select> <br /> <br />


						<h2>Billing Information</h2>
						<br /> <br /> 
						<label for="Name">Full Name:</label> 
						<input type="text" class="form-control" name="fullname" size="8" required /> 
						<label for="Address">Address</label> 
						<input type="text" class="form-control" name="adress" required /> 
						<label for="Country">Country:</label> 
						<input type="text" class="form-control" name="country" required /> 
						<label for="Zip">zip</label> 
						<input type="number" class="form-control" name="zipcode" required /><br/>
						<button type="submit" name="place_order" class="btn btn-default">Order</button>

                    </form>
						<%
							} // ending billing n payment info
						%>
						<%
							if (Confirmation != null) {
						%>
						<h4>
							Order Has been submitted!! ur order will be processd in quick time!!! <br /> <br />
							<br /> Thank you for ordering at Ecommerce Sales System.
						</h4>
						<br /> <br /> <br /> <br /> <br />
						<div id="link">
							<h2>
								<a href="user_cart.jsp"> Shop Again! </a>
							</h2>
						</div>
						<%
							}
						%>
					
				</div>
			</div>
		</div>
	</div>

<br/><br/>

	<footer class="text-center">
		<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
			<strong>Copyright &copy; 2017 <a>Deependra</a>.
			</strong> All rights reserved.
		</div>
	</footer>

</body>
</html>
