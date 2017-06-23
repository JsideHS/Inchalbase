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
			String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
			String uid = "hjang";         // SQL 사용자 이름
			String upw = "4748";     // SQL 사용자 패스워드
			Class.forName("org.mariadb.jdbc.Driver");              // DB와 연동하기 위해 DriverManager에 등록한다.
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
