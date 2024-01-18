package com.yedam.orderItem.mapper;

import java.util.List;

import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemMapper {
	// 주문아이템 목록
	List<OrderItemVO> selectList(int odNo);
	
	// 주문아이템 삭제
	int deleteOrderItem(int orderitemNo);
	
	// 주문아이템 수정
	int updateOrderItem(OrderItemVO vo);
	
	// 주문아이템 등록
	int insertOrderItem(OrderItemVO vo);
}
