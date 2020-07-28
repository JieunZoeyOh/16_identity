package com.identity.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.BoardDAO;
import com.identity.project.domain.Book;
import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_Date;
import com.identity.project.domain.Book_Like_List;
import com.identity.project.domain.Notice;
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

	@Override
	public List<Notice> getNoticeList(int page, int limit) {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		int startrow=(page-1)*limit+1;
		int endrow=startrow+limit-1;
		map.put("start", startrow);
		map.put("end", endrow);
		return dao.getNoticeList(map);
	}

	@Override
	public int getNoticeListCount() {
		return dao.getNoticeListCount();
	}

	@Override
	public void insertNotice(Notice notice) {
		dao.insertNotice(notice);
	}

	@Override
	public Notice getDetail(int num) {
		if(setReadCountUpdate(num)!=1)
			return null;
		return dao.getDetail(num);
	}

	private int setReadCountUpdate(int num) {
		return dao.setReadCountUpdate(num);
	}

	@Override
	public boolean ismodifyWriter(int no, String password) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("no", no);
		map.put("password", password);
		Notice result = dao.ismodifyWriter(map);
		if(result != null ) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int boardModify(Notice notice) {
		return dao.NoticeModify(notice);
	}

	@Override
	public boolean isBoardWriter(int no, String password) {
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("no", no);
		map.put("password", password);
		Notice result = dao.ismodifyWriter(map);
		if(result != null ) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public int deleteNotice(int no) {
		int result = 0;
		Notice notice = dao.getDetail(no);
		if(notice != null) {
			result = dao.Noticedelete(notice);
		}
		return result;
	}
}
