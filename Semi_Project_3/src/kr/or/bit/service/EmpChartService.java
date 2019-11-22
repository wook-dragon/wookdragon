package kr.or.bit.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;
import net.sf.json.JSONArray;


public class EmpChartService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		ActionForward forward = null;
		try {
  		  		  empdao dao = new empdao();
  		  		  ArrayList<emp> emplistForChart = dao.emplistForChart();
  		  		  
  		  		  System.out.println("chart 서비스 " + emplistForChart);
  		  		  
  		  		  JSONArray obj = JSONArray.fromObject(emplistForChart);
  		  		  
  		  		  System.out.println("json  왜 안돼??"  + obj);
  		  		  
  		  		request.setAttribute("emplistForChart",obj);
			      
  		  		  forward = new ActionForward();
  			  	  forward.setRedirect(false); //forward 방식
  			  	  forward.setPath("/EmpChart_recieveData.jsp");
  			  	 // System.out.println("chart 서비스 " + emplistForChart);
	
		  	}catch(Exception e){
		  		System.out.println(e.getMessage());
		  	}
		return forward;
	}

}
