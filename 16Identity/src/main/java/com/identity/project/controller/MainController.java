package com.identity.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.identity.project.service.MainService;

@Controller
public class MainController {
	//@Autowired
	//private MainService mainService;
	
	@RequestMapping(value = "/main.com", method = RequestMethod.GET)
	public String main() {
		return "main/main";
	}
}
