package com.identity.project;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.mock.web.MockHttpSession;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;



@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml",
									"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})

public class JiminTest {
	
	private static final Logger logger =  LoggerFactory.getLogger(JiminTest.class);
	
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;
	
	@Before 
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		logger.info("setup()");
	}
	
	@Test
	public void passchk() throws Exception{
		try {
			mockMvc.perform(post("/passchk.net")
					.param("password","1111")
					.param("id", "jimin1@gmail.com"))
					.andDo(print())
					.andExpect(status().isOk());
			logger.info(">>> MemberController - passchk() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test 
	public void member_update() throws Exception{
		try {
			 mockMvc.perform(post("/updateForm.net")
					.param("id","jimin1@gmail.com"))
				    .andDo(print())
				    .andExpect(model().attributeExists("memberinfo"))
				    .andExpect(status().isOk());
			logger.info(">>> MemberController - member_update() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test 
	public void review() throws Exception{
		try {
			mockMvc.perform(get("/myReview.net")
					.sessionAttr("id", "jimin1@gmail.com"))
					.andDo(print())
					.andExpect(model().attributeExists("profile"))
					.andExpect(model().attributeExists("listcount"))
					.andExpect(model().attributeExists("commentlist"))
					.andExpect(status().isOk());
			logger.info(">>> MemberController - review() 수행 성공 <<<");
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}
}
