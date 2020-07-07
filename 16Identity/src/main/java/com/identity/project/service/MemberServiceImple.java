package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.MemberDAO;
import com.identity.project.domain.Member;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private MemberDAO dao;

	@Override
	public List<Member> getStateList() {
		return dao.list();
	}

	@Override
	public Member member_info(String id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int delete(String id) {
	    return dao.delete(id);
		
	}

	@Override
	public int update(Member m) {
		return dao.update(m);
	}
	
}
