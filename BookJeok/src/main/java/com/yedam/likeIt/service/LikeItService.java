package com.yedam.likeIt.service;

import java.util.List;

import com.yedam.likeIt.vo.LikeItVO;

public interface LikeItService {
	//찜 목록
	public List<LikeItVO> selectList(int memberNo);
	
	//찜 삭제
	public boolean remLikeIt(int bookNo, int memberNo);
}
