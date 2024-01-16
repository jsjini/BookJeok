package com.yedam.search.mapper;

import java.util.List;

import com.yedam.book.vo.BookVO;
import com.yedam.search.vo.SearchVO;


public interface SearchMapper {
	List<SearchVO> selectKeyword(String today);
	List<BookVO> selectList(String keyword);
}
