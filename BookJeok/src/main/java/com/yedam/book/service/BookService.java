package com.yedam.book.service;

import java.util.List;
import java.util.Map;

import com.yedam.book.vo.BookVO;

public interface BookService {

	public List<BookVO> bookList();
	public List<BookVO> bookBestList();
	public List<BookVO> bookNewList();
	public List<BookVO> bookGenreList(BookVO cat);
	public List<BookVO> booksPagingList(int bookno, int page);
	public int totalCnt();
}
