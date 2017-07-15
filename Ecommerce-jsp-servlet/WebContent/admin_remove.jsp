<%@page contentType="text/html" pageEncoding="UTF-8"%>
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


<title>admin_remove</title>
<style type="text/css">
body { background-image:url('http://cdn.dcodes.net/2/bg_images/wood/w12.jpg'); }
</style>


</head>
<body>



	<%
		String classifier_name = "none";
		session.setAttribute("admin_mode", "remove");
		String db_deletion_result = (String) session.getAttribute("db_deletion_result");
		//   out.println("Admin mode = " + (String) session.getAttribute("admin_mode"));
		//   out.println("db_deletion_result = " + db_deletion_result);
		if ((String) session.getAttribute("classifier_name") != null) {
			classifier_name = (String) session.getAttribute("classifier_name");
			//    out.println("Classifier name selected = " + classifier_name);
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
				
		<br /> 
		<br />
		
		
		    
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
				 <div class="col-xs-12 col-sm-12 col-lg-12 no-padding">

						<br />
						<h3>Select a product to remove</h3>
						<br />
						<%
							if (db_deletion_result != null) {
								if (db_deletion_result.equals("success")) {
						%>
						<span style="color: green"> <b> Deletion Successful!! </b>
						</span>
						<%
							}
								if (db_deletion_result.equals("failure")) {
						%>
						<span style="color: red"> <b> Deletion Failure! Please
								try again! </b>
						</span>
						<%
							}
							}
						%>
						<br /> <br />
						<div class="col-xs-12 col-sm-12 col-lg-12 no-padding">
							<div class="form-group ">
								<label class="control-label" for="">Select Item</label> <select
									name="admin_classifer_choice">
									<option value="default">default</option>
									<option value="Books">Books</option>
									<option value="Electronics">Electronics</option>
									<option value="Icecream">Ice Cream</option>
								</select>
								<div class="help-block"></div>
								<div class="form-group">
									<button type="submit" value="Delete" name="admin_category" class="dc_3d_button gray">Delete</button>

								</div>

							</div>
						</div>
				    </div>
			      </div>
				</div>
	   </form>

						<div  class="container" id="admin_mode">
						<%
							if ((String) session.getAttribute("classifier_name") != null) {
								classifier_name = (String) session.getAttribute("classifier_name");
						%>
						Catogory Selected : <span style="color: green"> <b> <%=classifier_name%>
						</b>
						</span>
						
                     <form name="admin" action="Controller" method="post">
               
						      <label> Product ID </label>
                              <input type="radio" name="admin_radio_delete" value="id" required/><br /> 
                             
                              <label>Product Name </label>
                              <input  type="radio" name="admin_radio_delete" value="name" required/><br/>
							
						      <label>Id/Name </label>
                              <input type="text" name="admin_id_or_name" required /><br/>
                             <button type="submit" value="Delete" class="dc_3d_button gray" name="admin_db_delete">Delete</button><br />
						
					 </form>
						<%
							}
						%>
					</div>
				</div>
			
	

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