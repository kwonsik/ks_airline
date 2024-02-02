<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
Connection conn = null;
PreparedStatement pstmt = null;
try {
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String username = request.getParameter("username");
	String userpass = request.getParameter("userpass");
	String useremail = request.getParameter("useremail");
	String phone = request.getParameter("userphone");
	String post1 = request.getParameter("post1");
	String useraddress1 = request.getParameter("useraddress1");
	String useraddress2 = request.getParameter("useraddress2");
	String smsaccept = request.getParameter("smsaccept");
	if (smsaccept.equals("yes")) {
		smsaccept = "Y";
	} else {
		smsaccept = "N";
	}

	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mbasic", "root", "1234");
	pstmt = conn.prepareStatement(
	"insert into jsp_userinfo (userid,username,userpass,useremail,phone,post,address1,address2,sms,userip) value(?,?,?,?,?,?,?,?,?,?)");
	pstmt.setString(1, userid);
	pstmt.setString(2, username);
	pstmt.setString(3, userpass);
	pstmt.setString(4, useremail);
	pstmt.setString(5, phone);
	pstmt.setString(6, post1);
	pstmt.setString(7, useraddress1);
	pstmt.setString(8, useraddress2);
	pstmt.setString(9, smsaccept);
	pstmt.setString(10, InetAddress.getLocalHost().getHostAddress());
	int result = pstmt.executeUpdate();

	if (result > 0) {
		out.print("<script>" + "alert('회원가입을 환영합니다');location.href=\"Main.jsp;\"" + "</script>");
	}
}

catch (Exception e) {
	e.printStackTrace();
	out.println("DB연동 실패");
} finally {
	if (pstmt != null) {
		pstmt.close();
	}
	if (conn != null) {
		conn.close();
	}
}
%>