package com.identity.project.task;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.identity.project.domain.Member;
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
	
	@Scheduled(cron="0 0 0 1 * *")
	public void checkBook() throws Exception {
		List<Member> memberList = memberService.getStateList();
		String isbn = "";
		for(int i=0; i<memberList.size();i++) {
			System.out.println("회원의 ID: "+memberList.get(i).getM_id());
			if(memberList.get(i).getSubstate().equals("MBTI 구독중")) {
				System.out.println("회원의 mbti: "+memberList.get(i).getM_mbti());
				List<String> bookList = boardService.getBookISBN_mbti(memberList.get(i).getM_mbti());
				List<String> adminList = adminService.getBookISBN(memberList.get(i).getM_id());
				bookList.removeAll(adminList);
				for(int j=0; j<bookList.size(); j++) {
					double randomValue = Math.random();
			        int ran = (int)(randomValue * bookList.size()+1)-1;
			        isbn = bookList.get(ran);
				}
				Subscribe sub = new Subscribe();
		        sub.setM_id(memberList.get(i).getM_id());
		        sub.setIsbn(isbn);
		        adminService.SubBook(sub);
			}
			
			else if(memberList.get(i).getSubstate().equals("RANDOM 구독중")){
				System.out.println("회원의 mbti: "+memberList.get(i).getM_mbti());
				List<String> bookList = boardService.getBookISBN();
				List<String> adminList = adminService.getBookISBN(memberList.get(i).getM_id());
				bookList.removeAll(adminList);
				for(int j=0; j<bookList.size(); j++) {
					double randomValue = Math.random();
			        int ran = (int)(randomValue * bookList.size()+1)-1;
			        isbn = bookList.get(ran);
				}
				Subscribe sub = new Subscribe();
		        sub.setM_id(memberList.get(i).getM_id());
		        sub.setIsbn(isbn);
		        adminService.SubBook(sub);
			}
			else;
		}
		List<Subscribe> subList = adminService.distinctSub();
		for(int i=0; i<subList.size();i++) {
			adminService.SubOrder(subList.get(i).getIsbn());
		}
		System.out.println("정기구독 완료");
	}
}
