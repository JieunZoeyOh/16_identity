package com.identity.project.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.identity.project.domain.Comments;
import com.identity.project.domain.Deliver;
import com.identity.project.domain.Joinlist;
import com.identity.project.domain.Member;
import com.identity.project.domain.Suborder;
import com.identity.project.domain.Subscribe;
import com.identity.project.domain.Warn;
import com.identity.project.domain.Warn_Check;
import com.identity.project.service.AdminService;

@Controller
public class AdminController {
	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "/main.net", method = RequestMethod.GET)
	public ModelAndView main(ModelAndView mv) {
		int membercount = adminService.memberCount();
		int warncount = adminService.warnCount();
		int commentcount = adminService.commentCount();
		int subcount = adminService.subCount();
		int today = adminService.getTodaySub();
		int yester = adminService.getYesterSub();
		int week = adminService.getWeekSub();
		int month = adminService.getMonthSub();
		int year = adminService.getYearSub();
		int all = adminService.getAllSub();
		int[] chart = adminService.getchartValues();
		mv.setViewName("admin/main");
		mv.addObject("membercount", membercount);
		mv.addObject("warncount", warncount);
		mv.addObject("commentcount", commentcount);
		mv.addObject("today", today);
		mv.addObject("yester", yester);
		mv.addObject("week", week);
		mv.addObject("month", month);
		mv.addObject("year", year);
		mv.addObject("all", all);
		mv.addObject("subcount", subcount);
		mv.addObject("chart", chart);
		return mv;
	}

	@RequestMapping(value = "/member.net", method = RequestMethod.GET)
	public ModelAndView member(ModelAndView mv) {
		List<Member> list = adminService.getMemberList();
		mv.setViewName("admin/admin_member");
		mv.addObject("list", list);
		return mv;

	}

	@RequestMapping(value = "/order.net", method = RequestMethod.GET)
	public ModelAndView order(ModelAndView mv) {
		List<Suborder> list = adminService.getOrderList();
		mv.setViewName("admin/admin_order");
		mv.addObject("list", list);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/orderSucess.net", method = RequestMethod.POST)
	public void orderSucess(HttpServletResponse response) throws Exception {
		int result = adminService.orderUpdate();
		List<Deliver> Dlist = adminService.getDList();
		if (Dlist.size() == 0) {
			List<Subscribe> list = adminService.getM_id();
			for (int i = 0; i < list.size(); i++) {
				adminService.deliveryInsert(list.get(i).getM_id());
			}
		}
		response.getWriter().print(result);
	}

	@RequestMapping(value = "/delivery.net", method = RequestMethod.GET)
	public ModelAndView delivery(ModelAndView mv, HttpSession session) {
		List<Deliver> list = adminService.getDList();
		mv.setViewName("admin/admin_delivery");
		mv.addObject("list", list);
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/deliverSucess.net", method = RequestMethod.POST)
	public void deliverSucess(HttpServletResponse response) throws Exception {
		int result = adminService.deliveryUpdate();
		List<Deliver> list = adminService.getDList();
		for(Deliver d:list) {
			System.out.println("m_id:"+d.getM_id());
			int res = adminService.subDrop(d.getM_id());
			if(res != 0) System.out.println("해지");
			else System.out.println("구독중");
		}
		response.getWriter().print(result);
	}

	@RequestMapping(value = "/comment.net", method = RequestMethod.GET)
	public ModelAndView comment(ModelAndView mv) {
		List<Comments> comments_list = adminService.getCList();
		mv.setViewName("admin/admin_comment");
		mv.addObject("list", comments_list);
		return mv;
	}

	@RequestMapping(value = "/subscribe.net")
	public ModelAndView subscribe(ModelAndView mv, HttpServletRequest request) {
		List<Joinlist> list = adminService.getList();
		List<Subscribe> sub = new ArrayList<Subscribe>();
		for (Joinlist sublist : list) {
			sub = sublist.getSubscribe();
			String[] a = new String[13];
			for (Subscribe s : sub) {
				String day = s.getUpdatedate().substring(5, 7);
				if (day.equals("01"))
					a[0] = s.getB_title();
				if (day.equals("02"))
					a[1] = s.getB_title();
				if (day.equals("03"))
					a[2] = s.getB_title();
				if (day.equals("04"))
					a[3] = s.getB_title();
				if (day.equals("05"))
					a[4] = s.getB_title();
				if (day.equals("06"))
					a[5] = s.getB_title();
				if (day.equals("07"))
					a[6] = s.getB_title();
				if (day.equals("08"))
					a[7] = s.getB_title();
				if (day.equals("09"))
					a[8] = s.getB_title();
				if (day.equals("10"))
					a[9] = s.getB_title();
				if (day.equals("11"))
					a[10] = s.getB_title();
				if (day.equals("12"))
					a[11] = s.getB_title();
				String year = s.getUpdatedate().substring(0, 4);
				a[12] = year + "Y";
			}
			sublist.setMonth(a);
		}

		mv.setViewName("admin/admin_subscribe");
		mv.addObject("list", list);
		return mv;
	}

	@RequestMapping(value = "/report.net")
	public ModelAndView subscribe(ModelAndView mv) {
		List<Warn> list = adminService.warnList();
		for (Warn w : list) {
			System.out.println(w.getCmt_no() + ", " + w.getM_id() + ", " + w.getW_count());
			for (Warn_Check wc : w.getWarn_check()) {
				System.out.println(wc.getWc_date() + ", " + wc.getM_id() + ", " + wc.getWc_reason());
			}
		}
		mv.setViewName("admin/admin_report");
		mv.addObject("data", list);
		return mv;
	}
	
	@GetMapping(value="/reportDelete.net")
	public void reportDelete(int cmt_no,HttpServletResponse response) throws Exception {
		int result = adminService.warnDelete(cmt_no);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(result != 0) {
			out.println("alert('반려 성공');");
			out.println("location.href='report.net'");
		} else {
			out.println("alert('반려 실패');");
			out.println("location.href='report.net'");
		}
		out.println("</script>");
		out.close();
	}
	
	@GetMapping(value="/reportAccept.net")
	public void reportAccept(int cmt_no,HttpServletResponse response, String m_id) throws Exception {
		System.out.println("댓글 번호:"+cmt_no);
		int result = adminService.commentDelete(cmt_no);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		if(result != 0) {
			adminService.memberWarn(m_id);
			out.println("alert('접수 성공');");
			out.println("location.href='report.net'");
		} else {
			out.println("alert('접수 실패');");
			out.println("location.href='report.net'");
		}
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping(value = "/member_delete.net")
	public void deleteProcess(String id, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		int result = adminService.delete(id);
		out.println("<script>");
		// 탈퇴된 경우
		if (result == 1) {
			out.println("alert('탈퇴가 완료 되었습니다.');");
			out.println("location.href='member.net';");
		} else {
			out.println("history.back()");
		}
		out.println("</script>");
		out.close();
	}
}
