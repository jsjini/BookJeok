package com.yedam.likeIt.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.likeIt.service.LikeItService;
import com.yedam.likeIt.serviceImpl.LikeItServiceImpl;

public class RemoveLikeItControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String bookNo = req.getParameter("bookNo");
		String memberNo = req.getParameter("memberNo");
		
		LikeItService svc = new LikeItServiceImpl();
		Map<String, Object> map = new HashMap<>();
		if(svc.remLikeIt(Integer.parseInt(bookNo), Integer.parseInt(memberNo))) {
			map.put("retCode", "OK");
		} else {
			map.put("retCode", "NG");
		}
				
		Gson gson = new GsonBuilder().create();
		try {
			resp.getWriter().print(gson.toJson(map));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
