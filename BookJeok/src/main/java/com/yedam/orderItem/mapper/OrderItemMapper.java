package com.yedam.orderItem.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.orderItem.vo.OrderItemPageVO;
import com.yedam.orderItem.vo.OrderItemVO;

public interface OrderItemMapper {
	// 주문자 정보
	OrderItemVO selectMemberInfo(int memberNo);

	// 주문상세 등록
	int insertOrderItem(OrderItemPageVO vo);

	// 주문상세 목록
	List<OrderItemPageVO> selectList(int odNo);

	// 리뷰 체크
	OrderItemPageVO selectReview(@Param("bookNo")int bookNo, @Param("orderitemNo")int orderitemNo, @Param("memberNo")int memberNo);
}
