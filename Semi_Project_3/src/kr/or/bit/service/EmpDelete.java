package kr.or.bit.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;

public class EmpDelete implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		int result =0;
		int empno = Integer.parseInt(request.getParameter("empno"));
		try {
			forward = new ActionForward();
			empdao dao = new empdao();
			System.out.println("너의 번호는? : "+empno);
			result = dao.deleteEmp(empno);
			
			System.out.println(result + "/" +dao.deleteEmp(empno));
			forward.setPath("/printemplist.do");
		}catch(Exception e) {
			System.out.println("예외 발생..... : " + e.getMessage());
		}
		System.out.println("result" + result);
		System.out.println("forward" + forward);
		return forward;
	}

}
