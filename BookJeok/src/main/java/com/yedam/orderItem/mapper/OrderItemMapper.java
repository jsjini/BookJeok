package com.yedam.orderItem.mapper;

import java.util.List;

import com.yedam.orderItem.vo.OrderItemPageVO;
import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemMapper {
	// 주문자 정보
	OrderItemVO selectMemberInfo(int memberNo);

	// 주문상세 등록
	int insertOrderItem(OrderItemPageVO vo);

	// 주문상세 목록
	List<OrderItemPageVO> selectList(int odNo);

}
