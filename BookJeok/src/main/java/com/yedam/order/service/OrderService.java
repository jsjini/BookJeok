package com.yedam.order.service;

import java.util.List;

import com.yedam.order.vo.OrderVO;

public interface OrderService {
	// 주문 목록
	public List<OrderVO> orderList(int memberNo);

}
