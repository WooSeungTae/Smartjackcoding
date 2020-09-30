package com.lab.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.lab.filesave.filesaveDAO;
import com.lab.filesave.filesaveDTO;


@Service
public class fileuploadService {
	private static final String SAVE_PATH = "D:\\Java\\projectWorkSpace\\SmartjackTest\\src\\main\\webapp\\image";
	private static final String Del_PATH = "D:\\Java\\projectWorkSpace\\SmartjackTest\\src\\main\\webapp";
	@Autowired
	filesaveDAO fdao;
	
	/*파일 등록*/
	public String saveFile(MultipartFile uploadfile) {
		UUID uuid = UUID.randomUUID();
		String saveName = uuid+"_"+uploadfile.getOriginalFilename();
		File saveFile = new File(SAVE_PATH,saveName);
		try {
			uploadfile.transferTo(saveFile); /*특정파일로 저장*/
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
		return saveName;
	}
	
	/*파일 삭제*/
	public void delFile(String savename) {
		String deletePath = Del_PATH +"\\image\\"+savename;
		File deletefile = new File(deletePath);
		System.out.println("파일경로 : "+deletePath);
		System.out.println("지울파일 : "+deletefile);
		if(deletefile.exists()==true) {			
			deletefile.delete();
			System.out.println("파일이 삭제됩니다.");
		}
	}
	
	/*파일 내역 등록*/
	public void filesave(MultipartFile uploadfile,filesaveDTO fdto,HttpServletRequest request) {
		HttpSession mySession = request.getSession();
		String id = (String) mySession.getAttribute("sessionId");
		String name =  (String) mySession.getAttribute("sessionName");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH시mm분ss초");
		Date time = new Date();
		String savetime = format.format(time);
		fdto.setId(id);
		fdto.setName(name);
		fdto.setImagsize(uploadfile.getSize()+"byte");
		fdto.setSavetime(savetime);
		fdao.filesave(fdto);
	}
	
	/*파일 삭제*/
	public void filedel(String savename) {
		fdao.filedel(savename);
		delFile(savename);		
	}
	
	
	/*전체 파일 검색*/
	public List<filesaveDTO> allfileview() {
		return fdao.allfileview();
	}
	
	/*이미지 이름으로 검색*/
	public filesaveDTO pop(String savename) {
		return fdao.pop(savename);
	}
	
}
