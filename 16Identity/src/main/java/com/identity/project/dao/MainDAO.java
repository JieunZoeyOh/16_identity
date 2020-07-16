package com.identity.project.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Book;

@Repository
public class MainDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> mbtiList() {
		return sqlSession.selectList("Books.mbtiList");
	}

	public Map<String, List<List<Book>>> mbtiRecommendList(List<String> mbti_list) {
		Map<String, List<List<Book>>> mbtiRecommendList = new HashMap<String, List<List<Book>>>();
		for(String mbti : mbti_list) {
			List<String> book_isbn = sqlSession.selectList("Books.recommend_book_isbn_list", mbti);
			List<List<Book>> list = new ArrayList<List<Book>>();
			for(int i=0; i<book_isbn.size(); i++) {
				list.add(sqlSession.selectList("Books.getbookInfoFromisbn", book_isbn.get(i)));
			}
			mbtiRecommendList.put(mbti, list);
		}
		return mbtiRecommendList;
	}
}