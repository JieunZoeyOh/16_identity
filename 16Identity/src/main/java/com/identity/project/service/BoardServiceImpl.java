package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.BoardDAO;
import com.identity.project.domain.Book;

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

	@Override
	public int bookInsert(Book book) {
		return dao.bookInsert(book);
	}

	@Override
	public int likeInsert(String isbn) {
		return dao.likeInsert(isbn);
	}

	@Override
	public int getLikeCount(String isbn) {
		return dao.likeCount(isbn);
	}


}
