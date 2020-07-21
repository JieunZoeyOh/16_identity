package com.identity.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Book;
import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_Date;
import com.identity.project.domain.MBTI;

@Repository
public class BoardDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> getBookList() {
		return sqlSession.selectList("Books.isbnList");
	}

	public List<String> getBookList_mbti(String m_mbti) {
		return sqlSession.selectList("Books.isbn_mbti_List", m_mbti);
	}
	
	
	public int bookInsert(Book book) {
		String isbn = book.getIsbn();
		Book check_book = new Book();
		
		check_book = sqlSession.selectOne("Books.book_check",isbn);
		
		if(check_book==null) {
			return sqlSession.insert("Books.book_insert", book);
		}
		else {
			return 0;
		}
		
	}

	public int likeInsert(String isbn) {
		Book_Like check_like= new Book_Like();
		check_like = sqlSession.selectOne("Books.like_check",isbn);
		
		if(check_like==null) {
			System.out.println("like테이블에 없다");
			return sqlSession.insert("Books.like_insert", isbn);
		}
		else {
			return 0;
		}
	}

	public Book_Like likeCount(String isbn) {
		
		Book_Like count_like = new Book_Like();
		
		count_like= sqlSession.selectOne("Books.like_count",isbn);
		
		if(count_like ==null){
			return null;
		}
		else {
			return count_like;
		}
	}

	public int like_action(Book_Like_Date bld) {
		Book_Like_Date check = new Book_Like_Date();
		check = sqlSession.selectOne("Books.like_action", bld);
		
		if(check==null) {
			return 0;
		}
		else
			return 1;
	}

	
	
	public int insert_bookmbti(String isbn, String m_mbti) {
		Book_Like book= new Book_Like();
		book = sqlSession.selectOne("Books.like_count", isbn);
		
		String book_mbti ="";
		
		String result="";
		
		if(book.getE_count()>book.getI_count())
			book_mbti +="e";
		if(book.getE_count()<book.getI_count()) {
			book_mbti +="i";
		}
		if(book.getS_count()<book.getN_count()) {
			book_mbti +="n";
		}
		if(book.getS_count()>book.getN_count()) {
			book_mbti +="s";
		}
		if(book.getT_count()<book.getF_count()) {
			book_mbti +="f";
		}
		if(book.getT_count()>book.getF_count()) {
			book_mbti +="t";
		}
		if(book.getP_count()<book.getJ_count()) {
			book_mbti +="j";
			result = book_mbti;
		}
		if(book.getP_count()>book.getJ_count()) {
			book_mbti +="p";
			result = book_mbti;
		}
		else if(book.getE_count()==book.getI_count()){
			result= m_mbti;
		}
		else if(book.getS_count()==book.getN_count()){
			result= m_mbti;
		}
		else if(book.getT_count()==book.getF_count()){
			result= m_mbti;
		}
		else if(book.getP_count()==book.getJ_count()){
			result= m_mbti;
		}
		System.out.println("적절 mbti는"+result);
		Book book_update= new Book();
		book_update.setIsbn(isbn);
		book_update.setMbti(result);
		int insert_bookmbti = sqlSession.update("Books.update_bookmbti", book_update);
		if(insert_bookmbti==1) {
			System.out.println("book_mbti 성공");
			return 1;
		}
		return 0;
	}
	
	
	public int add_like(Book_Like_Date bld) {
		
		String m_mbti = sqlSession.selectOne("Books.select_mbti", bld.getM_id());
		
		bld.setM_mbti(m_mbti);
		
		int add_like_date= sqlSession.insert("Books.add_like_date", bld);
		return add_like_date;
	}

	public int update_like(Book_Like_Date bld) {
		String m_mbti = sqlSession.selectOne("Books.select_mbti", bld.getM_id());
		MBTI user = new MBTI();
		int result=0;
		user = sqlSession.selectOne("Books.user_mbti_value", m_mbti);
		
		Book_Like book_value= new Book_Like();
		book_value= sqlSession.selectOne("Books.like_count", bld.getIsbn());
		
		book_value.setLike_count(book_value.getLike_count()+1);
		book_value.setE_count(book_value.getE_count()+user.getMbti_e());
		book_value.setI_count(book_value.getI_count()+user.getMbti_i());
		book_value.setS_count(book_value.getS_count()+user.getMbti_s());
		book_value.setN_count(book_value.getN_count()+user.getMbti_n());
		book_value.setT_count(book_value.getT_count()+user.getMbti_t());
		book_value.setF_count(book_value.getF_count()+user.getMbti_f());
		book_value.setJ_count(book_value.getJ_count()+user.getMbti_j());
		book_value.setP_count(book_value.getP_count()+user.getMbti_p());
		
		
		int update_like_ok = sqlSession.update("Books.update_like", book_value);
		if(update_like_ok==1) {
			System.out.println("좋아요 성공");
			result= 1;
		}
		else {
			System.out.println("좋아요 실패");
			result= 0;
		}
		
		int result2= insert_bookmbti(bld.getIsbn(),m_mbti);
		
		if(result2==1)
			result=1;
		else
			result=0;
		
		return result;
	}

	public int cancel_like(Book_Like_Date bld) {
		String m_mbti = sqlSession.selectOne("Books.select_mbti", bld.getM_id());
		MBTI user = new MBTI();
		int result=0;
		user = sqlSession.selectOne("Books.user_mbti_value", m_mbti);
		
		Book_Like book_value= new Book_Like();
		book_value= sqlSession.selectOne("Books.like_count", bld.getIsbn());
		
		book_value.setLike_count(book_value.getLike_count()-1);
		book_value.setE_count(book_value.getE_count()-user.getMbti_e());
		book_value.setI_count(book_value.getI_count()-user.getMbti_i());
		book_value.setS_count(book_value.getS_count()-user.getMbti_s());
		book_value.setN_count(book_value.getN_count()-user.getMbti_n());
		book_value.setT_count(book_value.getT_count()-user.getMbti_t());
		book_value.setF_count(book_value.getF_count()-user.getMbti_f());
		book_value.setJ_count(book_value.getJ_count()-user.getMbti_j());
		book_value.setP_count(book_value.getP_count()-user.getMbti_p());
		
		int update_like_ok = sqlSession.update("Books.update_like", book_value);
		if(update_like_ok==1) {
			System.out.println("좋아요 취소 성공");
			result= 1;
		}
		else {
			System.out.println("좋아요 취소 실패");
			result= 0;
		}
		
		int delete_book_like = sqlSession.delete("Books.delete_book_like", bld);
		if(delete_book_like==1)
			result=1;
		else
			result=0;
		
		
		int result2= insert_bookmbti(bld.getIsbn(),m_mbti);
		
		if(result2==1)
			result=1;
		else
			result=0;
		
		return result;
			
	}

	public int like_check(String m_id, String isbn) {
		Book_Like_Date bld= new Book_Like_Date();
		bld.setM_id(m_id);
		bld.setIsbn(isbn);
		
		Book_Like_Date bld_result = new Book_Like_Date();
		bld_result = sqlSession.selectOne("Books.like_action", bld);
		
		if(bld_result != null) {
			return 1;
		}
		else {
			return 0;
		}
		
		
	}

}
