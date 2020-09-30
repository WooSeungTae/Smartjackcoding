package com.lab.care;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.lab.filesave.filesaveDTO;
import com.lab.memberLog.memberLogDTO;
import com.lab.service.fileuploadService;
import com.lab.service.memberLogService;
import com.lab.service.smartMemberService;
import com.lab.smartmemberinfo.smartMemberDTO;


/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	smartMemberService memberservice;
	@Autowired
	memberLogService logservice;
	@Autowired
	fileuploadService fileservice;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);

		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);

		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "/stand/main";
	}

	@RequestMapping("header")
	public String header() {
		return "/stand/header";		
	}

	@RequestMapping("/footer")
	public String footer() {
		return "/stand/footer";
	}
	@RequestMapping("/main")
	public String main() {
		return "/stand/main";
	}
	/*로그인화면*/
	@RequestMapping("/login")
	public String login() {
		return "/member/login";
	}
	/* ----------------- 회원 관련 컨트롤-------------------------*/
	/*회원등록 화면*/
	@RequestMapping("memberRegister")
	public String memberregister() {
		return "member/memberRegister";
	}
	
	/*회원등록*/
	@RequestMapping("memberRegisterCheck")
	public String memberregisterCheck(Model model,smartMemberDTO sdto) {
		model.addAttribute("regCheck",memberservice.memberRegisterCheck(sdto));
		return "member/memberRegister";
	}

	/*로그인 확인*/
	@RequestMapping("loginCheck")
	public String loginCheck(Model model,smartMemberDTO sdto,HttpServletRequest request) {
		model.addAttribute("logCheck",memberservice.searchId(sdto, request));
		
		return "/member/login";
		
	}
	
	/*로그아웃*/
	@RequestMapping("logout")
	public String logout(HttpServletRequest request,HttpServletResponse response,memberLogDTO mdto) throws IOException {
		HttpSession mySession = request.getSession();
		String name =  (String) mySession.getAttribute("sessionName");
		String id = (String) mySession.getAttribute("sessionId");
		String jointime = (String) mySession.getAttribute("sessionJoin");
		System.out.println("조인시간"+jointime);
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH시mm분ss초");
		Date time = new Date();
		String outtime = format.format(time);
		mdto.setId(id);
		mdto.setName(name);
		mdto.setOuttime(outtime);
		mdto.setJointime(jointime);		
		if(name!=null) {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println("<script>alert('>"+name+"님 안녕히 가세요');</script>");
		out.flush();
		logservice.logOut(mdto);
		mySession.removeAttribute("sessionId");
		mySession.removeAttribute("sessionName");
		}
		return "/stand/main";
		
	}
	
	/*로그 기록*/
	@RequestMapping("memberlog")
	public String memberlog(Model model,HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("sessionId");
		model.addAttribute("loglist",logservice.memberlog(id));
		return "memberLog/memberLog";
	}
	/* ----------------- 파일 업로드-------------------------*/
	
	/*파일 업로드*/
	@RequestMapping(value="fileupload", method = RequestMethod.POST)
	public String fileupload(MultipartFile uploadfile,filesaveDTO fdto,HttpServletRequest request) {
	    String savename = fileservice.saveFile(uploadfile);
	    fdto.setSavename(savename);
	    fileservice.filesave(uploadfile,fdto,request);
	    return "redirect:galleryview";
	}
	
	/*파일 삭제*/
	@RequestMapping(value="filedel")
	public void filedel(HttpServletRequest request) {
		String savename = request.getParameter("savename");
		fileservice.filedel(savename);
	}
	
	/*이미지 보이기*/	
	@RequestMapping("galleryview")
	public String galleryview(Model model) {
		model.addAttribute("allList",fileservice.allfileview());
		return "gallery/galleryview";
	}
	
	@RequestMapping("pop")
	public String pop(Model model,HttpServletRequest request) {
		String savename = (String)request.getParameter("savename");
		model.addAttribute("savename",fileservice.pop(savename));
		return "gallery/gallerypop";
	}

}
