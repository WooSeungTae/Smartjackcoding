package com.lab.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lab.memberLog.memberLogDAO;
import com.lab.memberLog.memberLogDTO;

@Service
public class memberLogService {
	@Autowired
	memberLogDAO mdao;
	
	/*로그아웃 기록 저장*/
	public void logOut(memberLogDTO mdto) {
		mdao.logOut(mdto);
	}
	
	/*로그 기록 보기*/
	public List<memberLogDTO> memberlog(String id) {
		return mdao.memberlog(id);
	}
}
