package com.yedam.book.service;

import com.yedam.book.vo.BookVO;

public interface BookDetailService {
	BookVO selectOne(int book_no);
}
