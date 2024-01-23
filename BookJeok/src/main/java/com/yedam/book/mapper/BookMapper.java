package com.yedam.book.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.yedam.book.vo.BookVO;

public interface BookMapper {

	public List<BookVO> selectList();
	public List<BookVO> selectBestList(); //베스트셀러 
	public List<BookVO> selectNewList(); //신간도서
	public List<BookVO> selectGenreList(BookVO cat); //분야별 리스트 
	public List<BookVO> selectPageList (@Param("item") BookVO cat  , @Param("page") int page); //목록 페이징
	int selectCount(@Param("item") BookVO cat); //페이징 용 목록 카운트 
	public List<BookVO> selectRandomList();//랜덤도서리스트 출력

}
