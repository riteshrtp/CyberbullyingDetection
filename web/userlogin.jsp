<%@page import="com.oreilly.servlet.*,java.sql.*,databaseconnection.*,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"%>
<html>

<head>
	<title>Cyberbulling</title>
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
</head>

<body>
	<%

Statement st = null;
ResultSet rs = null;
String userid = request.getParameter("userid");
String pass = request.getParameter("pass");
String name=null;
session.setAttribute("userid",userid);
session.setAttribute("pass",pass);

try{
	Class.forName("com.mysql.jdbc.Driver");	
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/socialnetwork1","root","root");
	st = con.createStatement();
	String qry ="select * from reg where  userid='"+userid+"' AND pass='"+pass+"'"; 
	rs = st.executeQuery(qry);
	if(rs.next()){
	name=rs.getString("name");
	session.setAttribute("name",name);
	response.sendRedirect("userpage.jsp?m3=done");
	
	}
	else{
		out.println("Enter correct username, password");		
	}
	con.close();
	st.close();
}
catch(Exception ex){
	out.println(ex);
}
%>
</body>

</html>