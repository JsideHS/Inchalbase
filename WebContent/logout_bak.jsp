<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α׾ƿ� ������</title>
</head>
<body>
    <%
        session.invalidate();
    %>
               
   <script>
    alert("���������� �α׾ƿ��Ǿ����ϴ�~~ �ȳ��� ������ ^^")
    location.href="loginForm.jsp";
    </script>
</body>
</html>