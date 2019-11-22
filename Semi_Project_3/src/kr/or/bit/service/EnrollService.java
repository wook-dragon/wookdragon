//양찬식 (클래스 새로 만듦.)
package kr.or.bit.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;

public class EnrollService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		  emp emp = new emp();
		  ActionForward	forward = null;
		  
		  try {
			 emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
			 emp.setEname(request.getParameter("ename"));
			 emp.setJob(request.getParameter("job"));
			 emp.setMgr(Integer.parseInt(request.getParameter("mgr"))); 
			 Date hiredate2 = Date.valueOf(request.getParameter("hiredate"));
			 emp.setHiredate(hiredate2); 
			 emp.setSal(Integer.parseInt(request.getParameter("sal"))); 
			 emp.setComm(Integer.parseInt(request.getParameter("comm"))); 
			 emp.setDeptno(Integer.parseInt(request.getParameter("deptno")));
			 empdao dao = new empdao();
			 int result = dao.insertEmp(emp);
			  	  
			  	  String msg="";
			  	  String url="";
			  	  
			  	  if(result > 0) {
			  		  msg ="등록성공";
			  		  url ="printemplist.do";
			  	  }else { //-1 (제약, 컬럼길이 문제)
			  		  msg ="등록실패";
			  		  url ="Memberlist.jsp";
			  	  }
			  	  request.setAttribute("emp_msg", msg);
			  	  request.setAttribute("emp_url", url);
			  	  
			  	  forward = new ActionForward();
			  	  forward.setRedirect(false); //forward 방식
			  	  forward.setPath("/WEB-INF/redirect.jsp");
			  	  
		  }catch (Exception e) {
			e.printStackTrace();
		  }	
			return forward;
		}

	}