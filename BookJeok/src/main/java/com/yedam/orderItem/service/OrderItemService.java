package com.yedam.orderItem.service;

import java.util.List;

import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemService {
	// 주문아이템 목록
	public List<OrderItemVO> orderItemList(int odNo);
	
	// 주문아이템 삭제
	public boolean remOrderItem(int orderitemNo); 
	
	// 카트 수정
	public boolean modOrderItem(OrderItemVO vo); 
}
