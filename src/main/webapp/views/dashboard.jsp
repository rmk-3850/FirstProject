<%@page import="bean.*"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>DashBoard</title>
    <link rel="stylesheet" href="assets/css/calendar.css">
     <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">    
    <link rel="stylesheet" href="assets/css/bootstrap.css">
    <link rel="stylesheet" href="assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
</head>

<body>
    <jsp:useBean id="prodDAO" class="bean.ProductDAO"></jsp:useBean>
    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="#"><!-- <img src="assets/images/logo/logo.png" alt="Logo" srcset="">-->LOGO</a>
                        </div>
                        <div class="toggler">
                            <a href="#" class="sidebar-hide d-xl-none d-block"><i class="bi bi-x bi-middle"></i></a>
                        </div>
                    </div>
                </div>
                <div class="sidebar-menu">
                    <ul class="menu">
                        <li class="sidebar-title">Menu</li>

                        <li class="sidebar-item active ">
                            <a href="dashboard.jsp" class='sidebar-link'>
                                <i class="bi bi-grid-fill"></i>
                                <span>HOME</span>
                            </a>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-stack"></i>
                                <span>CUSTOMER</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="customer.jsp">회원 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="customer.jsp">기타</a>
                                </li>                                
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-collection-fill"></i>
                                <span>RESERVATION</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="reservation.jsp">예약 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="reservation.jsp">기타</a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-grid-1x2-fill"></i>
                                <span>SERVICE</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="service.jsp">서비스 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="service.jsp">기타</a>
                                </li>
                            </ul>
                        </li>

                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-hexagon-fill"></i>
                                <span>PRODUCT</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="product.jsp">상품 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="product.jsp">기타</a>
                                </li>
                             </ul>
                        </li>
 
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-pen-fill"></i>
                                <span>NOTICE</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="notice_list.jsp">공지 사항</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="notice_list.jsp">기타</a>
                                </li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <button class="sidebar-toggler btn x"><i data-feather="x"></i></button>
            </div>
        </div>
        <div id="main">
            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            <div class="page-heading">
                <div class="page-title">
                    <div class="row">
                        <div class="col-12 col-md-6 order-md-1 order-last">
                            <h3>DASH BOARD</h3>
                        </div>
                        <div class="col-12 col-md-6 order-md-2 order-first">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-item"><a href="login.jsp">로그아웃</a></li>
                                </ol>
                            </nav>
                        </div>
                    </div>
                </div>
                <hr style="height: 5px;">
                <section id="basic-list-group">
                    <div class="row match-height">
                        <div class="col-lg-3 col-md-12">                            
	                        <div class="card">
	                            <ul class="list-group">
	                                <li class="list-group-item active text-center">공지&nbsp;<a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0); color:white;"
										href="notice_list.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" /><path	d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /></svg></a></li>
	                                <li class="list-group-item">시스템 사용법</li>
	                                <li class="list-group-item">업데이트 안내</li>
	                                <li class="list-group-item">사용법</li>
	                                <li class="list-group-item">공지 오류해결</li>                                            
	                            </ul>
	                        </div>
                        </div>
                        <div class="col-lg-9 col-md-12">
                            <div class="card">
									<div id="line"></div>
							</div>
                        </div>
                        
                    </div>
                </section>
                <section class="list-group-button-badge">
                	<div class="row match-height">
                        <div class="col-lg-3 col-md-12">
                   	        <div class="card">
	                            <ul class="list-group">
	                                <li class="list-group-item active text-center">재고수량&nbsp;<a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0); color:white;"
										href="product.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" /><path	d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /></svg></a></li>
									<%
									request.setCharacterEncoding("utf-8");
									ArrayList<ProductDTO> list = (ArrayList) prodDAO.getProductToDashBoard();
									for (ProductDTO board : list) {
									%>
									<li class="list-group-item">
										<%=board.getPd_name()%> : <%=board.getPd_ea()%>개
									</li>
									<%
									}
									%>                                       
	                            </ul>
	                        </div>	                        
                        </div>
                        <div class="col-lg-6 col-md-12 d-flex justify-content-center align-items-center">                          
							
								<div class="calendar-wrapper">
									<header>
										<p class="current-date"></p>
										<div class="icons">
											<span id="prev" class="material-symbols-rounded">chevron_left</span>
											<span id="next" class="material-symbols-rounded">chevron_right</span>
										</div>
									</header>
									<div class="calendar">
										<ul class="weeks">
											<li>Sun</li>
											<li>Mon</li>
											<li>Tue</li>
											<li>Wed</li>
											<li>Thu</li>
											<li>Fri</li>
											<li>Sat</li>
										</ul>
									<ul class="days"></ul>
									</div>
								</div>
							
                        </div>
                        <jsp:useBean id="ld" class="bean.DateDTO" scope="page"></jsp:useBean>
                        <div class="col-lg-3 col-md-12">                            
	                        <div class="card">
	                            <ul class="list-group">
	                                <li class="list-group-item active text-center"><jsp:getProperty property="month" name="ld"/>월 <jsp:getProperty property="day" name="ld"/>일 예약현황&nbsp;<a class="icon-link icon-link-hover" style="--bs-icon-link-transform: translate3d(0, -.125rem, 0); color:white;"
										href="reservation.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" /><path	d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /></svg></a></li>
	                                <li class="list-group-item">시스템 사용법</li>
	                                <li class="list-group-item">업데이트 안내</li>
	                                <li class="list-group-item">사용법</li>
	                                <li class="list-group-item">공지 오류해결</li>                                            
	                            </ul>
	                        </div>
                        </div>
                	</div>
                        
                </section>
            <footer>
                <div class="footer clearfix mb-0 text-muted">
                    <div class="float-start">
                        <p>2024 &copy; ACORN</p>
                    </div>
                    <div class="float-end">
                        <p><span class="text-danger"><i class="bi bi-heart"></i></span> by <a
                                href="#">거니네조</a>
                        </p>                                
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <script src="assets/js/bootstrap.bundle.min.js"></script>
    <script src="assets/vendors/apexcharts/apexcharts.js"></script>
    <script src="assets/js/pages/dashboard.js"></script>
    <script src="assets/js/pages/ui-apexchart.js"></script>    
    <script src="assets/js/main.js"></script>
    <script src="assets/js/calendar.js" defer></script>
</body>

</html>