<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String userid = request.getParameter("reg_id");
session.setAttribute("userid",userid);
String password = request.getParameter("pass");
Class.forName("org.sqlite.JDBC");
java.sql.Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Raiden\\Downloads\\sqlite-tools-win32-x86-3380300\\sqlite-tools-win32-x86-3380300\\HostelManagement.db");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select * from user where reg_id='" + userid + "' and password='" + password + "'");
String link = "";
try {
	if (rs.next()) {
		link = "login.html";
		if (rs.getInt("status_id") == 0) {
			link = "mainPage.html"; 
		}
		if (rs.getInt("status_id") == 9) {
			link = "AdminPage.jsp"; 
		}
	} else {
		link = "login.html";
	} 
} catch(Exception e) {
	
}
if (link == "login.html") {
	session.invalidate();
}
rs.close();
con.close();
response.sendRedirect(link);
%>