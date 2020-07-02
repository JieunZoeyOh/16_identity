package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Subscribe;

public interface AdminService {

	List<String> getBookISBN(String m_id);
	void SubBook(Subscribe sub);
}
