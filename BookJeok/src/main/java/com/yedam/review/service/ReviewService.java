package com.yedam.review.service;

import java.util.List;

import com.yedam.review.vo.ReviewVO;

public interface ReviewService {
	public List<ReviewVO> selectOne(int bookNo);
	
	public boolean addReview(ReviewVO vo);
}
