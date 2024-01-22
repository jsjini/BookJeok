package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class MyPage implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 내정보 기본값으로 보이게, 문의내역은 없어서 없다고 뜨게, 내 서재, 주문내역
		
		MemberVO vo = new MemberVO();
		MemberService svc = new MemberServiceImpl();
		
		if (vo != null) {
			HttpSession session = req.getSession(); //req.:요청정보
			session.setAttribute("logId", vo.getId());// 세션객체에 로그인아이값을 저장.
			//session.setAttribute("logPw", vo.getPw());
			session.setAttribute("logName", vo.getMName());
			session.setAttribute("memberNo", vo.getMemberNo()); //여기까지 넣었다가 마이페이지 정보때문에 밑에 더 넣음..
			session.setAttribute("email", vo.getEmail());
			session.setAttribute("age", vo.getAge());
			session.setAttribute("phone", vo.getPhone());
			session.setAttribute("likes", vo.getLikes());
			session.setAttribute("sms", vo.getSms());
			session.setAttribute("point", vo.getPoint());
		
		try {
			resp.sendRedirect("mypage.do");
			req.getRequestDispatcher("member/mypage.tiles").forward(req, resp);
		} catch (ServletException | IOException e) { 
			e.printStackTrace();
		}
	} else {
		req.setAttribute("message", "로그인이 필요한 서비스입니다.");	
	}
		return;
	}
}
