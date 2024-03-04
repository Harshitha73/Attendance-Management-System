<html>

<head>
<style>

body
{
background-image: url("images/event4.png");
background-repeat: no-repeat;
height: 100%;
background-size: cover;
}

.topnav
 {
  margin:0;
  font-family:Impact, Charcoal, sans-serif;
  width:100%;
  overflow: auto;
  background-color: ;
}


.topnav a
{
  float:left;
  color: #000;
  width:17%;
  text-align: center;
  padding: 18px;
  text-decoration: none;
  font-size: 18px;
}


.topnav a:hover
{
  background-color: white;
  color: #95bdbc;
}



.opx
{
text-align:left;
padding-left:216px;
padding-top:px;
}
.phone
{
 text-align:right;
 padding-right:40px;
}

.fa
{
  padding: 20px;
  font-size: 30px;
  width: 15px;
  height:15px;
  text-align: center;
  text-decoration: none;
  border-radius: 30%;
}

.fa:hover
{
  opacity: 0.7;
}

/* Set a specific color for each brand */

/* Facebook */
.fa-facebook
{
  background: #000;
  color: white;
}

/* Twitter */
.fa-twitter
{
  background: #95bdbc;
  color: white;
}
.fieldset1
{
    float:left;
    border:0px #57bfe1;
    -moz-border-radius:8px;
    -webkit-border-radius:8px;
    border-radius:8px;
    padding-top: 20px;
    padding-right: 25px;
    padding-bottom: 20px;
    padding-left: 25px;
    text-align:justify;
   
}
#foot1
{
position:absolute;
width:100%;
    height:60px;
    background-color:lightblue;
}

.left
{
float:left;
padding-top:6px;
padding-left:10px;
}

.right
{
float:right;
padding-bottom:6px;
padding-right:10px;
}

#footer
{
   position:absolute;
   bottom:0;
   width:100%;
   height:60px;     /* Height of the footer */
}

<input type="text">
</style>
</head>



<body>


<%@page import="oracle.jdbc.driver.*" %>
<%@page import="oracle.sql.*" %>
<%@page import="oracle.jdbc.driver.OracleDriver"%>
<%@page import="java.sql.*,java.io.*"%>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
RequestDispatcher rd;
Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
Statement stm=con.createStatement();
String name=(String)session.getAttribute("name");
ResultSet rs=stm.executeQuery("select * from christmas where name='"+name+"'");
ResultSetMetaData rsm=rs.getMetaData();
int count=rsm.getColumnCount();
while(rs.next())
{
%>
<table align="center" border="1" cellpadding="10" cellspacing="0">
<tr>
<td>Name </td>
<td><%=rs.getString(1)%></td>
</tr>
<tr>
<td>Email</td>
<td><%=rs.getString(2)%></td>
</tr>
<tr><td colspan="2">Attendance</td></tr>

<tr>
<%
for(int i=4;i<=count;i++)
{%>
<td><%=rsm.getColumnName(i)%></td>
<td><%=rs.getString(i)%></td>
<%}%>
</tr>
</table>
<%
}
%>

<div id="footer">
<div style="background-color:##ec8787">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">







</div>

<div style="background-color:#95bdbc;padding-top:6px;padding-bottom:6px;">
Copyright &copy 2018,All Right Reserved by Hogwarts University.
</div>
</div>

</body>
</html>

