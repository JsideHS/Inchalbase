<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   request.setCharacterEncoding("euc-kr");
   Class.forName("org.mariadb.jdbc.Driver");              // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
   String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
   String uid = "hjang";         // SQL ����� �̸�
   String upw = "4748";  
   String bid = request.getParameter("name");
   String bpass = request.getParameter("password");
   String title = request.getParameter("title");
   String memo = request.getParameter("memo");
   
   String k_bid = new String(bid.getBytes("8859_1"),"KSC5601");
   String k_title = new String(title.getBytes("8859_1"),"KSC5601");
   String k_memo = new String(memo.getBytes("8859_1"),"KSC5601");
   int pg = Integer.parseInt(request.getParameter("pg"));

   /*  Connection conn=null;
    PreparedStatement pstmt=null;
    ResultSet rs=null; */

    
%>