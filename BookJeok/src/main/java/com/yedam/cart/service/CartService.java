package com.yedam.cart.service;

import java.util.List;

import com.yedam.cart.vo.CartVO;

public interface CartService {
	// 카트 목록
	public List<CartVO> cartList(int memberNo);
	
	// 카트 등록
	public boolean addCart(CartVO vo); 
	
	// 카트 삭제
	public boolean remCart(int cartNo); 
	
	// 카트 수정
	public boolean modCart(CartVO vo); 
}
