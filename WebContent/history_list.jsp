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
			
			pstmt=conn.prepareStatement("SELECT * FROM history ORDER BY log_time DESC");
			rs=pstmt.executeQuery();
	}catch(Exception e){
		e.printStackTrace();
	}

%>
<html>
<head>
<title>ȸ�� �湮���</title>
</head>
<body>
<center>
<table border=1 width=300>
	<tr align=center>
	<title>ȸ�� �湮���</title>
	    <td>ID</td>
	    <td>���ӻ���</td>
	    <td>IP</td>
	    <td>�ð�</td>
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
	<a href="main.jsp">����ȭ������ ���ư���!</a>
	</tr>
</table>
</center>
</body>
</html>
