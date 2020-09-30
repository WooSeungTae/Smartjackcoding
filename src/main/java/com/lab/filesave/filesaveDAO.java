package com.lab.filesave;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.lab.filesave.filesaveDTO;
@Repository
public class filesaveDAO {
	
	private final String fNamespace="com.lab.mybatis.filesave.filesave";
	
	@Autowired
	private SqlSession sqlSession;
	
	
	/*파일 내역 등록*/
	public void filesave(filesaveDTO fdto) {
		System.out.println("아이디 : "+fdto.getId());
		System.out.println("이름 : "+fdto.getName());
		System.out.println("사이즈 : "+fdto.getImagsize());
		System.out.println("저장시간 : "+fdto.getSavetime());		
		sqlSession.insert(fNamespace+".filesave",fdto);
	}
	
	/*전체 파일 검색*/
	public List<filesaveDTO> allfileview() {
		return sqlSession.selectList(fNamespace+".allfileview");
	}
	
	/*이미지 이름으로 검색*/
	public filesaveDTO pop(String savename) {
		return sqlSession.selectOne(fNamespace+".pop",savename);
	}
	
	/*파일 삭제*/
	public void filedel(String savename) {
		sqlSession.delete(fNamespace+".filedel",savename);
	}
	
	
}
