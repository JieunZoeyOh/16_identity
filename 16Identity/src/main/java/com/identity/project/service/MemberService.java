package com.identity.project.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;

public interface MemberService {

	List<Member> getStateList();

	int isId(String m_id, String m_password);

	int isId(String m_id);

	int insert(Member member);

	public Member member_info(String id);
	
	public int update(Member m);

	public int delete(Member m);

	String getMbti(String m_id);

	String getNickname(String m_id);

	String getMbtiNickname(String m_id);

	public Member profile(String m_id);
	
	String getState(String m_id);

	Member getList(String m_id);

	void updateSub(String m_id, String substate, int season);

	void dropSub(String m_id);

	int isNick(String m_nickname);

	String find_id(String m_name, String m_phone);

	Member check(String m_id);

	int newPassword(Member member);
	
}
