package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Member;

public interface MemberService {

	List<Member> getStateList();

	int isId(String m_id, String m_password);

	int isId(String m_id);

	int insert(Member member);

	public Member member_info(String id);
	
	public int delete(String id);
	
	public int update(Member m);
	
}
