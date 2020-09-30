package com.lab.smartmemberinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class smartMemberDAO {
	private final String sNamespace ="com.lab.mybatis.memberMapper.memberMapper";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/*회원등록*/
	public void memberRegister(smartMemberDTO sdto) {
		sqlSession.insert(sNamespace+".memberRegister",sdto);
	}
	
	/*ID로 검색*/
	public smartMemberDTO searchId(smartMemberDTO sdto) {
		return sqlSession.selectOne(sNamespace+".searchId",sdto);
	}
	
	
}
