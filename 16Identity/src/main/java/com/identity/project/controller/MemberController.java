package com.identity.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import com.identity.project.domain.Comments;
import com.identity.project.domain.Member;
import com.identity.project.service.CommentService;
import com.identity.project.service.MemberService;
import com.identity.project.task.SendMail;
import com.identity.project.domain.MailVO;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberSerivce;

	@Autowired
	private CommentService commentService;
	
	@Value("${savefoldername}")
	private String saveFolder;

	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Autowired
	private SendMail sendMail;
	

	@RequestMapping(value = "/join.net", method = RequestMethod.GET)
	public String join() {
		return "member/joinForm"; // WEB-INF/views/member/joinForm.jsp
	}

	// 회원가입처리
	@RequestMapping(value = "/joinProcess.net", method = RequestMethod.POST)
	public void joinProcess(Member member, HttpServletResponse response) throws Exception {
		MultipartFile uploadfile = member.getUploadfile();
		if (!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
			member.setM_original(fileName); // 원래 파일명 저장
			// 새로운 폴더 이름 : 오늘 년-월-일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
			int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
			int date = c.get(Calendar.DATE); // 오늘 일 구합니다.

			String homedir = saveFolder + year + "-" + month + "-" + date;
			System.out.println("homedir=" + homedir);
			File path1 = new File(homedir);
			if (!(path1.exists())) {
				path1.mkdir(); // 새로운 폴더를 생성
			}

			// 난수를 구합니다.
			Random r = new Random();
			int random = r.nextInt(100000000);

			/**** 확장자 구하기 시작 ****/
			int index = fileName.lastIndexOf(".");
			System.out.println("index = " + index);

			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			/**** 확장자 구하기 끝 ****/

			// 새로운 파일명
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName = " + refileName);

			// 오라클 디비에 저장될 파일 명
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);

			// transferTo(File path) : 업로드한 파일을 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			member.setM_file(fileDBName);
		}

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		// 비밀번호 암호화 추가
		String encPassword = passwordEncoder.encode(member.getM_password());
		System.out.println(encPassword);
		member.setM_password(encPassword);
		String about = member.getM_address_about();
		String address = member.getM_address();
		member.setM_address(address+" "+about);//주소와 상세 주소 합치기
		int result = memberSerivce.insert(member);

		out.println("<script>");
		if (result == 1) {
			out.println("alert('회원가입을 축하합니다.');");
			out.println("location.href='login.net';");
		} else {
			out.println("alert('회원가입에 실패했습니다.');");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping(value = "/idcheck.net", method = RequestMethod.GET)
	public void idcheck(@RequestParam("m_id") String m_id, HttpServletResponse response) throws Exception {
		int result = memberSerivce.isId(m_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	//닉네임체크
	@RequestMapping(value = "/nickcheck.net", method = RequestMethod.GET)
	public void nickcheck(@RequestParam("m_nickname") String m_nickname, HttpServletResponse response) throws Exception {
		int result = memberSerivce.isNick(m_nickname);
		//부터 시작
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(result);
	}
	
	// 아이디 찾기 폼
	@RequestMapping(value = "/find_id.net")
	public String find_id_form() throws Exception{
		return "member/find_id";
	}
	
	// 아이디 찾았을때
	@RequestMapping(value = "/find_id2.net", method = RequestMethod.GET)
	public ModelAndView find_id(HttpServletResponse response, String m_name, String m_phone, ModelAndView mv) throws Exception{
		String result = memberSerivce.find_id(m_name, m_phone);
		if(result != null && result != "") {
			mv.addObject("id",result);
			mv.setViewName("member/find_id_ok");
			return mv;
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('회원정보가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
	@RequestMapping(value = "/find_pass.net")
	public String find_pass_form() throws Exception{
		return "member/find_pass";
	}
	

	@RequestMapping(value = "/newPass.net", method = RequestMethod.POST)
	public void find_pass(@RequestParam("m_id")String m_id, HttpServletResponse response) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		Member member = memberSerivce.check(m_id);
		if(member == null) { 
		out.println("<script>");
		out.println("alert('저장된 ID가 없습니다.');");
		out.println("history.back()");
		out.println("</script>");
		}else {
			Random r = new Random();
			int num = r.nextInt(89999) + 10000;
			String newpass = "mbti"+Integer.toString(num); // 비밀번호 저장
			String encPassword = passwordEncoder.encode(newpass);
			member.setM_password(encPassword);
			int result = memberSerivce.newPassword(member);
			//여기부터 메일 보내기
			if(result == 1) {
				MailVO vo = new MailVO();
				vo.setFrom("dntrlsl02@naver.com");
				vo.setTo(member.getM_id());
				vo.setSubject(member.getM_name() + "님 ! 비밀번호를 알려드려요");
				vo.setContent(member.getM_name() + "님의 새로운 비밀번호는 " + newpass + " 입니다.");
				sendMail.sendMail(vo);
				out.println("<script>");
				out.println("alert('비밀번호 변경에 성공했습니다. 이메일을 확인해주세요');");
				out.println("location.href='login2.net'");
				out.println("</script>");
			}
		}
	}

	@RequestMapping(value = "/login.net", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login2(ModelAndView mv, @CookieValue(value = "saveid", required = false) Cookie readCookie)
			throws Exception {
		if (readCookie != null) {
			mv.addObject("saveid", readCookie.getValue());
			System.out.println("cookie time=" + readCookie.getMaxAge());
		}
		mv.setViewName("member/loginForm");
		return mv;
	}

	@RequestMapping(value = "/logout.net", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "redirect:login.net";
	}

	// passchk.net
	@PostMapping(value = "/passchk.net")
	public void passchk(String password, HttpServletResponse response, HttpSession session) throws Exception {
		String id = (String) session.getAttribute("m_id");
		int result = memberSerivce.isId(id, password);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if (result == 1) {
			out.println("location.href='updateForm.net'");
		} else {
			String message = "비밀번호가 일치하지 않습니다.";
			out.println("alert('" + message + "');");
			out.println("history.back();");
		}
		out.println("</script>");
		out.close();
	}

	// updateForm.net
	@RequestMapping(value = "/updateForm.net")
	public ModelAndView member_update(HttpSession session, ModelAndView mv) throws Exception {
		String id = (String) session.getAttribute("m_id");
		System.out.println("확인:" + id);
		Member m = memberSerivce.member_info(id);
		System.out.println("확인:" + m.getM_file());
		mv.setViewName("mypage/updateform");
		mv.addObject("memberinfo", m);
		return mv;
	}

	// updateProcess.net
	@ResponseBody
	@RequestMapping(value = "/updateProcess.net", method = RequestMethod.POST)
	public void updateProcess(Member member, HttpServletResponse response, HttpServletRequest request, String check)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");

		MultipartFile uploadfile = member.getUploadfile();
		System.out.println("check = " + check);

		if (check != null && !check.equals("")) { // 기존파일 그대로사용하는 경우
			System.out.println("기존파일 그대로 사용합니다.");
		} else {

			if (uploadfile != null && !uploadfile.isEmpty()) { // 파일 변경한 경우 
				System.out.println("파일 변경되었습니다. ");

				String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
				member.setM_original(fileName);

				String fileDBName = fileDBName(fileName, saveFolder);

				// transferTo(File path) : 업로드 한 파일을 매개변수의 경로에 저장
				uploadfile.transferTo(new File(saveFolder + fileDBName));

				// 바뀐 파일명으로 저장
				member.setM_file(fileDBName);

			} else { // uploadfile.isEmpty() 인 경우 - 기존 파일 제거한 경우

				System.out.println(" uploadfile.isEmpty()");
				System.out.println("선택 파일이 없습니다. ");

				// <input type = "hidden" name = "m_file" value ="${m.m_file}">
				// 위 태그에 값이 있다면 "" 로 값을 초기화한다.
				member.setM_file("");
				member.setM_original("");
			}
		}
		
		PrintWriter out = response.getWriter();
		String encPassword = passwordEncoder.encode(member.getM_password());
		System.out.println(encPassword);
		member.setM_password(encPassword);
		out.println("<script>");
		int result = memberSerivce.update(member);
		
		// 삽입이 된 경우
		if (result == 1) {
			out.println("alert('수정되었습니다');");
			out.println("location.href='main.com';");

		} else {
			out.println("alert('회원 정보 수정 실패 하였습니다.');");
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();

	}

	private String fileDBName(String fileName, String saveFolder) {
		// 새로운 폴더 이름 : 오늘 년-월-일
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); 
		int month = c.get(Calendar.MONTH) + 1;
		int date = c.get(Calendar.DATE);

		String homedir = saveFolder + year + "-" + month + "-" + date;
		System.out.println(homedir);
		File path1 = new File(homedir);
		if (!(path1.exists())) {
			path1.mkdir(); // 새로운 폴더 생성
		}

		// 난수를 구한다.
		Random r = new Random();
		int random = r.nextInt(100000000);

		/*** 확장자 구하기 시작 ***/
		int index = fileName.lastIndexOf(".");

		// 문자열에서 특정 문자열의 위치값(index) 를 반환한다.
		// indexOf 가 처음 발견되는 문자열에 대한 index 를 반환하는 반면 ,
		// lastIndexOf 는 마지막으로 발견되는 문자열의 index 를 반환한다.
		// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열의 위치를 리턴한다.)
		System.out.println("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		/*** 확장자 구하기 끝 ***/

		// 새로운 파일명
		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		// 오라클 디비에 저장될 파일명
		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}

	@RequestMapping(value = "/delete.net")
	public void deleteProcess(Member member, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		System.out.println(request.getParameter("id"));
		member.setM_id(request.getParameter("id"));
		int result = memberSerivce.delete(member);
		out.println("<script>");

		// 탈퇴된 경우
		if (result == 1) {
			out.println("alert('탈퇴가 완료 되었습니다.');");
			out.println("location.href='login.net';");
		} else {
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();

	}

	@RequestMapping(value = "/loginProcess.net", method = RequestMethod.POST)
	public String loginProcess(@RequestParam("m_id") String m_id, @RequestParam("m_password") String m_password,
			@RequestParam(value = "remember", defaultValue = "") String remember, HttpServletResponse response,
			HttpSession session) throws Exception {

		int result = memberSerivce.isId(m_id, m_password); //부터 시작
		String m_nickname = memberSerivce.getNickname(m_id);
		String mbti_nickname = memberSerivce.getMbtiNickname(m_id);
		String state = memberSerivce.getState(m_id);
		if (result == 1) {
			// 로그인 성공
			session.setAttribute("m_id", m_id);
			//header mbti별명, 닉네임 환영합니다.
			session.setAttribute("m_nickname", m_nickname);
			session.setAttribute("mbti_nickname", mbti_nickname);
			//Subscribe //구독 신청 상태 값 넘기기
			session.setAttribute("substate", state);
			Cookie savecookie = new Cookie("saveid", m_id);
			if (!remember.equals("")) {
				savecookie.setMaxAge(60 * 60);
				System.out.println("쿠키 저장 : 60*60");
			} else {
				System.out.println("쿠키 저장 : 0");
				savecookie.setMaxAge(0);
			}
			response.addCookie(savecookie);
			return "redirect:main.com";
		} else {
			String message = "비밀번호가 일치하지 않습니다.";
			if (result == -1)
				message = "아이디가 존재하지 않습니다.";
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('" + message + "');");
			out.println("location.href='login.net';");
			out.println("</script>");
			out.close();
			return null;
		}
	}
	
	//myReview.net 
	@RequestMapping(value = "/myReview.net")
	public ModelAndView review(HttpSession session, ModelAndView mv,HttpServletRequest request) throws Exception {
		String id = (String) session.getAttribute("m_id");
		System.out.println("확인:" + id);
		Member m = memberSerivce.profile(id);
		List<Comments> commentlist = commentService.getmyCommentList(id);
		int listcount = commentService.listcount(id); //내 리뷰 댓글 count
		
		mv.setViewName("mypage/myReview");
		mv.addObject("profile", m);
		mv.addObject("listcount",listcount);
		mv.addObject("commentlist",commentlist);
		return mv;
	}
	
	@RequestMapping(value="/myBook.net")
	public ModelAndView myBook(HttpSession session, ModelAndView mv) {
		String id = (String) session.getAttribute("m_id");
		Member m = memberSerivce.profile(id);
		
		mv.setViewName("mypage/myBook");
		mv.addObject("profile", m);
		return mv;
	}
}
