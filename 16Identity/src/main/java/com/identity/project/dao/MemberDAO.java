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

	public Member isId(String m_id) {
		return sqlSession.selectOne("Members.idcheck",m_id);
	}

	public int insert(Member member) {
		return sqlSession.insert("Members.insert", member);
	}
	
	public int update(Member m) {
		return sqlSession.update("Members.update" , m);
	}

	public int delete(String id) {
		return sqlSession.delete("Members.delete", id);
	}
	
}
