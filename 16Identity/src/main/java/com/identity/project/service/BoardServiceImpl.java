package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.BoardDAO;
import com.identity.project.domain.Book;
import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_Date;

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
	public Book_Like getLikeCount(String isbn) {
		return dao.likeCount(isbn);
	}

	@Override
	public int like_action(Book_Like_Date bld) {
		return dao.like_action(bld);
	}

	@Override
	public int add_like(Book_Like_Date bld) {
		return dao.add_like(bld);
	}

	@Override
	public int update_like(Book_Like_Date bld) {
		return dao.update_like(bld);
	}

	@Override
	public int cancel_like(Book_Like_Date bld) {
		return dao.cancel_like(bld);
	}


}
