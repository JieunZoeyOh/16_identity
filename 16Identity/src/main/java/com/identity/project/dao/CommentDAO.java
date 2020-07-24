package com.identity.project.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Comments;
import com.identity.project.domain.Comments_Like;
import com.identity.project.domain.Member;
import com.identity.project.domain.Review_Like_List;
import com.identity.project.domain.Warn;
import com.identity.project.domain.Warn_Check;

@Repository
public class CommentDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	public int commentsInsert(Comments co) {
		Member mem = sqlSession.selectOne("Comments.member_info", co.getCmt_id());
		co.setCmt_mbti(mem.getM_mbti());
		co.setCmt_nickname(mem.getM_nickname());
		System.out.println("co_mbti="+co.getCmt_mbti());
		System.out.println("co_nickname="+co.getCmt_nickname());
		System.out.println("id="+co.getCmt_id());
		System.out.println("isbn="+co.getIsbn());
		return sqlSession.insert("Comments.insert", co);
	}


	public int commentsCount(String isbn) {
		return sqlSession.selectOne("Comments.comments_count",isbn);
	}

	public List<Comments> getCommentlist(Map<String, Object> map) {
		return sqlSession.selectList("Comments.comments_list",map);
	}


	public int comment_delete(String cmt_no) {
		return sqlSession.delete("Comments.comments_delete", cmt_no);
	}


	public int comment_update(Comments cmt) {
		System.out.println("DAO 내용 확인1 "+cmt.getCmt_content());
		System.out.println("DAO 내용 확인2 "+cmt.getCmt_no());
		System.out.println(sqlSession.update("Comments.comments_update", cmt));
		return sqlSession.update("Comments.comments_update", cmt);
	}


	public int add_warn(Warn warn) {
		String m_id= sqlSession.selectOne("Comments.comments_info_id", warn.getCmt_no());
		System.out.println("댓글 작성자 "+m_id);
		warn.setM_id(m_id);
		
		Warn warn_check= new Warn();
		warn_check = sqlSession.selectOne("Comments.warn_check", warn);
		
		if(warn_check==null) {
			System.out.println("신고되지 않은 게시물 -insert 진행");
			int result = sqlSession.insert("Comments.insert_warn", warn);
			System.out.println("결과"+result);
		}
		else {
			System.out.println("신고된 게시물 -update 진행");
			warn_check.setW_count(warn_check.getW_count()+1);
			int result2= sqlSession.update("Comments.update_warn", warn_check);
			System.out.println("결과"+result2);
		}
		return 0;
	}


	public int warn_check(Warn_Check warn_check) {
		Warn_Check warn_check2= new Warn_Check();
		warn_check2= sqlSession.selectOne("Comments.wc_check", warn_check);
		
		if(warn_check2==null) {
			System.out.println("warn_check 테이블에 없음- 신고가능 ");
			int result = sqlSession.insert("Comments.wc_insert", warn_check);
			System.out.println("결과"+result);
			return result;
		}
		else {
			System.out.println("warn_check 테이블에 있음- 신고불가 ");
			return 0;
		}
	}

	public int listcount(String id) {
		return sqlSession.selectOne("Comments.listcount", id);
	}


	public List<Comments> getmyCommentlist(Map<String, Object> map) {
		return sqlSession.selectList("Comments.mycomment_list",map);
	}


	public int cmt_like(Comments_Like cmt_like) {
		Comments_Like cm_check = new Comments_Like();
		System.out.println("확인하려는 댓글번호:"+ cmt_like.getCmt_no());
		System.out.println("확인하려는 아이디:"+ cmt_like.getCmt_like_id());
		
		cm_check = sqlSession.selectOne("Comments.cm_check", cmt_like);
		if(cm_check ==null) {
			System.out.println("좋아요 가능- insert, update 실행");
			//comments_like - insert
			int result1= sqlSession.insert("Comments.cl_insert", cmt_like);
			
			int result2= sqlSession.update("Comments.cm_update", cmt_like.getCmt_no());
				
			if(result1 == 1 && result2==1) {
				System.out.println("댓글 좋아요 성공");
			}
			
			Comments cm = new Comments();
			cm.setCmt_no(cmt_like.getCmt_no());
			int cmt_no= cm.getCmt_no();
			cm = sqlSession.selectOne("Comments.comment_info", cmt_no);
			System.out.println("좋아요 눌린 댓글의 현재 좋아요 수"+cm.getCmt_like());
			return cm.getCmt_like();
		}
		else {
			System.out.println("좋아요 취소- delete, update 실행");
			//comments_like - delete
			int result1= sqlSession.delete("Comments.cl_delete", cmt_like);
			
			int result2= sqlSession.update("Comments.cm_update_minus", cmt_like.getCmt_no());
				
			if(result1 == 1 && result2==1) {
				System.out.println("댓글 좋아요 취소 성공");
			}
			
			Comments cm = new Comments();
			cm.setCmt_no(cmt_like.getCmt_no());
			int cmt_no= cm.getCmt_no();
			cm = sqlSession.selectOne("Comments.comment_info", cmt_no);
			System.out.println("좋아요 눌린 댓글의 현재 좋아요 수"+cm.getCmt_like());
			return cm.getCmt_like();
			
		}
	
	}


	public List<Comments> getCommentList_popular(Map<String, Object> map) {
		return sqlSession.selectList("Comments.comments_list_popular",map);
	}


	public List<Comments> getCommentList_mine(Map<String, Object> map) {
		return sqlSession.selectList("Comments.comments_list_mine",map);
	}


	public int getMyreviewCount(String isbn, String m_id) {
		Comments cm_mine= new Comments();
		cm_mine.setIsbn(isbn);
		cm_mine.setCmt_id(m_id);
		
		return sqlSession.selectOne("Comments.myreviewcount",cm_mine);
	}


	public List<Comments> getSomeoneCommentList(Map<String, Object> map) {
		
		return sqlSession.selectList("Comments.someoneCommentList",map);
	}


	public int getSomeoneListCount(String id) {
		return sqlSession.selectOne("Comments.someoneListCount",id);
	}


	public int cancel_like_fromLikeDate(HashMap<String, Object> cmtinfo) {
		return sqlSession.delete("Comments.cancelLike");
	}


	public int cancle_like(int cmt_like_no) {
		int cmt_no = sqlSession.selectOne("Comments.find_cmt_no", cmt_like_no);
		int result1= sqlSession.delete("Comments.cmt_like_delete", cmt_like_no);
		if(result1 == 1) {
			return sqlSession.update("Comments.minusLikeFromComments", cmt_no);
		}else {
			return 0;
		}
	}


	public int getListCount(String sort, List<String> mbtilist) {
		if(sort.equals("recency")) {
			return sqlSession.selectOne("Comments.getListCountRecency", mbtilist);
		}else {
			return sqlSession.selectOne("Comments.getListCountPopular", mbtilist);
		}
	}


	public List<Review_Like_List> getReviewList(int page, int limit, String sort, List<String> mbtilist) {
		Map<String, Object> map= new HashMap<String, Object>();
		int startrow = (page-1)*limit+1;
		int endrow = startrow+limit-1;
		
		map.put("start", startrow);
		map.put("end", endrow);
		map.put("list", mbtilist);
		if(sort.equals("recency")) {
			return sqlSession.selectList("Comments.getReviewListRecency", map);
		} else {
			return sqlSession.selectList("Comments.getReviewListPopular", map);
		}
	}
}
