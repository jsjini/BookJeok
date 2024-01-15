package com.yedam.search.service;

import java.util.List;

import com.yedam.search.vo.SearchVO;

public interface SearchService {
	List<SearchVO> searchList(String today);
}
