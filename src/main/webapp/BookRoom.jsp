<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String roomNumber = (String)session.getAttribute("rn");
String userid = (String)session.getAttribute("userid");
String payment_id = (String)request.getParameter("payment_id");
Class.forName("org.sqlite.JDBC");
java.sql.Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Raiden\\Downloads\\sqlite-tools-win32-x86-3380300\\sqlite-tools-win32-x86-3380300\\HostelManagement.db");
Statement st = con.createStatement();
ResultSet rs = st.executeQuery("select empty_beds from room where room_no = '" + roomNumber + "'");
st.executeUpdate("update room set empty_beds = '" + (rs.getInt("empty_beds") - 1) + "' where room_no = '" + roomNumber + "'");
st.executeUpdate("update user set status_id = 1, payment_id = '" + payment_id + "' ,room_no = '" + roomNumber + "' where reg_id='" + userid + "'");
String link = "login.html";
session.invalidate();
rs.close();
con.close();
response.sendRedirect(link);
%>