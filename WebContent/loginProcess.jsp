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
  		String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
  		String uid = "hjang";         // SQL ����� �̸�
  		String upw = "4748";     // SQL ����� �н�����
  		Class.forName("org.mariadb.jdbc.Driver");              // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
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
  				out.println("<script>alert('��й�ȣ�� ��Ȯ���� �ʽ��ϴ�.'); history.back();</script>");
  			}
  			    pstmt.close();
  				conn.close();
  		}
  	    else{
   		  	out.println("<script>");
   		    out.println("alert('���� ���� �����Դϴ�.')");
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
