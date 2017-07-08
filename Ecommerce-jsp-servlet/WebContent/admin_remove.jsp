<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>admin_remove</title>
<!-- Bootstrap -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




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


	   <div class="container text-center">
		<h2>Welcome Admin!!</h2>
		
		<br /> 
		<br />
		<form name="admin" action="Controller" method="post">
			<div class="logmeout">
				<input type="submit" name="signout" class="form-group btn btn-default pull-right" value="Logout">
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
									<button type="submit" value="Delete" name="admin_category" class="btn btn-default">Delete</button>

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
                             <button type="submit" value="Delete" class="btn btn-default" name="admin_db_delete">Delete</button><br />
						
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