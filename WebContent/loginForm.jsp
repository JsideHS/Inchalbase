<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.net.*" %>

<%   

    InetAddress Address = InetAddress.getLocalHost();
   

	if (session.getAttribute("id")!=null){//���ǿ� ����� ID NULL�̾ƴϸ�
		response.sendRedirect("main.jsp");//���� �������� �̵�
		
	
           		
	}	
	
 

%>

<html>
<head>
<title>�����̳� ������Ʈ~</title>
</head>
<body>
<form name="loginform" action="loginProcess.jsp" method="post">
   
<center>
<table border=1>
	<tr>
		<td colspan="2" align=center>
			<b><font size=5>�α��� ������</font></b>
		</td>
	</tr>
	<tr><td>���̵� : </td><td><input type="text" name="id"/></td></tr>
	<tr><td>��й�ȣ : </td><td><input type="password" name="pass"/></td></tr>
	<input type="hidden" name="ip" value="<%="Address.getHostAddress()"%>"/>
	<tr>
		<td colspan="2" align=center>
		    <input type="submit" value="�α���">
		    
			
			<a href="joinForm.jsp">ȸ������</a>
		</td>
	</tr>


</table>
</center>
   </form>
 
</body>
</html>
