<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%
String reg_id = request.getParameter("reg_id");
Class.forName("org.sqlite.JDBC");
java.sql.Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Raiden\\Downloads\\sqlite-tools-win32-x86-3380300\\sqlite-tools-win32-x86-3380300\\HostelManagement.db");
Statement st = con.createStatement();
st.executeUpdate("update user set status_id = 0 where reg_id='" + reg_id + "'");
ResultSet rs = st.executeQuery("select empty_beds, user.room_no from room, user where user.room_no=room.room_no and reg_id = '" + reg_id + "'");
st.executeUpdate("update room set empty_beds = '" + (rs.getInt("empty_beds") + 1) + "' where room_no = '" + rs.getInt("room_no") + "'");
st.executeUpdate("update user set room_no = null where reg_id='" + reg_id + "'");
con.close();
rs.close();
response.sendRedirect("AdminPage.jsp");
%>