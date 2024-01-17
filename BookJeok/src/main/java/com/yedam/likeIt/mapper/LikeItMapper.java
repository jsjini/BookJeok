package com.yedam.likeIt.mapper;

import java.util.List;

import com.yedam.likeIt.vo.LikeItVO;

public interface LikeItMapper {
	List<LikeItVO> selectOne(int memberNo);
}
