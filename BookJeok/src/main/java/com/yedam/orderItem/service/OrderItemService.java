package com.yedam.orderItem.service;

import java.util.List;

import com.yedam.orderItem.vo.OrderItemPageVO;
import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemService {
	// 주문자 정보
	public OrderItemVO memberInfo(int memberNo);

	// 주문상세 등록
	public boolean addOrderItem(OrderItemPageVO vo);

	// 주문상세 목록
	public List<OrderItemPageVO> orderItemList(int odNo);

}
