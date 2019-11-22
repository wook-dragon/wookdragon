<%@page import="kr.or.bit.utils.ConnectionHelper"%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% 

	request.setCharacterEncoding("UTF-8");
	

	String id = request.getParameter("userid");
	String pwd = request.getParameter("pwd");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	System.out.println("안녕");
	try{
		System.out.println(id);
		conn = ConnectionHelper.getConnection("oracle");
		//비기능적 요구사항
		//conn = Singleton_Helper.getConnection("oracle");
		
		//데이터베이스에게 요청하는 query문을 날림
		String sql="select userid, pwd from adminlist where userid=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,id);
		rs = pstmt.executeQuery();  // 데이터베이스에서 정보를 가져올때 사용 
		System.out.println("rs : ");
		//업무핵심 !
		while(rs.next()) {
			//데이터가 있다. = 아이디가 존재한다. 
					
			//ID가 존재합니다.
			if(pwd.equals(rs.getString("pwd"))){
				//ID 존재, PWD가 맞을때 
				//정상회원 

				//Top.jsp에서 정보 로그인 상태를 보여줄거예요 . "oo님 로그인 하셨습니다."
				session.setAttribute("userid", rs.getString("userid"));  // rs.getString("id") or id 상관없음. 어짜피 같음
				//session한테 서버가 A값을 넘겨줌. 식별하기위해 그 A값안에 userid가 들어가는 것 
				
				response.sendRedirect("Main.jsp"); //자바로쓰는 방식 // or location.href (자바스크립트)
				
			
			}else
				//ID 존재, PWD(X)
				out.print("<script>");
						out.print("alert('잘못입력하셨습니다. 다시 입력해주세요.')");
				out.print("</script>");
				out.print("<script>");
					out.print("location.href='Login.jsp'");//자바스크립트로 쓰는방식
				out.print("</script>");
			
		}
		//아이디가 존재하지 않을때 -> 회원가입 사이트로 넘겨줌
		out.print("<script>");
		out.print("alert('존재하지 않는 아이디입니다. 회원가입을 해주세요.')");//자바스크립트로 쓰는방식
		out.print("</script>");
		
		out.print("<script>");
		out.print("location.href='Login.jsp'");//자바스크립트로 쓰는방식
		out.print("</script>");
		
		
	}catch(Exception e){
		System.out.println(e.getMessage());
	}finally{
		rs.close();
		pstmt.close();
		conn.close();
	} 

%>   