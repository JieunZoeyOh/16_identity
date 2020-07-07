package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.identity.project.dao.MemberDAO;
import com.identity.project.domain.Member;

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
	
}
