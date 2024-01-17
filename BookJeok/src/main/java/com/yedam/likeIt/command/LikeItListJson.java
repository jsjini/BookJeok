package com.yedam.likeIt.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.likeIt.service.LikeItService;
import com.yedam.likeIt.serviceImpl.LikeItServiceImpl;
import com.yedam.likeIt.vo.LikeItVO;

public class LikeItListJson implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String memberNo = req.getParameter("memberNo");

		LikeItService svc = new LikeItServiceImpl();
		List<LikeItVO> list = svc.selectOne(Integer.parseInt(memberNo));
		Gson gson = new GsonBuilder().create();

		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
