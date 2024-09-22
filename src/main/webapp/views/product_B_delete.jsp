<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<jsp:useBean id="prodDAO" class="bean.ProductDAO" />
<%
	//대분류 가져오기
	String pd_B_code = request.getParameter("pd_B_code");

	prodDAO.delelteBProduct(pd_B_code);
	response.sendRedirect("product.jsp");
%>