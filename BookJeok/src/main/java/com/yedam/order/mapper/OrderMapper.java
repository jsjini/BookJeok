package com.yedam.order.mapper;

import java.util.List;

import com.yedam.order.vo.OrderVO;

public interface OrderMapper {
	// 주문 목록
	List<OrderVO> selectList(int memberNo);
	
	// 주문 추가
	int insertOrder(OrderVO vo);
	
	// 주문번호 중복체크
	String checkOrderNo(int memberNo);
	
	// 회원 포인트 사용 후 변경
	int updatePoint(OrderVO vo);
}
