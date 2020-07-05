package com.identity.project.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Comments;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int commentsInsert(Comments co) {
		String mbti = sqlSession.selectOne("Comments.member_mbti", co.getCmt_id());
		co.setCmt_mbti(mbti);
		System.out.println("co_mbti="+co.getCmt_mbti());
		System.out.println("id="+co.getCmt_id());
		System.out.println("isbn="+co.getIsbn());
		return sqlSession.insert("Comments.insert", co);
	}
}
