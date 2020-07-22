package com.identity.project.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_List;
import com.identity.project.domain.Member;
import com.identity.project.domain.Review_Like_List;
import com.identity.project.service.BoardService;
import com.identity.project.service.CommentService;
import com.identity.project.service.CommentServiceImpl;
import com.identity.project.service.MemberService;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private MemberService memberSerivce;
	
	@Autowired
	private CommentServiceImpl commentService;
	
	@RequestMapping(value="/review.net", method=RequestMethod.GET)
	public String review() {
		return "review/review_search";
	}
	
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
	public ModelAndView notice(HttpSession session, ModelAndView mv){
		String m_id = (String) session.getAttribute("m_id");//프로필 사진 부분
		Member m = memberSerivce.profile(m_id);//프로필 사진 부분
		mv.addObject("profile", m);	//프로필 사진 부분
		
		
		mv.setViewName("mypage/notice");
		return mv;
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
}
