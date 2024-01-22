package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;


public class MyPageControl implements Control {

	MemberVO vo = new MemberVO();
	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 내정보 기본값으로 보이게(단건조회가 제일 쉬움), 나의 리뷰, 내 서재(링크), 주문내역(링크)
		HttpSession session = req.getSession();
		int memberNo = (Integer)session.getAttribute("memberNo");
		MemberService svc = new MemberServiceImpl(); 
		MemberVO vo = svc.selectPage(memberNo); //파라미터가 int 라서 int 로 받아줌
		req.setAttribute("vo", vo);
		RequestDispatcher rd = req.getRequestDispatcher("member/mypage.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
	}
}
	
