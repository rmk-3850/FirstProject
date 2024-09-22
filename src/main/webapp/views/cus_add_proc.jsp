<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // 폼에서 전달된 데이터 받기
    request.setCharacterEncoding("utf-8");
    String cus_id = request.getParameter("b_cus_id"); // 회원 ID
    String cus_name = request.getParameter("b_cus_name");
    String cus_gender = request.getParameter("b_cus_gender");
    String cus_ph = request.getParameter("b_cus_ph");
    String cus_mail = request.getParameter("b_cus_mail");
    String cus_rank = request.getParameter("b_cus_rank");
    String cus_note = request.getParameter("b_cus_note");

    final String URL = "jdbc:mariadb://svc.sel4.cloudtype.app:32217/acorn";
    final String ID = "root";
    final String PW = "1820";
    
    Connection conn = null;
    PreparedStatement stmt = null;
    
    try {
        // JDBC 드라이버 로드
        Class.forName("org.mariadb.jdbc.Driver");
        // 데이터베이스 연결
        conn = DriverManager.getConnection(URL, ID, PW);
        
        String sql = "INSERT INTO cus (cus_id, cus_name, cus_gender, cus_ph, cus_mail, cus_rank, cus_note) VALUES (?, ?, ?, ?, ?, ?, ?)";
    
        // PreparedStatement 생성 및 값 설정
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, Integer.parseInt(cus_id)); // cus_id를 정수로 변환하여 설정
        stmt.setString(2, cus_name);
        stmt.setString(3, cus_gender);
        stmt.setString(4, cus_ph);
        stmt.setString(5, cus_mail);
        stmt.setString(6, cus_rank);
        stmt.setString(7, cus_note);
        
        // SQL 쿼리 실행
        stmt.executeUpdate();
        
        // 회원 목록 페이지로 리다이렉션
        response.sendRedirect("customer.jsp");

    } catch(Exception err) {
        // 에러 발생 시 콘솔에 출력
        err.printStackTrace();
    } finally {
        // 리소스 해제
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
