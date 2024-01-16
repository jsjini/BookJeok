package com.yedam.review.mapper;

import java.util.List;

import com.yedam.review.vo.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> selectOne(int bookNo);
}
