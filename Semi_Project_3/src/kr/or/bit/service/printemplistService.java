package kr.or.bit.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;


public class printemplistService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
  		  		  empdao dao = new empdao();
  		  		  ArrayList<emp> printemplist = dao.getemplist();
  		  		  request.setAttribute("printemplist",printemplist);
		  		  
  		  		  forward = new ActionForward();
  			  	  forward.setRedirect(false); //forward 방식
  			  	  forward.setPath("/Memberlist.jsp");
  			  	  System.out.println("서비스 " + printemplist);
	
		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}
}
