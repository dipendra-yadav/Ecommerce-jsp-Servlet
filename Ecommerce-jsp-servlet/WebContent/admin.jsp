<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="mycss.css" type="text/css">
<!-- Bootstrap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<link rel="stylesheet" href="css/dbStyle.css">
<link href="font-awesome-4.4.0/css/font-awesome.css" rel="stylesheet">
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
				<a class="navbar-brand" href="#">Sales System</a>
			</div>
			<!--   <div id="navbar" class="navbar-collapse collapse">
                    <ul class="nav navbar-nav navbar-right">
                        <li> <a href="admin_insert.jsp" title="Insert" > <i class="fa fa-plus-circle text-blue fa-2x"> </i> Insert Item </a> </li>
                        <li> <a href="admin_update.jsp" title="Update" > <i class="fa fa-pencil-square text-blue fa-2x"></i> Update Item </a> </li>
                        <li> <a href="admin_remove.jsp" title="Delete" > <i class="icon-remove-sign text-blue fa-2x"></i> Delete Item</a> </li>                    
                        <li> <a href="admin_view_all.jsp" title="View" > <i class="fa fa-eye text-blue fa-2x"></i>view all  </a> </li>                    
                   -->
		</div>
	</div>
	<br />
	<br />
	<br />
	<br />


	<%
		String admin_name = (String) session.getAttribute("name");
	%>
	<div class="container text-center">
		<div class="row">
			<h2>
				Welcome
				<%=admin_name%>
			</h2>
			<br /> <br />
			<form name="admin" action="Controller" method="Post">
				<input class="form-group btn btn-default pull-right" type="submit"
					name="signout" value="Logout">
			</form>



		</div>
		<nav id="links">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="admin_insert.jsp" title="Insert"> <i
						class="fa fa-plus-circle text-blue fa-2x"> </i> Insert Item
				</a></li>
				<li><a href="admin_update.jsp" title="Update"> <i
						class="fa fa-pencil-square text-blue fa-2x"></i> Update Item
				</a></li>
				<li><a href="admin_remove.jsp" title="Delete"> <i
						class="fa fa-trash-o text-blue fa-2x "></i> Delete Item
				</a></li>
				<li><a href="admin_view_all.jsp" title="View"> <i
						class="fa fa-eye text-blue fa-2x"></i>view all
				</a></li>
			</ul>
		</nav>

	</div>






	<footer class="text-center">
		<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
			<strong>Copyright &copy; 2017 <a>Deependra</a>.
			</strong> All rights reserved.
		</div>
	</footer>

</body>
</html>
