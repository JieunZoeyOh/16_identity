package com.identity.project.service;

import java.util.List;

import com.identity.project.domain.Comments;
import com.identity.project.domain.Deliver;
import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;
import com.identity.project.domain.Subscribe;
import com.identity.project.domain.Warn;

public interface AdminService {

	List<String> getBookISBN(String m_id);
	void SubBook(Subscribe sub);
	List<Joinlist> getList();
	List<Suborder> getOrderList();
	void SubOrder(String isbn);
	List<Subscribe> distinctSub();
	int getOrderTotal();
	int getOrderPrice();
	int orderUpdate();
	int deliveryUpdate();
	List<Subscribe> getM_id();
	void deliveryInsert(String m_id);
	List<Deliver> getDList();
	List<Member> getMemberList();
	int memberCount();
	int warnCount();
	int commentCount();
	int subCount();
	List<Warn> warnList();
	int warnDelete(int wc_no);
	int commentDelete(int cmt_no);
	void memberWarn(String m_id);
	int subDrop(String m_id);
	int delete(String id);
	int getTodaySub();
	int getYesterSub();
	int getWeekSub();
	int getMonthSub();
	int getYearSub();
	List<Comments> getCList();
	int getAllSub();
	int[] getchartValues();
	int ad_com_delete(String cmt_no);
	int newWarnCount();
}
