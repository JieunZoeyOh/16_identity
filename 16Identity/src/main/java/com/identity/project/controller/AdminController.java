package com.identity.project.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Deliver;
import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;
import com.identity.project.domain.Subscribe;
import com.identity.project.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;
	
	@RequestMapping(value = "/main.net", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		int membercount = adminService.memberCount();
		int warncount = adminService.warnCount();
		int commentcount = adminService.commentCount();
		int subcount = adminService.subCount();
		mv.setViewName("admin/main");
		mv.addObject("membercount",membercount);
		mv.addObject("warncount",warncount);
		mv.addObject("commentcount",commentcount);
		mv.addObject("subcount",subcount);
		return mv;
	}
	
	@RequestMapping(value = "/member.net", method = RequestMethod.GET)
	public ModelAndView member(ModelAndView mv) {
		List<Member> list = adminService.getMemberList();
		mv.setViewName("admin/admin_member");
		mv.addObject("list", list);
		return mv;
		
	}
	
	@RequestMapping(value = "/order.net", method = RequestMethod.GET)
	public ModelAndView order(ModelAndView mv) {
		List<Suborder> list = adminService.getOrderList();
		mv.setViewName("admin/admin_order");
		mv.addObject("list", list);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/orderSucess.net", method = RequestMethod.POST)
	public void orderSucess(HttpServletResponse response) throws Exception {
		int result = adminService.orderUpdate();
		List<Deliver> Dlist = adminService.getDList();
		if(Dlist.size()==0) {
			List<Subscribe> list = adminService.getM_id();
			for(int i=0; i<list.size(); i++) {
				System.out.println("m_id:"+list.get(i).getM_id());
				adminService.deliveryInsert(list.get(i).getM_id());
			}
		}
		response.getWriter().print(result);
	}
	
	@RequestMapping(value = "/delivery.net", method = RequestMethod.GET)
	public ModelAndView delivery(ModelAndView mv, HttpSession session) {
		List<Deliver> list = adminService.getDList();
		mv.setViewName("admin/admin_delivery");
		mv.addObject("list", list);
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/deliverSucess.net", method = RequestMethod.POST)
	public void deliverSucess(HttpServletResponse response) throws Exception {
		int result = adminService.deliveryUpdate();
		response.getWriter().print(result);
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
			String[] a = new String[13];
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
				String year = s.getUpdatedate().substring(0,4);
				a[12]= year+"Y";
			}
			sublist.setMonth(a);
		}

		mv.setViewName("admin/admin_subscribe");
		mv.addObject("list", list);
		return mv;
	}
}
