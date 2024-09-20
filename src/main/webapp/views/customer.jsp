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
    </style>
</head>
<body>

<div class="container">
    <h1>회원 관리</h1>

       <!-- 필터: 가입일 및 기간 설정 -->
    <div class="filters">
        <div class="date-filter">
            <div class="checkbox-container">
                <input type="radio" name="date-filter" id="three-months">
                <label for="three-months">3개월</label>
            </div>
            <div class="checkbox-container">
                <input type="radio" name="date-filter" id="six-months">
                <label for="six-months">6개월</label>
            </div>
            <div class="checkbox-container">
                <input type="radio" name="date-filter" id="custom-range">
                <label for="custom-range">사용자 지정</label>
            </div>
            <input type="date" value="2024-07-01">
            -
            <input type="date" value="2024-07-31">
        <div>
            <button type="button">조회</button>
        </div>
</div>
    </div>
    <!-- 등록, 수정, 삭제 버튼 -->
    <div class="action">
        <button>등록</button>
        <button>수정</button>
        <button>삭제</button>
    </div>
    <!-- 회원 관리 테이블 -->
    <table>
        <thead>
            <tr>
                <th><input type="checkbox"></th>
                <th>ID</th>
                <th>이름</th>
                <th>성별</th>
                <th>연락처</th>
                <th>e-mail</th>
                <th>회원등급</th>
                <th>특이사항</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><input type="checkbox"></td>
                <td>1</td>
                <td>이건희</td>
                <td>남</td>
                <td>010-0000-0000</td>
                <td>aaa@aaa</td>
                <td>GOLD</td>
                <td>팀장</td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>2</td>
                <td>김로민</td>
                <td>남</td>
                <td>010-0000-0000</td>
                <td>bbb@bbb</td>
                <td>GOLD</td>
                <td></td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>3</td>
                <td>염정섭</td>
                <td>남</td>
                <td>010-0000-0000</td>
                <td>ccc@ccc</td>
                <td>GOLD</td>
                <td></td>
            </tr>
            <tr>
                <td><input type="checkbox"></td>
                <td>4</td>
                <td>김수민</td>
                <td>여</td>
                <td>010-0000-0000</td>
                <td>ddd@ddd</td>
                <td>GOLD</td>
                <td></td>
            </tr>
        </tbody>
    </table>
    <!-- 엑셀 다운로드 및 인쇄 버튼 -->
    <div class="export-buttons">
        <button>엑셀 다운로드</button>
        <button onclick="window.print()">인쇄</button>
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
