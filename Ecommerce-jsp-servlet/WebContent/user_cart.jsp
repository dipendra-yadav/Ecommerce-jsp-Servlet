<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="https://getbootstrap.com/favicon.ico">
<%@page import="com.controller.ProductDetails"%>
<%@page import="com.controller.CartDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.controller.Query"%>
<%@page session="true"%>
<%@page errorPage="error.jsp"%>


<style type="text/css">
body { background-image:url('http://cdn.dcodes.net/2/bg_images/wood/w12.jpg'); }
</style>

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


	<!-- 	<div class="container"> -->
	<!-- 		<div class="navbar-top navbar navbar-inverse navbar-fixed-top"> -->
	<!-- 			<div class="container"> -->
	<!-- 				<div class="navbar-header"> -->
	<!-- 					<button type="button" class="navbar-toggle collapsed" -->
	<!-- 						data-toggle="collapse" data-target="#navbar" aria-expanded="false" -->
	<!-- 						aria-controls="navbar"> -->
	<!-- 						<span class="sr-only">Toggle navigation</span> <span -->
	<!-- 							class="icon-bar"></span> <span class="icon-bar"></span> <span -->
	<!-- 							class="icon-bar"></span> -->
	<!-- 					</button> -->
	<!-- 					<a class="navbar-brand" href="#">Ecommerce </a> -->
	<!-- 				</div> -->
	<!-- 				<div id="navbar" class="navbar-collapse collapse"> -->
	<!-- 					<ul class="nav navbar-nav navbar-right"> -->
	<!-- 						<li><a href="#"></a></li> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->



	<%!ProductDetails pro = new ProductDetails();
	CartDetails mycart = new CartDetails();

	ProductDetails sessionbean = new ProductDetails(); //need to remove 
	String name = null;

	ArrayList productid = new ArrayList();
	ArrayList productname = new ArrayList();
	ArrayList productdescription = new ArrayList();
	ArrayList brandname = new ArrayList();
	ArrayList productprice = new ArrayList();
	Query queryObject = new Query();%>

	<%
		productid = (ArrayList) session.getAttribute("productid");
		productname = (ArrayList) session.getAttribute("productname");
		productdescription = (ArrayList) session.getAttribute("productdescription");
		brandname = (ArrayList) session.getAttribute("brandname");
		productprice = (ArrayList) session.getAttribute("productprice");
		System.out.println("Product DESCRIPTION SET IN USER CART.JSP");
		sessionbean.setProduct_description(productdescription);
	%>


	<%
		String authentication = (String) session.getAttribute("authentication");
		if (authentication == null) {
	%>
	<br />
	<br />
	<br />
	<br />

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
								class="form-control" name="login_name" /> <label for="password">Password:</label>
							<input type="password" class="form-control" name="login_password" />
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



				<div id="user_info" align="center">
					<span style="color: black"> <i> Hi! &nbsp; <%=(session.getAttribute("name"))%>
					</i>
					</span>
				</div>

				<form name="logout" action="Controller" method="Post">
					<input class="form-group btn btn-default pull-right" type="submit"
						name="signout" value="Logout">
				</form>



				<div class="container">
					<div class="row-fluid">
						<form name="cart" action="Controller" method="Post">
							<select name="Item">
							    <option value="default">--default--</option>
								<option value="books">Books</option>
								<option value="electronics">Electronics</option>
								<option value="icecream">Ice Cream</option>
							</select>
							<button type="submit" class="btn btn-default" value="product"
								name="product">Product</button>
						</form>
						<br />
						<br />
						<div class="container text-center">
							<%
								if (session.getAttribute("total_cart_items") != null) {
							%>
							<span id="total_cart_items"> Total items in cart = <%=session.getAttribute("total_cart_items")%></span>
							<%
								}
							%>

						</div>



						<%
							if (productname != null) {
						%>
						<form name="cart_details" method="Post" action="Controller">
							<span>
								<button type="submit" class="btn btn-default"
									value="Add to Cart" name="cartdetails">Add To Cart</button>
							</span> <span>
								<button type="submit" class="btn btn-default"
									value="finish n checkout" name="checkout_cart">Checkout</button>
							</span> <br />
							<br />



							<%
								for (int i = 0; i < productid.size(); i++) {
							%>

							<div class="container">
								<div class="row-fluid">

									<div class="span2 well">
										<table class="table table-striped table-bordered">
											<br />
											<span id="quantity"> Qty <input type="text"
												name="quantity" value="" size="1">
											</span>
											<br />

											<tr>
												<%--   <td>
                                   <%=productid.get(i) %>
                                 </td>
                                --%>
											</tr>
											<br />
											<tr>
												<td><img id="myimage" onclick="changeImage()"
													border="0" src="Images/image_3.gif" width="75" height="75"
													alt="Loading.."> <span id="inner_artcile_heading">
														<%=productname.get(i)%>
												</span><br> &nbsp; &nbsp; &nbsp; &nbsp;</td>
											</tr>
											<tr>
												<td>by <%=brandname.get(i)%>
												<td>
											</tr>


											<tr>
												<td><%=productdescription.get(i)%></td>
											</tr>
											<tr>
												<td>Price: Rs <%=productprice.get(i)%>
												</td>
											</tr>
										</table>
									</div>
								</div>
							</div>

							<%
								}
							%>
							<%
								session.setAttribute("product_name", productname);
										}
							%>

						</form>


					</div>
				</div>
			</div>
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

		<br /> <br /> <br /> <br />
		<footer class="text-center">
			<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
				<strong>Copyright &copy; 2017 <a>Deependra</a>.
				</strong> All rights reserved.
			</div>
		</footer>

	</div>
</body>
</html>