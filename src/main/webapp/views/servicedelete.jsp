<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="bean.*"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.NamingException"%>
<%@page import="javax.sql.DataSource"%>
<%
// 데이터베이스 연결 설정
ServiceDAO dao = new ServiceDAO();

String ser_code = request.getParameter("ser_code");
out.println("ser_code: " + ser_code);

if (ser_code != null && !ser_code.isEmpty()) {
	try {
		dao.deleteService(ser_code);
		response.sendRedirect("service.jsp");
	} catch (Exception e) {
		out.println("삭제 중 오류가 발생했습니다: " + e.getMessage());
		e.printStackTrace();
	}
} else {
	out.println("품목 코드가 누락되었습니다.");
}
%>
