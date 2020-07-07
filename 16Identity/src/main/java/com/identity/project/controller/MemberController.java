package com.identity.project.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Member;
import com.identity.project.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService memberSerivce;
	
	
	//updateForm.net
    @RequestMapping(value = "/updateForm.net")
    public ModelAndView member_update(HttpSession session, ModelAndView mv) throws Exception{
    	String id = (String)session.getAttribute("id");
    	Member m = memberSerivce.member_info(id);
    	mv.setViewName("mypage/updateform");
    	mv.addObject("memberinfo",m);
    	return mv;
    }
	
	//updateProcess.net
	@RequestMapping(value = "/updateProcess.net", method = RequestMethod.POST)
	public int updateProcess(Member member) throws Exception{
    	int result = memberSerivce.update(member);
    	return result;
	}
	
	@RequestMapping(value = "/delete.net")
	public int deleteProcess(String id) throws Exception{
    	int result = memberSerivce.delete(id);
    	return result;
    	
	}
	
}
