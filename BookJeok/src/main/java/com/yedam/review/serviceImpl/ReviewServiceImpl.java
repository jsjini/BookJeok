package com.yedam.review.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.review.mapper.ReviewMapper;
import com.yedam.review.service.ReviewService;
import com.yedam.review.vo.ReviewVO;

public class ReviewServiceImpl implements ReviewService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	ReviewMapper mapper = session.getMapper(ReviewMapper.class);

	@Override
	public List<ReviewVO> selectOne(int bookNo) {
		return mapper.selectOne(bookNo);
	}

	@Override
	public boolean addReview(ReviewVO vo) {
		return mapper.insertReview(vo) == 1;
	}

}
