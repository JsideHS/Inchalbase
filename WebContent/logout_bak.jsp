<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그아웃 페이지</title>
</head>
<body>
    <%
        session.invalidate();
    %>
               
   <script>
    alert("정상적으로 로그아웃되었습니다~~ 안녕히 가세요 ^^")
    location.href="loginForm.jsp";
    </script>
</body>
</html>