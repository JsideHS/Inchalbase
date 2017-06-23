<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<%
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String ip=request.getRemoteAddr();
	
	Connection conn=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try {
  		/* Context init = new InitialContext();
  		DataSource ds = (DataSource) init.lookup("java:comp/env");
  		conn = ds.getConnection(); */
  		String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
  		String uid = "hjang";         // SQL 사용자 이름
  		String upw = "4748";     // SQL 사용자 패스워드
  		Class.forName("org.mariadb.jdbc.Driver");              // DB와 연동하기 위해 DriverManager에 등록한다.
  		conn=DriverManager.getConnection(url,uid,upw); 
  		
  		pstmt=conn.prepareStatement("SELECT id, pass FROM member WHERE id=?");
  		pstmt.setString(1,id);
  		pstmt.setString(2,pass);
  		rs=pstmt.executeQuery();
  		
  		if(rs.next()){
  			if(pass.equals(rs.getString("pass"))){
  				session.setAttribute("id",id);
  				session.setAttribute("pass",pass);
  				session.setAttribute("ip",ip);
  				
  		  		String sql2 = "insert into history(log_id,log_info,log_ip) VALUES(?,?,?)";
  		  		PreparedStatement pstmt2 = conn.prepareStatement(sql2);
  		  		pstmt2.setString(1,id);
  		  		pstmt2.setString(2,"login");
  		  		pstmt2.setString(3,ip);
  		  		pstmt2.execute();
  				
  				out.println("<script>");
  		  		out.println("location.href='main.jsp'");
  		  		out.println("</script>");
  		  		
  		  	    
  			}
  			else{
  				out.println("<script>alert('비밀번호가 정확하지 않습니다.'); history.back();</script>");
  			}
  			    pstmt.close();
  				conn.close();
  		}
  	    else{
   		  	out.println("<script>");
   		    out.println("alert('없는 계정 정보입니다.')");
   		    out.println("history.back()");
   		    out.println("</script>");
   				
   	    }
  		
  		out.println("<script>");
  		out.println("location.href='loginForm.jsp'");
  		out.println("</script>");
	}catch(Exception e){
		e.printStackTrace();
 	}
%>
