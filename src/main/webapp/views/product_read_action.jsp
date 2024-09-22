<%@page import="bean.ProductDTO"%>
<%@page import="bean.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<jsp:useBean id="prodDAO" class="bean.ProductDAO" />
<jsp:useBean id="product" class="bean.ProductDTO" />
<%
	request.setCharacterEncoding("UTF-8");

	String action = request.getParameter("action");
	String pd_B_code = request.getParameter("pd_B_code");
	String pd_code = request.getParameter("pd_code");
	String pd_name = request.getParameter("pd_name");
	int pd_price = Integer.parseInt(request.getParameter("pd_price"));
	int pd_ea = Integer.parseInt(request.getParameter("pd_ea"));
	
	prodDAO = new ProductDAO();
	
	if("update".equals(action)) {
		product = new ProductDTO();
		product.setPd_B_code(pd_B_code);
		product.setPd_code(pd_code);
		product.setPd_name(pd_name);
		product.setPd_price(pd_price);
		product.setPd_ea(pd_ea);
		
		prodDAO.updateProductOne(product);
		response.sendRedirect("product_detail.jsp?pd_B_code=" + pd_B_code);
		
	} else if("delete".equals(action)) {
		prodDAO.delelteProductOne(pd_B_code, pd_code);
		response.sendRedirect("product_detail.jsp?pd_B_code=" + pd_B_code);
	} else {
		response.sendRedirect("product_detail.jsp?pd_B_code=" + pd_B_code);
	}
	
%>