<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="icon" href="https://getbootstrap.com/favicon.ico">


<!-- DC 3D Buttons CSS -->
<link rel="stylesheet" href="http://cdn.dcodes.net/2/3d_buttons/css/dc_3d_buttons.css" />
<!-- DC Web Icons CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.dcodes.net/2/web_icons/dc_web_icons.css" />

<!-- DC Web Icons II CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.dcodes.net/2/web_icons2/dc_web_icons2.css" />

<!-- DC Web Icons III CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.dcodes.net/2/web_icons3/dc_web_icons3.css" />

<!-- DC Pictogram Icons CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.dcodes.net/2/pictogram_icons/dc_pictogram_icons.css" />

<!-- DC Pictogram Fonts CSS -->
<link rel="stylesheet" type="text/css" href="http://cdn.dcodes.net/2/pictogram_fonts/dc_pictogram_fonts.css" />

<%@page errorPage="error.jsp"%>

<style type="text/css">
thead {
	background-color: orange;
	color: white;
}
body { background-image:url('http://cdn.dcodes.net/2/bg_images/wood/w12.jpg');
</style>
</head>
<body>
	<%!
	ArrayList productname = new ArrayList();
	ArrayList productdescription = new ArrayList();
	ArrayList brandname = new ArrayList();
	ArrayList productprice = new ArrayList();
	ArrayList productid = new ArrayList();%>
	<%
		productname = (ArrayList) session.getAttribute("productname");
		productdescription = (ArrayList) session.getAttribute("productdescription");
		brandname = (ArrayList) session.getAttribute("brandname");
		productprice = (ArrayList) session.getAttribute("productprice");
		productid = (ArrayList) session.getAttribute("productid");
		System.out.println("\nproductname = " + productname);
		System.out.println("\nproductdescription = " + productdescription);
		System.out.println("\nbrandname = " + brandname);
		System.out.println("\nproductprice = " + productprice);
		System.out.println("\nproductid = " + productid);
	%>



	<%
		String classifier_name = "none";
		session.setAttribute("admin_mode", "view");
		String db_insertion_result = (String) session.getAttribute("db_insertion_result");
		//    out.println("Admin mode = " + (String) session.getAttribute("admin_mode"));
		//    out.println("insertion_result " + db_insertion_result);
		if ((String) session.getAttribute("classifier_name") != null) {
			classifier_name = (String) session.getAttribute("classifier_name");
			// out.println("Classifier name selected = " + classifier_name);
		}
	%>

	

    <%
		String admin_name = (String) session.getAttribute("name");
	%>
	
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
	
	
	
	<br/><br/>
	   <div class="container text-center">
		<div class="row">
			<h2>Hi, &nbsp;<%=admin_name%>
			</h2>
			<br /> <br />
		</div>
			
		
		<a href="admin_insert.jsp" title="Insert" 
						class="dc_3d_button gray">Insert Item
				</a>
				<a href="admin_update.jsp" title="Update" 
						class="dc_3d_button gray"> Update Item
				</a>
				<a href="admin_remove.jsp" title="Delete" class="dc_3d_button gray"><span class="tea"></span>Delete Item
				</a>
				<a href="admin_view_all.jsp" title="View"
						class="dc_3d_button gray">view all
				</a>
			
	
		
	<form name="admin" action="Controller" method="post">
		<div class="logmeout">
			<input type="submit" name="signout"
				class="form-group btn btn-default pull-right" value="Logout ">
		</div>
	</form>
	

	
	<form name="admin" action="Controller" method="post">
		<div class="container">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4"
					style="background-color: #; opacity: 0.9;">
					<br />
			<h3>Select a product to view</h3>
			<br /> <br />
			<%
				if (db_insertion_result != null) {
					if (db_insertion_result.equals("success")) {
			%>
			<span style="color: green"> <b> Insertion Successful!! </b>
			</span>
			<%
				}
					if (db_insertion_result.equals("failure")) {
			%>
			<span style="color: red"> <b> Insertion Failure! Please
					try again! </b>
			</span>
			<%
				}
				}
			%>
			<br /> <br />
			<div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
				<div class="form-group ">
					<label class="control-label" for="">Select Item</label> 
					<select name="admin_classifer_choice">
						<option value="default">default</option>
						<option value="Books">Books</option>
						<option value="Electronics">Electronics</option>
						<option value="Icecream">Ice Cream</option>
					</select>
					<div class="help-block"></div>
					<div class="form-group">
						<button type="submit" value="Insert" name="admin_view_all_products" class="dc_3d_button gray">View All</button>
					</div>

				</div>
			</div>

   </div>
   </div>
   </form>
			<%
				if ((String) session.getAttribute("classifier_name") != null) {
					classifier_name = (String) session.getAttribute("classifier_name");
			%>
			Catogory Selected : <span style="color: green"> <b> <%=classifier_name%>
			</b>
			</span>

			<%
				}
			%>
			<br /> <br />
			<%
				if (productname != null) {
			%>
			<table class="table table-striped table-bordered">
				<thead>
					<tr>
						<th>Product Id</th>
						<th>Product Name</th>
						<th>Brand/Author Name</th>
						<th>Description</th>
						<th>Price</th>

					</tr>
				</thead>

				<%
					for (int i = 1; i <= productname.size(); i++) {
				%>
				<tbody>
					<tr>
						<td><%=productid.get(i - 1)%></td>
						<td><%=productname.get(i - 1)%></td>
						<td><%=brandname.get(i - 1)%></td>
						<td><%=productdescription.get(i - 1)%></td>
						<td><%=productprice.get(i - 1)%></td>
					</tr>
				</tbody>
				<%
					}
				%>
			</table>
			<%
				}
			%>
			
			<br /> <br />
			
			
			
			
			
	<footer class="text-center">
		<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
			<strong>Copyright &copy; 2017 <a>Deependra</a>.
			</strong> All rights reserved.
		</div>
	</footer>
			
		</div>
	</body>
</html>




