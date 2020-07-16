package com.identity.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BoardController {
	//@Autowired
	//private BoardService boardService;
	
	@RequestMapping(value="/review.net", method=RequestMethod.GET)
	public String review() {
		return "review/review_search";
	}
}
