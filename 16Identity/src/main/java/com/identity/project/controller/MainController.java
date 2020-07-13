package com.identity.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.service.MainService;
import com.identity.project.service.MemberService;

@Controller
public class MainController {
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private MainService mainService;
	
	@RequestMapping(value = "/main.com", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		//1. mbti 목록 불러오기
		List<String> mbti_list = mainService.getMbtiList();
		
		mv.addObject("mbti_list", mbti_list);
		mv.setViewName("main/main");
		
		return mv;
	}
	
	@RequestMapping(value = "/subscribe_apply.com", method = RequestMethod.GET)
	public ModelAndView subscribe_apply(String m_id, ModelAndView mv) {
		String mbti = memberService.getMbti(m_id);
		mv.setViewName("main/subscribe_apply");
		mv.addObject("m_id", m_id);
		mv.addObject("mbti", mbti);
		return mv;
	}
	
	@RequestMapping(value = "/subscribe_drop.com", method = RequestMethod.GET)
	public String subscribe_drop() {
		return "main/subscribe_drop";
	}
}
