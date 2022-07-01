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
    <link rel="stylesheet" href="Admin.css">
</head>
<body>

	<div class="hamburger-menu, container">
        <input id="menu__toggle" type="checkbox" />
        <label class="menu__btn" for="menu__toggle">
          <span></span>
        </label>

        <ul class="menu__box">
          <li><a class="menu__item" href="#" class="active" onclick="displayTable('table-1')">Requests</a></li>
          <li><a class="menu__item" href="#" class="active" onclick="displayTable('table-2')">Booked Room</a></li>
          <li><a class="menu__item" href="#" class="active" onclick="displayTable('table-3')">Review Await</a></li>
        </ul>

        <h2>Admin</h2>
    </div>
      <div>
        <table id="table-1" >
        
        	<thead>
            	<tr>
                	<th>Registration Id</th>
                	<th>Room/Type</th>
                	<th>Hostel Name</th>
                	<th>Fees</th>
                	<th>Receipt</th>
                	<th>Approval</th>
            	</tr>
            </thead>
            <tbody>
        
        	<%
        		Class.forName("org.sqlite.JDBC");
        		java.sql.Connection con = DriverManager.getConnection("jdbc:sqlite:C:\\Users\\Raiden\\Downloads\\sqlite-tools-win32-x86-3380300\\sqlite-tools-win32-x86-3380300\\HostelManagement.db");
        		Statement st = con.createStatement();
 
                ResultSet rs = st.executeQuery("select reg_id, user.payment_id, user.room_no, room_type, user.hostel_name, fees from user, fee_structure, room where room.room_type = fee_structure.type and user.room_no = room.room_no and user.status_id = 1");
 
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("reg_id") + "</td>");
                    out.println("<td>" + rs.getString("room_no") + "//" + rs.getString("room_type") + "</td>");
                    out.println("<td>" + rs.getString("hostel_name") + "</td>");
                    out.println("<td>" + rs.getString("fees") + "</td>");
                    out.println("<td onclick=\"checkReceipt(this)\">" + rs.getString("payment_id") + "</td>");
                    out.println("<td> <button type=\"button\" onClick=\"confirm1(" + "'" + rs.getString("reg_id") + "'" + ")\">Confirm</button> <button type=\"button\" onClick=\"onHold(" + "'" + rs.getString("reg_id") + "'" + ") \">On Hold</button> </td>");
                    out.println("</tr>");
                }
            %>
            
        </tbody>
        </table>
    </div>



    <div>
        <table id="table-2" style="display:none;">
            <thead>
            	<tr>
                	<th>Registration Id</th>
                	<th>Room/Type</th>
                	<th>Hostel Name</th>
                	<th>Fees</th>
                	<th>Receipt</th>
            	</tr>
            </thead>
            <tbody>
        
        	<%
                rs = st.executeQuery("select reg_id, user.payment_id, user.room_no, room_type, user.hostel_name, fees from user, fee_structure, room where room.room_type = fee_structure.type and user.room_no = room.room_no and user.status_id = 2");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("reg_id") + "</td>");
                    out.println("<td>" + rs.getString("room_no") + "//" + rs.getString("room_type") + "</td>");
                    out.println("<td>" + rs.getString("hostel_name") + "</td>");
                    out.println("<td>" + rs.getString("fees") + "</td>");
                    out.println("<td onclick=\"checkReceipt(this)\">" + rs.getString("payment_id") + "</td>");
                    out.println("</tr>");
                }
            %>
            
        </tbody>
        </table>
    </div>


    <div>
        <table id="table-3" style="display:none;">
            <thead>
            	<tr>
                	<th>Registration Id</th>
                	<th>Room/Type</th>
                	<th>Hostel Name</th>
                	<th>Fees</th>
                	<th>Receipt</th>
                	<th>Approval</th>
            	</tr>
            </thead>
            <tbody>
        
        	<%
                rs = st.executeQuery("select reg_id, user.payment_id, user.room_no, room_type, user.hostel_name, fees from user, fee_structure, room where room.room_type = fee_structure.type and user.room_no = room.room_no and user.status_id = 3");
                while (rs.next()) {
                    out.println("<tr>");
                    out.println("<td>" + rs.getString("reg_id") + "</td>");
                    out.println("<td>" + rs.getString("room_no") + "//" + rs.getString("room_type") + "</td>");
                    out.println("<td>" + rs.getString("hostel_name") + "</td>");
                    out.println("<td>" + rs.getString("fees") + "</td>");
                    out.println("<td onclick=\"checkReceipt(this)\">" + rs.getString("payment_id") + "</td>");
                    out.println("<td> <button type=\"button\" onClick=\"confirm1(" + "'" + rs.getString("reg_id") + "'" + ")\">Confirm</button> <button type=\"button\" onClick=\"reject(" + "'" + rs.getString("reg_id") + "'" + ") \">Reject</button> </td>");
                    out.println("</tr>");
                }
            %>
            
        	</tbody>
        </table>
    </div>
    
    <script>
      	function confirm1(reg_id) {
      		location.href = "ConfirmRoom.jsp?reg_id="+reg_id
      	}
      	
      	function onHold(reg_id) {
      		location.href = "OnHold.jsp?reg_id="+reg_id
      	}
      	
      	function reject(reg_id) {
      		location.href = "Reject.jsp?reg_id="+reg_id
      	}
      	
      	function displayTable(id1) {
      	  if (document.getElementById(id1).style.display === "none")
      	    document.getElementById(id1).style.display = "inline-table";

      	  switch (id1) {
      	    case "table-1":
      	      document.getElementById("table-2").style.display = "none";
      	      document.getElementById("table-3").style.display = "none";
      	      break;

      	    case "table-2":
      	      document.getElementById("table-1").style.display = "none";
      	      document.getElementById("table-3").style.display = "none";
      	      break;

      	    case "table-3":
      	      document.getElementById("table-1").style.display = "none";
      	      document.getElementById("table-2").style.display = "none";
      	      break;

      	    default:
      	      document.getElementById("table-1").style.display = "none";
      	      document.getElementById("table-2").style.display = "none";
      	      document.getElementById("table-3").style.display = "none";
      	  }
      	}
      	
      	function checkReceipt(payment_id) {
      		let url = "https://dashboard.razorpay.com/app/payments/" + payment_id.innerHTML + "#paymentbuttons"
      		window.open(url)
      	}

      </script>
      
</body>
</html>