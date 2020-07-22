package com.identity.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.identity.project.dao.MemberDAO;
import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Autowired
	private PasswordEncoder passwordEncoder;

	@Override
	public List<Member> getStateList() {
		return dao.list();
	}

	@Override
	public int isId(String m_id, String m_password) {
		Member rmember = dao.isId(m_id);
		int result=-1; //아이디가 존재하지 않는 경우- rmember가 null인 경우
		if(rmember != null) { //아이디가 존재하는 경우
			//passwordEncoder.matches(rawPassword, encodedPassword)
			//사용자에게 입력받은 패스워드를 비교하고자 할 때 사용하는 메서드입니다.
			//rawPassword : 사용자가 입력한 패스워드
			//encodedPassword : DB에 저장된 패스워드
			if(passwordEncoder.matches(m_password, rmember.getM_password())) {
				result=1;	//아이디와 비밀번호가 일치하는 경우
			}else {
				result=0;	//아이디는 존재하지만 비밀번호가 일치하지 않은 경우
			}
		}
		return result;
	}

	@Override
	public int isId(String m_id) {
		Member rmember = dao.isId(m_id);
		return (rmember==null)? -1 : 1;
	}

	@Override
	public int insert(Member member) {
		return dao.insert(member);
	}

	@Override
	public Member member_info(String id) {
		return dao.member_info(id);
	}

	@Override
	public int delete(Member m) {
	    return dao.delete(m);
		
	}

	@Override
	public int update(Member m) {
		return dao.update(m);
	}

	@Override
	public String getMbti(String m_id) {
		return dao.getMbti(m_id);
	}

	@Override
	public String getNickname(String m_id) {
		return dao.getNickname(m_id);
	}

	@Override
	public String getMbtiNickname(String m_id) {
		return dao.getMbtiNickname(m_id);
	}

	@Override
	public Member profile(String m_id) {
		return dao.profile(m_id);
	}
	
	@Override
	public String getState(String m_id) {
		return dao.getState(m_id);
	}

	@Override
	public Member getList(String m_id) {
		return dao.getList(m_id);
	}

	@Override
	public void dropSub(String m_id) {
		dao.dropSub(m_id);
	}

	@Override
	public void updateSub(String m_id, String substate, int season) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("m_id", m_id);
		map.put("substate", substate);
		map.put("season", season);
		dao.UpdateSub(map);
	}

	@Override
	public int isNick(String m_nickname) {
		Member rmember = dao.isNick(m_nickname);
		return (rmember == null) ? -1 : 1;
	}

	@Override
	public String find_id(String m_name, String m_phone){
		Map<String, String> map = new HashMap<String, String>();
		map.put("m_name", m_name);
		map.put("m_phone", m_phone);
		String result = dao.find_id_phone(map);
		return result;
	}

	@Override
	public Member check(String m_id) {
		return dao.isId(m_id);
	}

	@Override
	public int newPassword(Member member) {
		return dao.newPassword(member);
	}

	@Override
	public int isPhone(String m_phone) {
		Member rmember = dao.isPhone(m_phone);
		return (rmember==null)? -1 : 1;
	}
}
