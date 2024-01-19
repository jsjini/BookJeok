package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.service.MemberService;
import com.yedam.member.serviceImpl.MemberServiceImpl;
import com.yedam.member.vo.MemberVO;

public class JoinControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// parameter(3개), DB insert, 목록페이지.
		MemberVO vo = new MemberVO(); // 기본생성자 호출
		if (req.getMethod().equals("GET")) {
			// GET 방식 요청일 때
			// 3개 : title=테스트&content=입력내용&writer=홍길동
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/member/memberjoin.jsp");
			try {
				rd.forward(req, resp); // 요청을 재 지정하겠습니다.
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}

		} else if (req.getMethod().equals("POST")) {

			String id = req.getParameter("id");
			String mName = req.getParameter("mName");
			String pw = req.getParameter("pw");
			String email = req.getParameter("email");
			String age = req.getParameter("age");
			String phone = req.getParameter("phone");
			String likes = req.getParameter("likes");
			String sms = req.getParameter("sms");

			vo = new MemberVO(); // 기본생성자 호출
			vo.setId(id);
			vo.setMName(mName);
			vo.setPw(pw);
			vo.setEmail(email);
			vo.setAge(age);
			vo.setPhone(phone);
			vo.setLikes(likes);
			vo.setSms(sms);

			MemberService svc = new MemberServiceImpl();
			try {
				if (svc.joinMember(vo)) {
					resp.sendRedirect("main.do?msg=1"); //Joinresult.do
					req.setAttribute("message", "환영합니다");
				} else {
					resp.sendRedirect("memberJoin.do");
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		} // end of if

	} // end of execute()

}
