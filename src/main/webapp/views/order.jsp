<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">
<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/vendors/perfect-scrollbar/perfect-scrollbar.css">
<link rel="stylesheet" href="assets/vendors/bootstrap-icons/bootstrap-icons.css">
<link rel="stylesheet" href="assets/css/app.css">
<link rel="shortcut icon" href="assets/images/favicon.svg" type="image/x-icon">
<style>
		button {
            background-color: rgb(42, 105, 241);
            color: white;
            border: none;
            border-radius: 5px;
            height: 25px;
            width: 50px;
            cursor: pointer;
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
		.btn-order{
			width: 3em;
			height: 3em;
			display: inline-block;
		}
		
</style>
</head>
<body>
	<div id="app">
	<jsp:include page="/views/header.jsp"></jsp:include>
	    <section class="bootstrap-select">
	         <div class="row">
	             <div class="col-12" >
	                 <div class="card">
	                     <div class="card-content">
	                         <div class="card-body">
	                         	<form id="frame"></form>
	                         </div>
	                     </div>
	                 </div>
	             </div>
	         </div>
	     </section>
	     <button class="btn-order btn icon icon-left" id="btn"><svg style="width: 30px; height: 30px;"  xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512"><path d="M256 512A256 256 0 1 0 256 0a256 256 0 1 0 0 512zM232 344l0-64-64 0c-13.3 0-24-10.7-24-24s10.7-24 24-24l64 0 0-64c0-13.3 10.7-24 24-24s24 10.7 24 24l0 64 64 0c13.3 0 24 10.7 24 24s-10.7 24-24 24l-64 0 0 64c0 13.3-10.7 24-24 24s-24-10.7-24-24z"/></svg></button><br><br>	
		 <button id="totalsum" >합계</button>
		 <br><br>
		 <div class="footer">
			 <button>발주</button>
		 </div>
	</div>
<jsp:include page="/views/footer.jsp"></jsp:include>
</body>


</html>