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
			String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
			String uid = "hjang";         // SQL ����� �̸�
			String upw = "4748";     // SQL ����� �н�����
			Class.forName("org.mariadb.jdbc.Driver");              // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
			conn=DriverManager.getConnection(url,uid,upw); 
			
			pstmt=conn.prepareStatement("SELECT * FROM member");
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<html>
<head>
<title>ȸ������ �ý��� �����ڸ��(ȸ�� ��� ����)</title>
</head>
<body>
<center>
<table border=1 width=300>
	<tr align=center><td colspan=2>ȸ�� ���</td></tr>
	<%while(rs.next()){%>
	<tr align=center>
		<td>
			<a href="member_info.jsp?id=<%=rs.getString("id") %>">
				<%=rs.getString("id") %>
			</a>
		</td>
		<td><a href="member_delete.jsp?id=<%=rs.getString("id") %>">����</a></td>
	</tr>
	<%} %>
	<tr>
	<a href="main.jsp">����ȭ������ ���ư���!</a>
	</tr>
</table>
</center>
</body>
</html>
