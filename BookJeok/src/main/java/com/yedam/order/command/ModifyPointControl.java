package com.yedam.order.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.order.service.OrderService;
import com.yedam.order.serviceImpl.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class ModifyPointControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		String point = req.getParameter("remainPoint");
		String memberNo = req.getParameter("memberNo");
		
		OrderVO vo = new OrderVO();
		vo.setPoint(Integer.parseInt(point));
		vo.setMemberNo(Integer.parseInt(memberNo));
		
		OrderService svc = new OrderServiceImpl();
		svc.modPoint(vo);
		
	}
}
