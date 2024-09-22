<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 폼에서 전달된 데이터 받기
    request.setCharacterEncoding("utf-8");
    String cus_id = request.getParameter("cus_id"); // 회원 ID
    String cus_name = request.getParameter("cus_name");
    String cus_gender = request.getParameter("cus_gender");
    String cus_ph = request.getParameter("cus_ph");
    String cus_mail = request.getParameter("cus_mail");
    String cus_rank = request.getParameter("cus_rank");
    String cus_note = request.getParameter("cus_note");

    Context context = null;
    DataSource dataSource = null;

    Connection connection = null;
    PreparedStatement statement = null;
    
    try {
        context = new InitialContext();
        dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        connection = dataSource.getConnection();
        
        String sql = "INSERT INTO cus (cus_id, cus_name, cus_gender, cus_ph, cus_mail, cus_rank, cus_note) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
        // PreparedStatement 생성 및 값 설정
        statement = connection.prepareStatement(sql);
        statement.setInt(1, Integer.parseInt(cus_id)); // cus_id를 정수로 변환하여 설정
        statement.setString(2, cus_name);
        statement.setString(3, cus_gender);
        statement.setString(4, cus_ph);
        statement.setString(5, cus_mail);
        statement.setString(6, cus_rank);
        statement.setString(7, cus_note);
        
        // SQL 쿼리 실행
        statement.executeUpdate();
        
        // 회원 목록 페이지로 리다이렉션
        response.sendRedirect("customer.jsp");

    } catch(Exception err) {
        // 에러 발생 시 콘솔에 출력
        err.printStackTrace();
    } finally {
        // 리소스 해제
        try {
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
