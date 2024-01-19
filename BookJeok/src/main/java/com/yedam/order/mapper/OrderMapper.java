package com.yedam.order.mapper;

import java.util.List;

import com.yedam.order.vo.OrderVO;

public interface OrderMapper {
	// 주문 목록
	List<OrderVO> selectList(int memberNo);
}
