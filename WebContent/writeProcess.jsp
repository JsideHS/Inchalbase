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
   String bid = (String)session.getAttribute("id");
   String bpass = (String)session.getAttribute("pass");
   String title = request.getParameter("title");
   String memo = request.getParameter("memo");
   
   String k_bid = new String(bid.getBytes("8859_1"),"KSC5601");
   String k_title = new String(title.getBytes("8859_1"),"KSC5601");
   String k_memo = new String(memo.getBytes("8859_1"),"KSC5601");

   /*  Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null; */

    
%>
bid: <%=k_bid %><br/>
bpass: <%=bpass %><br/>
titel: <%=k_title %><br/>
memo: <%=k_memo %><br/>
<%     
    
    try {
    	
  		
    	Connection conn=DriverManager.getConnection(url,uid,upw);
	
    	String sql = "insert into board(b_id,b_pass,title,memo) VALUES(?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);	
		pstmt.setString(1, k_bid);
  		pstmt.setString(2, bpass);
  		pstmt.setString(3, k_title);
  		pstmt.setString(4, k_memo);

  		pstmt.execute();
		pstmt.close();
		conn.close();
		
		
} catch(SQLException e) {
	out.println( e.toString() );
	}
%>
  <script language=javascript>
   self.window.alert("����Ϸ�");
   Document.location="board_list.jsp"
   </script>
<br/>
<a href="board_list.jsp">��Ϻ���</a>

