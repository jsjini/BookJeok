package com.yedam.common;

import org.apache.ibatis.session.SqlSession;

import com.yedam.book.mapper.BookMapper;

public class Mainexe { // 테스트용 클래스
	public static void main(String[] args) {
		SqlSession session = DataSource.getInstance().openSession(true);
		BookMapper mapper = session.getMapper(BookMapper.class);
		
		String mapper1 = mapper.selectList();
		System.out.println(mapper1);
	}

}
