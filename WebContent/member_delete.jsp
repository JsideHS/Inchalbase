<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
%>
<%
	String id=null;
	
	if ((session.getAttribute("id")==null) || 
	  (!((String)session.getAttribute("id")).equals("admin"))) {
		out.println("<script>");
		out.println("location.href='loginForm.jsp'");
		out.println("</script>");
	}
	
	String delete_id=request.getParameter("id");
	
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
			
			pstmt=conn.prepareStatement("DELETE FROM member WHERE id=?");
			pstmt.setString(1,delete_id);
			pstmt.executeUpdate();
			
			out.println("<script>");
			out.println("location.href='member_list.jsp'");
			out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
	}
%>
