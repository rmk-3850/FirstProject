<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서비스 수정</title>
    <style>
        .div {
            padding-left: 55px;
        }
        .form, textarea, select {
            width: 80%;
            border-radius: 5px;
            border: solid rgb(228, 228, 228) 2px;
            font-family: "맑은고딕", Malgun Gothic;
            margin-top: 8px;
        }
        .form {
            height: 25px;      
        }
        textarea {
            height: 150px;
        }
        button {
            background-color: rgb(42, 105, 241);
            color: white;
            border: none;
            border-radius: 5px;
            height: 25px;
            width: 50px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%
    String code = request.getParameter("code");
    ServiceDAO dao = new ServiceDAO();
    ServiceDTO service = dao.getServiceDetail(code);

    if (service == null) {
        out.println("품목 코드 찾을 수 없음: " + code);
        return;
    }
%>

<div class="div">
    <h2>서비스 수정</h2>
    <form method="post" action="serviceupdateproc.jsp" accept-charset="UTF-8"> <!-- 수정 후 요청을 처리할 페이지로 설정 -->
        <div>
            <label>품목 코드</label><br>
            <input class="form" name="ser_code" value="<%= service.getSer_code() %>" readonly>
        </div>
        <br>
        <div>
            <label>서비스 명</label><br>
            <input class="form" name="ser_name" value="<%= service.getSer_name() %>">
        </div>
        <br>
        <div>
            <label>판매 가격</label><br>
            <input class="form" name="ser_price" value="<%= service.getSer_price() %>">
        </div>
        <br>
        <div class="button-container">
            <button type="button" onclick="history.back()">이전</button>
            <button type="submit">수정</button>
        </div>
    </form>
</div>

</body>
</html>
