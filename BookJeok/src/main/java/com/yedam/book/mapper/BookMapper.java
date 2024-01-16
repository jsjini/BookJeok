package com.yedam.book.mapper;

import java.util.List;

import com.yedam.book.vo.BookVO;

public interface BookMapper {

	public List<BookVO> selectList();
	public List<BookVO> selectBestList(); //베스트셀러 
	public List<BookVO> selectNewList(); //신간도서
	public List<BookVO> selectGenreList(BookVO cat); //분야별 리스트 

}
