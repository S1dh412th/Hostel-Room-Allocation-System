<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
</head>
<body>

	<table class="table">
        <thead>
          <tr>
            <th scope="col">Room Number</th>
            <th scope="col">Total Beds</th>
            <th scope="col">Available Beds</th>
            <th scope="col">Room Type</th>
            <th scope="col">Fees</th>
          </tr>
        </thead>
        <tbody>
        
        	<%
        		Class.forName("org.sqlite.JDBC");
        		java.sql.Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Raiden\\Downloads\\sqlite-tools-win32-x86-3380300\\sqlite-tools-win32-x86-3380300\\HostelManagement.db");
        		Statement st = con.createStatement();
 
                ResultSet rs = st.executeQuery("select room_no, total_beds, empty_beds, room_type, fees from room inner join fee_structure on room.room_type=fee_structure.type where floor= '"+request.getParameter("floor")+"' and wing= '"+request.getParameter("wing")+"' and empty_beds>'"+0+"'");
 
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td onclick=\"selectRoom(this)\">" + rs.getString("room_no") + "</td>");
                    out.println("<td>" + rs.getString("total_beds") + "</td>");
                    out.println("<td>" + rs.getString("empty_beds") + "</td>");
                    out.println("<td>" + rs.getString("room_type") + "</td>");
                    out.println("<td>" + rs.getString("fees") + "</td>");
                    out.println("</tr>");
                }
 
                rs.close();
                con.close();
            %>
            
        </tbody>
      </table>
      
      <script>
      	function selectRoom(roomNumber) {
      		let text = "Are you sure you want to book room number : " + roomNumber.innerHTML;
      		
      		if (confirm(text) == true) {
      			location.href = "Payment.jsp?rn="+roomNumber.innerHTML
      		}
      	}
      </script>

</body>
</html>