<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Donor</title>
        
        <link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        
        <style>
        <style>
            body {
                background-image: url('');
                background-repeat:no-repeat;
                background-size: cover;
            }
            .footer {
                position:relative;
                left: 0;
                bottom: 0;
                width: 100%;
                background-color: #f8f9fa;
                color: black;
            }
            .card {
                 margin: 0 auto;
                 float: none;
             }
             

             body {
            background-color: #f8f9fa;
        }
        .container {
            margin-top: 30px;
            margin-left: 10%;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        label {
            font-weight: bold;
        }
        button {
            width: 100%;
            margin-top: 15px;
        }

        /* Make the table responsive */
        @media only screen and (max-width: 300px) {
        table, thead, tbody, th, td {
            display: block;
        }

        /* Hide table headers (but not display: none;, for accessibility) */
        thead tr {
            position: absolute;
            top: -9999px;
            left: -9999px;
        }

        tr {
            border: 1px solid #ccc;
        }

        td {
            /* Behave like a "row" */
            border: none;
            border-bottom: 1px solid #eee;
            position: relative;
            padding-left: 50%;
        }

        td:before {
            /* Now like a table header */
            position: absolute;
            /* Top/left values mimic padding */
            top: 6px;
            left: 6px;
            width: 45%;
            padding-right: 10px;
            white-space: nowrap;
        }

        /*
        Label the data
        */
        td:nth-of-type(1):before { content: "Column 1"; }
        td:nth-of-type(2):before { content: "Column 2"; }
        td:nth-of-type(3):before { content: "Column 3"; }
        }

        /* Add some padding and a blue border */
        table {
        border-collapse: collapse;
        width: 100%;
        padding: 5px;
        border: 1px solid rgb(121, 203, 245);
        display: table;
        margin-left: 0%;
        }

        /* Add some padding and a blue border to the table headers */
        th {
        border: 1px solid rgb(121, 203, 245);
        padding: 10px;
        background-color: #f2f2f2;
        }

        /* Add some padding to the table cells */
        td {
        border: 1px solid rgb(121, 203, 245);
        padding: 10px;
        }

        </style>
        
    </head>
    <body>
        <%@include file="navbar.jsp" %>
        <div class="container">
    <h2 style="margin-top: 30px;">You Can/Can't Donate Blood</h2>

    <table>
    <thead>
        <tr>
        <th>CAN</th>
        <th>CAN'T</th>
        </tr>
    </thead>
    <tbody>
        <tr>
        <td>1.If You are Fit and Healthy</td>
        <td>1.If you have a cold,Sore throat or Flu</td>
        </tr>
        <tr>
            <td>2.Age 18-70</td>
            <td>2.If you have Chronic Infrctious Disease</td>
        </tr>
        <tr>
            <td>3.Weight more than 45kgs</td>
            <td>3.You are taking Antibiotics</td>
        </tr>
        <tr>
            <td>4.If YOu've had no Operation in six months</td>
            <td>4.If You had recent Surgery</td>
        </tr>
        <tr>
            <td>5.Even if you have Cholesterol</td>
            <td>5.You are Pregnant Or Breastfeeding</td>
        </tr>
        <tr>
            <td>6.Even if you take blood pressure medication and your pressure is stable</td>
            <td>6.You've Had an Extended Stay in Certain Countries</td>
        </tr>
    
    </tbody>
    </table>
    </div>
    <!-- Form -->
    <div class="container">
        <h2>Blood Donor Form</h2>
        <a style="float : right" href="checkifalreadydonated.jsp">Already Donated?</a>
        <form id="donorform"  action="Donor"  method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" class="form-control" id="name" placeholder="Enter name" name="name" required>
            </div>
            <div class="form-group">
                <label for="email">CNIC:</label>
                <input type="text" class="form-control" id="email" placeholder="Enter Cnic" name="cnic">
            </div>
            <div class="form-group">
                <label for="contact">Contact:</label>
                <input type="text" class="form-control" id="contact" placeholder="Enter contact" name="contact">
            </div>
            <div class="form-group">
                <label for="unitdonate">Units Donated:</label>
                <input type="number" class="form-control" id="unitdonate" placeholder="Enter units donated" name="unitsdonated" required>
            </div>
            <div class="form-group">
                <label for="dob">Date of Birth :</label>
                <input type="date" class="form-control" id="dob" name="dob">
            </div>
            <div class="form-group">
                <label for="gender">Gender:</label>
                <select class="form-control" id="gender" name="gender">
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                   
                </select>
            </div>
            <div class="form-group">
                <label for="blood_group">Blood Group:</label>
                <select class="form-control" id="blood_group" name="blood_group">
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
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

        <%@include file="footer.jsp" %>
         <!-- SweetAlert Script -->
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
				        button: "Try Again",
				    });
				</script>
			<% } %>

               
             
		
    </body>
</html>
