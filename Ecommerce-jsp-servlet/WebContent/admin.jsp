<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Bootstrap -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="icon" href="https://getbootstrap.com/favicon.ico">
<!-- <!-- DC Transparent Buttons CSS --> -->
<!-- <link type="text/css" rel="stylesheet" href="http://cdn.dcodes.net/2/buttons_transparent/css/dc_buttons_transp.css" /> -->

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
body { background-image:url('http://cdn.dcodes.net/2/bg_images/wood/w12.jpg'); }
</style>

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
				Welcome ! &nbsp;
				<%=admin_name%>
			</h2>
			<br /> <br />
			<form name="admin" action="Controller" method="Post">
				<input class="form-group btn btn-default pull-right"     type="submit"
					name="signout" value="Logout">
			</form>



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
			
		

	</div>






	<footer class="text-center">
		<div class="container col-lg-12 col-md-12 col-xs-12 no-padding">
			<strong>Copyright &copy; 2017 <a>Deependra</a>.
			</strong> All rights reserved.
		</div>
	</footer>

</body>
</html>
