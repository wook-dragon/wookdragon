<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:include page="/Common/Admin.jsp"></jsp:include>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<jsp:include page="/Common/Top.jsp"></jsp:include>

<style>
th {
   text-align: center;
}

#div2 {
   width: auto;
   text-align: center;
   top: 10%;
   left: 10%;
}

#input2 {
   border-color: #3dc9b3;
   border-radius: 10px;
   opacity: none;
}

#input1 {
   border: 2px solid #3dc9b3;
   border-radius: 10px;
}
</style>


<script type="text/javascript">
$(document).ready(function(){
   
   //사번으로 검색
   $('#empnosearch').click(function(){
     
      
      if($('#empno').val() == ""){
         alert("사번입력");
         $('#empno').focus();
      }else{
      
         $.ajax(
            {
               url:"empnosearch.do", //Ex10_ok.jsp   
               data:{empno:$('#empno').val()}, //MemoId?id=aa
               dataType:"json", //xml , json , script , html , text
               success:function(responsedata){
                 // $('#empsearch').empty();
                  $('#tbody').empty();
                  console.log(responsedata);
                  console.log(responsedata.empno);
                  var str = "";
                  str += "<tr>";
                  str += "<td>" + responsedata.empno + "</td>";
                  str += "<td>" + responsedata.ename + "</td>";
                  str += "<td>" + responsedata.job + "</td>";
                  str += "<td>" + responsedata.mgr + "</td>";
                  str += "<td>" + responsedata.hiredate + "</td>";
                  str += "<td>" + responsedata.sal + "</td>";
                  str += "<td>" + responsedata.comm + "</td>";
                  str += "<td>" + responsedata.deptno + "</td>";
                  str += "<td colspan='2'><a href='empedit.do?empno="
                  str += responsedata.empno +"'"; 
                  str += "class='btn btn-skin btn-lg'>수정 </a>&nbsp;&nbsp";
                  str += "<a href='EmpDelete.do?empno="
                  str += responsedata.empno+"'"; 
                  str += "class='btn btn-skin btn-lg'>삭제</a>";
                  str += "</td></tr>";
                  console.log(str);
                    $('#tbody').append(str);
               },
               error:function(){
               }
            }      
         );
      };
   });

   
         



   // 부서번호로 검색
   $('#deptnosearch').click(function(){
      //console.log($('#deptno').val());
      
      if($('#deptno').val() == ""){
         alert("부서번호입력");
         $('#deptno').focus();
      }else{
      // empno ,ename , sal , job, comm, deptno
         $.ajax(
            {
               url:"deptnosearch.do", //Ex10_ok.jsp   
               data:{deptno:$('#deptno').val()}, //MemoId?id=aa
               dataType:"json", //xml , json , script , html , text
               type:"get",
               success:function(responsedata){
                  console.log(responsedata);
                  //$('#empsearch').empty();
                  $('#tbody').empty();
                  
                   $.each(responsedata,function(index, obj) {
                     console.log(obj.deptno);
                     var str = "";
                     str += "<tr>";
                           str += "<td>" + obj.empno + "</td>";
                           str += "<td>" + obj.ename + "</td>";
                           str += "<td>" + obj.job + "</td>";
                           str += "<td>" + obj.mgr + "</td>";
                           str += "<td>" + obj.hiredate + "</td>";
                           str += "<td>" + obj.sal + "</td>";
                           str += "<td>" + obj.comm + "</td>";
                           str += "<td>" + obj.deptno + "</td>";
                           str += "<td colspan='2'><a href='empedit.do?empno="
                           str += obj.empno +"'"; 
                           str += "class='btn btn-skin btn-lg'>수정 </a>&nbsp;&nbsp";
                           str += "<a href='EmpDelete.do?empno="
                           str += obj.empno +"'"; 
                           str += "class='btn btn-skin btn-lg'>삭제</a>";
                           str += "</td></tr>";
                           
                             $('#tbody').append(str);
   
                  });
               },
               error:function(xhr){
                  alert(xhr.status);
               }
            }      
         );
   
   
}
   });
});
      


</script>

<section id="div2">
<br>
<br>
   사번으로검색 : 
    <input type="text" size="20" id="empno" name="empno" maxlength="4" >
     <input type="button" value="검색" id="empnosearch" class="btn btn-skin btn-lg"> 
     &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
        부서번호로 검색 : 
      <input type="text" size="20" id="deptno" name="deptno" maxlength="2" >
     <input type="button" value="검색" id="deptnosearch" class="btn btn-skin btn-lg"> 
     
<br>
<br>
<br>

  <table> 

      <table id = "empsearch" class="table table-hover" style="width: 1000px; height: 100%;  margin-left: auto; margin-right: auto;">
         <tr>
            <h3 style="text-align: center">Member List</h3>
         </tr>
         <tr>
            <th>사원번호</th>
            <th>사원이름</th>
            <th>직종</th>
            <th>사수번호</th>
            <th>입사일</th>
            <th>임금</th>
            <th>커미션</th>
            <th>부서번호</th>
         <th>사원정보 수정 및 삭제</th>
         </tr>
        
         
         
          <tbody id="tbody" style="height:100%">
         <c:forEach var="list" items="${requestScope.printemplist}"> 
         <tr>
         <td>
            <a href='empdetail.do?empno=${list.empno}'>${list.empno}</a>
         </td>
         <td>${list.ename}</td>
         <td>${list.job}</td>
         <td>${list.mgr}</td>
         <td>${list.hiredate}</td>
         <td>${list.sal}</td>
         <td>${list.comm}</td>
         <td>${list.deptno}</td>
         
         <td colspan="2">
       <a href="empedit.do?empno=${list.empno}" class="btn btn-skin btn-lg">수정 </a>&nbsp;&nbsp;
         <a href="EmpDelete.do?empno=${list.empno}" class="btn btn-skin btn-lg">삭제</a>
         </td>
         </tr>
         
         </c:forEach>
          </tbody>
</table>
</table>
</section>


<jsp:include page="/Common/Bottom.jsp" flush="false"></jsp:include>
</body>
</html>