package com.identity.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	
	
	
	
	
}
