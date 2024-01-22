package com.yedam.order.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.order.service.OrderService;
import com.yedam.order.serviceImpl.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class AddOrderControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String odNo = req.getParameter("odNo");
		String odTg = req.getParameter("odTg");
		String odAd = req.getParameter("odAd");
		String odt = req.getParameter("odt");
		String odStatus = req.getParameter("odStatus");
		String odPrice = req.getParameter("odPrice");
		String usePoint = req.getParameter("usePoint");
		String odTotal = req.getParameter("odTotal");
		String memberNo = req.getParameter("memberNo");
		String phone = req.getParameter("phone");
		String point = req.getParameter("remainPoint");

		OrderVO vo = new OrderVO();
		vo.setOdNo(Integer.parseInt(odNo));
		vo.setOdTg(odTg);
		vo.setOdAd(odAd);
		vo.setOdt(odt);
		vo.setOdStatus(odStatus);
		vo.setOdPrice(Integer.parseInt(odPrice));
		vo.setUsePoint(Integer.parseInt(usePoint));
		vo.setOdTotal(Integer.parseInt(odTotal));
		vo.setMemberNo(Integer.parseInt(memberNo));
		vo.setPhone(phone);
		vo.setPoint(Integer.parseInt(point));
		
		OrderService svc = new OrderServiceImpl();
		Map<String, Object> map = new HashMap<>();

		if (svc.addOrder(vo) == 1) {
			map.put("retCode", "OK");
			map.put("odNo", vo.getOdNo());
			map.put("point", vo.getPoint());
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
