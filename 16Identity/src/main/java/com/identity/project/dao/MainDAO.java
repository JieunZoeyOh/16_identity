package com.identity.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> mbtiList() {
		return sqlSession.selectList("Books.mbtiList");
	}

	public Map<String, List<Book>> mbtiRecommendList(List<String> mbti_list) {
		Map<String, List<Book>> mbtiRecommendList = new HashMap<String, List<Book>>();
		for(String mbti : mbti_list) {
			List<String> book_isbn = sqlSession.selectList("Books.recommend_book_isbn_list", mbti);
			List<Book> list = new ArrayList<Book>();
			for(int i=0; i<book_isbn.size(); i++) {
				list.add(sqlSession.selectOne("Books.getbookInfoFromisbn", book_isbn.get(i)));
			}
			mbtiRecommendList.put(mbti, list);
		}
		return mbtiRecommendList;
	}
	
	public List<Book> bestRecommendList() {
		List<String> book_isbn = sqlSession.selectList("Books.best_recommend_isbn_list");
		List<Book> list = new ArrayList<Book>();
		for(int i=0; i<book_isbn.size(); i++) {
			list.add(sqlSession.selectOne("Books.getbookInfoFromisbn", book_isbn.get(i)));
		}
		return list;
	}

	public List<Comments> bestReviewList() {
		List<Integer> cmt_no_list = sqlSession.selectList("Comments.best_review_cmt_no_list");
		List<Comments> list = new ArrayList<Comments>();
		for(int i : cmt_no_list) {
			list.add(sqlSession.selectOne("Comments.comment_info", i));
		}
		return list;
	}
}