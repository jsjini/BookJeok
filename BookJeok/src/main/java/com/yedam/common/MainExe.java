package com.yedam.common;

import java.util.List;

import com.yedam.review.service.ReviewService;
import com.yedam.review.serviceImpl.ReviewServiceImpl;
import com.yedam.review.vo.ReviewVO;
import com.yedam.search.service.SearchService;
import com.yedam.search.serviceImpl.SearchServiceImpl;
import com.yedam.search.vo.SearchVO;

public class MainExe {

	public static void main(String[] args) {
		ReviewService svc = new ReviewServiceImpl();
		List<ReviewVO> reviewInfo = svc.selectOne(1);
		System.out.println(reviewInfo.toString());

	}

}
