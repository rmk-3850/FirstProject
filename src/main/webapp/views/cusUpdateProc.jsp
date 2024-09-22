<%@page import="mybean.dbcp.DBConnectionMgr"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

    // 수정할 회원 정보
    String b_cus_id = request.getParameter("b_cus_id");
    
    String cus_name = request.getParameter("b_cus_name");
    String cus_gender = request.getParameter("b_cus_gender");
    String cus_ph = request.getParameter("b_cus_ph");
    String cus_mail = request.getParameter("b_cus_mail");
    String cus_rank = request.getParameter("b_cus_rank");
    String cus_note = request.getParameter("b_cus_note");

    DBConnectionMgr pool = null;
    Connection conn = null;
    PreparedStatement stmt = null;

    try {
        pool = DBConnectionMgr.getInstance();
        conn = pool.getConnection();

        // 회원 정보 수정
        String sql = "UPDATE cus SET cus_name=?, cus_gender=?, cus_ph=?, cus_mail=?, cus_rank=?, cus_note=? WHERE cus_id=?";
        stmt = conn.prepareStatement(sql);
        
        stmt.setString(1, cus_name);
        stmt.setString(2, cus_gender);
        stmt.setString(3, cus_ph);
        stmt.setString(4, cus_mail);
        stmt.setString(5, cus_rank);
        stmt.setString(6, cus_note);
        stmt.setString(7, b_cus_id);
        
        int rowsUpdated = stmt.executeUpdate();
        
        // 수정이 완료되면 customer.jsp로 리다이렉트
        response.sendRedirect("customer.jsp");
    } 
    catch (Exception err) {
        err.printStackTrace(); // 오류를 콘솔에 출력
    } 
    finally {
        pool.freeConnection(conn, stmt, null);
    }
%>
