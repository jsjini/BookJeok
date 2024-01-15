package com.yedam.search.mapper;

import java.util.List;

import com.yedam.search.vo.SearchVO;


public interface SearchMapper {
	List<SearchVO> selectList(String today);
}
