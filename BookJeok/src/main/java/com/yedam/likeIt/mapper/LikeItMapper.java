package com.yedam.likeIt.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.cart.vo.CartVO;
import com.yedam.likeIt.vo.LikeItVO;

public interface LikeItMapper {
	//찜 목록
	List<LikeItVO> selectList(int memberNo);
	
	//찜 추가
	int insertLikeIt(LikeItVO vo);
	
	//찜 추가 중복체크
	LikeItVO checkLikeIt(LikeItVO vo);
	
	//찜 삭제
	int deleteLikeIt(@Param("bookNo") int bookNo,  @Param("memberNo") int memberNo);
}
