package com.lab.memberLog;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.lab.smartmemberinfo.smartMemberDTO;

@Repository
public class memberLogDAO {
	
	private final String lNamespace = "com.lab.mybatis.memberLog.memberLog";
	
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/*로그인 기록 저장*/
	public void logTime(smartMemberDTO sdto) {
		sqlSession.insert(lNamespace+".logTime",sdto);
	}
	
	/*로그아웃 기록 저장*/
	public void logOut(memberLogDTO mdto) {
		sqlSession.update(lNamespace+".logOut",mdto);
	}
	
	/*로그 기록 보기*/
	public List<memberLogDTO> memberlog(String id){
		return sqlSession.selectList(lNamespace+".memberlog",id);
	}
	
}
