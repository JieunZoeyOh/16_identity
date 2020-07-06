package com.identity.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.identity.project.domain.Comments;
import com.identity.project.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/reviewpost.minji", method = RequestMethod.GET)
	public String review_detail() {
		return "review/review_detail";
	}
	
	@ResponseBody
	@RequestMapping(value = "/review_commentsadd.minji", method = RequestMethod.POST)
	public void review_commentsadd(HttpServletRequest request) throws Exception {
		String content= request.getParameter("content");
		String id= request.getParameter("id");
		String isbn= request.getParameter("isbn");
		String authors= request.getParameter("authors");
		String publisher= request.getParameter("publisher");
		String book_price= request.getParameter("book_price");
		String book_date= request.getParameter("book_date");
		String book_contents= request.getParameter("book_contents");
		String book_image= request.getParameter("book_image");
		
		System.out.println(content);
		System.out.println(id);
		System.out.println(isbn);
		
		Comments co = new Comments();
		co.setCmt_content(content);
		co.setIsbn(isbn);
		co.setCmt_id(id);
		
		int ok = commentService.commentsInsert(co);
	}
}
