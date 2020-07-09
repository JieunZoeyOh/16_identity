package com.identity.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Book;
import com.identity.project.domain.Book_Like;

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

	public int likeCount(String isbn) {
		
		Book_Like count_like = new Book_Like();
		
		count_like= sqlSession.selectOne("Books.like_count",isbn);
		
		if(count_like ==null){
			return 0;
		}
		else {
			int count = count_like.getLike_count();
			return count;
		}
	}
	
	
}
