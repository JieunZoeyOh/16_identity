package com.identity.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;
import com.identity.project.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@RequestMapping(value = "/reviewpost.minji", method = RequestMethod.GET)
	public ModelAndView  review_detail(ModelAndView mv) {
		int count = commentService.getListCount("8996991341 9788996991342");
		mv.setViewName("review/review_detail");
		mv.addObject("count", count);
		
		return mv;
	}
	@RequestMapping(value = "/review_commentsadd.minji", method = RequestMethod.POST)
	public String review_commentsadd(HttpServletRequest request) throws Exception {
		String content= request.getParameter("content");
		String id= request.getParameter("id");
		String isbn= request.getParameter("isbn");
		String authors= request.getParameter("authors");
		String publisher= request.getParameter("publisher");
		int book_price= Integer.parseInt(request.getParameter("book_price"));
		String book_date= request.getParameter("book_date");
		String book_contents= request.getParameter("book_contents");
		String book_image= request.getParameter("book_image");
		String title = request.getParameter("title");
		
		 Book book = new Book(); 
		 book.setIsbn(isbn); 
		 book.setB_title(title);
		 book.setB_thumbnail(book_image);
		 book.setB_authors(authors);
		 book.setB_content(book_contents); 
		 book.setB_publisher(publisher);
		 book.setB_saleprice(book_price); 
		 book.setB_datetime(book_date);
		
		System.out.println(content);
		System.out.println(id);
		System.out.println(isbn);
		System.out.println(authors);
		System.out.println(book_contents);
		System.out.println(publisher);
		System.out.println(book_price);
		System.out.println(book_date);
		
		int book_ok = commentService.bookInsert(book);
		
		if(book_ok==1) {
			System.out.println("책 데이터 삽입 성공");
		}
		else {
			System.out.println("책 데이터 이미 존재");
		}
		Comments co = new Comments();
		co.setCmt_content(content);
		co.setIsbn(isbn);
		co.setCmt_id(id);
		
		int ok = commentService.commentsInsert(co);
		if(ok==1) {
			System.out.println("댓글 데이터 삽입 성공");
		}
		return "redirect:reviewpost.minji";
	}
	
	@ResponseBody
	@PostMapping(value="CommentList.minji")
	public List<Comments> CommentList(@RequestParam("isbn") String isbn,
			@RequestParam(value="page", defaultValue="1", required=false) int page){
		List<Comments> list
			= commentService.getCommentList(isbn, page);
		return list;
	}
}
