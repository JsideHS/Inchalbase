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
	  		String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
	  		String uid = "hjang";         // SQL 사용자 이름
	  		String upw = "4748";     // SQL 사용자 패스워드
	  		Class.forName("org.mariadb.jdbc.Driver");              // DB와 연동하기 위해 DriverManager에 등록한다.
	  		Connection conn=DriverManager.getConnection(url,uid,upw); 
	  		
	  		
	  	
	  			
	  				
	  		  		String sql = "insert into history(log_id,log_info,log_ip) VALUES(?,?,?)";
	  		  	    PreparedStatement pstmt = conn.prepareStatement(sql);
	  		  		pstmt.setString(1,id);
	  		  		pstmt.setString(2,"logout");
	  		  		pstmt.setString(3,ip);
	  		  		pstmt.execute();
	  		  		
	  		/*   	out.println("<script>");
	  		    out.println("alert('정상적으로 로그아웃되었습니다~~ 안녕히 가세요 ^^')");
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
<title>로그아웃 페이지</title>
</head>
<body>
               
 <script>
    alert("정상적으로 로그아웃되었습니다~~ 안녕히 가세요 ^^")
    location.href="loginForm.jsp";
    </script>
</body>
</html>