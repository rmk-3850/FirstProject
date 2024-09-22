<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8"%>

<%
    request.setCharacterEncoding("utf-8");

    // 수정할 회원 정보
    String cus_id = request.getParameter("cus_id");
    
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
    ResultSet resultSet = null;
    
    try {
        context = new InitialContext();
        dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
        connection = dataSource.getConnection();

        // 회원 정보 수정
        String sql = "UPDATE cus SET cus_name=?, cus_gender=?, cus_ph=?, cus_mail=?, cus_rank=?, cus_note=? WHERE cus_id=?";
        statement = connection.prepareStatement(sql);
        
        statement.setString(1, cus_name);
        statement.setString(2, cus_gender);
        statement.setString(3, cus_ph);
        statement.setString(4, cus_mail);
        statement.setString(5, cus_rank);
        statement.setString(6, cus_note);
        statement.setString(7, cus_id);
        
        int rowsUpdated = statement.executeUpdate();
        
        // 수정이 완료되면 customer.jsp로 리다이렉트
        response.sendRedirect("customer.jsp");
    } 
    catch (Exception err) {
        err.printStackTrace(); // 오류를 콘솔에 출력
    } 
    finally {
       
    }
%>
