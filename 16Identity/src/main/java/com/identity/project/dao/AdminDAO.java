package com.identity.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Suborder;
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

	public List<Joinlist> getList() {
		return sqlSession.selectList("Subscribe.joinlist");
	}

	public List<Suborder> getOrderList() {
		return sqlSession.selectList("Subscribe.orderList");
	}

	public int SubOrder(String isbn) {
		return sqlSession.insert("Subscribe.subOrder",isbn);
	}

	public List<Subscribe> distinctSub() {
		return sqlSession.selectList("Subscribe.distinctSub");
	}

	public int getTotal() {
		return sqlSession.selectOne("Subscribe.getTotal");
	}

	public int getPrice() {
		return sqlSession.selectOne("Subscribe.getPrice");
	}
	
}
