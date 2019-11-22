<!-- 양찬식 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
	window.onload=function(){
		$("#upload").change(function(e){
			event.preventDefault();

			var file = e.target.files[0];
			console.log("1 : "+file);
			var url = URL.createObjectURL(file);
			console.log("2 : "+url);
			$("#previewImage").attr("src", url);
			
		});
	};
</script>
<c:set var="emp" value="${requestScope.emp }"></c:set>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<jsp:include page="/Common/Top.jsp"></jsp:include>
    <article class="container " style="height: 100%">
            <div class="page-header" style="text-align:center">
             <h3>Enroll</h3>
                </div>
          <!--    form roll="form" 에서 속성들
      role : 폼 양식이 있는 곳을 알려주거나 변경된 경우
      	joinok.jsp  -->	
            <div class="col-sm-6 col-md-offset-3">
                <form role="form" action="empeditok.do" method="post" name="joinForm" id="joinForm" enctype="multipart/form-data">
                 <div class="form-group">
                       <label>사원 사진</label><br>
                      
					<img id="previewImage" src ="
					<c:choose>
					<c:when test ="${emp.filepath != null}">upload/${emp.filepath}
					</c:when>	
				  <c:otherwise>
				  upload/default-avatar.png
				  </c:otherwise>
				  </c:choose>"
				   style = "width:100px;height:100px">
					<input type = "hidden" name = "hid"  value = "hello">
					<div>
					<div >
						<input type="file" name = "upload" id = "upload"value = "사진선택">
					</div>
				</div>
                    </div>
                    <div class="form-group">
                        <label for="empno">사원번호</label>
                        <input type="text" class="form-control" name="empno" id="empno" value="${emp.empno }" readonly="readonly">
                         <div class="tdempno"></div>
                    </div>
                    <div class="form-group">
                        <label for="ename">사원이름</label>
                        <input type="text" class="form-control" name="ename" id="ename" value="${emp.ename }">
                        <div class="tdename"></div>
                    </div>
                    <div class="form-group">
                        <label for="job">직종</label>
                        <input type="text" class="form-control" name="job" id="job" value="${emp.job }">
                        <div class="tdjob"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="mgr">사수번호</label>
                        <input type="text" class="form-control" name="mgr" id="mgr" value="${emp.mgr }">
                    	<div class="tdmgr"></div>
                    </div>
                    
                    <div class="form-group">
                        <label for="hiredate">입사일</label>
                        <input type="date" class="form-control" name="hiredate" id="hiredate" value="${emp.hiredate }">
                        <div class="tdhiredate"></div>
                    </div>
                    <div class="form-group">
                        <label for="sal">임금</label>
                        <input type="text" class="form-control" name="sal" id="sal" value="${emp.sal }">
                        <div class="tdsal"></div>
                    </div>
                    <div class="form-group">
                        <label for="comm">커미션</label>
                        <input type="text" class="form-control" name="comm" id="comm" value="${emp.comm }">
                        <div class="tdcomm"></div>
                    </div>
                    <div class="form-group">
                    	<label for="deptno">부서번호</label>
                    	<br>
                        <label for="10">10</label>
						<input type="radio" name="deptno" id="10" value="10"><br>
						<label for="20">20</label>
						<input type="radio" name="deptno" id="20" value="20"><br>
						<label for="30">30</label>
						<input type="radio" name="deptno" id="30" value="30"><br>
						<label for="40">40</label>
						<input type="radio" name="deptno" id="40" value="40"><br>
	                    <div class="tddeptno"></div>
                    </div>
            
                    <div class="form-group text-center col-sm-12">
                        <div class="col-sm-6"><button type="submit" id="join-submit" value="회원가입" class="btn btn-skin btn-lg btn-block "> 회원가입<i class="fa fa-check spaceLeft"></i></button></div>
                        <div class="col-sm-6"> <button type="reset" class="btn btn-skin btn-lg btn-block col-sm-4" value="취소">초기화<i class="fa fa-times spaceLeft"></i></button></div>
                       
                    </div>
                </form>
            </div>

        </article>
    </body>
    <jsp:include page="/Common/Regexp.jsp"></jsp:include>
</html>