package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;
import com.identity.project.domain.Comments_Like;
import com.identity.project.domain.Warn;
import com.identity.project.domain.Warn_Check;

public interface CommentService {

	int commentsInsert(Comments co);


	int getListCount(String isbn);

	List<Comments> getCommentList(String isbn, int page);


	int comment_delete(String cmt_no);


	int commentsUpdate(Comments cmt);


	int add_warn(Warn warn);


	int warn_check(Warn_Check warn_check);

	
	int listcount(String id);


	List<Comments> getmyCommentList(String id);


	int cmt_like(Comments_Like cmt_like);

}
