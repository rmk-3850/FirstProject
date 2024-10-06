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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/calendar.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200">
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/bootstrap.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/vendors/iconly/bold.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/vendors/bootstrap-icons/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/app.css">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/views/assets/images/favicon.svg" type="image/x-icon">

	<style>
		a {
		    color: inherit;  /* 부모 요소의 텍스트 색상을 따르도록 설정 */
		    text-decoration: none;  /* 밑줄 없애기 */
		}		
		a:visited {
		    color: inherit;
		}		
		a:hover {
		    color: inherit;
		}		
		a:active {
		    color: inherit;
		}
		td {
			white-space: nowrap; /* 텍스트 줄바꿈 방지 */
			overflow: hidden; /* 넘치는 텍스트 숨기기 */
			text-overflow: ellipsis; /* 넘치는 부분 '...'으로 표시 */
			font-size: small;
		}		
		.bi-plus-square {
			display: inline-block;
			transform: translateY(2px);
		}
		.bi-person-fill{
			display: inline-block;
			transform: translateY(6px);
			margin-right: 5px;
		}
		.bi-bell-fill{
			display: inline-block;
			transform: translateY(3px);
			margin-right: 5px;
		}
		.bi-box-arrow-right{
			display: inline-block;
			transform: translateY(3px);
		}
		.list-group-item.detail{
			font-size: small;
			white-space: nowrap; /* 텍스트 줄바꿈 방지 */
			overflow: hidden; /* 넘치는 텍스트 숨기기 */
			text-overflow: ellipsis; /* 넘치는 부분 '...'으로 표시 */
		}
	</style>
</head>

<body>
    <jsp:useBean id="dashDAO" class="bean.DashboardDAO"></jsp:useBean>
    <%
		ArrayList<DashboardDTO> list0 = (ArrayList<DashboardDTO>) dashDAO.getNotice();		
		ArrayList<DashboardDTO> list1 = (ArrayList<DashboardDTO>) dashDAO.getProduct();

    %>

    <div id="app">
        <div id="sidebar" class="active">
            <div class="sidebar-wrapper active">
                <div class="sidebar-header">
                    <div class="d-flex justify-content-between">
                        <div class="logo">
                            <a href="#">LOGO</a>
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
                            <a href="/FirstProject/Controller?command=DASHBOARD" class='sidebar-link'>
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
                                    <a href="/FirstProject/Controller?command=CUSTOMER">회원 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=CUSTOMER">기타</a>
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
                                    <a href="/FirstProject/Controller?command=RESERVATION">예약 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=RESERVATION">기타</a>
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
                                    <a href="/FirstProject/Controller?command=SERVICE">서비스 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=SERVICE">기타</a>
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
                                    <a href="/FirstProject/Controller?command=PRODUCT">상품 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=PRODUCT">기타</a>
                                </li>
                             </ul>
                        </li>
                        
                         <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                            	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person-fill-gear" viewBox="0 0 16 16"><path d="M11 5a3 3 0 1 1-6 0 3 3 0 0 1 6 0m-9 8c0 1 1 1 1 1h5.256A4.5 4.5 0 0 1 8 12.5a4.5 4.5 0 0 1 1.544-3.393Q8.844 9.002 8 9c-5 0-6 3-6 4m9.886-3.54c.18-.613 1.048-.613 1.229 0l.043.148a.64.64 0 0 0 .921.382l.136-.074c.561-.306 1.175.308.87.869l-.075.136a.64.64 0 0 0 .382.92l.149.045c.612.18.612 1.048 0 1.229l-.15.043a.64.64 0 0 0-.38.921l.074.136c.305.561-.309 1.175-.87.87l-.136-.075a.64.64 0 0 0-.92.382l-.045.149c-.18.612-1.048.612-1.229 0l-.043-.15a.64.64 0 0 0-.921-.38l-.136.074c-.561.305-1.175-.309-.87-.87l.075-.136a.64.64 0 0 0-.382-.92l-.148-.045c-.613-.18-.613-1.048 0-1.229l.148-.043a.64.64 0 0 0 .382-.921l-.074-.136c-.306-.561.308-1.175.869-.87l.136.075a.64.64 0 0 0 .92-.382zM14 12.5a1.5 1.5 0 1 0-3 0 1.5 1.5 0 0 0 3 0"/></svg>                               
                                <span>MEMBER</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=MEMBER">직원 관리</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=MEMBER">기타</a>
                                </li>
                            </ul>
                        </li>
                        
                        <li class="sidebar-item  has-sub">
                            <a href="#" class='sidebar-link'>
                                <i class="bi bi-megaphone-fill"></i>
                                <span>NOTICE</span>
                            </a>
                            <ul class="submenu ">
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=NOTICE">공지 사항</a>
                                </li>
                                <li class="submenu-item ">
                                    <a href="/FirstProject/Controller?command=NOTICE">기타</a>
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
                        <div class="col-lg-3 col-md-12">
                            <h3>DASH BOARD</h3>
                        </div>
                        <div class="col-lg-6 "></div>
                        
                        <div class="col-lg-3 col-md-12 d-flex justify-content-end align-items-end">
                            <nav aria-label="breadcrumb" class="breadcrumb-header float-start float-lg-end">
                                <ol class="breadcrumb">
                                    <li>
                                    <i class="bi bi-person-fill" style="font-size:x-large;" ></i>
                       	 			<i class="bi bi-bell-fill" style="font-size:larger; line-height: 10px;" ></i>
                        			<a href="/FirstProject/Controller?command=LOGIN"><span class="badges badge bg-light-danger">로그아웃</span>&nbsp;<i class="bi bi-box-arrow-right " ></i></a>
                        			</li>
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
										href="/FirstProject/Controller?command=NOTICE""notice_list.jsp"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" /><path	d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /></svg></a></li>
	                               	<%
										for(int i=0; i<list0.size(); i++){											
											DashboardDTO board0 = list0.get(i);
									%>
										<li class="list-group-item text-bold-500 detail">
											<a  href="notice_view.jsp"> <%=board0.getNotice_title()%></a>
										</li>
									<%
										}
									%>                                         
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
										href="/FirstProject/Controller?command=PRODUCT"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" /><path	d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /></svg></a></li>
	                            </ul>
								<table class="table table-bordered mb-0">


								</table>
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
										href="/FirstProject/Controller?command=RESERVATION"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-square" viewBox="0 0 16 16"><path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" /><path	d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4" /></svg></a></li>
	                            </ul>                                        
              					<table class="table table-bordered mb-0">
              					<%--
									<%
										for(int i = beginPerPage2; i < beginPerPage2 + numPerPage; i++){
											if(i==totalRecord2) break;
											DashboardDTO board2 = list2.get(i);
									%>
										<tr>
											<td class="text-bold-500"><%=board2.getReservation_time()%></td>
											<td class="text-bold-500"><%=board2.getService_name()%></td>
										</tr>
									<%
										}
									%>
										<tr>
											<td align="center" colspan="2" class="calendar-wrapper">
												<a href="dashboard.jsp?nowPage1=<%=nowPage1%>&nowPage2=<%=nowPage2 - 1%>"><span id="prev" class="icons material-symbols-rounded" style="display: inline-block; transform: translateY(3px);">chevron_left</span></a>
											<%												
												for(int i=0; i < totalPage2; i++){
											%>
												<i class="bi bi-dot"></i>
											<%
												}
											%>
												<a href="dashboard.jsp?nowPage1=<%=nowPage1%>&nowPage2=<%=nowPage2 + 1%>"><span id="next" class="icons material-symbols-rounded " style="display: inline-block; transform: translateY(3px);">chevron_right</span></a>

											</td>
										</tr>
										 --%>
								</table>
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
    </div>
<script src="${pageContext.request.contextPath}/views/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/vendors/apexcharts/apexcharts.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/js/pages/ui-apexchart.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/js/main.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/js/calendar.js" defer></script>
</body>

</html>