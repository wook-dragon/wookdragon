<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- css -->
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
  <link href="css/nivo-lightbox.css" rel="stylesheet" />
  <link href="css/nivo-lightbox-theme/default/default.css" rel="stylesheet" type="text/css" />
  <link href="css/animations.css" rel="stylesheet" />
  <link href="css/style.css" rel="stylesheet">
  <link href="color/default.css" rel="stylesheet">

<%request.setCharacterEncoding("UTF-8"); %>
</head>

<body id="page-top" data-spy="scroll" data-target=".navbar-custom">


  <!-- Navigation -->
  <div id="navigation">
    <nav class="navbar navbar-custom" role="navigation">
      <div class="container">
        <div class="row">
          <div class="col-md-2">
            <div class="site-logo">
              <a href="Main.jsp" class="brand">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Star<br>Community</a>
            </div>
          </div>


          <div class="col-md-10">

            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
              <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
                                                <i class="fa fa-bars"></i>
                                                </button>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="menu">
              <ul class="nav navbar-nav navbar-right">

                <li class="active"><a href="gomain.do">Home</a></li>
                <%

            if(session.getAttribute("userid") != null) {//로그인한 사용자가 있다면?
               %>
               <li><a href="Logout.jsp">Logout</a></li>
               <%
            }else{
               %>
               <li><a href="login.do">Login</a></li>
               <li><a href="JoinForm.jsp">Join</a></li>
               <%
            }
            %>
              </ul>
            </div>
            <div style="text-align: right">
            
                  <%

            if(session.getAttribute("userid") != null) {//로그인한 사용자가 있다면?
               out.print("<b>" + session.getAttribute("userid") +"<b> Welcome!");
            }

             %>
             
             <%
               String id = null;
               id = (String)session.getAttribute("userid");   //session.setAttribute("userid", rs.getString("id"));
                                                              //로그인 시 session에게 userid값을 부여. Session은 모든 프로젝트에서 사용 가능.
                                                              //get 해 올 수 있음. 
               
               if(id != null) { //session값 중에 아이디가 있다면
                  //out.print(id + "님 환영합니다. 좋은하루되세요 ^_^<br>");
                  if(id.equals("admin")){ // 그중에서도 만약 admin이라면
                     //out.print("<a href='Memberlist.jsp'><input type='button'>회원관리 페이지</a>");
                     out.print("<a href='enroll.do' class='btn btn-skin btn-scroll'>Enroll</a>&nbsp;");
                     out.print("<a href='printemplist.do' class='btn btn-skin btn-scroll'>Search</a>&nbsp;");
                     out.print("<a href='EmpChart.jsp' class='btn btn-skin btn-scroll'>Chart</a>");
                  }
               }else { 
                  // 로그인 하지 않은 사용자
                  //로직을 main은 회원만 볼 수 있다고 한다면? sendRedirect or location 걸면돼요. 
                  //out.print("<script>");
                  //out.print("location.href='Ex02_JDBC_Login.jsp'");//자바스크립트로 쓰는방식
                  //out.print("</script>");
                  
                  //즉 사이트 방문시 제일 처음 보이는 화면
                  out.print("Welcome!");

                  
               }
            %>
            </div>
            <!-- /.Navbar-collapse -->

          </div>
        </div>
      </div>
      <!-- /.container -->
    </nav>
  </div>
  <!-- /Navigation -->
  
  
