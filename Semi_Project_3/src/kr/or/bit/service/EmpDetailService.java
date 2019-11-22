package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;

public class EmpDetailService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
				int empno = Integer.parseInt(request.getParameter("empno"));
				System.out.println("사원번호 : "+empno);
		  		  empdao dao = new empdao();
		  		  System.out.println("다오야 왜그러니? : "+dao);
		  		  emp em = dao.getEmpDetail(empno);
		  		  System.out.println("너의 이름은? : "+em.getEname());
		  		  request.setAttribute("empdetail",em);
		  		  forward = new ActionForward();
			  	  forward.setRedirect(false); //forward 방식
			  	  forward.setPath("/MemberDetail.jsp");

		  	}catch(Exception e){
		  		System.out.println("안녕디지몬 : "+e.getMessage());
		  	}
		return forward;
	}

}
