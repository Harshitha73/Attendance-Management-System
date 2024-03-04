package project13;

import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class Team extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)
	{
		try
		{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		PreparedStatement stmt=con.prepareStatement("insert into student5(username,password) values(?,?,?,?)");
		String uname=req.getParameter("uname");
		String password=req.getParameter("pwd");
		stmt.setString(1,uname);
		stmt.setString(2,password);
		stmt.executeUpdate();
		PrintWriter out=res.getWriter();
		out.println("Successfully registered");
		}
		catch(Exception e)
		{	
		 System.out.println(e);
		}
	}
}
	