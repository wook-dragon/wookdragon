package kr.or.bit.service;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;
import net.sf.json.JSONObject;

public class EmpnoSearchService implements Action{

   @Override
   public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
      
      ActionForward forward = null;
      
      try {
                 PrintWriter out = response.getWriter();
                 String empno = request.getParameter("empno");
                 System.out.println("왜? " + empno);
                 
                 
                  empdao dao = new empdao();
                  emp emp = new emp();
                  
                  emp = dao.getEmplistbyempno(empno);
                  System.out.println("emp 는 왜 안 들어오는 거니 ? " + emp);
                   
                  JSONObject object = JSONObject.fromObject(emp);
                  System.out.println("제이슨 " + object);
                  
             
                  request.setAttribute("emplistbyempno", object);
                
                  forward = new ActionForward();
                  forward.setRedirect(false); //forward 방식
                  forward.setPath("/empjson.jsp");

           }catch(Exception e){
              System.out.println(e.getMessage() + "null???????");
           }
      return forward;
   }

}