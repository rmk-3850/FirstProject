<!-- cusDeleteProc.jsp -->
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 삭제</title>
</head>
<body>
<%
    String cus_id = request.getParameter("cus_id");
    
    if (cus_id != null) {
        final String URL = "jdbc:mariadb://svc.sel4.cloudtype.app:32217/acorn";
        final String ID = "root";
        final String PW = "1820";
        
        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            Class.forName("org.mariadb.jdbc.Driver");
            conn = DriverManager.getConnection(URL, ID, PW);
            
            // 삭제 쿼리 실행
            String sql = "DELETE FROM cus WHERE cus_id=?";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, Integer.parseInt(cus_id));
            stmt.executeUpdate();
            
            response.sendRedirect("customer.jsp");
        } 
        catch(Exception err) {
            System.out.println("cusDeleteProc.jsp : " + err);
        } 
        finally {
            if(stmt != null) stmt.close();
            if(conn != null) conn.close();
        }
    } 
%>
</body>
</html>
