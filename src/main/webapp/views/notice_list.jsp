<%@page import="bean.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>NOTICE</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/assets/css/app.css">
<link rel="shortcut icon" href="${pageContext.request.contextPath}/views/assets/images/favicon.svg" ype="image/x-icon">
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
<jsp:useBean id="noticeDAO" class="bean.NoticeDAO" ></jsp:useBean>
<%
	ArrayList<NoticeDTO> list1 = (ArrayList)noticeDAO.getSNoticeList();
	ArrayList<NoticeDTO> list2 = (ArrayList)noticeDAO.getGNoticeList();
	
	int totalRecord = 0; 	//총 글의 개수
	int numPerPage = 5; 	//한 페이지 당 보여질 글의 개수
	int totalPage = 0; 		//총 페이지 수
	int nowPage = 0; 		//현재 페이지
	int beginPerPage = 0; 	//페이지별 시작번호
	int pagePerBlock = 3;	//블럭 당 페이지 수
	int totalBlock = 0; 	//총 블럭 수
	int nowBlock = 0;		//현재 블럭
	
	String keyField = request.getParameter("keyField");
	String keyWord = request.getParameter("keyWord");
	
	totalRecord = list2.size();
	totalPage = (totalRecord + numPerPage - 1) / numPerPage;
	
	if(request.getParameter("nowPage") != null )
	nowPage = Integer.parseInt(request.getParameter("nowPage"));
	
	beginPerPage = nowPage*numPerPage;
	totalBlock = (totalPage + pagePerBlock - 1)/pagePerBlock;
	
	if(request.getParameter("nowBlock") != null )
	nowBlock = Integer.parseInt(request.getParameter("nowBlock"));
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
	
	                <li class="sidebar-item ">
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
	                
	                <li class="sidebar-item active has-sub">
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
				<a href="#" class="burger-btn d-block d-xl-none"> <i
					class="bi bi-justify fs-3"></i>
				</a>
			</header>

			<div class="page-heading">
				<div class="page-title">
					<div class="row">
                        <div class="col-lg-3 col-md-12">
                            <h3>NOTICE</h3>
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
				<div class = "row form-group">
						<form method="post" action="#" id="" class="col-4 d-flex">
							<input type="text" class="form-control" placeholder="공지글 조회">
							<input type="button" class="btn btn-outline-success"  value="조회">
						</form>
						<form class="col-8 d-flex" ></form>
				</div>
				<section class="section">
					<div class="col-12 d-flex justify-content-center align-items-center"></div>
					<div class="row" id="table-hover-row">
						<div class="col-12">
							<div class="card">
								<div class="card-content">
									<div class="table-responsive">
										<table class="table table-hover mb-0" id="table">
											<thead>
												<tr>
													<th style="width: 10%" class="text-center ">번호</th>
													<th style="width: 50%" class="text-center ">제목</th>
													<th style="width: 10%" class="text-center ">작성자</th>
													<th style="width: 30%" class="text-center ">작성일</th>
												</tr>
											</thead>
											<tbody>
												<%
													for (NoticeDTO board : list1) {
												%>

														<tr>
															<td style="width: 10%" class="text-center text-bold-500"><i class="bi bi-pin-angle-fill"></i></td>
															<td style="width: 50%" class="text-center text-bold-500"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-chat-square-heart-fill" viewBox="0 0 16 16"><path d="M2 0a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h2.5a1 1 0 0 1 .8.4l1.9 2.533a1 1 0 0 0 1.6 0l1.9-2.533a1 1 0 0 1 .8-.4H14a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2zm6 3.993c1.664-1.711 5.825 1.283 0 5.132-5.825-3.85-1.664-6.843 0-5.132"/></svg> <a href="notice_read.jsp?notice_no=<%=board.getNotice_no()  %>"><%=board.getNotice_title()%></a></td>
															<td style="width: 10%" class="text-center text-bold-500">admin</td>
															<td style="width: 30%" class="text-center text-bold-500"><%=board.getNotice_reg()%></td>
														</tr>
												<%
													}
														for(int i = beginPerPage; i < beginPerPage + numPerPage; i++){ 
														if(i==totalRecord) break;
														NoticeDTO board = list2.get(i);
												%>

														<tr>
															<td style="width: 10%" class="text-center text-bold-500"><%=board.getNotice_no()%></td>
															<td style="width: 50%" class="text-center text-bold-500"><a href="notice_read.jsp?notice_no=<%=board.getNotice_no() %>"><%=board.getNotice_title()%></a></td>
															<td style="width: 10%" class="text-center text-bold-500">admin</td>
															<td style="width: 30%" class="text-center text-bold-500"><%=board.getNotice_reg()%></td>
														</tr>
												<%
													}
												%>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-12 d-flex justify-content-center align-items-center">
  
							<ul class="pagination pagination-primary">
								<%
									if(0 == nowBlock ){
								%>
									<li class="page-item disabled">
										<a class="page-link" href="#">
											<span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
										</a>
									</li>
								<%
									}else {
								%>
									<li class="page-item">
										<a class="page-link" href="notice_list.jsp?nowPage=<%=(nowBlock-1)*pagePerBlock%>&nowBlock=<%=nowBlock - 1 %>">
											<span aria-hidden="true"><i class="bi bi-chevron-left"></i></span>
										</a>
									</li>
								<%
									}
									if(nowBlock != totalBlock-1){
										for(int i=0; i < pagePerBlock; i++){
								%>
											<li class="page-item <%= (i == nowPage % pagePerBlock) ? "active" : "" %>">
												<a class="page-link" href="notice_list.jsp?nowPage=<%=nowBlock*pagePerBlock + i%>&nowBlock=<%=nowBlock %>" ><%=(nowBlock*pagePerBlock + i + 1) %></a>
											</li>
								<%	
										}
									}else{
										if(totalPage%pagePerBlock !=0 ){
											for(int i=0; i < totalPage%pagePerBlock; i++){
												%>
															<li class="page-item <%= (i == nowPage % pagePerBlock) ? "active" : "" %>">
																<a class="page-link" href="notice_list.jsp?nowPage=<%=nowBlock*pagePerBlock + i%>&nowBlock=<%=nowBlock %>" ><%=(nowBlock*pagePerBlock + i + 1) %></a>
															</li>
												<%
											}
										}else{
											for(int i=0; i < pagePerBlock; i++){
												%>
													<li class="page-item <%= (i == nowPage % pagePerBlock) ? "active" : "" %>">
														<a class="page-link" href="notice_list.jsp?nowPage=<%=nowBlock*pagePerBlock + i%>&nowBlock=<%=nowBlock %>" ><%=(nowBlock*pagePerBlock + i + 1) %></a>
													</li>
												<%	
											
											}
										}
									}
									if(nowBlock == totalBlock-1){
								%>
									<li class="page-item disabled">
										<a class="page-link" href="#">
											<span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
										</a>
									</li>
								<%
									} else{
								%>
									<li class="page-item">
										<a class="page-link" href="notice_list.jsp?nowPage=<%=(nowBlock + 1)*pagePerBlock%>&nowBlock=<%=nowBlock + 1 %>">
											<span aria-hidden="true"><i class="bi bi-chevron-right"></i></span>
										</a>
									</li>
								<%
									}
								%>
							</ul>
						</div>
				</section>
				<footer>
					<div class="footer clearfix mb-0 text-muted">
						<div class="float-start">
							<p>2024 &copy; ACORN</p>
						</div>
						<div class="float-end">
							<p>
								<span class="text-danger"><i class="bi bi-heart"></i></span>
								by <a href="#">거니네조</a>
							</p>
						</div>
					</div>
				</footer>
			</div>
		</div>
	</div>
<script	src="${pageContext.request.contextPath}/views/assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath}/views/assets/js/main.js"></script>
</body>

</html>