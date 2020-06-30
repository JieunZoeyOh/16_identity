package com.identity.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

import org.springframework.web.servlet.NoHandlerFoundException;
@ControllerAdvice
public class ExceptionController {
	private static final Logger logger = LoggerFactory.getLogger(ExceptionController.class);
	
	@ExceptionHandler(NoHandlerFoundException.class)
	public ModelAndView handlerError404(HttpServletRequest request, Exception e) {
		logger.info(e.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error/404");
		mav.addObject("exception", "404오류");
		mav.addObject("url", request.getRequestURL());
		return mav;
	}
	
	@ExceptionHandler(Exception.class)
	public ModelAndView common(Exception e, HttpServletRequest request) {
		logger.info(e.toString());
		ModelAndView mav = new ModelAndView();
		mav.setViewName("error/common");
		mav.addObject("exception", e);
		mav.addObject("url", request.getRequestURL());
		return mav;
	}
}
