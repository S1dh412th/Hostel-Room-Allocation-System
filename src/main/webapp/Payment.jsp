<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>

<%

//  https://razorpay.com/payment-button/pl_JisZ7jg78OuACy/view/?utm_source=payment_button&utm_medium=button&utm_campaign=payment_button
	String roomNumber = request.getParameter("rn");
	session.setAttribute("rn",roomNumber);
	String link = "https://razorpay.com/payment-button/pl_JiqrwJCF6JfmHh/view/?utm_source=payment_button&utm_medium=button&utm_campaign=payment_button";
	response.sendRedirect(link);

%>