<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
   	<meta name="viewport" content="width=device-width, initial-scale=1.0">
   	<link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<title>Already Received</title>
</head>
<body>
	<%@include file="navbar.jsp" %>
		<div class="container">
	    	<div class="col-md-6 col-lg-5 mx-auto" style="max-width: 500px; margin-top: 40px;">
	        	<h1 class="text-center">Search Receiver Already Received</h1>
	        	<form action="CheckReceiver" method="POST">
	        		<div class="form-group">
	                	<label for="cnic">Cnic:</label>
	                	<input type="text" class="form-control" id="cnic" placeholder="Enter Cnic" name="cnic" required>
	            	</div>
	            	<div class="form-group">
	                	<label for="name">Name:</label>
	                	<input type="text" class="form-control" id="name" placeholder="Enter name" name="name">
	            	</div>
		            <div class="form-group">
		                <label for="blood_group">BloodType</label>
		                <select class="form-control" id="blood_group" name="bloodtype">
		                    <option value="a+">A+</option>
		                    <option value="a-">A-</option>
		                    <option value="b+">B+</option>
		                    <option value="b-">B-</option>
		                    <option value="o+">O+</option>
		                    <option value="o-">O-</option>
		                    <option value="ab+">AB+</option>
		                    <option value="ab-">AB-</option>
		                </select>
		            </div>
		            <div class="form-group">
	                	<label for="unitswant">Units Want To Receive Again:</label>
	                	<input type="text" class="form-control" id="unitswant" placeholder="Enter Units" name="units" required>
	            	</div>
	           
	            	<button type="submit" class="btn btn-primary btn-block">Submit</button>
	        	</form>
	    	</div>
		</div>
	
	<%@include file="footer.jsp" %>
			<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
				<% 
				    Boolean success = (Boolean) request.getAttribute("success");
				    String message = (String) request.getAttribute("message");
				    if (success != null && !success) { 
				%>
					<script>
					    swal({
					        title: "Error!",
					        text: "<%= message %>",
					        icon: "error",
					        button: "Check Now",
					    }).then(() => {
					        window.location.href = "Receive.jsp";
					    });
					</script>
				<% } %>
</body>
</html>