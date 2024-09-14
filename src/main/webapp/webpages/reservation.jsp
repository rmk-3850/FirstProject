<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>예약 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
        h1 {
            border-bottom: 2px solid black;
            padding-bottom: 10px;
            margin-bottom: 20px;
        }
        .container {
            width: 90%;
            margin: 0 auto;
        }
        .search-bar, .table-options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 15px;
        }
        .search-bar input[type="date"], .search-bar input[type="text"] {
            padding: 5px;
            margin-right: 10px;
        }
        .search-bar button {
            padding: 5px 10px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid black;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
        input[type="checkbox"] {
            margin-right: 10px;
        }
        .pagination {
            text-align: center;
            margin-top: 15px;
        }
        .pagination a {
            padding: 8px 16px;
            margin: 0 5px;
            text-decoration: none;
            border: 1px solid #ddd;
            color: black;
        }
        .pagination a:hover {
            background-color: #ddd;
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
    </style>
</head>
<body>

<div class="container">
    <h1>예약 관리</h1>

    <div class="search-bar">
        <div>
            <input type="date" id="startDate" name="startDate">
            ~
            <input type="date" id="endDate" name="endDate">
            <button type="button">조회</button>
        </div>
        <div>
            <input type="text" placeholder="검색">
            <button type="button">조회</button>
        </div>
    </div>
 <!-- 등록, 수정, 삭제 버튼 -->
    <div class="action-buttons">
        <button>등록</button>
        <button>수정</button>
        <button>삭제</button>
    </div>

    <table>
        <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>예약번호</th>
                <th>예약품목</th>
                <th>예약날짜</th>
                <th>예약시간</th>
                <th>예약자명</th>
                <th>특이사항</th>
            </tr>
            <tr>
                <th><input type="checkbox"></th>
                <th><input type="text" placeholder="예약번호"></th>
                <th><input type="text" placeholder="예약품목"></th>
                <th><input type="date"></th>
                <th><input type="time"></th>
                <th><input type="text" placeholder="예약자명"></th>
                <th><input type="text" placeholder="특이사항"></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td>P01</td>
                <td>파마</td>
                <td>2024-09-14</td>
                <td>18:00</td>
                <td>홍길동</td>
                <td>머리결 안좋음</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>C01</td>
                <td>커트</td>
                <td>2024-08-11</td>
                <td>12:00</td>
                <td>김로민</td>
                <td></td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>P01</td>
                <td>파마</td>
                <td>2024-09-01</td>
                <td>18:00</td>
                <td>이건희</td>
                <td></td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>P01</td>
                <td>파마</td>
                <td>2024-09-14</td>
                <td>19:00</td>
                <td>박제희</td>
                <td></td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>CL01</td>
                <td>클리닉</td>
                <td>2024-09-19</td>
                <td>18:30</td>
                <td>정소율</td>
                <td>머리결 안좋음</td>
            </tr>
        </tbody>
    </table>

    <!-- 엑셀 다운로드 및 인쇄 버튼 -->
    <div class="export-buttons">
        <button>엑셀 다운로드</button>
        <button onclick="window.print()">인쇄</button>
    </div>
    <div class="pagination">
        <a href="#">&lt;</a>
        <a href="#" class="active">1</a>
        <a href="#">&gt;</a>
    </div>
</div>
</body>
</html>