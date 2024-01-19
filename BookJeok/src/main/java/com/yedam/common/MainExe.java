package com.yedam.common;

import com.yedam.cart.service.CartService;
import com.yedam.cart.serviceImpl.CartServiceImpl;
import com.yedam.cart.vo.CartVO;

public class MainExe {
	
	public static void main(String[] args) {
		// 테스트
		CartService svc = new CartServiceImpl();
		CartVO vo = new CartVO();
		vo.setMemberNo(1);
		vo.setBookNo(10);
		vo.setQuantity(1);
		
		svc.addCart(vo);
		
		System.out.println(svc.addCart(vo));
		
	}

}
