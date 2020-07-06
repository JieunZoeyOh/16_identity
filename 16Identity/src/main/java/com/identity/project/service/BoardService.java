package com.identity.project.service;

import java.util.List;

public interface BoardService {

	List<String> getBookISBN();

	List<String> getBookISBN_mbti(String m_mbti);

}
