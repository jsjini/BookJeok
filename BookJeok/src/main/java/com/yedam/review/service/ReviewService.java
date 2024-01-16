package com.yedam.review.service;

import java.util.List;

import com.yedam.review.vo.ReviewVO;

public interface ReviewService {
	List<ReviewVO> selectOne(int bookNo);
}
