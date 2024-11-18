
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="org.hibernate.SessionFactory" %>
<%@page import="org.hibernate.Session" %>
<%@page import="java.util.List" %>
<%@page import="com.Entity.DonorEntity" %>
<%@page import="com.HibernateHelper.HibernateUtil" %>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <title>Blood Bank</title>
  
   <link rel="stylesheet" href="css/styles.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
   <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<style>
		/*  .carousel-image {
		    height: 600px; /* Adjust to the desired height 
		   /*  object-fit: cover ; /* Prevents distortion while maintaining proportion 
		}*/
	</style>
</head>
<body>
   <%@include file="navbar.jsp" %>
   <div class="container" style="margin-top: 50px; margin-bottom: 50px;">
       <h1>Welcome to Blood Bank</h1>
       <p>We are a leading organization that deals with blood transfusion, and in case of any emergency, our organization will provide you with the necessary assistance. If you want to help someone by donating blood, please feel free to visit us. </p>
   </div>
   <hr>
   <!-- Carousel -->
  <div id="myCarousel" class="carousel slide" data-ride="carousel">
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner">
        <div class="carousel-item active" data-interval="3000">
            <img src="https://cdn.pixabay.com/photo/2018/01/17/04/13/blood-donation-3087392_1280.jpg" class="d-block w-100" alt="Blood Donation Camp 1" style="height: 450px;">
        </div>
        <div class="carousel-item" data-interval="3000">
            <img src="https://cdn.pixabay.com/photo/2022/05/25/02/42/world-blood-donor-day-7219630_1280.png" class="d-block w-100" alt="Blood Donation Camp 2" style="height: 450px;">
        </div>
        <div class="carousel-item" data-interval="3000">
            <img src="https://cdn.pixabay.com/photo/2019/06/27/04/35/organ-donation-4301527_1280.jpg" class="d-block w-100" alt="Blood Donation Camp 3" style="height: 450px;">
        </div>
    </div>
    <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
</div>

	<div style="margin-top: 20px" class="container">
		<h1>What is Blood Donation?</h1>
		<p>Blood donation is a means to save lives, It is a help for the survival of others. Blood donation is a process in which blood is collected from a volunteer, tested, and stored for usage. There are tons of blood donation sites, societies, and organizations in Pakistan that collect blood from volunteers 
			and also provide blood to people in case of need.
		</p>
		<h1>Why Blood Donation is Needed?</h1>
		<p>Blood is needed every single minute for various purposes including:</p>
		<ul>
			<li>To fulfill the requirement of blood loss because of a disease or accident.</li>
			<li>For surgeries</li>
			<li>For patients suffering from Anemia</li>
			<li>For a mother, while giving birth to a child</li>
			<li>For individuals suffering from ailments like Hemophilia and Thalassaemia</li>
		</ul>
		<p>Each year, over 10,000 people die in Pakistan due to the non-availability of blood at the required time. To resolve this problem, a large number of organizations have been established that collect blood from random donors and provide it to people in hospitals in their time of need.</p>
	</div>
	

   <!--Cards-->
<hr>
<div class="container">
        <h3 class="text-center">Story of Drop of Blood</h3>
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="embed-responsive embed-responsive-16by9">
                <iframe class="embed-responsive-item" src="video/video.mp4" ></iframe>
            </div>
        </div>
    </div>
</div>
<br> &nbsp; &nbsp;

<footer>
    <div class="footer-content">
        <div class="footer-section">
            <h2>About</h2>
            <p><a href="About.html">Information about the website.</a></p>
        </div>
        <div class="footer-section">
            <h2>Address</h2>
            <p>Pakistan</p>
            <p>Sindh, Badin, Village Raees Nabi Bux Bhurgri</p>
        </div>
        <div class="footer-section">
            <h2>Contact</h2>
            <p>Email:bhurgriahtsham@gmail.com</p>
            <p>Phone:03XXXXXXXX</p>
        </div>
        <div class="footer-section">
            <h2>Social Media</h2>
            <ul>
                <li><a href="#">Facebook: XXXXX</a></li>
                <li><a href="#">Twitter: XXXXX</a></li>
                <li><a href="#">Instagram:XXXXXX</a></li>
                <li><a href="#">LinkedIn:Ahtsham Bhurgri</a></li>
            </ul>
        </div>
    </div>
    <div class="copywrites">
        <p>© 2023 Make A Blood Relation. All rights reserved.</p>
    </div>
</footer>

</body>
</html>