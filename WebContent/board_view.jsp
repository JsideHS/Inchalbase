<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>



<%
    

	if (session.getAttribute("id")==null){//���ǿ� ����� ID�� NULL�̸�
		response.sendRedirect("loginForm.jsp");//�α��� �������� �̵�
        		
	}
	
%>

<%
Class.forName("org.mariadb.jdbc.Driver");     // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
String uid = "hjang";         // SQL ����� �̸�
String upw = "4748";     // SQL ����� �н�����
int idx = Integer.parseInt(request.getParameter("idx"));
int pg = Integer.parseInt(request.getParameter("pg"));//pg �� �޾Ƽ� ����.






try {
             
	Connection conn=DriverManager.getConnection(url,uid,upw); 	
	Statement stmt = conn.createStatement();
		/* pstmt=conn.prepareStatement("SELECT * FROM board WHERE b_id=?");
		pstmt.setString(1,bid); */
		
		String sql = "SELECT b_id, title, memo, time, hit FROM board WHERE NUM=" +idx;
		ResultSet rs = stmt.executeQuery(sql);
		 
		/* pstmt=conn.prepareStatement("SELECT b_id, title, memo, time, hit FROM board WHERE NUM=" +idx);
		rs=pstmt.executeQuery();  */
		if(rs.next()){
			request.setCharacterEncoding("euc-kr");
			String bid = rs.getString(1);
			String title = rs.getString(2);
			String memo = rs.getString(3);
			String time = rs.getString(4);
			int hit = rs.getInt(5);
		    hit++;  
		
		
	
		
/* }catch(Exception e){
	e.printStackTrace();
} */

		

%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
 <title>�Խ���</title>
 </head>
 <body>
  <h3><%=(String)session.getAttribute("id") %> �� ȯ���մϴ�!!!!!!!!.</h3>
  <form name= "logout" method= "post" action="logout.jsp">
<h3><input type="submit" value="�α׾ƿ�"></h3>
</form>
<h3><input type="submit" value="��������" OnClick="window.location='main.jsp'"></h3>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>�� ��</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">�۹�ȣ</td>
      <td width="319"><%=idx %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">��ȸ��</td>
      <td width="319"><%=hit %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">�̸�</td>
      <td width="319"><%=bid %></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">�ۼ���</td>
      <td width="319"><%=time %></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">����</td>
      <td width="319"><%=title%></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
                <tr>
      <td width="0"></td>
                   <td width="399" colspan="2" height="200"><%=memo%>
                </tr>
<% 
    sql = "UPDATE board SET HIT=" + hit + " where NUM=" +idx;
	stmt.executeUpdate(sql);
 	
 	rs.close();
 	stmt.close();
 	conn.close(); 
}
	}catch(SQLException e) {
}

%>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
     <tr height="1" bgcolor="#82B5DF"><td colspan="4" width="407"></td></tr>
     <tr align="center">
      <td width="0">&nbsp;</td>
      <td colspan="2" width="399"><input type=button value="�۾���" OnClick="window.location='board_write.jsp'">
      <%-- <a href="board_view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title %></a> --%>
	<input type=button value="���" >
	<input type=button value="���" OnClick="window.location='board_list.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="����" OnClick="window.location='board_modify.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="����" OnClick="window.location='board_delete.jsp?idx=<%=idx%>&pg=<%=pg%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body>
 </html>