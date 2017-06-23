<%@ page language="java" contentType="text/html; charset=EUC-KR"%>
<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.net.*" %>
<%
	request.setCharacterEncoding("euc-kr");
	String id=request.getParameter("id");
	String pass=request.getParameter("pass");
	String name=request.getParameter("name");
	int age=Integer.parseInt(request.getParameter("age"));
	String gender=request.getParameter("gender");
	String email=request.getParameter("email");
	
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
  		
  		pstmt=conn.prepareStatement("insert into member values (?,?,?,?,?,?)");
  		pstmt.setString(1,id);
  		pstmt.setString(2,pass);
  		pstmt.setString(3,name);
  		pstmt.setInt(4,age);
  		pstmt.setString(5,gender);
  		pstmt.setString(6,email);
  		int result=pstmt.executeUpdate();
  		
  		if(result!=0){  			
  			out.println("<script>");
  		  	out.println("location.href='loginForm.jsp'");
  		  	out.println("</script>");
  		 
  		  	
  		}else {
  			out.println("<script>");
  	  		out.println("location.href='joinForm.jsp'");
  	  		out.println("</script>");	 
  			
  		}
	}catch(Exception e){
		e.printStackTrace();
 	}
%>
