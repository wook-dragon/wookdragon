
<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
   request.setCharacterEncoding("UTF-8");

%>

<jsp:include page="/Common/Admin.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원조회</title>
</head>
<body>

<jsp:include page="/Common/Top.jsp"></jsp:include>
   <!-- <table style="width: 100%; height: 600px ;margin-left: auto; margin-right: auto; color: black; background-image: url('img/bg.png');  
         opacity: 0.7;"> -->
   <table style="width: 700px; height: 600px ;margin-left: auto; margin-right: auto; ">      
         
      <tr>
         <%-- <td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include> --%>
         </td>
      </tr>
      <tr>
         <%-- <td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include> --%>
         </td>
         <!-- <td style="width: 700px; background-image: url('img/pic5.jpg');"> -->
         <td style="width: 700px;"> 
         <!--  데이터 받아서 UI 구성 -->
         <%
         String name = request.getParameter("search");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;
                     
            
            //where ename like = '%길동%'
            conn = ConnectionHelper.getConnection("oracle");
            String sql = "select count(*) from koreamember where name like ?";
            String sql2 = "select id, name, email from koreamember where name like'%"+name+"%'";
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, '%'+name+'%');
            rs = pstmt.executeQuery(); // select는 query / delete는 executeUpdate()
            int rowcount = 0;
            int index = 0;
            if(rs.next()){
               rowcount = rs.getInt(1);
            }
   
            
            
         %>
         <!-- 여기! -->
         <table class="table table-hover" style="width:700px; height:100px; margin-left:auto; margin-right:auto;">
               <tr><th colspan="4" style="text-align: center;">회원리스트</th></tr>
               <tr style="border-bottom: 1px solid gray;">
            
                  <th>#</th>
                  <th>id</th>
                  <th>name</th>
                  <th>email</th>
               </tr>
               <%
                  if(rowcount > 0){ //검색된 데이터가 있음 
                     //prepareStatement 단점은 쿼리를 미리 컴파일 시킴
                     
                     pstmt = conn.prepareStatement(sql2);
                      rs = pstmt.executeQuery();//수정,추가,삭제 -> Update /Query는 select 
                      while(rs.next()){
                         String id = rs.getString(1);
                         String mname = rs.getString(2);
                         String email = rs.getString(3);
                         index ++; 
               
               %>
                     <tr>
                     <td><%=index %></td>
                     <td><%=id %></td>
                     <td><%=mname %></td>
                     <td><%=email%></td>
                     </tr>
               <%  
                      }  //end while
                     out.print("<tr><td colspan='4'>");   
                      out.print("<b>[" + name +"] 조회결과 " + rowcount + "건 조회</b>   "); //name -> 검색이름 
                      out.print("</td></tr>");
                  }else{//조회된 건수가 없는 경우 
                     out.print("<tr><td colspan='4'>");   
                      out.print("<b>[" + name +"] 조회결과가 없습니다.</b>"); //name -> 검색이름 
                     
                  }       
               %>
               
					<tr style="text-align:right">
					<td colspan="3">
						<a href="Memberlist.jsp" class="btn btn-skin">회원목록 페이지</a>
					</td>
					</tr>
               
         </table>   

               
         <%
            rs.close();
            pstmt.close();
         %>      
         </td>
      </tr>

   </table>
   </div>
   <jsp:include page="/Common/Bottom.jsp"></jsp:include>
      

</body>
</html>