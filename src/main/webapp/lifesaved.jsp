<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="org.hibernate.query.SelectionQuery" %>
<%@page import="com.Entity.Receiver" %>
<%@page import="java.util.List" %>
<%@page import="com.HibernateHelper.HibernateUtil" %>
<!DOCTYPE html>
<html>
<head>
 		<meta charset="UTF-8">
   		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>Life Saved</title>
		<link rel="stylesheet" href="css/styles.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<style>
           
        .container {
            margin-top: 100px;
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

        /* Table Styles */

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
        width: 70%;
        padding: 5px;
        border: 1px solid rgb(121, 203, 245);
        display: table;
        margin-left: 15%;
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
		<h1 class="text-center">Life Saved</h1>
		<table>
	
			<thead>
		        <tr>
		        	<th>Serial No</th>
			        <th>Names</th>
			        <th>Blood Group</th>
			        <th>Units Received</th>
		        </tr>
		    </thead>
		    <tbody>
		    	<%	
		    		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		    		Session ses = sessionFactory.openSession();
		    		try{
		    			SelectionQuery<Receiver> de = ses.createSelectionQuery("from Receiver",Receiver.class);
		        		List<Receiver> lt = de.list();
		        		int i = 1;
		        		for(Receiver receive : lt){
		        			
		    	%>
		    			
				        <tr>
				        	<td><%= i %></td>
				            <td><%= receive.getName() %></td>
				            <td><%= receive.getBloodgroup() %></td>
				            <td><%= receive.getUnitsreceived() %></td>
				        </tr>
		        <%
		    				i++;
		        		}
		    		}catch(Exception e){
		    			e.printStackTrace();
		    		} 	
		    		finally{
		    			ses.close();
		    		}
		        %>
		    </tbody>
    </table>
	
	
	
	
	</div>
	
	
	
	<%@include file="footer.jsp" %>
	
	
	
</body>
</html>