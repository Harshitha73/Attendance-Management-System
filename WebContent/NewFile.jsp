<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Count</title>
<head>
<style>
		table {
  		font-family: arial, sans-serif;
  		border-collapse: collapse;
		width:100%; 
		border:1;
		cellspacing:0;
		cellpadding:10;
		}

		td, th {
 		border: 1px solid #FD0E3D;
  		text-align: left;
  		padding: 8px;
		}

		tr:nth-child(even) {
  		background-color:#EFFD0E;
		}

		tr:nth-child(odd) {
  		background-color:#EFFD0E;
		}

		a{
		color:#5e5656;
		}

		a:hover {
 		color:#ec0808;
		}

	</style>
</head>
	<body>

		<%@page import="oracle.jdbc.driver.*" %>
		<%@page import="oracle.sql.*" %>
		<%@page import="oracle.jdbc.driver.OracleDriver"%>
		<%@page import="java.sql.*,java.io.*"%>
		
		<table>
		<tr>
			<th>Student Name</th>	
			<th>Email</th>
			<th>Attendance</th>
		</tr>
		<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		RequestDispatcher rd;
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		PreparedStatement pstmt=con.prepareStatement("select * from christmas");
		Statement stmt=con.createStatement();
		ResultSet rs =stmt.executeQuery ("SELECT * FROM christmas ");
		while(rs.next())
		{

			%>
			<tr>
			<td><%=rs.getString(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(4)%></td>
			</tr>
			
		<%
		}
	
		%>
		</table>
		<br>
	</body>
</html>