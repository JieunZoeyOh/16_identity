package com.identity.project.controller;

import java.util.*;
import java.io.*;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_Date;
import com.identity.project.domain.Book_Like_List;
import com.identity.project.domain.Member;
import com.identity.project.domain.Notice;
import com.identity.project.domain.Review_Like_List;
import com.identity.project.service.BoardService;
import com.identity.project.service.CommentService;
import com.identity.project.service.MemberService;
@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberSerivce;
	
	@Autowired
	private CommentService commentService;
	
	@Value("${savefoldername}")
	private String saveFolder;
	
	@ResponseBody
	@RequestMapping(value="/reviewLikeCmt.net", method=RequestMethod.POST)
	public Map<String, Object> reviewLC(
			@RequestParam(value="isbn") String isbn) {
		System.out.println("넘어온isbn"+isbn);
		Map<String, Object> map = new HashMap<String, Object>();
		Book_Like like = boardService.getLikeCount(isbn);
		map.put("isbn", isbn);
		if(like == null) {
			map.put("like", 0);
		} else {
			map.put("like", like.getLike_count());
		}
		map.put("comment",commentService.getListCount(isbn));
		return map;
	}
	
	@RequestMapping(value="/myBook.net")
	public ModelAndView myBook(HttpSession session, ModelAndView mv) {
		String m_id = (String) session.getAttribute("m_id");
		Member m = memberSerivce.profile(m_id);
		
		mv.setViewName("mypage/myBook");
		mv.addObject("profile", m);	//프로필 사진 부분
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value="/myBookAjax.net", method = RequestMethod.POST)
	public Map<String, Object> myBookAjax(HttpSession session, @RequestParam(value="page", defaultValue="1", required=false) int page) {
		String m_id = (String) session.getAttribute("m_id");
		//좋아요한 북 리스트
		List<Book_Like_List> bookLikelist = new ArrayList<Book_Like_List>();
		int limit = 5;
		int listcount = boardService.getLikeListCount(m_id);
		
		//총 페이지 수
		int maxpage = (listcount + limit -1 ) / limit;
		int startpage = ((page -1) / 5) * 5 + 1;
		int endpage=startpage + 5 - 1 ;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		bookLikelist = boardService.getLikeList(page, limit, m_id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("listcount", listcount);
		map.put("bookLikelist", bookLikelist);
		map.put("page", page); 
		map.put("maxpage", maxpage); 
		map.put("startpage", startpage);
		map.put("endpage", endpage); 
		map.put("limit", limit);
		return map;
	}
	
	@ResponseBody
	@RequestMapping(value="/myLikeReview.net")
	public Map<String, Object> myLikeReview(HttpSession session, @RequestParam(value="page", defaultValue="1", required=false) int page) {
		String m_id = (String) session.getAttribute("m_id");
		//좋아요한 북 리트스
		List<Review_Like_List> reviewLikelist = new ArrayList<Review_Like_List>();
		int limit = 5;
		int listcount = boardService.getReviewLikeCount(m_id);
		
		//총 페이지 수
		int maxpage = (listcount + limit -1 ) / limit;
		int startpage = ((page -1) / 5) * 5 + 1;
		int endpage=startpage + 5 - 1 ;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		reviewLikelist = boardService.getReviewLikeList(page, limit, m_id);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("listcount", listcount);
		map.put("reviewLikelist", reviewLikelist);
		map.put("page", page); 
		map.put("maxpage", maxpage); 
		map.put("startpage", startpage);
		map.put("endpage", endpage); 
		map.put("limit", limit);
		return map;
	}
	
	@RequestMapping(value="/notice.net")
	public ModelAndView notice(HttpSession session, ModelAndView mv, @RequestParam(value = "page", defaultValue = "1", required = false) int page){
		String m_id = (String) session.getAttribute("m_id");//프로필 사진 부분
		Member m = memberSerivce.profile(m_id);//프로필 사진 부분
		mv.addObject("profile", m);	//프로필 사진 부분

		int limit = 10;
		int listcount = boardService.getNoticeListCount();
		int maxpage = (listcount + limit - 1) / limit;
		int startpage = ((page - 1) / 10) * 10 + 1;
		int endpage = startpage + 10 - 1;

		if (endpage > maxpage)
			endpage = maxpage;

		List<Notice> noticelist = boardService.getNoticeList(page, limit); // 리스트 받아옴

		mv.setViewName("mypage/notice");
		mv.addObject("page", page);
		mv.addObject("maxpage", maxpage);
		mv.addObject("startpage", startpage);
		mv.addObject("endpage", endpage);
		mv.addObject("listcount", listcount);
		mv.addObject("noticelist", noticelist);
		mv.addObject("limit", limit);
		return mv;
	}
	
	// 공지사항 작성 폼 이동
	@GetMapping(value = "/NoticeWrite.net")
	public String notice_write() {
		return "mypage/notice_write";
	}
	
	@PostMapping(value = "/Noticewrite_ok.net")
	public String board_write_ok(Notice notice) {
		boardService.insertNotice(notice); // 저장 메서드 호출
		return "redirect:/notice.net";
	}
	
	@PostMapping("/NoticeAddAction.net")
	// @RequestMapping(value="/BoardAddAction.bo",method=RequestMethod.POST)
	public String bbs_write_ok(Notice notice, HttpServletRequest request) throws Exception {
		MultipartFile uploadfile = notice.getUploadfile();

		if (uploadfile != null &&!uploadfile.isEmpty()) {
			String fileName = uploadfile.getOriginalFilename(); // 원래 파일명
			notice.setN_original(fileName); // 원래 파일명 저장

			// 새로운 폴더 이름 : 오늘 년 - 월 - 일
			Calendar c = Calendar.getInstance();
			int year = c.get(Calendar.YEAR); // 오늘 년도를 구합니다
			int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
			int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
			//String saveFolder 
			//= request.getSession().getServletContext().getRealPath("resources") + "/upload/";
			String homedir = saveFolder + year + "-" + month + "-" + date;
			System.out.println(homedir);
			File path1 = new File(homedir);
			if (!(path1.exists())) {
				path1.mkdir(); // 새로운 폴더 생성
			}

			// 난수를 구합니다.
			Random r = new Random();
			int random = r.nextInt(1000000000);

			/*** 확장자 구하기 시작 ***/
			int index = fileName.lastIndexOf(".");
			// 문자열에서 특정 문자열의 위치 값(index)를 반환한다.
			// indexOf가 ㅓ음으로 발견되는 문자열에 대한 index를 반환하는 반면,
			// lastIndexOf는 마지막으로 발견되는 문자열의 index를 반환합니다.
			// (파일명에 점이 여러개 있을 경우 맨 마지막에 발견되는 문자열 위치를 리턴)
			System.out.println("index = " + index);

			String fileExtension = fileName.substring(index + 1);
			System.out.println("fileExtension = " + fileExtension);
			/*** 확장자 구하기 끝 ***/

			// 새로운 파일명
			String refileName = "bbs" + year + month + date + random + "." + fileExtension;
			System.out.println("refileName = " + refileName);

			// 오라클 디비에 저장될 파일 명
			String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
			System.out.println("fileDBName = " + fileDBName);

			// transferTo(File path) : 업로드한 파일의 매개변수의 경로에 저장합니다.
			uploadfile.transferTo(new File(saveFolder + fileDBName));

			// 바뀐 파일명으로 저장
			notice.setN_file(fileDBName);
		}

		boardService.insertNotice(notice); // 저장된 메서드 호출

		return "redirect:notice.net";
	}
	
	@GetMapping("/NoticeDetailAction.net")
	public ModelAndView Detail(int num, ModelAndView mv, HttpServletRequest request) {
		Notice notice = boardService.getDetail(num);
		if (notice == null) {
			System.out.println("상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "상세보기 실패입니다.");
		} else {
			System.out.println("상세보기 성공");
			mv.setViewName("mypage/notice_view");
			mv.addObject("notice", notice);
		}
		return mv;
	}
	
	@GetMapping("/NoticeModify.net")
	public ModelAndView BoardModifyView(int num, ModelAndView mv, HttpServletRequest request) {
		
		Notice notice = boardService.getDetail(num);

		if (notice == null) {
			System.out.println("(수정)상세보기 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "(수정)상세보기 실패입니다.");
			return mv;
		}
		System.out.println("(수정)상세보기 성공");

		mv.addObject("notice", notice);

		mv.setViewName("mypage/notice_modify");
		return mv;
	}
	
	@PostMapping("NoticeModifyAction.net")
	public ModelAndView BoardModifyAction(String before_file, Notice notice, String check, ModelAndView mv, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(notice.getPassword());
		
		boolean usercheck = boardService.ismodifyWriter(notice.getNo(), notice.getPassword());

		// 비밀번호가 다른경우
		if (usercheck != true) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 다릅니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
			return null;
		}

		MultipartFile uploadfile = notice.getUploadfile();
		System.out.println("check=" + check);

		if (check != null && !check.equals("")) { // 기존 파일 그대로 사용하는 경우입니다.
			System.out.println("기존파일 그대로 사용합니다.");
			notice.setN_original(check);

		} else {
			if (uploadfile != null && !uploadfile.isEmpty()) { // 파일 변경한 경우
				System.out.println("파일 변경되었습니다.");
				String fileName = uploadfile.getOriginalFilename(); // 원래파일명
				notice.setN_original(fileName);

				String fileDBName = fileDBName(fileName, saveFolder);

				uploadfile.transferTo(new File(saveFolder + fileDBName));

				notice.setN_file(fileDBName);
			} else { 
				System.out.println("선택 파일 없습니다.");
				notice.setN_file(""); // ""로 초기화
				notice.setN_original(""); // ""로 초기화
			}
		}

		int result = boardService.boardModify(notice);

		if (result == 0) {
			System.out.println("게시판 수정 실패");
			mv.setViewName("error/error");
			mv.addObject("url", request.getRequestURL());
			mv.addObject("message", "게시판 수정 실패");
		} else {//수정 성공
			System.out.println("게시판 수정 완료");
			System.out.println(notice.getN_file());
			System.out.println(before_file);
			String url = "redirect:NoticeDetailAction.net?num=" + notice.getNo();

			mv.setViewName(url);
		}
		return mv;
	}
	
	private String fileDBName(String fileName, String saveFolder) {
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR); // 오늘 년도 구합니다.
		int month = c.get(Calendar.MONTH) + 1; // 오늘 월 구합니다.
		int date = c.get(Calendar.DATE); // 오늘 일 구합니다.
		
		String homedir = saveFolder + year + "-" + month + "-" + date;
		System.out.println(homedir);
		File path1 = new File(homedir);

		if (!(path1.exists())) {
			path1.mkdir(); // 새로운 폴더를 생성
		}

		Random r = new Random();
		int random = r.nextInt(100000000);

		int index = fileName.lastIndexOf(".");
		System.out.println("index = " + index);

		String fileExtension = fileName.substring(index + 1);
		System.out.println("fileExtension = " + fileExtension);

		String refileName = "bbs" + year + month + date + random + "." + fileExtension;
		System.out.println("refileName = " + refileName);

		String fileDBName = "/" + year + "-" + month + "-" + date + "/" + refileName;
		System.out.println("fileDBName = " + fileDBName);

		return fileDBName;
	}
	
	@GetMapping("NoticeFileDown.net")
	public void BoardFileDown(String filename,
			HttpServletRequest request, String original,
			HttpServletResponse response) throws Exception{
		String savePath = "resources/upload";
		
		//서블릿의 실행 환경정보를 담고 있는 객체를 리턴합니다.
		ServletContext context = request.getSession().getServletContext();
		String sDownloadPath = context.getRealPath(savePath);
		
		//String sFilePath = sDownloadPath + "\\" + fileName;
		//"\" 추가하기 위해 "\\" 사용합니다.
		String sFilePath = sDownloadPath + "/" + filename;
		System.out.println(sFilePath);
		
		byte b[] = new byte[4096];
		
		//sFilePath에 있는 파일의 MimeType을 구해옵니다.
		String sMimeType = context.getMimeType(sFilePath);
		System.out.println("sMimeType>>>" + sMimeType);
		
		if (sMimeType == null)
			sMimeType = "application/octet-stream";
		response.setContentType(sMimeType);


		// - 이 부분이 한글 팡리명이 깨지는 것을 방지함.
		String sEncoding = new String(original.getBytes("utf-8"), "ISO-8859-1");
		System.out.println(sEncoding);

		/*
		 * Content-Disposition : attachment : 브라우저는 해당 Content를 처리하지 않고 , 다운로드 하게 됩니다.
		 */
		response.setHeader("Content-Disposition", "attachment; filename= " + sEncoding);

		try (
			BufferedOutputStream out2 = new BufferedOutputStream(response.getOutputStream());
			BufferedInputStream in = new BufferedInputStream(new FileInputStream(sFilePath));) {
			int numRead;
			while ((numRead = in.read(b, 0, b.length)) != -1) {
				out2.write(b, 0, numRead);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@PostMapping("NoticeDelete.net")
	public String delete(HttpServletResponse response, int no, String password) throws IOException {
		
		boolean usercheck = boardService.isBoardWriter(no, password);
		
		//비밀번호 일치하지 않는 경우
				if(usercheck == false) {
					response.setContentType("text/html;charset=utf-8");
					PrintWriter out = response.getWriter();
					out.println("<script>");
					out.println("alert('비밀번호가 다릅니다.');");
					out.println("history.back();");
					out.println("</script>");
					out.close();
					return null;
				}
				
		
		int result = boardService.deleteNotice(no);
		//삭제 처리 실패한 경우
		if(result == 0) {
			System.out.println("게시판 삭제 실패");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 실패');");
			out.println("history.back()");
			out.println("</script>");
			out.close();;
			return null;
		}
	//삭제 처리 성공한 경우 - 글 목록 보기 요청을 전송하는 부분
		System.out.println("게시판 삭제 성공");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다.');");
		out.println("location.href='notice.net';");
		out.println("</script>");
		out.close();;
		return null;
	}
	
	@RequestMapping(value="/contact.net")
	public String contact() {
		return "info/contact";
	}
	
	@RequestMapping(value="/aboutUS.net")
	public String aboutUS() {
		return "info/aboutUS";
	}
	
	@RequestMapping(value="/developers.net")
	public String developers() {
		return "info/developers";
	}
	
	@RequestMapping(value="/termsOfService.net")
	public String termsOfService() {
		return "info/TOS";
	}
	
	@ResponseBody
	@PostMapping(value = "/bookLikeCancle.net")
	public int bookLikeCancle(HttpSession session, String isbn) {
		String m_id = (String) session.getAttribute("m_id");
		Book_Like_Date bld = new Book_Like_Date();
		bld.setM_id(m_id);
		bld.setIsbn(isbn);
		int result = boardService.cancel_like(bld);
		return result;
	}
	
	@ResponseBody
	@PostMapping(value = "/reviewLikeCancle.net")
	public int reviewLikeCancle(int cmt_like_no) {
		int result = commentService.cancel_like(cmt_like_no);
		return result;
	}
	
	@RequestMapping(value="/review.net", method=RequestMethod.GET)
	public String review() {
		return "review/review_board";
	}
	
	@RequestMapping(value="/reviewSearch.net", method=RequestMethod.POST)
    public ModelAndView reviewSearch(String searchWord, ModelAndView mv,
	         @RequestParam(value="category",defaultValue="전체", required=false) String category) {
      
    	mv.setViewName("review/review_search");
    	mv.addObject("searchWord", searchWord);
    	mv.addObject("category", category);
    	System.out.println(searchWord);
    	System.out.println(category);
    	return mv;
    }
	
	@ResponseBody
	@RequestMapping(value="/reviewBoardAjax.net")
	public Map<String, Object> reviewBoard(String sort, @RequestParam(value="mbti[]") List<String> mbti,
					@RequestParam(value="page", defaultValue="1", required=false) int page) {
		Map<String, Object> map = new HashMap<String, Object>();
		int limit = 10;
		List<String> mbtilist = new ArrayList<String>();

		for (String a:mbti) {
			if(!a.contains("all")) {
				mbtilist.add(a);
				System.out.println(a);
			}
		}
		
		int listcount = commentService.getListCount(sort, mbtilist);
		System.out.println(listcount);
		System.out.println(sort+"sort는");
		List<Review_Like_List> reviewlist = new ArrayList<Review_Like_List>();
		reviewlist = commentService.getReviewList(page, limit, sort, mbtilist);
		
		//총 페이지 수
		int maxpage = (listcount + limit -1 ) / limit;
		int startpage = ((page -1) / 10) * 10 + 1;
		int endpage=startpage + 10 - 1 ;
		if(endpage > maxpage) {
			endpage = maxpage;
		}
		
		map.put("listcount", listcount);
		map.put("reviewlist", reviewlist);
		map.put("page", page); 
		map.put("sort", sort); 
		map.put("maxpage", maxpage); 
		map.put("startpage", startpage);
		map.put("endpage", endpage); 
		map.put("limit", limit);
		map.put("mbti", mbti);
		return map;
	}
}
