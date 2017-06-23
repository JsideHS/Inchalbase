<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   request.setCharacterEncoding("euc-kr");
   Class.forName("org.mariadb.jdbc.Driver");              // DB와 연동하기 위해 DriverManager에 등록한다.
   String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
   String uid = "hjang";         // SQL 사용자 이름
   String upw = "4748";  
   int idx = Integer.parseInt(request.getParameter("idx"));
   String passw = request.getParameter("pass"); // 
   String pass = request.getParameter("b_pass");//
   int pg = Integer.parseInt(request.getParameter("pg"));
  
   try{
		
		Connection conn = DriverManager.getConnection(url,uid,upw);
		Statement stmt = conn.createStatement();
		
		String sql = "SELECT b_pass FROM board WHERE NUM=" + idx;
		ResultSet rs = stmt.executeQuery(sql);
		
		 if(rs.next()){
				pass = rs.getString(1);
		 }
		 
		 if(pass.equals(passw)) {
			   			
			sql = "DELETE FROM board WHERE NUM=" + idx;	
			stmt.executeUpdate(sql);
    
%>

<script language=javascript>
   				self.window.alert("해당 글을 삭제하였습니다.");
   				location.href="board_list.jsp";
</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("비밀번호를 틀렸습니다.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>
