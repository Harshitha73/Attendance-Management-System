package project13;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

public class Redirect extends HttpServlet
{
	public void service(HttpServletRequest req,HttpServletResponse res)throws IOException
	{
		PrintWriter out=res.getWriter();
		try
		{
		res.setContentType("text/html");
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
		Statement stm=con.createStatement();
		PreparedStatement stmt=con.prepareStatement("insert into leader(username,password) values(?,?)");
		RequestDispatcher rd;
		String usname=req.getParameter("uname");
		String password=req.getParameter("pwd");
		int f=0;
		ResultSet rs=stm.executeQuery("select username,password from leader1");
		while(rs.next())
		{
			if(usname.equals(rs.getString(1)) && password.equals(rs.getString(2)))
			{
				f=1;
				break;
			}
		}
		if(f==1)
		{
			stmt.setString(1,usname);
			stmt.setString(2,password);
			stmt.executeUpdate();
			rd=req.getRequestDispatcher("feedback.html");
			rd.include(req,res);
		}
		else
		{
			out.println("Invalid credentials");
			rd=req.getRequestDispatcher("login.html");
			rd.include(req,res);
		}
		}
		catch(Exception e)
		{
			out.println(e);
		}
	}
}


	