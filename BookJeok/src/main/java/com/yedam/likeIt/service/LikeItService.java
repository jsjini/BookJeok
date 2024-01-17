package com.yedam.likeIt.service;

import java.util.List;

import com.yedam.likeIt.vo.LikeItVO;

public interface LikeItService {
	public List<LikeItVO> selectOne(int memberNo);
}
