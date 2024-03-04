<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Check</title>
	<body>

		<%@page import="oracle.jdbc.driver.*" %>
		<%@page import="oracle.sql.*" %>
		<%@page import="oracle.jdbc.driver.OracleDriver"%>
		<%@page import="java.sql.*,java.io.*"%>
		<%
	
		Class.forName("oracle.jdbc.driver.OracleDriver");
		RequestDispatcher rd;
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		PreparedStatement stmt=con.prepareStatement("select * from christmas");
		String name=(String)session.getAttribute("name");
		ResultSet rs =stmt.executeQuery ("SELECT * FROM christmas where name ='"+name+"'");
		while(rs.next())
		{
		if(name.equals(rs.getString(1)))
		{
			%>
			Name:<%=rs.getString(1)%>
			<br>
			Attendance:<%=rs.getString(4)%>
		<%}
		}
		%>
		<br>
	</body>
</html>