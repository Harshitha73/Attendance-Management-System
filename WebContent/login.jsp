
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>MemberLogin</title>
</head>
<body>
<%@page import="java.sql.*,java.io.*,java.lang.*"%>
     <%
String name=request.getParameter("name");
String pwd=request.getParameter("pwd");
Class.forName("oracle.jdbc.driver.OracleDriver");
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
PreparedStatement stmt=con.prepareStatement("select * from christmas");

try{
ResultSet rs =stmt.executeQuery ("SELECT * FROM christmas WHERE name ='"+name+"' AND pwd='"+pwd+"'");
while(rs.next()){
boolean entrance;
entrance=false;

if ((name.equals(name)) && (pwd.equals(pwd))){
entrance=true;
}
else{
entrance=false;
}
if (entrance==true){
session.setAttribute("name",name);%>
<jsp:forward page="abc.html"/> <%}
else if(entrance==false){%>
<jsp:forward page="ChristmasEvent.html"/> <%}
}
}
 
catch (SQLException e) {
System.err.println("SQL problem: " + e.getMessage());
System.err.println("SQL state: " + e.getSQLState());
System.err.println("Vendor error: " + e.getErrorCode());
} finally {
try {
if (con != null) {
con.close();
}
} catch (SQLException e) {
System.err.println(e.getMessage());
}
}


%>
</body>
</html>
