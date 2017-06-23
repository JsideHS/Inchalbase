<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.net.*" %>
<%   

    
	if (session.getAttribute("id")==null){//세션에 저장된 ID가 NULL이면
		response.sendRedirect("loginForm.jsp");//로그인 페이지로 이동
		
           		
	}
		
%>


<html>
<head>
<title>현석이네 웹사이트~</title>
</head>	
<body>

<h3><%=(String)session.getAttribute("id") %> 님 환영합니다!!!!!!!!.</h3>
<h3> 접속된IP:<%=request.getRemoteAddr()%></h3>
<form name= "logout" method= "post" action="logout.jsp">
<h3><input type="submit" value="로그아웃"></h3>
</form>
	
 
    

   				

<h3><a href="board_list.jsp">게시판이동</a></h3>

<%if(session.getAttribute("id").equals("admin")){%>
<a href="member_list.jsp">관리자모드 -(회원 목록 보기)</a>
<a href="history_list.jsp">관리자모드 -(접속 기록 보기)</a>
<%}%>
</body>
</html>
