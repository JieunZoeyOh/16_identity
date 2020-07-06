package com.identity.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.CommentDAO;
import com.identity.project.domain.Comments;

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDAO dao;
	
	@Override
	public int commentsInsert(Comments co) {
		return dao.commentsInsert(co);
	}

}
