package com.identity.project.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.identity.project.domain.Subscribe;
import com.identity.project.service.AdminService;
import com.identity.project.service.BoardService;
import com.identity.project.service.MemberService;

@Service
public class SubscribeTask {
	@Autowired
	private BoardService boardService;
	
	@Autowired
	private AdminService adminService;
	
	@Autowired
	private MemberService memberService;
	
	@Scheduled(cron="0 0 0 10 * *")
	public void checkBook() throws Exception {
		List<String> memberList = memberService.getList();
		String isbn = "";
		for(int i=0; i<memberList.size();i++) {
			List<String> bookList = boardService.getBookISBN();
			System.out.println(memberList.get(i));
			List<String> adminList = adminService.getBookISBN(memberList.get(i));

			bookList.removeAll(adminList);
			
			System.out.println("회원이 읽지 않은 책:"+bookList);
			
			for(int j=0; j<bookList.size(); j++) {
				System.out.println("booksize:"+bookList.size());
				double randomValue = Math.random();
		        int ran = (int)(randomValue * bookList.size()+1)-1;
		        System.out.println("랜덤:"+ran);
		        isbn = bookList.get(ran);
			}
			Subscribe sub = new Subscribe();
	        sub.setM_id(memberList.get(i));
	        sub.setIsbn(isbn);
	        adminService.SubBook(sub);
		}
	}
}
