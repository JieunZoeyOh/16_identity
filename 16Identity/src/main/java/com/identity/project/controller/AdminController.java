package com.identity.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.identity.project.service.AdminService;

@Controller
public class AdminController {
	//@Autowired
	//private AdminService adminService;
	
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
	
	@RequestMapping(value = "/subscribe.net", method = RequestMethod.GET)
	public String subscribe() {
		return "admin/admin_subscribe";
	}
}
