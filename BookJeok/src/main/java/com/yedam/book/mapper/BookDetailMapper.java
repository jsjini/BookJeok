package com.yedam.book.mapper;

import java.util.List;

import com.yedam.book.vo.BookVO;

public interface BookDetailMapper {
	BookVO selectOne(int bookNo);
}
