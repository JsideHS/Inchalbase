<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>
<%
   request.setCharacterEncoding("euc-kr");
   Class.forName("org.mariadb.jdbc.Driver");              // DB와 연동하기 위해 DriverManager에 등록한다.
   String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
   String uid = "hjang";         // SQL 사용자 이름
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