package kr.or.bit.service;

import java.sql.Date;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import kr.or.bit.action.Action;
import kr.or.bit.action.ActionForward;
import kr.or.bit.dao.empdao;
import kr.or.bit.dto.emp;

public class EmpEditOkService implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		 emp emp = new emp();
		  ActionForward	forward = null;
		  try {
			  ServletContext sc = request.getSession().getServletContext();
			    String dir = sc.getRealPath("/upload");
			System.out.println("dirdirdirdirdir : "+dir);
			int size = 1024*1024*10;
			MultipartRequest multi = new MultipartRequest(
					request,
					dir,
					size,
					"UTF-8",
					new DefaultFileRenamePolicy()
					);

			String filepath = multi.getParameter("filepath");
			String empno = multi.getParameter("empno");
			String ename = multi.getParameter("ename");
			String job = multi.getParameter("job");
			String mgr = multi.getParameter("mgr");
			//String hiredate = multi.getParameter("hiredate");
			String sal = multi.getParameter("sal");
			String comm = multi.getParameter("comm");
			String deptno = multi.getParameter("deptno");

			Enumeration filenames = multi.getFileNames();
			
			String files =(String)filenames.nextElement();
			String filename = multi.getFilesystemName(files);  //실제 서버 저장파일이름 
			String orifilename = multi.getOriginalFileName(files); //  원래 클라이언트가 저장한 이름 
			
			String filePath = filename;
			filePath=filePath.trim();
			System.out.println("너의 새로운 조소는 무엇이니?"+filePath);
			/*
			 * emp.setEmpno(Integer.parseInt(request.getParameter("empno")));
			 * emp.setEname(request.getParameter("ename"));
			 * emp.setJob(request.getParameter("job"));
			 * emp.setMgr(Integer.parseInt(request.getParameter("mgr"))); Date hiredate2 =
			 * Date.valueOf(request.getParameter("hiredate")); emp.setHiredate(hiredate2);
			 * emp.setSal(Integer.parseInt(request.getParameter("sal")));
			 * emp.setComm(Integer.parseInt(request.getParameter("comm")));
			 * emp.setDeptno(Integer.parseInt(request.getParameter("deptno")));
			 * emp.setFilepath(request.getParameter("filepath"));
			 */			 
			emp.setEmpno(Integer.parseInt(empno));
			 emp.setEname(ename);
			 emp.setJob(job);
			 emp.setMgr(Integer.parseInt(mgr)); 
			 //Date hiredate2 = Date.valueOf(hiredate);
			 //emp.setHiredate(hiredate); 
			 emp.setSal(Integer.parseInt(sal)); 
			 emp.setComm(Integer.parseInt(comm)); 
			 emp.setDeptno(Integer.parseInt(deptno));
			 emp.setFilepath(filePath);
			 System.out.println("너의 새로운 이름은 무엇이니??"+emp.getEname());
			 empdao dao = new empdao();
			 int result = dao.editEmp(emp);
			  	  
			  	  String msg="";
			  	  String url="";
			  	  
			  	  if(result > 0) {
			  		  msg ="수정성공";
			  		  url ="printemplist.do";
			  	  }else { //-1 (제약, 컬럼길이 문제)
			  		  msg ="수정실패";
			  		  url ="printemplist.do";
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
