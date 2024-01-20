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

public class LoginBookControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		
		String id = req.getParameter("id");
		String pw = req.getParameter("pw");
				
		MemberService svc = new MemberServiceImpl();

		MemberVO vo = svc.loginBook(id, pw);
		
		if (vo != null) {
			// 로그인 성공. ->세션에 정보 담아야 됨. 세션객체에 로그인정보를 저장함.
			HttpSession session = req.getSession(); //req.:요청정보
			session.setAttribute("logId", vo.getId());// 세션객체에 로그인아이값을 저장.
			session.setAttribute("logPw", vo.getPw());
			session.setAttribute("logName", vo.getMName());
			session.setAttribute("memberNo", vo.getMemberNo());

			try {
				resp.sendRedirect("main.do");
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			req.setAttribute("message", "fail");	
			
			try {
				req.getRequestDispatcher("main.do").forward(req, resp);
				//resp.sendRedirect("loginCheck.do");
				
			} catch (IOException | ServletException e) {
				e.printStackTrace();
			}
		}
	}

}
