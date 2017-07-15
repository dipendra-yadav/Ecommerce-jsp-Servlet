<!DOCTYPE html>
<html>
<head>
<title>cart</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="https://getbootstrap.com/favicon.ico">
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.controller.*"%>
<%@page errorPage="error.jsp"%>
<%@page autoFlush="true"  buffer="8kb" session="true"%>



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



	<%
		ArrayList itemname = new ArrayList();
		ArrayList quantityno = new ArrayList();
	%>

   	<jsp:useBean id="product_in_cart" class="java.util.ArrayList" scope="session"></jsp:useBean>
		
	<br />

	<form name="logout" action="Controller" method="Post">
		<input class="form-group btn btn-default pull-right" type="submit"
			name="signout" value="Logout">
	</form>

	<div class="container">
		<center>

			<%
				itemname = (ArrayList) session.getAttribute("product_in_cart");
				quantityno = (ArrayList) session.getAttribute("quantity_in_cart");
			%>
				
			<%
				if (itemname != null) {
			%>
			<br />
			<h1>Items in your cart</h1>
			<br />

			<div id="payment">
				<form action="Controller" method="Post">
					<button type="submit" class="dc_button3 ico-money"
						name="payment" value="Payment">Payment</button>
				</form>
			</div>
			<br /> <br /> <br />

			<div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
				<table class="table table-striped table-bordered">
					<thead>
						<tr>
							<th>No. of items</th>
							<th>Item Name</th>
							<th>Quantity</th>
						</tr>
					</thead>
					<%
						for (int i = 1; i <= itemname.size(); i++) {
					%>
					<tbody>
						<tr>
							<td><%=i%></td>
							<td><%=itemname.get(i - 1)%></td>
							<td><%=quantityno.get(i - 1)%></td>
						</tr>
					</tbody>
					<%
						}
					%>
				</table>
				<%
					}
				%>
				<%
					if (itemname == null) {
				%>

				<h1>There are no items in your cart now.. Please add items to
					your cart first!!</h1>
				<%
					}
				%>
			</div>
	</div>


	<br />
	<br />
	<br />
	<footer class="text-center">
		<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
			<strong>Copyright &copy; 2017 <a>Deependra</a>.
			</strong> All rights reserved.
		</div>
	</footer>


</body>

</html>
