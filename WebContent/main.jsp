<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.net.*" %>
<%   

    
	if (session.getAttribute("id")==null){//���ǿ� ����� ID�� NULL�̸�
		response.sendRedirect("loginForm.jsp");//�α��� �������� �̵�
		
           		
	}
		
%>


<html>
<head>
<title>�����̳� ������Ʈ~</title>
</head>	
<body>

<h3><%=(String)session.getAttribute("id") %> �� ȯ���մϴ�!!!!!!!!.</h3>
<h3> ���ӵ�IP:<%=request.getRemoteAddr()%></h3>
<form name= "logout" method= "post" action="logout.jsp">
<h3><input type="submit" value="�α׾ƿ�"></h3>
</form>
	
 
    

   				

<h3><a href="board_list.jsp">�Խ����̵�</a></h3>

<%if(session.getAttribute("id").equals("admin")){%>
<a href="member_list.jsp">�����ڸ�� -(ȸ�� ��� ����)</a>
<a href="history_list.jsp">�����ڸ�� -(���� ��� ����)</a>
<%}%>
</body>
</html>
