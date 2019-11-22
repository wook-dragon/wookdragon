
<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

	//한글처리
	request.setCharacterEncoding("UTF-8");
	
	//데이터 받기
	String id =request.getParameter("id");
	String name =request.getParameter("name");
	int age =Integer.parseInt(request.getParameter("age"));
	String gender =request.getParameter("gender");
	String email =request.getParameter("email");
	String pwd =request.getParameter("pwd");
	

	//DB연결
	//Class.forName("oracle.jdbc.OracleDriver");
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	
	try{
		conn = ConnectionHelper.getConnection("oracle");
		String sql = "update koreamember set name=? , email=? , age=?, gender=?, pwd=? where id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, email);
		pstmt.setInt(3, age);
		pstmt.setString(4, gender);
		pstmt.setString(5, pwd);
		pstmt.setString(6, id);

		int result = pstmt.executeUpdate();
		if(result > 0){ //result > 0  랑 result != 0
			out.print("<script>");
			out.print("location.href='Memberlist.jsp'");
			out.print("</script>");
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		pstmt.close();
	
	}
%>
 