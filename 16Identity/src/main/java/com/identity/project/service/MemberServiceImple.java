package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.MemberDAO;

@Service
public class MemberServiceImple implements MemberService {
	
	@Autowired
	private MemberDAO dao;
	
	@Override
	public List<String> getList() {
		return dao.list();
	}
	
}
