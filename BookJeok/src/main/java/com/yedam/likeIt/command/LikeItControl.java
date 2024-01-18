package com.yedam.likeIt.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.likeIt.service.LikeItService;
import com.yedam.likeIt.serviceImpl.LikeItServiceImpl;
import com.yedam.likeIt.vo.LikeItVO;

public class LikeItControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String memberNo = req.getParameter("memberNo");
		
		LikeItServiceImpl svc = new LikeItServiceImpl();
		List<LikeItVO> LikeItInfo = svc.selectList(Integer.parseInt(memberNo));
		
		req.setAttribute("LikeItVO", LikeItInfo);
		
		RequestDispatcher rd = req.getRequestDispatcher("likeIt/likeItList.tiles");
		try {
			rd.forward(req, resp);
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
