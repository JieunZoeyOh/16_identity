package com.identity.project;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;

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
public class HaeriTest {
	
	private static final Logger logger =  LoggerFactory.getLogger(HaeriTest.class);
	
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;
	
	@Before 
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		logger.info("setup()~~~~~~~~~~~~~~~~~~");
	}
	
	@Test // 관리자 - 정기구독 화면
	public void subscribe() throws Exception {
		try {
			mockMvc.perform(get("/subscribe.net"))
					.andDo(print())
					.andExpect(status().isOk())
					.andExpect(model().attributeExists("list"));
			logger.info(">>> AdminController - subscribe() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Test // 관리자 - 배송목록 배송완료 버튼 클릭시 구독 기간이 끝난 사람을 자동으로 구독상태를 구독중에서 구독안함으로 바꿈
	public void deliverSucess() throws Exception {
		try {
			mockMvc.perform(post("/deliverSucess.net"))
					.andDo(print())
					.andExpect(status().isOk());
			logger.info(">>> AdminController - deliverSucess 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test // 회원 - 정기구독 결제 완료시 수행화면
	public void kakaopaySuccess() throws Exception {
		try {
			mockMvc.perform(get("/kakaopaySuccess.com")
					.param("m_id","user1@naver.com")
					.param("price","9900")
					.param("substate","MBTI 구독중"))
					.andDo(print())
					.andExpect(status().isOk());
			logger.info(">>> MainController - kakaopaySuccess() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}

}
