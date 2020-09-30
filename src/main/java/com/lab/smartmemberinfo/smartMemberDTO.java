package com.lab.smartmemberinfo;

import java.sql.Date;

public class smartMemberDTO {
	private String id;
	private String pwd;
	private String name;
	private String addrFirst;
	private String addrSecond ;
	private String tel;
	private String birth;
	private Date joindate;
	private String jointime;
	
	
	public String getJointime() {
		return jointime;
	}
	public void setJointime(String jointime) {
		this.jointime = jointime;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddrFirst() {
		return addrFirst;
	}
	public void setAddrFirst(String addrFirst) {
		this.addrFirst = addrFirst;
	}
	public String getAddrSecond() {
		return addrSecond;
	}
	public void setAddrSecond(String addrSecond) {
		this.addrSecond = addrSecond;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public Date getJoindate() {
		return joindate;
	}
	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	
	
}
