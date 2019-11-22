
<%@page import="kr.or.bit.utils.ConnectionHelper"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="emp" value="${requestScope.empdetail }"></c:set>
	<jsp:include page="/Common/Admin.jsp"></jsp:include>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<jsp:include page="/Common/Top.jsp"></jsp:include>

	<table style="width: 900px; height: 500px; margin-left: auto; margin-right: auto;">
		<tr>
		<%-- 	<td colspan="2"><jsp:include page="/common/Top.jsp"></jsp:include> --%>
			</td>
		</tr>
		<tr>
			<%-- <td style="width: 200px"><jsp:include page="/common/Left.jsp"></jsp:include> --%>
			</td>
			<td style="width: 700px">
	
				<table class="table table-hover"
					style="width: 500px; height: 100px; margin-left: auto; margin-right: auto;" >
				
					<tr>
						<h3 style="text-align:center">Employee Detail</h3>
					</tr>
					<tr>
					<td>
					<label>사원 사진</label><br>
					<img id="previewImage" src ="
					<c:choose>
					<c:when test ="${empdetail.filepath == '/upload/'}">upload/${empdetail.empno }.png
					</c:when>
					<c:otherwise>upload/default-avatar.png
					</c:otherwise>
					</c:choose>"
					style = "width:100px;height:100px;">
					<input type = "hidden" name = "hid"  value = "hello">
					</td>
					<td></td>
					</tr>
					<tr>
						<td>사원번호</td>
						<td>${empdetail.empno }</td>
					</tr> 
					<tr>
						<td>사원이름</td>
						<td>${empdetail.ename }</td>
					</tr>
					<tr>
						<td>직종</td>
						<td>${empdetail.job }</td>
					</tr>
					<tr>
						<td>사수번호</td>
						<td>${empdetail.mgr }</td>
					</tr>
					<tr>
						<td>입사일</td>
						<td>${empdetail.hiredate }</td>
					</tr>
					<tr>
						<td>임금</td>
						<td>${empdetail.sal }</td>
					</tr>
					
					<tr>
						<td>커미션</td>
						<td>${empdetail.comm }</td>
					</tr>
					<tr>
						<td>부서번호</td>
						<td>${empdetail.deptno }</td>
					</tr>

					<tr style="text-align:right">
					<td colspan="2">
						<a href="printemplist.do" class="btn btn-skin">목록보기</a>
					</td>
					</tr>
				</table> 

			</td>
		</tr>


		</td>
		</tr>
		<tr>
			<%-- <td colspan="2"><jsp:include page="/common/Bottom.jsp"></jsp:include></td> --%>
		</tr>
	</table>
	
		<jsp:include page="/Common/Bottom.jsp"></jsp:include>
</body>
</html>