package kr.or.bit.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;
import net.sf.json.JSONArray;

public class DeptnoSearchService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {

		ActionForward forward = null;
		try {
			//PrintWriter out = response.getWriter();
			String deptno = request.getParameter("deptno");
			empdao dao = new empdao();
			List<emp> emplist = dao.getEmplistbydeptno(deptno);
			System.out.println("emplist는 나오니 서비스야? " + emplist);

			JSONArray jsonlistbydeptno = JSONArray.fromObject(emplist);
			System.out.println("제이슨 : " + jsonlistbydeptno);
			System.out.println("나오니??????");

			request.setAttribute("emplistbydeptno", jsonlistbydeptno);

			//out.print(jsonlistbydeptno);
			
			
		
			forward = new ActionForward(); 
			forward.setRedirect(false); //forward 방식
			forward.setPath("/Emplistbydeptno.jsp");
			  
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return forward;
	}
}
