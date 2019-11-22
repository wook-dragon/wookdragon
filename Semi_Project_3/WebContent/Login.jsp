<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="/Common/Top.jsp"></jsp:include>


<style type="text/css">
#mydiv {
	margin-top: 10px;
	margin-bottom: 110px;
	padding: 1px;
}

#loginboxdiv {
	position: relative;
	margin: 5px;
	padding: 1px;
	height: 350px;
}

#loginboxinnerbox {
	position: absolute;
	left: 40%;
	top: 10px;
	width: 300px;
	margin: 2px;
}

#footer2 {
	positon: fixed;
	bottom: 1px;
	margin: 1px;
}

#formBtn {
	text-align: center;
}

#myString {
	margin-top: 50px;
	margin-bottom: 1px;
}
</style>
</head>
<body>

	<div class="" id="mydiv">

		<div class="animatedParent" id="myString">
			<div class="section-heading text-center animated fadeInDown">
				<h2 class="h-bold">Login Page</h2>
			</div>
		</div>
		<div class="" id="loginboxdiv">
			<div class="login-box well" id="loginboxinnerbox">
				<form action="loginok.do" name="loginForm" id="loginForm"
					role="form" method="post">

					<div class="form-group">
						<label for="username-email">ID</label> 
						<input name="userid" id="userid" placeholder="ID" type="text" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">Password</label> 
						<input type="password" name="pwd" id="pwd" placeholder="Password" type="password" class="form-control" />
					</div>
					<hr>
					<div class="form-group" id="formBtn">
						<input type="submit" value="LOGIN" class="btn btn-skin btn-scroll">
						<input type="reset" value="CANCEL" class="btn btn-skin btn-scroll">
					</div>
				</form>
			</div>
		</div>

	</div>

	<jsp:include page="/Common/Bottom.jsp"></jsp:include>
</body>
</html>