package com.lab.service;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.lab.memberLog.memberLogDAO;
import com.lab.smartmemberinfo.smartMemberDAO;
import com.lab.smartmemberinfo.smartMemberDTO;


@Service
public class smartMemberService {
	@Autowired
	smartMemberDAO sdao;
	
	@Autowired
	memberLogDAO mdao;
	
	
	/*회원가입*/
	public int memberRegisterCheck(smartMemberDTO sdto) {
		try {
			sdao.memberRegister(sdto);
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	
	/*ID로 검색*/
	public int searchId(smartMemberDTO sdto,HttpServletRequest request) {
		smartMemberDTO dto2 = new smartMemberDTO();
		dto2 = sdao.searchId(sdto);
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		if(dto2!=null) {
			if(pwd.equals(dto2.getPwd())) {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH시mm분ss초");
				Date time = new Date();
				String jointime = format.format(time);
				sdto.setJointime(jointime);
				sdto.setName(dto2.getName());
				HttpSession mySession = request.getSession();
				mySession.setAttribute("sessionJoin", jointime);
				mySession.setAttribute("sessionId", id);
				mySession.setAttribute("sessionName", dto2.getName());
				mdao.logTime(sdto);
				return 1; /*id+pwd 동일 로그인 성공*/
			}else {
				return 0; /*pwd 불일치*/
			}
		}else {
			return -1; /*id 없음*/
		}
		
	}
	
	
	
	
	
}
