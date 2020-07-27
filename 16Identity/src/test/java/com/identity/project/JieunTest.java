package com.identity.project;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.view;

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
public class JieunTest {
	
	private static final Logger logger =  LoggerFactory.getLogger(JieunTest.class);
	
	@Autowired
	private WebApplicationContext wac;

	private MockMvc mockMvc;
	
	@Before 
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
		logger.info("setup()~~~~~~~~~~~~~~~~~~");
	}
	
	@Test // 메인
	//1. mbti 목록 불러오기
	//2. mbti recommend 불러오기 (각 mbti별 4권)
	//3. best review 불러오기(총 4권 - isbn,content)
	//4. best recommend 불러오기 (총4권 - isbn, title, authors)
	public void main_mbti_list() throws Exception {
		logger.info("===== main_mbti_list() 메소드 시작 =====");
		try {
			mockMvc.perform(get("/main.com"))
					.andDo(print())
					.andExpect(status().isOk())
					.andExpect(model().attributeExists("mbti_list"))
					.andExpect(model().attributeExists("mbtiRecommendList"))
					.andExpect(model().attributeExists("bestReviewList"))
					.andExpect(model().attributeExists("bestRecommendList"))
					.andExpect(view().name("main/main"));
			logger.info(">>> MainController - main() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test //댓글 게시판 (최신순-recency, 인기순-popular)
	public void bestReview() throws Exception {
		try {
			mockMvc.perform(get("/reviewBoardAjax.net")
					.param("page","1")
					.param("sort","recency")
					.param("mbti[]", "infp, intp, infj, intj, isfp, istp, isfj, istj"))
					.andDo(print())
					.andExpect(status().isOk())
					.andExpect(content().contentType("application/json;charset=UTF-8"))
					;
			logger.info(">>> BoardController - reviewBoard() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//@Test // 마이게시판 My Book- 좋아요 한 책 리스트 불러오기
	public void myBook() throws Exception {
		try {
			mockMvc.perform(post("/myBookAjax.net")
					.sessionAttr("m_id", "ohjieun@kakao.com"))
					.andDo(print())
					.andExpect(status().isOk())
					.andExpect(content().contentType("application/json;charset=UTF-8"))
					;
			logger.info(">>> BoardController - myBookAjax() 수행 성공 <<<");
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}