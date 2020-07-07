package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Suborder;
import com.identity.project.domain.Subscribe;

public interface AdminService {

	List<String> getBookISBN(String m_id);
	void SubBook(Subscribe sub);
	List<Joinlist> getList();
	List<Suborder> getOrderList();
	void SubOrder(String isbn);
	List<Subscribe> distinctSub();
	int getOrderTotal();
	int getOrderPrice();
}
