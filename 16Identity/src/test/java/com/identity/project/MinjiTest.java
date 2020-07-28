package com.identity.project;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
									"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class MinjiTest {

	private static final Logger logger =  LoggerFactory.getLogger(MinjiTest.class);
	
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;
	
	@Before 
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		logger.info("setup()~~~~~~~~~~~~~~~~~~");
	}
	
	
	@Test // 리뷰페이지 첫화면 
	public void reviewpost() throws Exception {
		try {
			mockMvc.perform(get("/reviewpost.minji"))
					.andDo(print())
					.andExpect(status().isOk())
					.andExpect(model().attributeExists("isbn"))
					.andExpect(model().attributeExists("bookvalue"))
					.andExpect(model().attributeExists("my_review_count"))
					.andExpect(model().attributeExists("like_check"))
					.andExpect(model().attributeExists("count"));
			logger.info(">>> CommentController - reviewpost() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test // 리뷰 책정보, 댓글 추가 작업
	public void review_commentsadd() throws Exception {
		try {
			mockMvc.perform(post("/review_commentsadd.minji")
					.param("content","댓글내용")
					.param("id","w@naver.com")
					.param("isbn","1157841112 9791157841110")
					.param("authors","이민지")
					.param("publisher","출판사")
					.param("book_price","15000")
					.param("book_date","2020-07-24")
					.param("book_contents","책소개입니당")
					.param("book_image","http://image.kyobobook.co.kr/images/book/xlarge/110/x9791157841110.jpg")
					.param("title","미라클 모닝")
					.param("translators","번역가")
					)
					.andDo(print())
					.andExpect(status().isOk());
			logger.info(">>> CommentController - review_commentsadd 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
