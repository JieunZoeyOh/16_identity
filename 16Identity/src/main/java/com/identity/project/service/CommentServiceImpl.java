package com.identity.project.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.CommentDAO;
import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;

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
		int startrow = (page-1)*3+1;
		int endrow = startrow+3-1;
		
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

}
