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
  		String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
  		String uid = "hjang";         // SQL ����� �̸�
  		String upw = "4748";     // SQL ����� �н�����
  		Class.forName("org.mariadb.jdbc.Driver");              // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
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
