package com.yedam.search.service;

import java.util.List;

import com.yedam.book.vo.BookVO;
import com.yedam.search.vo.SearchVO;

public interface SearchService {
	List<SearchVO> searchKeyword(String today); // 인기검 검색어
	List<BookVO> searchList(String keyword); // 결과 목록 보기
}
