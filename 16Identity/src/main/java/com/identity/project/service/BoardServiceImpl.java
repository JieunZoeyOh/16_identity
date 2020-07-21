package com.identity.project.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.BoardDAO;
import com.identity.project.domain.Book;
import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_Date;
import com.identity.project.domain.Book_Like_List;
import com.identity.project.domain.Review_Like_List;

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

	@Override
	public int like_check(String m_id, String isbn) {
		return dao.like_check(m_id, isbn);
	}

	@Override
	public int getLikeListCount(String m_id) {
		return dao.getLikeListCount(m_id);
	}

	@Override
	public List<Book_Like_List> getLikeList(int page, int limit, String m_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("m_id", m_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getLikeList(map);
	}

	@Override
	public int getReviewLikeCount(String m_id) {
		return dao.getReviewLikeCount(m_id);
	}

	@Override
	public List<Review_Like_List> getReviewLikeList(int page, int limit, String m_id) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		map.put("m_id", m_id);
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getReviewLikeList(map);
	}


}
