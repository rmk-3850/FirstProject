<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, bean.*" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>서비스 수정 결과</title>
    <style>
        .div {
            padding-left: 55px;
        }
        .message {
            font-family: "맑은고딕", Malgun Gothic;
            margin-top: 20px;
        }
        button {
            background-color: rgb(42, 105, 241);
            color: white;
            border: none;
            border-radius: 5px;
            height: 25px;
            width: 80px;
            cursor: pointer;
        }
    </style>
</head>
<body>
<%    	request.setCharacterEncoding("UTF-8");
    // 폼에서 전달된 데이터 받기
    String ser_code = request.getParameter("ser_code");
    String ser_name = request.getParameter("ser_name");
    String ser_price_str = request.getParameter("ser_price");

    int ser_price = 0;
    if (ser_price_str != null && !ser_price_str.isEmpty()) {
        try {
            ser_price = Integer.parseInt(ser_price_str);
        } catch (NumberFormatException e) {
            // 숫자로 변환할 수 없을 때 처리
            e.printStackTrace();
            out.println("<script>alert('가격은 숫자여야 합니다.'); history.back();</script>");
            return;
        }
    }

    // 데이터 확인
    System.out.println("ser_code: " + ser_code);
    System.out.println("ser_name: " + ser_name);
    System.out.println("ser_price: " + ser_price);

    // DAO 객체 생성 및 데이터 수정
    ServiceDAO dao = new ServiceDAO();
    boolean isUpdated = dao.updateService(ser_code, ser_name, ser_price);

    if (isUpdated) {
%>
        <div class="message">
            <h2>서비스가 성공적으로 수정되었습니다!</h2>
            <button onclick="location.href='service.jsp'">목록으로</button>
        </div>
<%
    } else {
%>
        <div class="message">
            <h2>서비스 수정에 실패했습니다. 다시 시도해주세요.</h2>
            <button onclick="history.back()">다시 시도</button>
        </div>
<%
    }
%>
</body>
</html>
