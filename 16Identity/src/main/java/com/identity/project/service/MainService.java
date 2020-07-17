package com.identity.project.service;

import java.util.List;
import java.util.Map;

import com.identity.project.domain.Book;
import com.identity.project.domain.Comments;

public interface MainService {

	List<String> getMbtiList();

	Map<String, List<Book>> getMbtiRecommendList(List<String> mbti_list);

	List<Book> getBestRecommendList();

	List<Comments> getBestReviewList();
}
