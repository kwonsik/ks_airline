<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
			<%
			Connection conn=null;
			PreparedStatement pstmt=null;
			ResultSet rset=null;
			try{
				//1. 드라이버로딩
				Class.forName("com.mysql.cj.jdbc.Driver");
				//2. Connection
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/mbasic","root","1234");
				//3. PreparedStatemant 사용준비
				String inputid=request.getParameter("inputid");
				String inputpass=request.getParameter("inputpass");
				
				
				pstmt=conn.prepareStatement("select count(*) from jsp_userinfo where userid=? and userpass=?");	
				pstmt.setString(1, inputid);
				pstmt.setString(2, inputpass);
				
				/*
				session.setAttribute("name",(String)rset.getString("username") );
				session.setAttribute("no", (int)rset.getInt("no"));
				*/
				
				rset=pstmt.executeQuery();
				int count=0;
				
				if(rset.next()){
					count=rset.getInt("count(*)");}
				if(count==0){out.print("<script>alert('아이디 비밀번호를 확인해주세요!');location.href='Main.jsp';</script>");}
				if(rset!=null){rset.close();}
				if(pstmt!=null){pstmt.close();}	
					
				pstmt=conn.prepareStatement("select username,no from jsp_userinfo where userid=? and userpass=?");
				pstmt.setString(1, inputid);
				pstmt.setString(2, inputpass);
				
				rset=pstmt.executeQuery();
				
				if(rset.next()){
					session.setAttribute("username", rset.getString("username"));
					session.setAttribute("no", rset.getInt("no"));
					out.print("<script>alert('환영합니다!');location.href='Main.jsp';</script>");
					
					
			}
			}
			catch(Exception e){e.printStackTrace();out.print("연동 실패");}
			finally{
				if(rset!=null){rset.close();}
				if(pstmt!=null){pstmt.close();}
				if(conn!=null){conn.close();}
			}
			
			
		%>