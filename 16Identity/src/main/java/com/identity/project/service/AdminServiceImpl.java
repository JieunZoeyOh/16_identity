package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.AdminDAO;
import com.identity.project.domain.Subscribe;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public List<String> getBookISBN(String m_id) {
		return dao.idList(m_id);
	}

	@Override
	public void SubBook(Subscribe sub) {
		dao.subBook(sub);
	}

}
