package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;

public class MyPage implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 내정보 추가..?, 내 서재, 주문내역
		try {
			req.getRequestDispatcher("member/mypage.jsp").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		

	}

}
