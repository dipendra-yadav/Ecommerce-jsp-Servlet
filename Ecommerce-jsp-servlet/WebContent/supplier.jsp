<!DOCTYPE html>
<html lang="en">
<head>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="icon" href="https://getbootstrap.com/favicon.ico">
<title>supplier</title>
<%@page errorPage="error.jsp"%>

<script>
	function validate() {
		var a1 = getElementById("name").value;
		var a2 = getElementById("organisation").value;
		var a3 = getElementById("email").value;
		var a4 = getElementById("password").value;
		if (a1 == "" || a1.trim == "" || a1 == null) {
			alert("please enter organisation name ");
		} else if (a2 == "" || a2.trim == "" || a2 == null) {
			alert("please enter location");
		} else if (a3 == "" || a3.trim == "" || a3 == null) {
			alert("please enter email");
		}
	}
</script>
</head>
<body>


	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
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
	<br />
	<br />
	<br />


	<div class="container">
		<marquee>
			<h3>Welcome to Online Business Relationship Management,thank you
				for being a part of our world.We welcome all new suppliers</h3>
		</marquee>
		<form class="form-signin">
			<center>
				<h2>Add Products</h2>
			</center>
			<br> 
			<label class="control-label" for="stuinfo-stu_title">Enter Product</label> 
			<input id="product" class="form-control" placeholder="Product name" type="text" required/> 
			
			<label class="control-label" for="stuinfo-stu_title">Price</label> 
			<input id="price" class="form-control" placeholder="product price" type="text" required/> 
			<label class="control-label" for="stuinfo-stu_title">Quantity</label> 
			<input id="" class="form-control" placeholder="Quantity" type="email" required/>
			<label class="control-label" for="stuinfo-stu_title">Product Category</label> 
			<select class="form-control" id="category" required/>
				<option selected="selected" value="" name="">--- Select Category ---</option>
				<option value="electronics">Electronics</option>
				<option value="books">books</option>
				<option value="garments">garments</option>
				<option value="Artifacts">Artifacts</option>
				<option value="food">Food</option>
			</select>

           <br/>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Add</button><br/>
			<button class="btn btn-lg btn-primary btn-block" type="submit">Edit Product Details</button>
	</div>
	</div>

	</form>
	</div>
	<!-- /container -->
	<br/><br/>
	<footer class="text-center">
					<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
						<strong>Copyright &copy; 2017 <a>Deependra</a>.
						</strong> All rights reserved.
					</div>
	</footer>


</body>
</html>
