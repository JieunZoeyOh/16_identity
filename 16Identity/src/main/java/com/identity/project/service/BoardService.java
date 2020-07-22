package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Book;
import com.identity.project.domain.Book_Like;
import com.identity.project.domain.Book_Like_Date;
import com.identity.project.domain.Book_Like_List;
import com.identity.project.domain.Review_Like_List;

public interface BoardService {

	List<String> getBookISBN();

	List<String> getBookISBN_mbti(String m_mbti);

	int bookInsert(Book book);

	int likeInsert(String isbn);

	Book_Like getLikeCount(String isbn);

	int like_action(Book_Like_Date bld);

	int add_like(Book_Like_Date bld);

	int update_like(Book_Like_Date bld);

	int cancel_like(Book_Like_Date bld);

	int like_check(String m_id, String isbn);

	int getLikeListCount(String m_id);

	List<Book_Like_List> getLikeList(int page, int limit, String m_id);

	int getReviewLikeCount(String m_id);

	List<Review_Like_List> getReviewLikeList(int page, int limit, String m_id);

}
