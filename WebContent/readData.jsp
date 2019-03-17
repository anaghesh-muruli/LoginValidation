<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%  Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String ename = request.getParameter("name");
	String pwd =request.getParameter("pwd");
	String qry = "select * from jejw17.student where username=? and password=?";
	
	Class.forName("com.mysql.jdbc.Driver");
	con = DriverManager.getConnection("jdbc:mysql://localhost:3306","root","root");
	pstmt = con.prepareStatement(qry);
	pstmt.setString(1, ename);
	pstmt.setString(2, pwd);
	pstmt.executeUpdate();
	rs = pstmt.executeQuery();
	if(rs.next())
	{
		session.setAttribute("success", "Login Successful");
		response.sendRedirect("./success.jsp");
		
	}
	else{
		session.setAttribute("faliure", "Login unsuccessful");
		response.sendRedirect("./failure.jsp");
		
	}
	
%>
</body>
</html>