<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bean.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서비스 상세보기</title>
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
            background-color: #f0f0f0; /* 어두운 배경색 */
        }
        textarea {
            height: 150px;
        }
        button {
            background-color: rgb(42, 105, 241);
            color: white;
            border: none;
            border-radius: 5px;
            height: 30px;
            width: 70px;
            cursor: pointer;
        }
        label {
            font-weight: bold;
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
    <h2>서비스 정보</h2>
    <form method="post" accept-charset="UTF-8">
        <div>
            <label>품목 코드</label><br>
            <input class="form" name="ser_code" value="<%= service.getSer_code() %>" readonly>
            <input type="hidden" name="ser_code" value="<%= service.getSer_code() %>">
        </div>
        <br>
        <div>
            <label>서비스 명</label><br>
            <input class="form" name="ser_name" value="<%= service.getSer_name() %>" readonly>
        </div>
        <br>
        <div>
            <label>판매 가격</label><br>
            <input class="form" name="ser_price" value="<%= service.getSer_price() %>" readonly>
        </div>
        <br>
        <div class="button-container">
            <button type="button" onclick="location.href='service.jsp'">목록</button>
            <button type="button" onclick="location.href='serviceupdate.jsp?code=<%= service.getSer_code() %>'">수정</button>
            <button type="button" onclick="confirmDelete('<%= service.getSer_code() %>')">삭제</button>
        </div>
    </form>
</div>

<script>
    function confirmDelete(ser_code) {
        if (confirm("정말로 삭제하시겠습니까?")) {
        	//encodeURIComponent : JavaScript에서 URL에 포함된 특정 부분을 안전하게 인코딩하는 함수
            location.href = 'servicedelete.jsp?ser_code=' + encodeURIComponent(ser_code);
        }
    }
</script>

</body>
</html>
