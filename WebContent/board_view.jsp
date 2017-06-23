<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>



<%
    

	if (session.getAttribute("id")==null){//세션에 저장된 ID가 NULL이면
		response.sendRedirect("loginForm.jsp");//로그인 페이지로 이동
        		
	}
	
%>

<%
Class.forName("org.mariadb.jdbc.Driver");     // DB와 연동하기 위해 DriverManager에 등록한다.
String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
String uid = "hjang";         // SQL 사용자 이름
String upw = "4748";     // SQL 사용자 패스워드
int idx = Integer.parseInt(request.getParameter("idx"));
int pg = Integer.parseInt(request.getParameter("pg"));//pg 값 받아서 저장.






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
 <title>게시판</title>
 </head>
 <body>
  <h3><%=(String)session.getAttribute("id") %> 님 환영합니다!!!!!!!!.</h3>
  <form name= "logout" method= "post" action="logout.jsp">
<h3><input type="submit" value="로그아웃"></h3>
</form>
<h3><input type="submit" value="메인으로" OnClick="window.location='main.jsp'"></h3>

<table>
  <tr>
   <td>
    <table width="100%" cellpadding="0" cellspacing="0" border="0">
     <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
      <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
      <td>내 용</td>
      <td width="5"><img src="img/table_right.gif" width="5" height="30" /></td>
     </tr>
    </table>
   <table width="413">
     <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">글번호</td>
      <td width="319"><%=idx %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">조회수</td>
      <td width="319"><%=hit %></td>
      <td width="0">&nbsp;</td>
     </tr>
	 <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">이름</td>
      <td width="319"><%=bid %></td>
      <td width="0">&nbsp;</td>
     </tr>
     <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">작성일</td>
      <td width="319"><%=time %></td>
      <td width="0">&nbsp;</td>
     </tr>
      <tr height="1" bgcolor="#dddddd"><td colspan="4" width="407"></td></tr>
    <tr>
      <td width="0">&nbsp;</td>
      <td align="center" width="76">제목</td>
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
      <td colspan="2" width="399"><input type=button value="글쓰기" OnClick="window.location='board_write.jsp'">
      <%-- <a href="board_view.jsp?idx=<%=idx%>&pg=<%=pg%>"><%=title %></a> --%>
	<input type=button value="답글" >
	<input type=button value="목록" OnClick="window.location='board_list.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="수정" OnClick="window.location='board_modify.jsp?idx=<%=idx%>&pg=<%=pg%>'">
	<input type=button value="삭제" OnClick="window.location='board_delete.jsp?idx=<%=idx%>&pg=<%=pg%>'">
      <td width="0">&nbsp;</td>
     </tr>
    </table>
   </td>
  </tr>
 </table>
</body>
 </html>