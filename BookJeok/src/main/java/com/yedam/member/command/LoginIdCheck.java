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

public class LoginIdCheck implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// TODO Auto-generated method stub
		MemberVO vo = new MemberVO(); // 기본생성자 호출
		if (req.getMethod().equals("GET")) {
			// GET 방식 요청일 때
			RequestDispatcher rd = req.getRequestDispatcher("/WEB-INF/member/idcheck.jsp");
			try {
				rd.forward(req, resp); // 요청을 재 지정하겠습니다.
			} catch (ServletException | IOException e) {
				e.printStackTrace();
			}

		} else if (req.getMethod().equals("POST")) {

			String id = req.getParameter("id");
			String pw = req.getParameter("pw");

			vo = new MemberVO(); // 기본생성자 호출
			vo.setId(id);
			vo.setPw(pw);

			MemberService svc = new MemberServiceImpl();
			try {
				if (svc.joinMember(vo)) {
					resp.sendRedirect("main.do"); 
					req.setAttribute("message", "환영합니다");
				} else {
					resp.sendRedirect("loginBook.do");
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

		} // end of if

	} // end of execute()

	}

