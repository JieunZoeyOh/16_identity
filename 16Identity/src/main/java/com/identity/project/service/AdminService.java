package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Subscribe;

public interface AdminService {

	List<String> getBookISBN(String string);
	void SubBook(Subscribe sub);
}
