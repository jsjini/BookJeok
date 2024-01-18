package com.yedam.likeIt.mapper;

import java.util.List;

import com.yedam.likeIt.vo.LikeItVO;

public interface LikeItMapper {
	//찜 목록
	List<LikeItVO> selectList(int memberNo);
	
	//찜 삭제
	int deleteLikeIt(int bookNo, int memberNo);
}
