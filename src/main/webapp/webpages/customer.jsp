<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mybean.bean.*, java.util.Set, java.util.HashSet" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 90%;
            margin: 0 auto;
        }
        h1 {
            font-size: 36px;
            margin: 20px 0;
            border-bottom: 2px solid black;
        }
        .filters {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .filters div {
            display: flex;
        }
        .filters input, .filters button, .filters select {
            margin-right: 10px;
            padding: 5px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        .input-row input {
            width: 100%;
            box-sizing: border-box;
            padding: 8px;
        }
        .action {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        .action button {
            padding: 10px 20px;
            cursor: pointer;
        }
        .pagination {
            text-align: center;
        }
        .pagination button {
            padding: 5px 10px;
            margin: 5px;
        } 
        .export-buttons {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }
        .export-buttons button {
            padding: 10px 20px;
            cursor: pointer;
        }
        .action-buttons {
            margin-top: 20px;
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        .action-buttons button {
            padding: 10px 20px;
            cursor: pointer;
        }
         .search-filter {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .search-filter select, .search-filter input, .search-filter button {
            margin-right: 10px;
        }
    </style>
</head>
<body>
	<% request.setCharacterEncoding("utf-8"); %>
    <jsp:useBean id="cusDto" class="mybean.bean.CustomerDTO" />
    <jsp:useBean id="cusDao" class="mybean.bean.CustomerDAO" />

    <% 	

    %>
<div class="container">
    <h1>회원 관리</h1>

       <!-- 필터: 가입일 및 기간 설정 -->
    <div class="filters">
        <div class="date-filter">
            <input type="date" value="2024-07-01">
            -
            <input type="date" value="2024-07-31">
        <div>
            <button type="button">조회</button>
        </div>
        </div>
    </div>
    </div>
     <!-- 드롭다운: 등급 및 이름 검색 -->
        <div class="search-filter">
            <select id="filter">
                <option value="name">이름</option>
                <option value="grade">등급</option>
            </select>
            <input type="text" id="filter">
            <button type="button" onclick="filterMembers()">검색</button>
        </div>
    </div>
    <!-- 등록 버튼 -->
    <div class="action">
        <button>등록</button>
    </div>
    <!-- 회원 관리 테이블 -->
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>연락처</th>
                <th>e-mail</th>
                <th>등록일</th>
                <th>회원등급</th>
            </tr>
        </thead>
        <tbody>
            <% 
    				Set<CustomerDTO> customers = cusDao.getCustomer(1); 
        			for (CustomerDTO cus : customers) {
            %> 
            <tr>
                <td><%= cus.getCus_id()  %></td>
                <td><a href><%= cus.getCus_name() %></a></td>
                <td><%= cus.getCus_ph() %></td>
                <td><%= cus.getCus_mail() %></td>
                <td><%= cus.getCus_reg() %></td>
                <td><%= cus.getCus_rank() %></td>
            </tr>
            <%
            	}
            %>
        </tbody>
    </table>
    <!-- 엑셀 다운로드 인쇄 버튼 -->
    <div class="export-buttons">
        <button>엑셀 다운로드</button>
    </div>
    <!-- 페이지네이션 -->
    <div class="pagination">
        <button>&lt;</button>
        <button>1</button>
        <button>2</button>
        <button>3</button>
        <button>&gt;</button>
    </div>
</div>

</body>
</html>
