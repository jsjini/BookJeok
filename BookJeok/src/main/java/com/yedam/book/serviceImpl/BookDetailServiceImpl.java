package com.yedam.book.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import com.yedam.book.mapper.BookDetailMapper;
import com.yedam.book.service.BookDetailService;
import com.yedam.book.vo.BookVO;
import com.yedam.common.DataSource;

public class BookDetailServiceImpl implements BookDetailService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	BookDetailMapper mapper = session.getMapper(BookDetailMapper.class);

	@Override
	public BookVO selectOne(int bookNo) {
		return mapper.selectOne(bookNo);
	}
	

}
