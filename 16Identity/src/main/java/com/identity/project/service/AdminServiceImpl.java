package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.AdminDAO;
import com.identity.project.domain.Deliver;
import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Suborder;
import com.identity.project.domain.Subscribe;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO dao;

	@Override
	public List<String> getBookISBN(String m_id) {
		return dao.idList(m_id);
	}

	@Override
	public void SubBook(Subscribe sub) {
		dao.subBook(sub);
	}

	@Override
	public List<Joinlist> getList() {
		return dao.getList();
	}

	@Override
	public List<Suborder> getOrderList() {
		return dao.getOrderList();
	}

	@Override
	public void SubOrder(String isbn) {
		dao.SubOrder(isbn);
	}

	@Override
	public List<Subscribe> distinctSub() {
		return dao.distinctSub();
	}

	@Override
	public int getOrderTotal() {
		return dao.getTotal();
	}

	@Override
	public int getOrderPrice() {
		return dao.getPrice();
	}

	@Override
	public int orderUpdate() {
		return dao.orderSuccess();
	}

	@Override
	public void deliveryInsert(String m_id) {
		dao.deliveryInsert(m_id);
	}

	@Override
	public int deliveryUpdate() {
		return dao.deliveryUpdate();
	}

	@Override
	public List<Subscribe> getM_id() {
		return dao.getM_id();
	}

	@Override
	public List<Deliver> getDList() {
		return dao.getDList();
	}

}
