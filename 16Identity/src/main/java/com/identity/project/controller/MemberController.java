package com.identity.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.PrintWriter;
import java.util.Calendar;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.identity.project.domain.Member;
import com.identity.project.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberSerivce;
	
	@Value("${savefoldername}")
	private String saveFolder;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@RequestMapping(value="/join.net", method=RequestMethod.GET)
	public String join() {
		return "member/joinForm";	//WEB-INF/views/member/joinForm.jsp
	}	
	
	//회원가입처리
	@RequestMapping(value="/joinProcess.net", method=RequestMethod.POST)
	public void joinProcess(Member member, HttpServletRequest request, HttpServletResponse response) throws Exception {
		MultipartFile uploadfile = member.getUploadfile();
		if(!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); //원래 파일명
			member.setM_original(fileName);  //원래 파일명 저장
			//새로운 폴더 이름 : 오늘 년-월-일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); //오늘 년도 구합니다.
			int month = c.get(Calendar.MONTH) + 1; //오늘 월 구합니다.
			int date = c.get(Calendar.DATE); //오늘 일 구합니다.
			
			String homedir = saveFolder + year + "-" + month + "-" + date;
			System.out.println("homedir="+homedir);
			File path1 = new File(homedir);
			if(!(path1.exists())) {
				path1.mkdir(); //새로운 폴더를 생성
			}
			
			//난수를 구합니다.
			Random r = new Random();
			int random = r.nextInt(100000000);
			
			/****확장자 구하기 시작****/
			int index = fileName.lastIndexOf(".");
			// 문자열에서 특정 문자열의 위치 값(idnex)를 반환한다.
			// indexOf가 처음 발견되는 문자열에 대한 index를 반환하는 반면,
			// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴합니다.)
			System.out.println("index = " + index);
			
			String fileExtension = fileName.substring(index+1);
			System.out.println("fileExtension = " + fileExtension);
			/****확장자 구하기 끝****/
			
			//새로운 파일명
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName = " + refileName);
			
			//오라클 디비에 저장될 파일 명
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);
			
			//transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));
			
			//바뀐 파일명으로 저장
			member.setM_file(fileDBName);
		}
		
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		
		//비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getM_password());
		System.out.println(encPassword);
		member.setM_password(encPassword);
		
		int result = memberSerivce.insert(member);
		
		out.println("<script>");
		if(result == 1) {
			out.println("alert('회원가입을 축하합니다.');");
			out.println("location.href='login.net';");
		} else {
			out.println("alert('회원가입에 실패했습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
		
	}
	  
	@RequestMapping(value="/idcheck.net", method=RequestMethod.GET)
	  public void idcheck(@RequestParam("m_id") String m_id, HttpServletResponse response) throws Exception{
		  int result = memberSerivce.isId(m_id);
		  response.setContentType("text/html;charset=utf-8");
		  PrintWriter out=response.getWriter();
		  out.print(result);
	}
	
	@RequestMapping(value="/login.net", method=RequestMethod.GET) 
	  public ModelAndView login(ModelAndView mv,
			  @CookieValue(value="saveid", required=false) Cookie readCookie) throws Exception{ 
		  if(readCookie != null) {
			  mv.addObject("saveid", readCookie.getValue());
			  System.out.println("cookie time="+readCookie.getMaxAge());
		  }
		  mv.setViewName("member/loginForm");
		  return mv;
	  }
	
	@RequestMapping(value="/logout.net", method=RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:login.net";
	}
	//updateForm.net
    @RequestMapping(value = "/updateForm.net")
    public ModelAndView member_update(HttpSession session, ModelAndView mv) throws Exception{
    	String id = (String)session.getAttribute("id");
    	Member m = memberSerivce.member_info(id);
    	mv.setViewName("mypage/updateform");
    	mv.addObject("memberinfo",m);
    	return mv;
    }
	
	//updateProcess.net
	@RequestMapping(value = "/updateProcess.net", method = RequestMethod.POST)
	public int updateProcess(Member member) throws Exception{
    	int result = memberSerivce.update(member);
    	return result;
	}
	
	@RequestMapping(value = "/delete.net")
	public int deleteProcess(String id) throws Exception{
    	int result = memberSerivce.delete(id);
    	return result;
    	
	}
	
	@RequestMapping(value="/loginProcess.net", method=RequestMethod.POST)
	  public String loginProcess(@RequestParam("m_id") String m_id, 
			  					@RequestParam("m_password") String m_password,
			  					@RequestParam(value="remember", defaultValue="") String remember,
			  					HttpServletResponse response, HttpSession session) throws Exception{
		  
		  int result = memberSerivce.isId(m_id, m_password);
		  System.out.println("결과는 " + result);
		  
		  if(result == 1) {
			  //로그인 성공
			  session.setAttribute("m_id", m_id);
			  Cookie savecookie = new Cookie("m_id", m_id);
			  if(!remember.equals("")) {
				  savecookie.setMaxAge(60*60);
				  System.out.println("쿠키 저장 : 60*60");
			  }else {
				  System.out.println("쿠키 저장 : 0");
				  savecookie.setMaxAge(0);
			  }
			  response.addCookie(savecookie);
			  return "redirect:main.com";
		  }else {
			  String message = "비밀번호가 일치하지 않습니다.";
			  if (result == -1) message = "아이디가 존재하지 않습니다.";
			  response.setContentType("text/html;charset=utf-8");
			  PrintWriter out = response.getWriter();
			  out.println("<script>");
			  out.println("alert('"+message+"');");
			  out.println("location.href='login.net';");
			  out.println("</script>");
			  out.close();
			  return null;
		  }
	  }
}
