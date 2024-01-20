package com.yedam.orderItem.mapper;

import com.yedam.orderItem.vo.OrderItemPageVO;
import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemMapper {
	// 주문자 정보
	OrderItemVO selectMemberInfo(int memberNo);
	
	// 주문아이템 등록
	int insertOrderItem(OrderItemPageVO vo);

}
