package kr.or.bit.dto;

/*
create table memo(
	id varchar2(15) not null,
	email varchar2(20) not null,
	content varchar2(100)
); 

데이터 row 1건을 담을 수 있는 클래스 (DTO)
 */
public class adminlist {
	private String userid;
	private String pwd;
	
	public adminlist() {}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}


	@Override
	public String toString() {
		return "adminlist [userid=" + userid + ", pwd=" + pwd + "]";
	}
	
	
}
