package com.identity.project.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.identity.project.domain.Comments_Like;
import com.identity.project.domain.Warn;
import com.identity.project.domain.Warn_Check;
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
		
		if(bookvalue==null) {
			System.out.println("책 좋아요 데이터 없음");
			Book_Like bookvalue2= new Book_Like();
			bookvalue2.setLike_count(0);
			bookvalue2.setE_count(0);
			bookvalue2.setI_count(0);
			bookvalue2.setS_count(0);
			bookvalue2.setN_count(0);
			bookvalue2.setT_count(0);
			bookvalue2.setF_count(0);
			bookvalue2.setP_count(0);
			bookvalue2.setJ_count(0);
			
			mv.setViewName("review/review_detail");
			mv.addObject("isbn", isbn);
			mv.addObject("count", count);
			mv.addObject("bookvalue", bookvalue2);
		}
		
		else {
			System.out.println("likecount값:"+bookvalue.getLike_count());
			System.out.println("e값 "+bookvalue.getE_count());
			System.out.println("i값 "+bookvalue.getI_count());
			System.out.println("S값 "+bookvalue.getS_count());
			System.out.println("N값 "+bookvalue.getN_count());
			System.out.println("T값 "+bookvalue.getT_count());
			System.out.println("F값 "+bookvalue.getF_count());
			System.out.println("P값 "+bookvalue.getP_count());
			System.out.println("J값 "+bookvalue.getJ_count());
			
		if(bookvalue.getE_count()==0 &&bookvalue.getI_count()==0) {
			bookvalue.setE_count(0);
			bookvalue.setI_count(0);
		}
		else {
			double e_percent= ((double)bookvalue.getE_count()/((double)(bookvalue.getE_count()+(double)bookvalue.getI_count())))*100;
		
			double i_percent= ((double)bookvalue.getI_count()/((double)(bookvalue.getI_count()+bookvalue.getE_count())))*100;
			
			bookvalue.setE_count(Integer.parseInt(String.valueOf(Math.round(e_percent))));
			System.out.println("E 퍼센트 값="+bookvalue.getE_count());
			bookvalue.setI_count(Integer.parseInt(String.valueOf(Math.round(i_percent))));
			System.out.println("I 퍼센트 값="+bookvalue.getI_count());
		}
		
		if(bookvalue.getS_count()==0 &&bookvalue.getN_count()==0) {
			bookvalue.setS_count(0);
			bookvalue.setN_count(0);
		}
		else {
			double s_percent= ((double)bookvalue.getS_count()/(double)(bookvalue.getS_count()+bookvalue.getN_count()))*100;
			double n_percent= ((double)bookvalue.getN_count()/(double)(bookvalue.getS_count()+bookvalue.getN_count()))*100;
			
			bookvalue.setS_count(Integer.parseInt(String.valueOf(Math.round(s_percent))));
			System.out.println("S 퍼센트 값="+s_percent);
			bookvalue.setN_count(Integer.parseInt(String.valueOf(Math.round(n_percent))));
			System.out.println("N 퍼센트 값="+n_percent);
		}
		
		if(bookvalue.getT_count()==0 &&bookvalue.getF_count()==0) {
			bookvalue.setT_count(0);
			bookvalue.setF_count(0);
		}
		else {
			double t_percent= ((double)bookvalue.getT_count()/(double)(bookvalue.getT_count()+bookvalue.getF_count()))*100;
			double f_percent= ((double)bookvalue.getF_count()/(double)(bookvalue.getT_count()+bookvalue.getF_count()))*100;
		
			bookvalue.setT_count(Integer.parseInt(String.valueOf(Math.round(t_percent))));
			System.out.println("T 퍼센트 값="+t_percent);
			bookvalue.setF_count(Integer.parseInt(String.valueOf(Math.round(f_percent))));
			System.out.println("F 퍼센트 값="+f_percent);
		}
		
		if(bookvalue.getP_count()==0 &&bookvalue.getJ_count()==0) {
			bookvalue.setP_count(0);
			bookvalue.setJ_count(0);
		}
		
		else {
			double p_percent= ((double)bookvalue.getP_count()/(double)(bookvalue.getP_count()+bookvalue.getJ_count()))*100;
			double j_percent= ((double)bookvalue.getJ_count()/(double)(bookvalue.getP_count()+bookvalue.getJ_count()))*100;
			
			bookvalue.setP_count(Integer.parseInt(String.valueOf(Math.round(p_percent))));
			System.out.println("P 퍼센트 값="+p_percent);
			bookvalue.setJ_count(Integer.parseInt(String.valueOf(Math.round(j_percent))));
			System.out.println("J 퍼센트 값="+j_percent);
		}
		
		mv.setViewName("review/review_detail");
		mv.addObject("isbn", isbn);
		mv.addObject("count", count);
		mv.addObject("bookvalue", bookvalue);
		}
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
	
	@ResponseBody
	@RequestMapping(value = "comment_warn.minji", method = RequestMethod.POST)
	public int CommentWarn(HttpSession session, HttpServletRequest request, HttpServletResponse response) throws Exception{
		System.out.println(request.getParameter("cmt_no"));
		int cmt_no =Integer.parseInt(request.getParameter("cmt_no"));
		String warn_reason=request.getParameter("warn_reason");
		System.out.println("댓글번호: "+cmt_no);
		System.out.println("신고사유: "+warn_reason);
		
		String m_id = (String) session.getAttribute("m_id");
		System.out.println("신고자 아이디: "+m_id);
		
		Warn_Check warn_check= new Warn_Check();
		warn_check.setM_id(m_id);
		warn_check.setCmt_no(cmt_no);
		warn_check.setWc_reason(warn_reason);
		
		int warn_check_ok = commentService.warn_check(warn_check);
		
		if(warn_check_ok==1) {
			Warn warn = new Warn();
			warn.setCmt_no(cmt_no);
			warn.setW_reason(warn_reason);
			int warn_ok = commentService.add_warn(warn);
			System.out.println("신고 최종 완료");
			return 1;
		}
		
		else {
			System.out.println("신고 중복");
			return 0;
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value = "comment_like.minji", method = RequestMethod.POST)
	public int CommentLike(HttpSession session, HttpServletRequest request) throws Exception{
		System.out.println("댓글 번호"+request.getParameter("cmt_no"));
		int cmt_no =Integer.parseInt(request.getParameter("cmt_no"));
		String m_id = (String) session.getAttribute("m_id");
		
		Comments_Like cmt_like = new Comments_Like();
		cmt_like.setCmt_no(cmt_no);
		cmt_like.setCmt_like_id(m_id);
		
		int cmt_like_ok= commentService.cmt_like(cmt_like);
		System.out.println("컨트롤러에서 좋아요 수:"+cmt_like_ok);
		return cmt_like_ok;
	}
	
	//test 부분
	@RequestMapping(value = "/reviewpost2.minji", method = RequestMethod.GET)
	public ModelAndView  review_detail2(ModelAndView mv, String isbn) {
		int count = commentService.getListCount(isbn);
		
		Book_Like bookvalue= new Book_Like();
		
		bookvalue = boardService.getLikeCount(isbn);
		
		if(bookvalue==null) {
			System.out.println("책 좋아요 데이터 없음");
			Book_Like bookvalue2= new Book_Like();
			bookvalue2.setLike_count(0);
			bookvalue2.setE_count(0);
			bookvalue2.setI_count(0);
			bookvalue2.setS_count(0);
			bookvalue2.setN_count(0);
			bookvalue2.setT_count(0);
			bookvalue2.setF_count(0);
			bookvalue2.setP_count(0);
			bookvalue2.setJ_count(0);
			
			mv.setViewName("review/review_detail");
			mv.addObject("isbn", isbn);
			mv.addObject("count", count);
			mv.addObject("bookvalue", bookvalue2);
		}
		
		else {
			System.out.println("likecount값:"+bookvalue.getLike_count());
			System.out.println("e값 "+bookvalue.getE_count());
			System.out.println("i값 "+bookvalue.getI_count());
			System.out.println("S값 "+bookvalue.getS_count());
			System.out.println("N값 "+bookvalue.getN_count());
			System.out.println("T값 "+bookvalue.getT_count());
			System.out.println("F값 "+bookvalue.getF_count());
			System.out.println("P값 "+bookvalue.getP_count());
			System.out.println("J값 "+bookvalue.getJ_count());
			
		if(bookvalue.getE_count()==0 &&bookvalue.getI_count()==0) {
			bookvalue.setE_count(0);
			bookvalue.setI_count(0);
		}
		else {
			double e_percent= ((double)bookvalue.getE_count()/((double)(bookvalue.getE_count()+(double)bookvalue.getI_count())))*100;
		
			double i_percent= ((double)bookvalue.getI_count()/((double)(bookvalue.getI_count()+bookvalue.getE_count())))*100;
			
			bookvalue.setE_count(Integer.parseInt(String.valueOf(Math.round(e_percent))));
			System.out.println("E 퍼센트 값="+bookvalue.getE_count());
			bookvalue.setI_count(Integer.parseInt(String.valueOf(Math.round(i_percent))));
			System.out.println("I 퍼센트 값="+bookvalue.getI_count());
		}
		
		if(bookvalue.getS_count()==0 &&bookvalue.getN_count()==0) {
			bookvalue.setS_count(0);
			bookvalue.setN_count(0);
		}
		else {
			double s_percent= ((double)bookvalue.getS_count()/(double)(bookvalue.getS_count()+bookvalue.getN_count()))*100;
			double n_percent= ((double)bookvalue.getN_count()/(double)(bookvalue.getS_count()+bookvalue.getN_count()))*100;
			
			bookvalue.setS_count(Integer.parseInt(String.valueOf(Math.round(s_percent))));
			System.out.println("S 퍼센트 값="+s_percent);
			bookvalue.setN_count(Integer.parseInt(String.valueOf(Math.round(n_percent))));
			System.out.println("N 퍼센트 값="+n_percent);
		}
		
		if(bookvalue.getT_count()==0 &&bookvalue.getF_count()==0) {
			bookvalue.setT_count(0);
			bookvalue.setF_count(0);
		}
		else {
			double t_percent= ((double)bookvalue.getT_count()/(double)(bookvalue.getT_count()+bookvalue.getF_count()))*100;
			double f_percent= ((double)bookvalue.getF_count()/(double)(bookvalue.getT_count()+bookvalue.getF_count()))*100;
		
			bookvalue.setT_count(Integer.parseInt(String.valueOf(Math.round(t_percent))));
			System.out.println("T 퍼센트 값="+t_percent);
			bookvalue.setF_count(Integer.parseInt(String.valueOf(Math.round(f_percent))));
			System.out.println("F 퍼센트 값="+f_percent);
		}
		
		if(bookvalue.getP_count()==0 &&bookvalue.getJ_count()==0) {
			bookvalue.setP_count(0);
			bookvalue.setJ_count(0);
		}
		
		else {
			double p_percent= ((double)bookvalue.getP_count()/(double)(bookvalue.getP_count()+bookvalue.getJ_count()))*100;
			double j_percent= ((double)bookvalue.getJ_count()/(double)(bookvalue.getP_count()+bookvalue.getJ_count()))*100;
			
			bookvalue.setP_count(Integer.parseInt(String.valueOf(Math.round(p_percent))));
			System.out.println("P 퍼센트 값="+p_percent);
			bookvalue.setJ_count(Integer.parseInt(String.valueOf(Math.round(j_percent))));
			System.out.println("J 퍼센트 값="+j_percent);
		}
		
		mv.setViewName("review/review_detail2");
		mv.addObject("isbn", isbn);
		mv.addObject("count", count);
		mv.addObject("bookvalue", bookvalue);
		}
		return mv;
	}
}
