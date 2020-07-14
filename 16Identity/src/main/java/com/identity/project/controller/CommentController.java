package com.identity.project.controller;

import java.io.PrintWriter;
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
import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_Date;
import com.identity.project.domain.Comments;
import com.identity.project.service.BoardService;
import com.identity.project.service.CommentService;

@Controller
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/reviewpost.minji", method = RequestMethod.GET)
	public ModelAndView  review_detail(ModelAndView mv, String isbn) {
		int count = commentService.getListCount(isbn);
		
		Book_Like bookvalue= new Book_Like();
		
		bookvalue = boardService.getLikeCount(isbn);
		
		System.out.println("likecount값:"+bookvalue.getLike_count());
		
		if(bookvalue.getE_count()==0 &&bookvalue.getI_count()==0) {
			bookvalue.setE_count(0);
			bookvalue.setI_count(0);
		}
		else {
			int e_percent= bookvalue.getE_count()/(bookvalue.getE_count()+bookvalue.getI_count())*100;
			bookvalue.setE_count(e_percent);
			System.out.println("E 퍼센트 값="+e_percent);
		
			int i_percent= bookvalue.getI_count()/(bookvalue.getE_count()+bookvalue.getI_count())*100;
			bookvalue.setI_count(i_percent);
			System.out.println("I 퍼센트 값="+i_percent);
		}
		
		if(bookvalue.getS_count()==0 &&bookvalue.getN_count()==0) {
			bookvalue.setS_count(0);
			bookvalue.setN_count(0);
		}
		else {
			int s_percent= bookvalue.getS_count()/(bookvalue.getS_count()+bookvalue.getN_count())*100;
			bookvalue.setS_count(s_percent);
			System.out.println("S 퍼센트 값="+s_percent);
			
			int n_percent= bookvalue.getN_count()/(bookvalue.getS_count()+bookvalue.getN_count())*100;
			bookvalue.setN_count(n_percent);
			System.out.println("N 퍼센트 값="+n_percent);
		}
		
		if(bookvalue.getT_count()==0 &&bookvalue.getF_count()==0) {
			bookvalue.setT_count(0);
			bookvalue.setF_count(0);
		}
		else {
			int t_percent= bookvalue.getT_count()/(bookvalue.getT_count()+bookvalue.getF_count())*100;
			bookvalue.setT_count(t_percent);
			System.out.println("T 퍼센트 값="+t_percent);
			
			int f_percent= bookvalue.getF_count()/(bookvalue.getT_count()+bookvalue.getF_count())*100;
			bookvalue.setF_count(f_percent);
			System.out.println("F 퍼센트 값="+f_percent);
		}
		
		if(bookvalue.getP_count()==0 &&bookvalue.getJ_count()==0) {
			bookvalue.setP_count(0);
			bookvalue.setJ_count(0);
		}
		
		else {
			int p_percent= bookvalue.getP_count()/(bookvalue.getP_count()+bookvalue.getJ_count())*100;
			bookvalue.setP_count(p_percent);
			System.out.println("P 퍼센트 값="+p_percent);
			
			int j_percent= bookvalue.getJ_count()/(bookvalue.getP_count()+bookvalue.getJ_count())*100;
			bookvalue.setJ_count(j_percent);
			System.out.println("J 퍼센트 값="+j_percent);
		}
		
		mv.setViewName("review/review_detail");
		mv.addObject("isbn", isbn);
		mv.addObject("count", count);
		mv.addObject("bookvalue", bookvalue);
		
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
		String translators= request.getParameter("translators");
		
		 Book book = new Book(); 
		 book.setIsbn(isbn); 
		 book.setB_title(title);
		 book.setB_thumbnail(book_image);
		 book.setB_authors(authors);
		 book.setB_content(book_contents); 
		 book.setB_publisher(publisher);
		 book.setB_saleprice(book_price); 
		 book.setB_datetime(book_date);
		 book.setB_translators(translators);
		 
		int book_ok = boardService.bookInsert(book);
		
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
		
		int like_ok = boardService.likeInsert(isbn);
		
		if(like_ok==1) {
			System.out.println("좋아요 테이블 삽입 성공");
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
	
	@RequestMapping(value = "comment_delete.minji", method = RequestMethod.GET)
	public ModelAndView CommentDelete(ModelAndView mv, HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(request.getParameter("cmt_no"));
		String cmt_no =request.getParameter("cmt_no");
		int delete_ok = commentService.comment_delete(cmt_no);
		
		if(delete_ok==1) {
			System.out.println("댓글삭제");
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('리뷰가 삭제되었습니다.');");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		mv.setViewName("review/review_detail");
		return mv;
	}
	
	@RequestMapping(value = "/review_commentsupdate.minji", method = RequestMethod.POST)
	public String review_commentsupdate(HttpServletRequest request) throws Exception {
		String content= request.getParameter("content");
		int cmt_no= Integer.parseInt(request.getParameter("cmt_no")); 
		System.out.println("댓글내용:"+content);
		System.out.println("댓글번호:"+cmt_no);
		
		Comments cmt = new Comments();
		
		cmt.setCmt_content(content);
		cmt.setCmt_no(cmt_no);
		
		int ok = commentService.commentsUpdate(cmt);
		if(ok==1) {
			System.out.println("댓글 데이터 수정 성공");
		}
		
		return "redirect:reviewpost.minji";
	}
	
	@ResponseBody
	@RequestMapping(value = "like_action.minji", method = RequestMethod.POST)
	public int like_action(ModelAndView mv, HttpServletRequest request) throws Exception {
		System.out.println("컨트롤러 도착");
		
		String authors= request.getParameter("authors");
		String publisher= request.getParameter("publisher");
		int book_price= Integer.parseInt(request.getParameter("book_price"));
		String book_date= request.getParameter("book_date");
		String book_contents= request.getParameter("book_contents");
		String book_image= request.getParameter("book_image");
		String title = request.getParameter("title");
		String translators= request.getParameter("translators");
		String isbn =request.getParameter("isbn");
		String id= request.getParameter("id");
		
		
		Book book = new Book(); 
		 book.setIsbn(isbn); 
		 book.setB_title(title);
		 book.setB_thumbnail(book_image);
		 book.setB_authors(authors);
		 book.setB_content(book_contents); 
		 book.setB_publisher(publisher);
		 book.setB_saleprice(book_price); 
		 book.setB_datetime(book_date);
		 book.setB_translators(translators);
		
		 int book_ok = boardService.bookInsert(book);
			
		if(book_ok==1) {
			System.out.println("책 데이터 삽입 성공");
		}
		else {
			System.out.println("책 데이터 이미 존재");
		}
		 
		
		int like_ok = boardService.likeInsert(isbn);
		
		if(like_ok==1) {
			System.out.println("좋아요 테이블 삽입 성공");
		}
		
		Book_Like_Date bld = new Book_Like_Date();
		bld.setM_id(id);
		bld.setIsbn(isbn);
		int like_possible= boardService.like_action(bld); //좋아요 중복 방지
		
		if(like_possible==1) {
			System.out.println("이미 좋아요한 사람입니다.");
			int cancel_ok = boardService.cancel_like(bld);
			System.out.println("좋아요 취소 결과:"+cancel_ok);
			Book_Like bookvalue2= new Book_Like();
			bookvalue2 = boardService.getLikeCount(isbn);
			return bookvalue2.getLike_count();
		}
		
		System.out.println("좋아요 안한 사람입니다.");
		int add_like = boardService.add_like(bld);
		int update_like= boardService.update_like(bld);
		System.out.println("좋아요 결과:"+update_like);
		Book_Like bookvalue3= new Book_Like();
		bookvalue3 = boardService.getLikeCount(isbn);
		return bookvalue3.getLike_count();
	}
	
}
