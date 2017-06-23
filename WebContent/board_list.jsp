<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<%

	final int ROWSIZE = 6;  // ���������� ���� �Խù� ��
	final int BLOCK = 5; // �Ʒ��� ���� ������ �ִ밳�� 1~5 / 6~10 / 11~15 ������ 5���� ����

	int pg = 1; //�⺻ ��������??? ���⼭ ������ 1????�� �޾Ƶ帮�°ɷ� ������..
	
	if(request.getParameter("pg")!=null) { //�޾ƿ� pg���� ������, �ٸ��������϶�
		pg = Integer.parseInt(request.getParameter("pg")); // pg���� ����
	}
	
	int start = (pg*ROWSIZE) - (ROWSIZE-1); // �ش����������� ���۹�ȣ(step2)
	int end = (pg*ROWSIZE); // �ش����������� ����ȣ(step2)
	
	int allPage = 0; // ��ü ��������
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1; // ���ۺ����� (1~5�������ϰ�� 1, 6~10�ϰ�� 6)
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // �� �� ���� (1~5�� ��� 5, 6~10�ϰ�� 10)

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

 <% 
	if (session.getAttribute("id")==null){//���ǿ� ����� ID�� NULL�̸�
		out.println("<script>");
		out.println("alert('�α��������������� �Խ��ǿ� �����Ҽ� �����ϴ�')");
		out.println("</script>"); 
		response.sendRedirect("loginForm.jsp");//�α��� �������� �̵�
       }
 %>
 
 
 
 </br>
 <% 
     
 Class.forName("org.mariadb.jdbc.Driver");     // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
 String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
 String uid = "hjang";         // SQL ����� �̸�
 String upw = "4748";     // SQL ����� �н�����
 int total = 0;
	/* Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int total = 0; */
	try {
			
			Connection conn=DriverManager.getConnection(url,uid,upw); 
			Statement stmt = conn.createStatement();
			Statement stmt1 = conn.createStatement();
			String sql = "";
			
			
			String sqlCount = "SELECT COUNT(*) FROM board";
			ResultSet rs = stmt.executeQuery(sqlCount);
			
			if(rs.next()){
				total = rs.getInt(1);
			}
			
			int sort=1;
			String sqlSort = "SELECT num from board order by time desc, step2 asc";
			rs = stmt.executeQuery(sqlSort);
			
			while(rs.next()){
				int stepNum = rs.getInt(1);
				sql = "UPDATE board SET step2=" + sort + " where num=" +stepNum;
			 	stmt1.executeUpdate(sql);
			 	sort++;
			}
			
			allPage = (int)Math.ceil(total/(double)ROWSIZE);
			
			if(endPage > allPage) {
				endPage = allPage;
			}
			
			out.print("�� �Խù� : " + total + "��");
			
			String sqlList = "SELECT num, b_id, title, time, hit, indent from board where STEP2 >="+start + " and STEP2 <= "+ end +" order by step2 asc";
			rs = stmt.executeQuery(sqlList);

%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">��ȣ</td>
   <td width="379">����</td>
   <td width="73">�ۼ���</td>
   <td width="164">�ۼ���</td>
   <td width="58">��ȸ��</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>  
<%
	    if(total == 0) {
%> 
               <tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">��ϵ� ���� �����ϴ�.</td>
	 	  </tr> 	  
<%
	    } else {
	    
		    while(rs.next()) {
		    	request.setCharacterEncoding("euc-kr");
			    int idx = rs.getInt(1);  
			    String bid = rs.getString(2);
			    String title = rs.getString(3);
			    String time = rs.getString(4);
			    int hit = rs.getInt(5);
			    int indent = rs.getInt(6);
		
%>	 

<tr height="25" align="center">
	<td>&nbsp;</td>
	<td><%=idx %></td>
	<td align="left"><a href="board_view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title %></td>
	<td align="center"><%=bid %></td>
	<td align="center"><%=time %></td>
	<td align="center"><%=hit %></td>
	<td>&nbsp;</td>
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>	
  
<%
		      }
    }
                      
	rs.close();
	stmt.close();
	conn.close();
	}  catch(SQLException e) {
	//out.println( e.toString() );
} 
%>  
<tr height="25" align="center">
</tr>
  <tr height="1" bgcolor="#D2D2D2"><td colspan="6"></td></tr>

 <tr height="1" bgcolor="#82B5DF"><td colspan="6" width="752"></td></tr>
 </table>
 
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr><td colspan="4" height="5"></td></tr>
  <tr>
      <td align="center">
		<%
			if(pg>BLOCK) {
		%>
			[<a href="board_list.jsp?pg=1">����</a>]
			[<a href="board_list.jsp?pg=<%=startPage-1%>">��</a>]
		<%
			}
		%>
		
		<%
			for(int i=startPage; i<= endPage; i++){
				if(i==pg){
		%>
					<u><b>[<%=i %>]</b></u>
		<%
				}else{
		%>
					[<a href="board_list.jsp?pg=<%=i %>"><%=i %></a>]
		<%
				}
			}
		%>
		
		<%
			if(endPage<allPage){
		%>
			[<a href="board_list.jsp?pg=<%=endPage+1%>">��</a>]
			[<a href="board_list.jsp?pg=<%=allPage%>">����</a>]
		<%
			}
		%>
		</td>
		</tr>
		  <tr align="center">
   <td><input type=button value="�۾���" OnClick="window.location='board_write.jsp'"></td>
   <td><a href="main.jsp">�������� ���ư���!</td>
  </tr>
</table>
</body> 
</html>

