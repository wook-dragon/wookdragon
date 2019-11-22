package kr.or.bit.service;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;

public class LoginOkService implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		HttpSession session = request.getSession();
		String id = request.getParameter("userid");
		String pwd = request.getParameter("pwd");
		
		try {
			forward = new ActionForward();
			PrintWriter out =response.getWriter();
			if(id.equals("admin")) {
				if(pwd.equals("1004")) {
					session.setAttribute("userid", "admin");
					forward.setPath("/gomain.do");
				}else {
					System.out.println("틀린비번");
					forward.setPath("/login.do");
				}
			}else {
				System.out.println("없는아이디");
				forward.setPath("/login.do");
			}
		}catch(IOException e) {
			e.printStackTrace();
		} 
		return forward;
	}

}
