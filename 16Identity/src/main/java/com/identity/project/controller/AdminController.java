package com.identity.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.SubList;
import com.identity.project.domain.Subscribe;
import com.identity.project.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/main.net", method = RequestMethod.GET)
	public String main() {
		return "admin/main";
	}
	
	@RequestMapping(value = "/order.net", method = RequestMethod.GET)
	public String order() {
		return "admin/admin_order";
	}
	
	@RequestMapping(value = "/delivery.net", method = RequestMethod.GET)
	public String delivery() {
		return "admin/admin_delivery";
	}
	
	@RequestMapping(value = "/member.net", method = RequestMethod.GET)
	public String member() {
		return "admin/admin_member";
	}
	
	@RequestMapping(value = "/report.net", method = RequestMethod.GET)
	public String report() {
		return "admin/admin_report";
	}
	
	@RequestMapping(value = "/comment.net", method = RequestMethod.GET)
	public String comment() {
		return "admin/admin_comment";
	}
	
	@RequestMapping(value = "/subscribe.net")
	public ModelAndView subscribe(ModelAndView mv, HttpServletRequest request) {
		List<Subscribe> list = adminService.getList();
		SubList sub = new SubList();
		System.out.println("subList: "+sub.getSublist().toString());
		/*
		for(Subscribe s : sub.getSublist() ) {
			String day = s.getUpdatedate().substring(5, 7);
			
			if(day.equals("01")) s.setJan(s.getIsbn());
			if(day.equals("02")) s.setFeb(s.getIsbn());
			if(day.equals("03")) s.setMar(s.getIsbn());
			if(day.equals("04")) s.setApr(s.getIsbn());
			if(day.equals("05")) s.setMay(s.getIsbn());
			if(day.equals("06")) s.setJun(s.getIsbn());
			if(day.equals("07")) s.setJul(s.getIsbn());
			if(day.equals("08")) s.setAug(s.getIsbn());
			if(day.equals("09")) s.setSep(s.getIsbn());
			if(day.equals("10")) s.setOct(s.getIsbn());
			if(day.equals("11")) s.setNov(s.getIsbn());
			if(day.equals("12")) s.setDec(s.getIsbn());
		} */
		
		mv.setViewName("admin/admin_subscribe");
		
		return mv;
	}
}
