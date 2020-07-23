package com.identity.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.CommentDAO;
import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;
import com.identity.project.domain.Comments_Like;
import com.identity.project.domain.Warn;
import com.identity.project.domain.Warn_Check;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO dao;
	
	@Override
	public int commentsInsert(Comments co) {
		return dao.commentsInsert(co);
	}

	@Override
	public int getListCount(String isbn) {
		return dao.commentsCount(isbn);
	}

	@Override
	public List<Comments> getCommentList(String isbn, int page) {
		int startrow = (page-1)*4+1;
		int endrow = startrow+4-1;
		
		Map<String, Object> map= new HashMap<String, Object>();
		//map.put("page", page);
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("isbn", isbn);
		return dao.getCommentlist(map);
	}

	@Override
	public int comment_delete(String cmt_no) {
		return dao.comment_delete(cmt_no);
	}

	@Override
	public int commentsUpdate(Comments cmt) {
		return dao.comment_update(cmt);
	}

	@Override
	public int add_warn(Warn warn) {
		return dao.add_warn(warn);
	}

	@Override
	public int warn_check(Warn_Check warn_check) {
		return dao.warn_check(warn_check);
	}
	
	@Override
	public int listcount(String id) {
		return dao.listcount(id);
	}

	@Override
	public List<Comments> getmyCommentList(String id) {

		Map<String, Object> map= new HashMap<String, Object>();
		map.put("id", id);
		return dao.getmyCommentlist(map);
	}

	@Override
	public int cmt_like(Comments_Like cmt_like) {
		return dao.cmt_like(cmt_like);
	}

	@Override
	public List<Comments> getCommentList_popular(String isbn, int page) {
		int startrow = (page-1)*4+1;
		int endrow = startrow+4-1;
		
		Map<String, Object> map= new HashMap<String, Object>();
		//map.put("page", page);
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("isbn", isbn);
		return dao.getCommentList_popular(map);
	}

	@Override
	public List<Comments> getCommentList_mine(String isbn, int page, String m_id) {
		int startrow = (page-1)*4+1;
		int endrow = startrow+4-1;
		
		Map<String, Object> map= new HashMap<String, Object>();
		//map.put("page", page);
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("isbn", isbn);
		map.put("id",m_id);
		return dao.getCommentList_mine(map);
	}

	@Override
	public int getMyreviewCount(String isbn, String m_id) {
		return dao.getMyreviewCount(isbn,m_id);
	}

	@Override
	public List<Comments> getSomeoneCommentList(String id, int limit, int page) {
		Map<String, Object> map= new HashMap<String, Object>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("id", id);
		return dao.getSomeoneCommentList(map);
	}

	@Override
	public int getSomeoneListCount(String id) {
		return dao.getSomeoneListCount(id);
	}

}
