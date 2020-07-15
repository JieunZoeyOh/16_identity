package com.identity.project.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	@RequestMapping(value = "/kakaoPay.com")
	public ModelAndView kakaopay(HttpServletRequest request, ModelAndView mv) {
		String substate = request.getParameter("substate");
		String m_id = request.getParameter("m_id");
		
		Member member = memberService.getList(m_id);
		String mbti = member.getM_mbti();
		String m_name = member.getM_name();
		String m_tel = member.getM_phone();
		String m_address = member.getM_address();
		int m_address_no = member.getM_address_no();
		
		mv.setViewName("main/kakaopay");
		mv.addObject("substate",substate);
		mv.addObject("m_id",m_id);
		mv.addObject("mbti",mbti);
		mv.addObject("m_name",m_name);
		mv.addObject("m_tel",m_tel);
		mv.addObject("m_address",m_address);
		mv.addObject("m_address_no",m_address_no);
		return mv;
	}
	
	@RequestMapping(value = "/kakaopaySuccess.com", method = RequestMethod.GET)
	public void kakaopaySuccess(String m_id, String substate,HttpSession session) {
		memberService.updateSub(m_id, substate);
		String state = memberService.getState(m_id);
		session.setAttribute("substate", state);
	}
	
	@RequestMapping(value = "/drop.com", method = RequestMethod.POST)
	public void drop(String m_id, String m_password,HttpServletResponse response,HttpSession session) throws Exception {
		int result = memberService.isId(m_id, m_password);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(result==1) {
			memberService.dropSub(m_id);
			String state = memberService.getState(m_id);
			session.setAttribute("substate", state);
			out.println("alert('정기구독 해지 완료');");
			out.println("self.close();");
		} else {
			out.println("alert('비밀번호가 틀렸습니다.');");
			out.println("location.href='/16Identity/subscribe_drop.com';");
		}
		out.println("</script>");
	}
	
	@RequestMapping(value = "/subscribe_drop.com", method = RequestMethod.GET)
	public String subscribe_drop() {
		return "main/subscribe_drop";
	}
}
