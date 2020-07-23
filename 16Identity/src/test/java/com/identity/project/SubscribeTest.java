package com.identity.project;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Subscribe;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class SubscribeTest {
	
	private static final Logger logger =  LoggerFactory.getLogger(SubscribeTest.class);
	@Autowired
	private SqlSessionTemplate sqlSession;
  
	@Test
	public void testReadAll() throws Exception {
		List<Joinlist> lvo = sqlSession.selectList("Subscribe.joinlist");
		
		for(Joinlist vo : lvo) {
			logger.info("회원ID : "+vo.getM_id());
			for(Subscribe s : vo.getSubscribe()) {
				logger.info("배달완료 날짜 : "+s.getUpdatedate());
				logger.info("책이름 : "+s.getB_title());
			}
			logger.info("===============================");
		}
	}
}
