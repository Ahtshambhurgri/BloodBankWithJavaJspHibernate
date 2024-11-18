<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="java.util.List" %>
<%@page import="org.hibernate.query.SelectionQuery" %>
<%@page import="com.HibernateHelper.HibernateUtil" %>
<%@page import="com.Entity.BloodAvailability" %>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make a Blood Relation</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<style>
      /* Make the table responsive */
      @media only screen and (max-width: 300px) {
        table,
        thead,
        tbody,
        th,
        td {
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
        td:nth-of-type(1):before {
          content: "Column 1";
        }
        .ba td:nth-of-type(2):before {
          content: "Column 2";
        }
        .ba td:nth-of-type(3):before {
          content: "Column 3";
        }
      }

      /* Add some padding and a blue border */
      table {
        border-collapse: collapse;
        width: 80%;
        padding: 5px;
        margin-bottom: 15px;
        border: 1px solid rgb(121, 203, 245);
        display: table;
        margin-left: 10%;
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
      <div class="col-md-6 col-lg-5 mx-auto" style="max-width: 500px; margin-top: 40px;">
      	<table>
      		<thead>
      			<tr>
      				<th>Blood Type</th>
      				<th>Available Units</th>
      			</tr>
      		</thead>
      		<tbody>
      		
      		
		      		
		      	<%
		      		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		      		Session ses = sessionFactory.openSession();
		      		
		      		try{ 
		      			SelectionQuery<BloodAvailability> selectionquery = ses.createSelectionQuery("from BloodAvailability", BloodAvailability.class);
		      			List<BloodAvailability> lt = selectionquery.list();
		      			for(BloodAvailability st:lt){
		      	%>			<tr>
		      					<td><%=st.getBloodtype() %></td>
		      					<td><%=st.getUnits() %></td>
		      				</tr>
		      	<%		}
		      			
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
    </div>
    
    <%@include file="footer.jsp" %>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    	<% 
		    Boolean success = (Boolean) request.getAttribute("success");
		    String message = (String) request.getAttribute("message");
		    if (success != null && success) { 
		%>
				<script>
				    swal({
				        title: "Success!",
				        text: "<%= message %>",
				        icon: "success",
				        button: "OK",
				    }).then(() => {
				        window.location.href = "BloodAvailability.jsp";
				    });
				</script>
		<% } %>
  </body>
</html>
