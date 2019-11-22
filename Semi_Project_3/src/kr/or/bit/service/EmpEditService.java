package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;

public class EmpEditService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
	ActionForward forward = new ActionForward();
		
		int empno = Integer.parseInt(request.getParameter("empno"));
		System.out.println("empno는???"+empno);
		empdao dao = null;
		try {
			dao=new empdao();
			emp emp = dao.getEmpByEmpno(empno);
			
  		  	request.setAttribute("emp",emp);
  		  	
  		  	forward.setRedirect(false);
  		  	forward.setPath("/MemberEdit.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return forward;
	}

}
