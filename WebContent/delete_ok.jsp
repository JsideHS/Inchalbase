<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   request.setCharacterEncoding("euc-kr");
   Class.forName("org.mariadb.jdbc.Driver");              // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
   String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
   String uid = "hjang";         // SQL ����� �̸�
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
   				self.window.alert("�ش� ���� �����Ͽ����ϴ�.");
   				location.href="board_list.jsp";
</script>

<%
		rs.close();
		stmt.close();
		conn.close();
		
		 } else { 
%>
			<script language=javascript>
			 self.window.alert("��й�ȣ�� Ʋ�Ƚ��ϴ�.");
				location.href="javascript:history.back()";
			</script>
<%		
		 }
 	} catch(SQLException e) {
		out.println( e.toString() );
	} 
%>
