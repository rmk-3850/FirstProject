<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지 리스트 페이지</title>
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
            padding-bottom: 10px;
            width: 100%;
            box-sizing: border-box;
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
        .board_wrap {
            width: 90%;
            margin: 0 auto;
            padding: 0 30px;
        }
        .board_list {
            width: 100%;
            margin: 0 auto;
        }
        .board_list > div {
            border-bottom: 1px solid #ddd;
            font-size: 0;
        }
        .board_list > div.top {
            border-bottom: 1px solid #999;
        }
        .board_list > div:last-child {
            border-bottom: 1px solid #000;
        }
        .board_list > div > div {
            display: inline-block;
            padding: 15px 0;
            text-align: center;
            font-size: 1.4rem;
        }
        .board_list > div.top > div {
            font-weight: 600;
        }
        .board_list .num,
        .board_list .writer,
        .board_list .count {
            display: none;
        }
        .board_list .num {
            width: 10%;
            display: inline-block;
        }
        .board_list .title {
            text-align: center;
            text-indent: 10px;
            width: 50%;
        }
        .board_list .writer {
            width: 20%;
            display: inline-block;
        }
        .board_list .date {
            width: 20%;
            display: inline-block;
        }
        .board_list .top .title {
            text-indent: 0;
        }
        html {
            font-size: 10px;
        }
        a {
            text-decoration: none;
            color: inherit;
        }
        .board_view {
            width: 90%;
            margin: 0 auto;
            border-top: 2px solid #000;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>공지사항</h1>

        <!-- 검색 및 필터 -->
        <div class="filters">
            <div class="search">
                <input type="text" placeholder="공지글 조회">
                <button>조회</button>
            </div>
        </div>
    </div>

    <div class="board_view">
        <div class="container">
            <div class="board_list_wrap">
                <div class="board_list">
                    <div class="top">
                        <div class="num">번호</div>
                        <div class="title">제목</div>
                        <div class="writer">작성자</div>
                        <div class="date">작성일</div>
                    </div>
                    <div>
                        <div class="num">5</div>
                        <div class="title"><a href="notice_view.jsp">사용법</a></div>
                        <div class="writer">관리자</div>
                        <div class="date">2024.01.01</div>
                    </div>
                    <div>
                        <div class="num">4</div>
                        <div class="title"><a href="notice_view.jsp">업데이트 (2024-09-13)</a></div>
                        <div class="writer">관리자</div>
                        <div class="date">2024.01.01</div>
                    </div>
                    <div>
                        <div class="num">3</div>
                        <div class="title"><a href="notice_view.jsp">시스템 점검 안내 (2024-08-30)</a></div>
                        <div class="writer">관리자</div>
                        <div class="date">2024.01.01</div>
                    </div>
                    <div>
                        <div class="num">2</div>
                        <div class="title"><a href="notice_view.jsp">업데이트 (2024-03-11)</a></div>
                        <div class="writer">관리자</div>
                        <div class="date">2024.01.01</div>
                    </div>
                    <div>
                        <div class="num">1</div>
                        <div class="title"><a href="notice_view.jsp">시스템 점검 안내 (2024-02-30)</a></div>
                        <div class="writer">관리자</div>
                        <div class="date">2024.01.01</div>
                    </div>
                </div>
                <div class="pagination">
                    <a href="#">&lt;</a>
                    <a href="#" class="active">1</a>
                    <a href="#" class="active">2</a>
                    <a href="#" class="active">3</a>
                    <a href="#">&gt;</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>