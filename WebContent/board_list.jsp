<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>


<%

	final int ROWSIZE = 6;  // 한페이지에 보일 게시물 수
	final int BLOCK = 5; // 아래에 보일 페이지 최대개수 1~5 / 6~10 / 11~15 식으로 5개로 고정

	int pg = 1; //기본 페이지값??? 여기서 무조건 1????로 받아드리는걸로 추정됨..
	
	if(request.getParameter("pg")!=null) { //받아온 pg값이 있을때, 다른페이지일때
		pg = Integer.parseInt(request.getParameter("pg")); // pg값을 저장
	}
	
	int start = (pg*ROWSIZE) - (ROWSIZE-1); // 해당페이지에서 시작번호(step2)
	int end = (pg*ROWSIZE); // 해당페이지에서 끝번호(step2)
	
	int allPage = 0; // 전체 페이지수
	
	int startPage = ((pg-1)/BLOCK*BLOCK)+1; // 시작블럭숫자 (1~5페이지일경우 1, 6~10일경우 6)
	int endPage = ((pg-1)/BLOCK*BLOCK)+BLOCK; // 끝 블럭 숫자 (1~5일 경우 5, 6~10일경우 10)

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

 <% 
	if (session.getAttribute("id")==null){//세션에 저장된 ID가 NULL이면
		out.println("<script>");
		out.println("alert('로그인을하지않으면 게시판에 접속할수 없습니다')");
		out.println("</script>"); 
		response.sendRedirect("loginForm.jsp");//로그인 페이지로 이동
       }
 %>
 
 
 
 </br>
 <% 
     
 Class.forName("org.mariadb.jdbc.Driver");     // DB와 연동하기 위해 DriverManager에 등록한다.
 String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
 String uid = "hjang";         // SQL 사용자 이름
 String upw = "4748";     // SQL 사용자 패스워드
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
			
			out.print("총 게시물 : " + total + "개");
			
			String sqlList = "SELECT num, b_id, title, time, hit, indent from board where STEP2 >="+start + " and STEP2 <= "+ end +" order by step2 asc";
			rs = stmt.executeQuery(sqlList);

%>
<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr height="5"><td width="5"></td></tr>
 <tr style="background:url('img/table_mid.gif') repeat-x; text-align:center;">
   <td width="5"><img src="img/table_left.gif" width="5" height="30" /></td>
   <td width="73">번호</td>
   <td width="379">제목</td>
   <td width="73">작성자</td>
   <td width="164">작성일</td>
   <td width="58">조회수</td>
   <td width="7"><img src="img/table_right.gif" width="5" height="30" /></td>
  </tr>  
<%
	    if(total == 0) {
%> 
               <tr align="center" bgcolor="#FFFFFF" height="30">
	 	   <td colspan="6">등록된 글이 없습니다.</td>
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
			[<a href="board_list.jsp?pg=1">◀◀</a>]
			[<a href="board_list.jsp?pg=<%=startPage-1%>">◀</a>]
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
			[<a href="board_list.jsp?pg=<%=endPage+1%>">▶</a>]
			[<a href="board_list.jsp?pg=<%=allPage%>">▶▶</a>]
		<%
			}
		%>
		</td>
		</tr>
		  <tr align="center">
   <td><input type=button value="글쓰기" OnClick="window.location='board_write.jsp'"></td>
   <td><a href="main.jsp">메인으로 돌아가기!</td>
  </tr>
</table>
</body> 
</html>

