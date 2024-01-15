package com.yedam.book.service;

import java.util.List;

import com.yedam.book.vo.BookVO;

public interface BookService {
public List<BookVO> bookList();
public List<BookVO> bookBestList();
public List<BookVO> bookNewList();
public List<BookVO> bookGenreList();

}
