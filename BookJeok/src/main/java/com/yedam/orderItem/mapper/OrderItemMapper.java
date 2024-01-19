package com.yedam.orderItem.mapper;

import java.util.List;

import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemMapper {
	// 주문아이템 목록
	OrderItemVO selectList(int memberNo);
	
//	// 주문아이템 삭제
//	int deleteOrderItem(int orderitemNo);
//	
//	// 주문아이템 수정
//	int updateOrderItem(OrderItemVO vo);
//	
//	// 주문아이템 등록
//	int insertOrderItem(OrderItemVO vo);
//	
//	// 주문번호 중복체크
//	OrderItemVO checkOrderNo(int odNo);
}
