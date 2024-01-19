package com.yedam.orderItem.service;

import java.util.List;

import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemService {
	// 주문아이템 목록
	public OrderItemVO orderItemList(int memberNo);
	
//	// 주문아이템 삭제
//	public boolean remOrderItem(int orderitemNo); 
//	
//	// 주문아이템 수정
//	public boolean modOrderItem(OrderItemVO vo); 
//	
//	// 주문아이템 등록
//	public int addOrderItem(OrderItemVO vo);
}
