package com.yedam.orderItem.service;

import com.yedam.orderItem.vo.OrderItemPageVO;
import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemService {
	// 주문자 정보
	public OrderItemVO memberInfo(int memberNo);
		
	// 주문아이템 등록
	public boolean addOrderItem(OrderItemPageVO vo);
	
}
