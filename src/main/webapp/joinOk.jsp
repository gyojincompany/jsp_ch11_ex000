<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 환영</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String mId = request.getParameter("id");
		String mPw = request.getParameter("pw"); 
		String mName = request.getParameter("name"); 
		String mEmail = request.getParameter("email");
		
		System.out.println(mId);
		System.out.println(mPw);
		System.out.println(mName);
		System.out.println(mEmail);
		
		String sql = "INSERT INTO members(id, passwd, name, email) VALUES ('" + mId + "','" + mPw + "','" + mName +"','" + mEmail + "')";
		
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/webdb";
		String username = "root";
		String password = "12345";
		
		Connection conn = null;
		Statement stmt = null;
		
		
		try{
			Class.forName(driverName);//드라이버 로딩
			conn = DriverManager.getConnection(url, username, password);//DB 연동
			stmt = conn.createStatement();
			
			int dbFlag = stmt.executeUpdate(sql);//sql 문 실행->1이 오면 성공 아니면 실패
			
			if(dbFlag == 1) {
				out.println("회원 가입 성공!!");
			} else {
				out.println("회원 가입 실패!!");
			}
			
			out.println(conn);
		} catch(Exception e) {
			e.printStackTrace();//에러 내용 출력
		} finally {
			try{
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null) {					
					conn.close();
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	%>
</body>
</html>