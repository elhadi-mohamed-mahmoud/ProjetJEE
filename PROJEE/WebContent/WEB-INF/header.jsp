<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=ISO-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Course</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="Course Project">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/bootstrap4/bootstrap.min.css">
<link href="${pageContext.request.contextPath}/plugins/fontawesome-free-5.0.1/css/fontawesome-all.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/OwlCarousel2-2.2.1/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/OwlCarousel2-2.2.1/owl.theme.default.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/plugins/OwlCarousel2-2.2.1/animate.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/main_styles.css">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/Chart.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>


<%
int idd = 0;
if (request.getParameterMap().containsKey("id")) {
	idd = Integer.parseInt(request.getParameter("id").toString());
}
%>
<script type="text/javascript">
  
  $(document).ready(function(){
	 
  $.ajax({
	
    url: "AxeRate?id=" + <%=idd%>,
    method: "GET",
    success: function(data) {
      console.log(data);
      var ecole = [];
      var score = [];

      for(var i in data) {
        ecole.push(data[i].ecole + " (" + data[i].count+")") ;
        score.push(data[i].sum / data[i].count);
      }

      var chartdata = {
        labels: ecole,
        datasets : [
          {
            label: 'La moyenne des ecoles',
            backgroundColor: 'rgba(200, 200, 200, 0.75)',
            borderColor: 'rgba(200, 200, 200, 0.75)',
            hoverBackgroundColor: 'rgba(200, 200, 200, 1)',
            hoverBorderColor: 'rgba(200, 200, 200, 1)',
            data: score
          
          }
        ]
      };


      var ctx = $("#mycanvas");

      var barGraph = new Chart(ctx, {
        type: 'bar',
        data: chartdata
      });
    },
    error: function(data) {
      console.log(data);
    }
  });
});
</script>


<style type="text/css">
      #chart-container {
        width: 60%;
        height: auto;
        margin:0 auto;
        margin-top: 50px;
        margin-bottom: 50px;
      }
    </style>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/responsive.css">
</head>
<body>

<div class="super_container">

  <!-- Header -->

  <header class="header d-flex flex-row">
    <div class="header_content d-flex flex-row align-items-center">
      <!-- Logo -->
      <div class="logo_container">
        <div class="logo">
          <img src="${pageContext.request.contextPath}/images/logo.png" alt="">
          <span>course</span>
        </div>
      </div>

      <!-- Main Navigation -->
      <nav class="main_nav_container">
        <div class="main_nav">
          <ul class="main_nav_list">
            <li class="main_nav_item"><a href="index">acceuil</a></li>
            <li class="main_nav_item"><a href="index?action=aboutus">à propos de nous</a></li>
            <li class="main_nav_item"><a href="index?action=contact">contact</a></li>
              <%
                if(request.getSession(true).getAttribute("ACTIF") != null && request.getSession(true).getAttribute("ACTIF").equals("YES")){
                  out.print("<li class=\"main_nav_item\"><a href=\"index?action=logout&id=" + request.getSession(true).getAttribute("id") + "\">se déconnecter</a></li>");
                }
                else{
                		out.print("<li class=\"main_nav_item\"><a href=\"index?action=register\">s'inscrire</a></li>");
                		out.print( "<li class=\"main_nav_item\"><a href=\"index?action=login\">se connecter</a></li>");
                }
              %>
            
          </ul>
        </div>
      </nav>
    </div>
    
  </header>
  
  <!-- Menu -->
  <div class="menu_container menu_mm">

    <!-- Menu Close Button -->
    <div class="menu_close_container">
      <div class="menu_close"></div>
    </div>

    <!-- Menu Items -->
    <div class="menu_inner menu_mm">
      <div class="menu menu_mm">
        <ul class="menu_list menu_mm">
          <li class="menu_item menu_mm"><a href="#">Home</a></li>
          <li class="menu_item menu_mm"><a href="#">About us</a></li>
          <li class="menu_item menu_mm"><a href="courses.html">Courses</a></li>
          <li class="menu_item menu_mm"><a href="elements.html">Elements</a></li>
          <li class="menu_item menu_mm"><a href="news.html">News</a></li>
          <li class="menu_item menu_mm"><a href="contact.html">Contact</a></li>
        </ul>

        <!-- Menu Social -->
        
        <div class="menu_social_container menu_mm">
          <ul class="menu_social menu_mm">
            <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-pinterest"></i></a></li>
            <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
            <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-instagram"></i></a></li>
            <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-facebook-f"></i></a></li>
            <li class="menu_social_item menu_mm"><a href="#"><i class="fab fa-twitter"></i></a></li>
          </ul>
        </div>

        <div class="menu_copyright menu_mm">Colorlib All rights reserved</div>
      </div>

    </div>

  </div>
  <!-- Home -->

  <div class="home">

    <!-- Hero Slider -->
    <div class="hero_slider_container">
      <div class="hero_slider owl-carousel">
        
        <!-- Hero Slide -->
        <div class="hero_slide">
          <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
          <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
            <div class="hero_slide_content text-center">
              <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Aidez à <span>évaluer</span> votre école</h1>
            </div>
          </div>
        </div>
        
        <!-- Hero Slide -->
        <div class="hero_slide">
          <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
          <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
            <div class="hero_slide_content text-center">
              <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Aidez à <span>évaluer</span> votre école</h1>
            </div>
          </div>
        </div>
        
        <!-- Hero Slide -->
        <div class="hero_slide">
          <div class="hero_slide_background" style="background-image:url(images/slider_background.jpg)"></div>
          <div class="hero_slide_container d-flex flex-column align-items-center justify-content-center">
            <div class="hero_slide_content text-center">
              <h1 data-animation-in="fadeInUp" data-animation-out="animate-out fadeOut">Aidez à <span>évaluer</span> votre école</h1>
            </div>
          </div>
        </div>

      </div>

      <div class="hero_slider_left hero_slider_nav trans_200"><span class="trans_200">prev</span></div>
      <div class="hero_slider_right hero_slider_nav trans_200"><span class="trans_200">next</span></div>
    </div>

  </div>



  <div class="hero_boxes">
    <div class="hero_boxes_inner">
      <div class="container">
        <div class="row">

          <div class="col-lg-4 hero_box_col">
            <div class="hero_box d-flex flex-row align-items-center justify-content-start">
              <img src="${pageContext.request.contextPath}/images/earth-globe.svg" class="svg" alt="">
              <div class="hero_box_content">
                <h2 class="hero_box_title">Evaluation par axes</h2>
                <a href="index?action=axeresults" class="hero_box_link">voir plus</a>
              </div>
            </div>
          </div>

          

          <div class="col-lg-4 hero_box_col">
            <div class="hero_box d-flex flex-row align-items-center justify-content-start">
              <img src="${pageContext.request.contextPath}/images/professor.svg" class="svg" alt="">
              <div class="hero_box_content">
                <h2 class="hero_box_title">Evaluation par ecole</h2>
                <a href="index?action=schoolresult" class="hero_box_link">voir plus</a>
              </div>
            </div>
          </div>

          <div class="col-lg-4 hero_box_col">
            <div class="hero_box d-flex flex-row align-items-center justify-content-start">
              <img src="${pageContext.request.contextPath}/images/books.svg" class="svg" alt="">
              <div class="hero_box_content">
                <h2 class="hero_box_title">Contactez-nous</h2>
                <a href="courses.html" class="hero_box_link">voir plus</a>
              </div>
            </div>
          </div>

        </div>
      </div>
    </div>
  </div>
