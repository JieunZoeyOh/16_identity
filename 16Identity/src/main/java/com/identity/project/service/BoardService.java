package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Book;

public interface BoardService {

	List<String> getBookISBN();

	List<String> getBookISBN_mbti(String m_mbti);

	int bookInsert(Book book);

	int likeInsert(String isbn);

	int getLikeCount(String isbn);

}
