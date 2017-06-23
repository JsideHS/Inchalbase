<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	String id=null;
	
	if ((session.getAttribute("id")==null) || 
	  (!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	try {
			/* Context init = new InitialContext();
			DataSource ds = 
				(DataSource) init.lookup("java:comp/env");
			conn = ds.getConnection(); */
			String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
			String uid = "hjang";         // SQL 사용자 이름
			String upw = "4748";     // SQL 사용자 패스워드
			Class.forName("org.mariadb.jdbc.Driver");              // DB와 연동하기 위해 DriverManager에 등록한다.
			conn=DriverManager.getConnection(url,uid,upw); 
			
			pstmt=conn.prepareStatement("SELECT * FROM history ORDER BY log_time DESC");
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<html>
<head>
<title>회원 방문기록</title>
</head>
<body>
<center>
<table border=1 width=300>
	<tr align=center>
	<title>회원 방문기록</title>
	    <td>ID</td>
	    <td>접속상태</td>
	    <td>IP</td>
	    <td>시간</td>
	</tr>
	<%while(rs.next()){%>
	<tr align=center>
		<td>
			<a<%=rs.getString("log_id") %>">
				<%=rs.getString("log_id") %>
			</a>
		</td>
		<td>
			<a<%=rs.getString("log_info") %>">
				<%=rs.getString("log_info") %>
			</a>
		</td>
		<td>
			<a<%=rs.getString("log_ip") %>">
				<%=rs.getString("log_ip") %>
			</a>
		</td>
		<td>
			<a<%=rs.getString("log_time") %>">
				<%=rs.getString("log_time") %>
			</a>
		</td>
`		</tr>
	<%} %>
	<tr>
	<a href="main.jsp">메인화면으로 돌아가기!</a>
	</tr>
</table>
</center>
</body>
</html>
