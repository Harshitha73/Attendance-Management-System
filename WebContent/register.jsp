<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registered</title>
</head>
<body>
<%@page import="java.sql.*,java.io.*,java.lang.*"%>
<%@page import="oracle.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
     <%
     try{
	String name=request.getParameter("name");
	String email=request.getParameter("email");
	String pwd=request.getParameter("pwd");
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
	PreparedStatement pstmt=con.prepareStatement("insert into christmas(name, email, pwd) values(?,?,?)");
	pstmt.setString(1,name);
	pstmt.setString(2,email);
	pstmt.setString(3,pwd);
	int c=pstmt.executeUpdate();
	if(c>0)
	{%>
		<jsp:forward page="RegSuc.html"/> 
	<% }
     }
     catch(Exception e)
     {
    	 out.println(e);	
     }
      %>
</body>
</html>


     
 