<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 정보</title>
    
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
            border-bottom: 2px solid black;
        }
        table {
            width: 70%;
            border-collapse: collapse;
            margin: 20px auto;
        }
        th, td {
            border: 1px solid black;
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>

<div class="container">
    <h1>회원 정보</h1>
    
    <table>
        <tr>
            <th>회원 ID</th>
            <td><%= request.getParameter("cus_id") %></td>
        </tr>
        <%
            String cus_id = request.getParameter("cus_id");
            
        Context context = null;
        DataSource dataSource = null;

        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;
        
        try {
            context = new InitialContext();
            dataSource = (DataSource) context.lookup("java:comp/env/jdbc/acorn");
            connection = dataSource.getConnection();
                
                String sql = "SELECT * FROM cus WHERE cus_id = ?";
                statement = connection.prepareStatement(sql);
                statement.setInt(1, Integer.parseInt(cus_id));
                
                resultSet = statement.executeQuery();
                
                if (resultSet.next()) {
        %>
        <tr>
            <th>이름</th>
            <td><%= resultSet.getString("cus_name") %></td>
        </tr>
        <tr>
            <th>성별</th>
            <td><%= resultSet.getString("cus_gender") %></td>
        </tr>
        <tr>
            <th>연락처</th>
            <td><%= resultSet.getString("cus_ph") %></td>
        </tr>
        <tr>
            <th>이메일</th>
            <td><%= resultSet.getString("cus_mail") %></td>
        </tr>
        <tr>
            <th>회원 등급</th>
            <td><%= resultSet.getString("cus_rank") %></td>
        </tr>
        <tr>
            <th>특이사항</th>
            <td><%= resultSet.getString("cus_note") %></td>
        </tr>
        <%
                } 
        %>
        
        <%
                
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (resultSet != null) resultSet.close();
                    if (statement != null) statement.close();
                    if (connection != null) connection.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
    </table>
    <br>
    <div class="button-container">
		<button type="button" onclick="location.href='customer.jsp'">목록</button>
		<button type="button" onclick="location.href='cusUpdate.jsp?cus_id=<%= cus_id %>'">수정</button>
		<button type="button" onclick="location.href='cusDelete.jsp?cus_id=<%=cus_id%>'">삭제</button>
    </div>
</div>

</body>
</html>
