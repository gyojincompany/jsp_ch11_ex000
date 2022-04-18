<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 리스트 보기</title>
</head>
<body>
	<%
	
	String sql = "select * from members";//members 테이블에 있는 모든 데이터 불러오기	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/webdb";
	String username = "root";
	String password = "12345";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs =null;
	
	
	try{
		Class.forName(driverName);//드라이버 로딩
		conn = DriverManager.getConnection(url, username, password);//DB 연동
		stmt = conn.createStatement();//sql 문 객체
		
		rs = stmt.executeQuery(sql);//select의 반환 결과물을 ResultSet 클래스 객체로 받음
		//select를 실행시에는 반환 결과물이 있으므로 executeQuery로 sql문을 실행해야 함
				
		while(rs.next()) { // next() 다음 내용이 있으면 참 없으면 거짓
			String p_id = rs.getString("id");
			String p_pw = rs.getString("passwd");
			String p_name = rs.getString("name");
			String p_email = rs.getString("email");
			String p_jointime = rs.getString("signuptime");
			
			out.print(p_id + " / ");
			out.print(p_pw + " / ");
			out.print(p_name + " / ");
			out.print(p_email + " / ");
			out.print(p_jointime + "<br>");
		}
		
		
	} catch(Exception e) {
		e.printStackTrace();//에러 내용 출력
	} finally {
		try{
			if(rs != null) {
				rs.close();
			}			
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