<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import = "java.sql.*" %>     <!-- JSP에서 JDBC의 객체를 사용하기 위해 java.sql 패키지를 import 한다 -->
<%
Connection conn = null; //초기화
try{
String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql에서 만든 DB명)" << 입력 이때 3306은 mysql기본 포트
String uid = "hjang";         // SQL 사용자 이름
String upw = "4748";     // SQL 사용자 패스워드
Class.forName("org.mariadb.jdbc.Driver");              // DB와 연동하기 위해 DriverManager에 등록한다.
conn=DriverManager.getConnection(url,uid,upw);    // DriverManager 객체로부터 Connection 객체를 얻어온다.
out.println("DB연결됨");      // 커넥션이 제대로 연결되면 수행된다.
}catch(Exception e){     // 예외 처리
e.printStackTrace();
}
%>



