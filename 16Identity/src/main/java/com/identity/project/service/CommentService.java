package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;

public interface CommentService {

	int commentsInsert(Comments co);


	int getListCount(String isbn);

	List<Comments> getCommentList(String isbn, int page);


	int comment_delete(String cmt_no);

}
