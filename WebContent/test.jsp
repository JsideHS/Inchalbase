<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<%@ page import = "java.sql.*" %>     <!-- JSP���� JDBC�� ��ü�� ����ϱ� ���� java.sql ��Ű���� import �Ѵ� -->
<%
Connection conn = null; //�ʱ�ȭ
try{
String url = "jdbc:mysql://localhost:3306/db1";      // URL, "jdbc:mysql://localhost:3306/(mySql���� ���� DB��)" << �Է� �̶� 3306�� mysql�⺻ ��Ʈ
String uid = "hjang";         // SQL ����� �̸�
String upw = "4748";     // SQL ����� �н�����
Class.forName("org.mariadb.jdbc.Driver");              // DB�� �����ϱ� ���� DriverManager�� ����Ѵ�.
conn=DriverManager.getConnection(url,uid,upw);    // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
out.println("DB�����");      // Ŀ�ؼ��� ����� ����Ǹ� ����ȴ�.
}catch(Exception e){     // ���� ó��
e.printStackTrace();
}
%>



