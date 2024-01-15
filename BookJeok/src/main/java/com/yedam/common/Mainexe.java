package com.yedam.common;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.cart.mapper.CartMapper;
import com.yedam.cart.vo.CartVO;


public class Mainexe { // 테스트용 클래스
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true);
		CartMapper mapper = session.getMapper(CartMapper.class);
		
		// 목록테스트
//		List<CartVO> mapper1 = mapper.selectList(2);

		// 등록테스트
//		int quantity = 2;
//		int memberNo = 1;
//		int bookNo = 2;
//		CartVO vo = new CartVO();
//		vo.setQuantity(quantity);
//		vo.setMemberNo(memberNo);
//		vo.setBookNo(bookNo);
//		int mapper1 = mapper.insertCart(vo);
		
		// 삭제테스트
//		int mapper1 = mapper.deleteCart(7);
		
		// 수정테스트
//		int cartNo = 7;
//		int quantity = 1;
//		CartVO vo = new CartVO();
//		vo.setCartNo(cartNo);
//		vo.setQuantity(quantity);
//		int mapper1 = mapper.updateCart(vo);
		
		
//		System.out.println(mapper1);
	}

}
