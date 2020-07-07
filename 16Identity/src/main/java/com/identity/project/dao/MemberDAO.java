package com.identity.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Member;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Member> list() {
		return sqlSession.selectList("Members.statelist");
	}

	public int update(Member m) {
		return sqlSession.update("Members.update" , m);
	}

	public int delete(String id) {
		return sqlSession.delete("Members.delete", id);
	}
	
}
