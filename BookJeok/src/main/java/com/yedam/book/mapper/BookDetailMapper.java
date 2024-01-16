package com.yedam.book.mapper;


import com.yedam.book.vo.BookVO;

public interface BookDetailMapper {
	BookVO selectOne(int bookNo);
}
