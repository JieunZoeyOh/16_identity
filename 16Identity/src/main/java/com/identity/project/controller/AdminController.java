package com.identity.project.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Suborder;
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
	public ModelAndView order(ModelAndView mv, HttpSession session) {
		List<Suborder> list = adminService.getOrderList();
		int total= adminService.getOrderTotal();
		int price = adminService.getOrderPrice();
		mv.setViewName("admin/admin_order");
		mv.addObject("list", list);
		mv.addObject("total", total);
		mv.addObject("price", price);
		return mv;
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
		List<Joinlist> list = adminService.getList();
		List<Subscribe> sub = new ArrayList<Subscribe>();
		for(Joinlist sublist : list ) {
			sub =sublist.getSubscribe();
			String[] a = new String[12];
			for(Subscribe s : sub) {
				String day = s.getUpdatedate().substring(5, 7);
				if(day.equals("01")) a[0]=s.getB_title();
				if(day.equals("02")) a[1]=s.getB_title();
				if(day.equals("03")) a[2]=s.getB_title();
				if(day.equals("04")) a[3]=s.getB_title();
				if(day.equals("05")) a[4]=s.getB_title();
				if(day.equals("06")) a[5]=s.getB_title();
				if(day.equals("07")) a[6]=s.getB_title();
				if(day.equals("08")) a[7]=s.getB_title();
				if(day.equals("09")) a[8]=s.getB_title();
				if(day.equals("10")) a[9]=s.getB_title();
				if(day.equals("11")) a[10]=s.getB_title();
				if(day.equals("12")) a[11]=s.getB_title();
			}
			sublist.setMonth(a);
		}
		mv.setViewName("admin/admin_subscribe");
		mv.addObject("list", list);
		return mv;
	}
}
