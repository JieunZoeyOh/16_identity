package com.identity.project.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.identity.project.dao.MainDAO;
import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;

@Service
public class MainServiceImpl implements MainService{
	
	@Autowired
	private MainDAO dao;

	@Override
	public List<String> getMbtiList() {
		return dao.mbtiList();
	}

	@Override
	public Map<String, List<Book>> getMbtiRecommendList(List<String> mbti_list) {
		return dao.mbtiRecommendList(mbti_list);
	}

	@Override
	public List<Book> getBestRecommendList() {
		return dao.bestRecommendList();
	}

	@Override
	public List<Comments> getBestReviewList() {
		return dao.bestReviewList();
	}

}
