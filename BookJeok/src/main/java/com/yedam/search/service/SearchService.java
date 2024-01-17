package com.yedam.search.service;

import java.util.List;

import com.yedam.book.vo.BookVO;
import com.yedam.search.vo.SearchVO;

public interface SearchService {
	List<SearchVO> searchKeyword(String daysAgo); // 인기검색어
	boolean addKeyword(String search); // 검색어 DB 저장
	List<BookVO> searchList(String keyword); // 결과 목록 보기
}
