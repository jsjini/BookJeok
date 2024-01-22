package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class LoginCheckControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 화면호출.
		try {
			// WILDCARD:*/* {1}폴더명 {2}파일명
			req.getRequestDispatcher("member/idcheck.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
		
		
		//		String msg = (String) req.getAttribute("message");
//		
//		if(msg != null) {
//			try {
//				req.setAttribute("message", msg);
//				req.getRequestDispatcher("main.do").forward(req, resp);
//				
//			} catch (ServletException | IOException e) {
//				e.printStackTrace();
//			}			
//		} else {
//			try {
//				resp.sendRedirect("main.do");
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
		

	}

}
