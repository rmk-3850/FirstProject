<%@ page language="java" contentType="text/html; charset=UTF-8" 
		pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>상품 관리</title>
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
            justify-content: flex-start;
            margin-bottom: 20px;
        }
        .filters div {
            display: flex;
            align-items: center;
        }
        .filters input[type="text"] {
            height: 32px;
            padding: 0 5px;
        }
        .filters button {
            height: 35px;
            padding: 0 10px;
            cursor: pointer;
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
        .actions {
            display: flex;
            justify-content: flex-end;
            gap: 10px;
        }
        .actions button {
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
        .checkbox-container {
            display: flex;
            align-items: center;
        }
        .checkbox-container input {
            margin-right: 5px;
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
        <h1>상품 관리</h1>
        
        <!-- 검색 및 필터 -->
        <div class="filters">
            <div class="search">
                <input type="text" placeholder="물품명 조회">
                <button>조회</button>
            </div>
        </div>
        
        <!-- 등록 버튼 -->
        <div class="action-buttons">
            <button>등록</button>
        </div>
        
        <!-- 상품 관리 테이블 -->
        <table>
            <thead>
                <tr>
                    <th>상품코드</th>
                    <th>상품명</th>
                    <th>가격</th>
                    <th>수량</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>S001</td>
                    <td><a href="">샴푸</a></td>
                    <td>50,000</td>
                    <td>5</td>
                </tr>
                <tr>
                    <td>S002</td>
                    <td><a href="">린스</a></td>
                    <td>40,000</td>
                    <td>3</td>
                </tr>
                <tr>
                    <td>S003</td>
                    <td><a href="">트리트먼트</a></td>
                    <td>70,000</td>
                    <td>2</td>
                </tr>
                <tr>
                    <td>S004</td>
                    <td><a href="">염색약</a></td>
                    <td>90,000</td>
                    <td>9</td>
                </tr>
            </tbody>
        </table>
        
        <!-- 엑셀 다운로드 버튼 -->
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