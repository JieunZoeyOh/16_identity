package com.identity.project.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;

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

	public int delete(Member m) {
		return sqlSession.delete("Members.delete", m);
	}

	public Member member_info(String id) {
		return sqlSession.selectOne("Members.idcheck",id);
	}

	public String getMbti(String m_id) {
		return sqlSession.selectOne("Members.mbti",m_id);
	}

	public String getNickname(String m_id) {
		return sqlSession.selectOne("Members.getNickname",m_id);
	}

	public String getMbtiNickname(String m_id) {
		return sqlSession.selectOne("Members.getMbtiNickname",m_id);
	}

	public Member profile(String m_id) {
		return sqlSession.selectOne("Members.profile",m_id);
	}
		
	public String getState(String m_id) {
		return sqlSession.selectOne("Members.getState",m_id);
	}

	public Member getList(String m_id) {
		return sqlSession.selectOne("Members.getListOne",m_id);
	}

	public void UpdateSub(Map<String, String> map) {
		sqlSession.update("Members.updateSub",map);
	}
	
}
