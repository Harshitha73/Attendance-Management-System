<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Count</title>
	<body>

		<%@page import="oracle.jdbc.driver.*" %>
		<%@page import="oracle.sql.*" %>
		<%@page import="oracle.jdbc.driver.OracleDriver"%>
		<%@page import="java.sql.*,java.io.*,java.util.*,java.text.*"%>
		<%
		Class.forName("oracle.jdbc.driver.OracleDriver");
		RequestDispatcher rd;
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		DateFormat df = new SimpleDateFormat("MMM_dd_yy");
		java.util.Date dateobj = new java.util.Date();
		String date=(String)df.format(dateobj);
		PreparedStatement pstmt=con.prepareStatement("update christmas set "+ date +"=? where name=?");
		Statement stm=con.createStatement();
		stm.executeUpdate("Alter table christmas add " + date + " varchar2(10)");
		//PreparedStatement pstmt=con.prepareStatement("update christmas set attendance=? where name=?");
		int f=0,present=0,absent=0;
		String p="";
		ResultSet rs=stm.executeQuery("select name from christmas");
		while(rs.next())
		{
			String k=rs.getString(1);
			String res=request.getParameter(k);
			if(res.equals("present"))
			{
				present++;
				pstmt.setString(1,"present");
				pstmt.setString(2,k);
			}
			else
			{
				absent++;
				pstmt.setString(1,"absent");
				pstmt.setString(2,k);
			}
			pstmt.executeUpdate();
		}
		%>
		Present Students : <%=present%><br>
		Absent Students : <%=absent%>
	</body>
</html>