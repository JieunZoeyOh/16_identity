package com.identity.project.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;
import com.identity.project.domain.Member;

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


	public int listcount(String id) {
		return sqlSession.selectOne("Comments.listcount", id);
	}


	public List<Comments> getmyCommentlist(Map<String, Object> map) {
		return sqlSession.selectList("Comments.mycomment_list",map);
	}
}
