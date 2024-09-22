<%@page import="java.util.ArrayList"%>
<%@page import="bean.*"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
        .excel-download {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
            margin-top: 20px;
        }
        .excel-download button {
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
    <script>
        function downloadExcel() {
            var table = document.getElementById("customerTable");
            var wb = XLSX.utils.table_to_book(table, {sheet: "회원 관리"});
            XLSX.writeFile(wb, '회원관리.xlsx');
        }
    </script>
</head>
<body>

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

    <!-- 등급 및 이름 검색 -->
    <form method="get" action="customer.jsp">
        <div class="search-filter">
            <select name="keyField">
                <option value="cus_name">이름</option>
                <option value="cus_rank">등급</option>
            </select>
            <input type="text" name="filterValue" id="filterValue">
            <button type="submit">검색</button>
        </div>
    </form>

    <!-- 등록 버튼 -->
    <div class="action">
        <button type="button" onclick="location.href='customer_add.jsp'">등록</button>
    </div>

    <!-- 회원 관리 테이블 -->
    <table id="customerTable">
        <thead>
            <tr>
                <th>ID</th>
                <th>이름</th>
                <th>성별</th>
                <th>연락처</th>
                <th>e-mail</th>
                <th>회원 등록일</th>
                <th>회원등급</th>
                <th>특이사항</th>
            </tr>
        </thead>
        <tbody>
        <% 
        String filterKey = request.getParameter("keyField");
        String filterValue = request.getParameter("filterValue");

        CustomerDAO customerDAO = new CustomerDAO(); 
        ArrayList<CustomerDTO> list = (ArrayList<CustomerDTO>) customerDAO.getCustomer(filterKey, filterValue);
        
        for(CustomerDTO customer : list) {
        %>
        <tr>
            <td><%= customer.getCus_id() %></td>
            <td><a href="cusRead.jsp?cus_id=<%= customer.getCus_id() %>"><%= customer.getCus_name() %></a></td>
            <td><%= customer.getCus_gender() %></td>
            <td><%= customer.getCus_ph() %></td>
            <td><%= customer.getCus_mail() %></td>
            <td><%= customer.getCus_reg()  %></td>
            <td><%= customer.getCus_rank() %></td>
            <td><%= customer.getCus_note() != null ? customer.getCus_note() : "" %></td> 
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- 엑셀 다운로드 버튼 -->
    <div class="excel-download">
        <button onclick="downloadExcel()">엑셀 다운</button>
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
