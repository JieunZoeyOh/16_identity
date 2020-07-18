package com.identity.project.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.identity.project.domain.Book_Like;
import com.identity.project.service.BoardService;
import com.identity.project.service.CommentService;
import com.identity.project.service.CommentServiceImpl;

@Controller
public class BoardController {
	@Autowired
	private BoardService boardService;
	
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
}
