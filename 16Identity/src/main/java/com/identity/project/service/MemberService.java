package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Member;

public interface MemberService {

	public List<Member> getStateList();

	public Member member_info(String id);
	
	public int delete(String id);
	
	public int update(Member m);
	
}
