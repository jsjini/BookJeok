package com.yedam.cart.mapper;

import java.util.List;

import com.yedam.cart.vo.CartVO;

public interface CartMapper {
	// 카트 목록
	List<CartVO> selectList(int memberNo);
	
	// 카트 추가 
	int insertCart(CartVO vo);
		
	// 카트 삭제
	int deleteCart(int cartNo);
		
	// 카트 수량 수정
	int updateCart(CartVO vo);
		
}
