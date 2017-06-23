<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.net.*" %>

<%   

    InetAddress Address = InetAddress.getLocalHost();
   

	if (session.getAttribute("id")!=null){//세션에 저장된 ID NULL이아니면
		response.sendRedirect("main.jsp");//메인 페이지로 이동
		
	
           		
	}	
	
 

%>

<html>
<head>
<title>현석이네 웹사이트~</title>
</head>
<body>
<form name="loginform" action="loginProcess.jsp" method="post">
   
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>로그인 페이지</font></b>
		</td>
	</tr>
	<tr><td>아이디 : </td><td><input type="text" name="id"/></td></tr>
	<tr><td>비밀번호 : </td><td><input type="password" name="pass"/></td></tr>
	<input type="hidden" name="ip" value="<%="Address.getHostAddress()"%>"/>
	<tr>
		<td colspan="2" align=center>
		    <input type="submit" value="로그인">
		    
			
			<a href="joinForm.jsp">회원가입</a>
		</td>
	</tr>


</table>
</center>
   </form>
 
</body>
</html>
