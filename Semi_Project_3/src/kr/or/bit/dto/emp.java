package kr.or.bit.dto;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class emp {
	private int empno;
	private String ename;
	private String job;
	private int mgr;
	private String hiredate; //수정
	private int sal;
	private int comm;
	private int deptno;
	private String filepath;
	
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getEmpno() {
		return empno;
	}
	public void setEmpno(int empno) {
		this.empno = empno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public int getMgr() {
		return mgr;
	}
	public void setMgr(int mgr) {
		this.mgr = mgr;
	}

	public int getSal() {
		return sal;
	}
	public void setSal(int sal) {
		this.sal = sal;
	}
	public String getHiredate() {
		return hiredate;
	}
	
    public void setHiredate(java.util.Date sqlDate) {
	   SimpleDateFormat formatter = new SimpleDateFormat ("yyyy-MM-dd");
	this.hiredate =  formatter.format(sqlDate);
	}
	public int getComm() {
		return comm;
	}
	public void setComm(int comm) {
		this.comm = comm;
	}
	public int getDeptno() {
		return deptno;
	}
	public void setDeptno(int deptno) {
		this.deptno = deptno;
	}
	@Override
	public String toString() {
		return "emp [empno=" + empno + ", ename=" + ename + ", job=" + job + ", mgr=" + mgr + ", hiredate=" + hiredate
				+ ", sal=" + sal + ", comm=" + comm + ", deptno=" + deptno + ", filepath=" + filepath + "]";
	}

	
	
}
