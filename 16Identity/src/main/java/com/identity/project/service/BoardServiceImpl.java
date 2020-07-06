package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.BoardDAO;

@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public List<String> getBookISBN() {
		return dao.getBookList();
	}

	@Override
	public List<String> getBookISBN_mbti(String m_mbti) {
		return dao.getBookList_mbti(m_mbti);
	}

}
