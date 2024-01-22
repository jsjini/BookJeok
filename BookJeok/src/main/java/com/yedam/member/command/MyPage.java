package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.member.vo.MemberVO;

public class MyPage implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 내정보 기본값으로 보이게, 문의내역은 없어서 없다고 뜨게, 내 서재, 주문내역
		
		MemberVO vo = new MemberVO();
		
		try {
			
			req.getRequestDispatcher("member/mypage.tiles").forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		

	}

}
