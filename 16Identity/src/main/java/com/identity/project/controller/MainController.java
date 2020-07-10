package com.identity.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Member;
import com.identity.project.service.MainService;
import com.identity.project.service.MemberService;

@Controller
public class MainController {
	@Autowired
	private MemberService memberService;
	
	@RequestMapping(value = "/main.com", method = RequestMethod.GET)
	public String main() {
		return "main/main";
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
