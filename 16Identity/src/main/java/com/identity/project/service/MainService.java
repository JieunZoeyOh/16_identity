package com.identity.project.service;

import java.util.List;

import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.KakaoPayApproval;

public interface MainService {

	List<String> getMbtiList();
	
	public String kakaoPayReady(String m_id, ModelAndView mv);

	public KakaoPayApproval kakaoPayInfo(String pg_token, String m_id);

}
