<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>   
<%@ page import="java.net.*" %> 
<%
   String id=(String)session.getAttribute("id"); 
   String ip=request.getRemoteAddr();
	    
	    /* Connection conn=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;  */
		 session.invalidate();  
 		

		try {
	  		/* Context init = new InitialContext();
	  		DataSource ds = (DataSource) init.lookup("java:comp/env");
	  		conn = ds.getConnection(); */
	  		String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
	  		String uid = "hjang";         // SQL ����� �̸�
	  		String upw = "4748";     // SQL ����� �н�����
	  		Class.forName("org.mariadb.jdbc.Driver");              // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
	  		Connection conn=DriverManager.getConnection(url,uid,upw); 
	  		
	  		
	  	
	  			
	  				
	  		  		String sql = "insert into history(log_id,log_info,log_ip) VALUES(?,?,?)";
	  		  	    PreparedStatement pstmt = conn.prepareStatement(sql);
	  		  		pstmt.setString(1,id);
	  		  		pstmt.setString(2,"logout");
	  		  		pstmt.setString(3,ip);
	  		  		pstmt.execute();
	  		  		
	  		/*   	out.println("<script>");
	  		    out.println("alert('���������� �α׾ƿ��Ǿ����ϴ�~~ �ȳ��� ������ ^^')");
  		  		out.println("location.href='loginForm.jsp'");
  		  		out.println("</script>"); */
	  				
	  				
	  			
	  			 
	  		  		
	  	 	    
		}catch(Exception e){
			e.printStackTrace();
	 	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>�α׾ƿ� ������</title>
</head>
<body>
               
 <script>
    alert("���������� �α׾ƿ��Ǿ����ϴ�~~ �ȳ��� ������ ^^")
    location.href="loginForm.jsp";
    </script>
</body>
</html>