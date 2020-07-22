package com.identity.project.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Comments;
import com.identity.project.domain.Deliver;
import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;
import com.identity.project.domain.Subscribe;
import com.identity.project.domain.Warn;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<String> idList(String m_id) {
		return sqlSession.selectList("Subscribe.isbnList",m_id);
	}

	public int subBook(Subscribe sub) {
		return sqlSession.insert("Subscribe.subBook",sub);
	}

	public List<Joinlist> getList() {
		return sqlSession.selectList("Subscribe.joinlist");
	}

	public List<Suborder> getOrderList() {
		return sqlSession.selectList("Subscribe.orderList");
	}

	public int SubOrder(String isbn) {
		return sqlSession.insert("Subscribe.subOrder",isbn);
	}

	public List<Subscribe> distinctSub() {
		return sqlSession.selectList("Subscribe.distinctSub");
	}

	public int getTotal() {
		return sqlSession.selectOne("Subscribe.getTotal");
	}

	public int getPrice() {
		return sqlSession.selectOne("Subscribe.getPrice");
	}

	public int orderSuccess() {
		return sqlSession.update("Suborder.orderSuccess");
	}

	public void deliveryInsert(String m_id) {
		sqlSession.insert("Deliver.insert",m_id);
	}

	public int deliveryUpdate() {
		return sqlSession.update("Deliver.update");
	}

	public List<Subscribe> getM_id() {
		return sqlSession.selectList("Subscribe.getM_id");
	}

	public List<Deliver> getDList() {
		return sqlSession.selectList("Deliver.list");
	}

	public List<Member> getMemberList() {
		return sqlSession.selectList("Members.getList");
	}

	public int getMemberCount() {
		return sqlSession.selectOne("Members.getMemberCount");
	}

	public int getWarnCount() {
		return sqlSession.selectOne("Warns.getWarnCount");
	}
	
	public int newWarnCount() {
		return sqlSession.selectOne("Warns.newWarnCount");
	}

	public int getCommentCount() {
		return sqlSession.selectOne("Comments.getCommentCount");
	}

	public int getSubCount() {
		return sqlSession.selectOne("Subscribe.getSubCount");
	}

	public List<Warn> getWarnList() {
		return sqlSession.selectList("Warns.getWarnList");
	}

	public int warnDelete(int wc_no) {
		return sqlSession.update("Warns.warnDel",wc_no);
	}

	public int commentDelete(int cmt_no) {
		return sqlSession.delete("Comments.getCommentDel",cmt_no);
	}

	public void memberWarn(String m_id) {
		sqlSession.update("Members.warnAccept",m_id);
	}

	public int subDrop(String m_id) {
		return sqlSession.update("Members.subDrop",m_id);
	}

	public int delete(String id) {
		return sqlSession.delete("Members.delete_admin", id);
	}

	public int TodaySub() {
		return sqlSession.selectOne("Subscribe.todaySub");
	}
	
	public int YesterSub() {
		return sqlSession.selectOne("Subscribe.yesterSub");
	}
	
	public int WeekSub() {
		return sqlSession.selectOne("Subscribe.weekSub");
	}
	
	public int MonthSub() {
		return sqlSession.selectOne("Subscribe.monthSub");
	}
	
	public int YearSub() {
		return sqlSession.selectOne("Subscribe.yearSub");
	}
		
	public List<Comments> getCList() {
		return sqlSession.selectList("Comments.getAllComments");
	}	

	public int AllSub() {
		return sqlSession.selectOne("Subscribe.allSub");
	}

	public int[] ChartValues() {
		int[] chart = new int[14];
		for(int i=chart.length-1; i>=0; i--) {
			chart[i] = sqlSession.selectOne("Subscribe.ChartValues",i);
		}
		return chart;
	}

	public int ad_com_delete(String cmt_no) {
		return sqlSession.delete("Comments.comments_delete",cmt_no);
	}
	
}
