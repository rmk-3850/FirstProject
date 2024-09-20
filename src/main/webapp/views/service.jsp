<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>판매 관리</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        h1 {
            text-align: left;
            margin: 20px;
        }
        .container {
            width: 80%;
            margin: 0 auto;
        }
        .search-box {
            display: flex;
            justify-content: space-between;
            margin: 20px 0;
        }
        .search-box input[type="text"] {
            width: 300px;
            padding: 8px;
        }
        .search-box button {
            padding: 8px 16px;
            background-color: #ddd;
            border: none;
            cursor: pointer;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: center;
        }
        th {
            background-color: #ddd;
        }
        .pagination {
            display: flex;
            justify-content: center;
            margin-bottom: 20px;
        }
        .pagination button {
            padding: 5px 10px;
            margin: 0 5px;
            border: 1px solid #ddd;
            background-color: white;
            cursor: pointer;
        }
        .register-button {
            text-align: right;
            margin-bottom: 20px;
        }
        .register-button button {
            padding: 8px 16px;
            background-color: #ddd;
            border: none;
            cursor: pointer;
        }
        .excel-download {
            text-align: right;
        }
        .excel-download button {
            padding: 8px 16px;
            background-color: #ddd;
            border: none;
            cursor: pointer;
        }
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/xlsx/0.18.5/xlsx.full.min.js"></script>
</head>
<body>

    <div class="container">
        <h1>판매 관리</h1>
        
        <div class="search-box">
            <div>
                <input type="text" placeholder="품목명으로 조회">
                <button>조회</button>
            </div>
            <div class="register-button">
                <button>등록</button>
            </div>
        </div>

        <table id="salesTable">
            <thead>
                <tr>
                    <th>품목코드</th>
                    <th>서비스명</th>
                    <th>판매 단가</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>C01</td>
                    <td>커트</td>
                    <td>30,000</td>
                </tr>
                <tr>
                    <td>P01</td>
                    <td>파마</td>
                    <td>50,000</td>
                </tr>
                <tr>
                    <td>CL01</td>
                    <td>영양</td>
                    <td>80,000</td>
                </tr>
                <tr>
                    <td>P01</td>
                    <td>파마</td>
                    <td>50,000</td>
                </tr>
                <tr>
                    <td>CL01</td>
                    <td>영양</td>
                    <td>80,000</td>
                </tr>
            </tbody>
        </table>

        <div class="pagination">
            <button>&lt;</button>
            <button>1</button>
            <button>2</button>
            <button>3</button>
            <button>&gt;</button>
        </div>

        <div class="excel-download">
             <button onclick="downloadExcel()">엑셀 다운</button>
        </div>
    </div>
<script>
        function downloadExcel() {
            var table = document.getElementById("salesTable");
            // 테이블 > 워크시트
            var wb = XLSX.utils.table_to_book(table, {sheet: "판매 관리"});
            XLSX.writeFile(wb, '판매_관리.xlsx');
        }
    </script>
</body>
</html>
