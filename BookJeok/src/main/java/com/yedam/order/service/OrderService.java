package com.yedam.order.service;

import java.util.List;

import com.yedam.order.vo.OrderVO;

public interface OrderService {
	// 주문 목록
	public List<OrderVO> orderList(int memberNo);
	
	// 주문번호 중복체크
	public String checkOdNo(int memberNo);
	
	// 주문 추가
	public int addOrder(OrderVO vo);
	
	// 회원 포인트 수정
	public boolean modPoint(OrderVO vo);
	
	
}
