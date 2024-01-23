package com.yedam.review.mapper;

import java.util.List;

import com.yedam.review.vo.ReviewVO;

public interface ReviewMapper {
	List<ReviewVO> selectOne(int bookNo);
	
	int insertReview(ReviewVO vo);
	
	int selectReviewNo(ReviewVO vo);
	
	int deleteReview(int reviewNo);
}
