package kr.or.bit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import kr.or.bit.dto.emp;
import kr.or.bit.utils.ConnectionHelper;



public class empdao {
	
			//전체리스트 추출 
			//진성쪼끔(도움)  + 인영 
			public ArrayList<emp> getemplist() {
				
				  Connection conn = null;
		          PreparedStatement pstmt = null;
		          ResultSet rs = null;
				  ArrayList<emp> emplist = new ArrayList<>();

				  
	              try {
	    	        conn = ConnectionHelper.getConnection("oracle");
	                String sql="select empno, ename, job, mgr, hiredate, sal, comm, deptno from emp";  //이건 바꾸기 
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					
					while(rs.next()) {
						emp emp = new emp();
						emp.setEmpno(rs.getInt("empno"));
						emp.setEname(rs.getString("ename"));
						emp.setJob(rs.getString("job"));
						emp.setMgr(rs.getInt("mgr"));
						emp.setHiredate(rs.getDate("hiredate"));
						emp.setSal(rs.getInt("sal"));
						emp.setComm(rs.getInt("comm"));
						emp.setDeptno(rs.getInt("deptno"));
						
						emplist.add(emp);
						
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
	              
				//System.out.println(emplist);
				return emplist;
				
			}
	
		//부서번호로 list 추출
		//인영 
			   public ArrayList<emp> getEmplistbydeptno(String deptno) {

				      Connection conn = null;
				      PreparedStatement pstmt = null;
				      ResultSet rs = null;
				      ArrayList<emp> emplist = new ArrayList<>();
				      
				      try {
				         conn = ConnectionHelper.getConnection("oracle");
				         String sql = "select empno, ename, job, mgr, hiredate, sal, comm, deptno, filepath from emp where deptno=?";

				         pstmt = conn.prepareStatement(sql);
				         pstmt.setString(1, deptno);
				         rs = pstmt.executeQuery();
				         
				         //SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
				           // java.util.Date date = sdf.parse(rs.getString("hiredate"));
				            //Date sqlDate = new Date(date.getTime());
				            System.out.println("rs" + rs);

				         while (rs.next()) {
				            emp emp = new emp();
				            emp.setEmpno(rs.getInt("empno"));
				            emp.setEname(rs.getString("ename"));
				            emp.setJob(rs.getString("job"));
				            emp.setMgr(rs.getInt("mgr"));
				               emp.setHiredate(rs.getDate("hiredate"));
				            emp.setSal(rs.getInt("sal"));
				            emp.setComm(rs.getInt("comm"));
				            emp.setDeptno(rs.getInt("deptno"));
				            emp.setFilepath(rs.getString("filepath"));

				            emplist.add(emp);


				         }
				         System.out.println("데이터베이스 가져오니? " + emplist);
				      } catch (Exception e) {

				         e.printStackTrace();
				      } finally {
				         try {
				            rs.close();
				            pstmt.close();
				            conn.close(); // 반환하기
				         } catch (SQLException e) {
				            e.printStackTrace();
				         }
				      }

				      return emplist;

				   }

				      
				   public emp getEmplistbyempno(String empno) { //사원번호로 검색하기 (수연)
				        
				        Connection conn = null;
				        PreparedStatement pstmt = null;
				        ResultSet rs = null;
				        emp emp = new emp();
				    
				        try {
				           conn = ConnectionHelper.getConnection("oracle");
				           String sql="select empno, ename, job, mgr, hiredate, sal, comm, deptno, filepath from emp where empno=?";
				           
				           pstmt = conn.prepareStatement(sql);
				           pstmt.setString(1, empno);
				           
				           rs = pstmt.executeQuery();
				           
				           while(rs.next()) {

				            emp.setEmpno(rs.getInt("empno"));
				            emp.setEname(rs.getString("ename"));
				            emp.setJob(rs.getString("job"));
				            emp.setMgr(rs.getInt("mgr"));
				               emp.setHiredate(rs.getDate("hiredate"));
				            emp.setSal(rs.getInt("sal"));
				            emp.setComm(rs.getInt("comm"));
				            emp.setDeptno(rs.getInt("deptno"));
				            emp.setFilepath(rs.getString("filepath"));
				              
				           }
				           System.out.println("데이터나오니 : " + emp);
				        } catch (Exception e) {
				  
				           e.printStackTrace();
				           
				        }finally {
				           
				           try {
				              rs.close();
				              pstmt.close();
				              conn.close();  
				              
				           } catch (SQLException e) {
				              e.printStackTrace();
				           }

				        }
				        
				        return emp;
				  
				     }
		public emp getEmpDetail(int empno) {
			Connection conn = null;
	          PreparedStatement pstmt = null;
	          ResultSet rs = null;

	          emp emp = new emp();
			  
            try {
  	        conn = ConnectionHelper.getConnection("oracle");
              String sql="select empno, ename, job, mgr, hiredate, sal, comm, deptno, filepath from emp where empno=?";  //이건 바꾸기 
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, empno);
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {
					emp.setEmpno(rs.getInt("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setMgr(rs.getInt("mgr"));
					emp.setHiredate(rs.getDate("hiredate"));
					emp.setSal(rs.getInt("sal"));
					emp.setComm(rs.getInt("comm"));
					emp.setDeptno(rs.getInt("deptno"));
					emp.setFilepath(rs.getString("filepath"));
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
            System.out.println("너의 경로는 ? : "+emp.getFilepath()+"구나?");
            System.out.println("너 얼마버니? " + emp.getSal());
			//System.out.println(emplist);
			return emp;
		}
		
		public int deleteEmp(int empno){
			Connection conn = null;
	          PreparedStatement pstmt = null;
	          ResultSet rs = null;
			int resultrow = 0;
			try {
				conn = ConnectionHelper.getConnection("oracle");
				String sql = "delete from emp where empno=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, empno);

				resultrow = pstmt.executeUpdate();
				System.out.println("resultrow : "+resultrow);
			} catch (Exception e) {
					System.out.println("db delete : " + e.getMessage());
			} finally {
				try {
					rs.close();
					pstmt.close();
					conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
				
			}
			return resultrow;
		}
		public int editEmp(emp emp) throws SQLException {
			Connection conn = null;
	          PreparedStatement pstmt = null;
			int rowcount = 0;
//			      System.out.println( "getDeptno"+emp.getDeptno());

			try {
				conn = ConnectionHelper.getConnection("oracle");
				String sql = "update emp set deptno=?, ename=?,job=?,mgr=?,sal=?,empno=?,  comm=?, filepath=? where empno=?";
				System.out.println(emp.getDeptno());
				System.out.println(emp.getEname());
				System.out.println(emp.getJob());
				System.out.println(emp.getMgr());
				System.out.println(emp.getSal());
				System.out.println(emp.getEmpno());
				System.out.println(emp.getComm());
				pstmt = conn.prepareStatement(sql);

				pstmt.setInt(1, emp.getDeptno());
				pstmt.setString(2, emp.getEname());
				pstmt.setString(3, emp.getJob());
				pstmt.setInt(4, emp.getMgr());
				pstmt.setInt(5, emp.getSal());
				pstmt.setInt(6, emp.getEmpno());
				pstmt.setInt(7, emp.getComm());
				pstmt.setString(8, emp.getFilepath());
				pstmt.setInt(9, emp.getEmpno());
				rowcount = pstmt.executeUpdate();

			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				pstmt.close();
				conn.close();
			}
			return rowcount;
		}	
		public ArrayList<emp> emplistForChart() {
			
			  Connection conn = null;
	          PreparedStatement pstmt = null;
	          ResultSet rs = null;
			  ArrayList<emp> emplist = new ArrayList<>();

			  
            try {
  	        conn = ConnectionHelper.getConnection("oracle");
              String sql="select empno, ename, job, mgr, sal, comm, deptno from emp";  //이건 바꾸기 
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				
				while(rs.next()) {
					emp emp = new emp();
					emp.setEmpno(rs.getInt("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setMgr(rs.getInt("mgr"));
					//emp.setHiredate(rs.getDate("hiredate"));
					emp.setSal(rs.getInt("sal"));
					emp.setComm(rs.getInt("comm"));
					emp.setDeptno(rs.getInt("deptno"));
					System.out.println("ㅓㅇ나ㅣㄹ넘이런ㅁㅇ;린아  : "+emp.getEname());
					emplist.add(emp);
					
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
            
			//System.out.println(emplist);
			return emplist;
			
		}
		public int insertEmp(emp emp) {
			Connection conn =null;//추가
			PreparedStatement pstmt = null;
			int resultrow=0;
			DataSource ds;
			
		/* Date hiredate2 = Date.valueOf(hiredate); */
			
			try {
				conn= ConnectionHelper.getConnection("oracle");//추가
				
				String sql = "insert into emp(empno, ename, job, mgr, hiredate, sal, comm, deptno) values(?,?,?,?,?,?,?,?)";
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, emp.getEmpno());
				pstmt.setString(2, emp.getEname());
				pstmt.setString(3, emp.getJob());
				pstmt.setInt(4, emp.getMgr());
				pstmt.setString(5, emp.getHiredate());
				pstmt.setInt(6, emp.getSal());
				pstmt.setInt(7, emp.getComm());
				pstmt.setInt(8, emp.getDeptno());
			
				resultrow = pstmt.executeUpdate();
				
			}catch(Exception e) {
				System.out.println("Insert : " + e.getMessage());
			}finally {
				
				try {
					pstmt.close();
					conn.close(); //반환하기
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
			return resultrow;
		}
		public emp getEmpByEmpno(int empno) throws SQLException {
			Connection conn = null;
	          PreparedStatement pstmt = null;
	          ResultSet rs = null;
			emp emp = new emp();
			try {
				conn= ConnectionHelper.getConnection("oracle");//추가
				String sql = "select empno,ename, job, mgr, hiredate, sal, filepath, deptno from Emp where empno=?";

				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, empno);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					emp.setEmpno(rs.getInt("empno"));
					emp.setEname(rs.getString("ename"));
					emp.setJob(rs.getString("job"));
					emp.setMgr(rs.getInt("mgr"));
					emp.setHiredate(rs.getDate("hiredate"));
					emp.setSal(rs.getInt("sal"));
					emp.setFilepath(rs.getString("filepath"));
					emp.setDeptno(rs.getInt("deptno"));
					
					System.out.println(emp.getFilepath());
				}
			} catch (Exception e) {

			} finally {
				rs.close();
				pstmt.close();
				conn.close();
			}
			return emp;
		}
		
}
