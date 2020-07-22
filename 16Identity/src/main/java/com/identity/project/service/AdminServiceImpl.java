package com.identity.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.AdminDAO;
import com.identity.project.domain.Comments;
import com.identity.project.domain.Deliver;
import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;
import com.identity.project.domain.Subscribe;
import com.identity.project.domain.Warn;

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

	@Override
	public List<Member> getMemberList() {
		return dao.getMemberList();
	}

	@Override
	public int memberCount() {
		return dao.getMemberCount();
	}

	@Override
	public int warnCount() {
		return dao.getWarnCount();
	}

	@Override
	public int commentCount() {
		return dao.getCommentCount();
	}

	@Override
	public int subCount() {
		return dao.getSubCount();
	}

	@Override
	public List<Warn> warnList() {
		return dao.getWarnList();
	}

	@Override
	public int warnDelete(int cmt_no) {
		return dao.warnDelete(cmt_no);
	}

	@Override
	public int commentDelete(int cmt_no) {
		return dao.commentDelete(cmt_no);
	}

	@Override
	public void memberWarn(String m_id) {
		dao.memberWarn(m_id);
	}

	@Override
	public int subDrop(String m_id) {
		return dao.subDrop(m_id);
	}

	@Override
	public int delete(String id) {
		return dao.delete(id);
	}

	public int getTodaySub() {
		return dao.TodaySub();
	}
	
	@Override
	public int getYesterSub() {
		return dao.YesterSub();
	}
	
	@Override
	public int getMonthSub() {
		return dao.MonthSub();
	}
	
	@Override
	public int getWeekSub() {
		return dao.WeekSub();
	}
	
	@Override
	public int getYearSub() {
		return dao.YearSub();
	}
		
	public List<Comments> getCList() {
		return dao.getCList();
	}

}
