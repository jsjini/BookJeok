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
import com.yedam.likeIt.vo.LikeItVO;

public class AddLikeItControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		// memberNo, bookNo, quantity
		String memberNo = req.getParameter("memberNo");
		String bookNo = req.getParameter("bookNo");
		
		LikeItVO vo = new LikeItVO();
		vo.setMemberNo(Integer.parseInt(memberNo));
		vo.setBookNo(Integer.parseInt(bookNo));
		
		LikeItService svc = new LikeItServiceImpl();
		Map<String, Object> map = new HashMap<>();
		
		// 아작스로 json 데이터 가져오는게 아니면 호출해서 숫자값으로 조건걸기.
//		svc.addCart(vo);
		
		
		if(svc.addLikeIt(vo) == 1) {
			map.put("retCode", "OK");
		} else if (svc.addLikeIt(vo) == 2){
			map.put("retCode", "CK");
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
