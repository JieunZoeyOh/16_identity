package com.identity.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Subscribe;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> idList(String m_id) {
		return sqlSession.selectList("Subscribe.isbnList",m_id);
	}

	public int subBook(Subscribe sub) {
		return sqlSession.insert("Subscribe.subBook",sub);
	}

	public List<Subscribe> getList() {
		return sqlSession.selectList("Subscribe.list");
	}
	
}
