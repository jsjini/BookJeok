package com.yedam.book.serviceImpl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.yedam.book.mapper.BookMapper;
import com.yedam.book.service.BookService;
import com.yedam.book.vo.BookVO;
import com.yedam.common.DataSource;


public class BookServiceImpl  implements BookService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	BookMapper mapper = session.getMapper(BookMapper.class);



	@Override
	public List<BookVO> bookList() {
		return mapper.selectList();
	}
	
	@Override
	public List<BookVO> bookBestList() {
		return mapper.selectBestList();
	}

	@Override
	public List<BookVO> bookNewList() {
		return mapper.selectNewList();
	}

	@Override
	public List<BookVO> bookGenreList(BookVO cat) {	
		return mapper.selectGenreList(cat);
	}


	@Override
	public List<BookVO> booksPagingList(int bookNo, int page) {
		return mapper.selectPageList(bookNo, page);
	}

	@Override
	public int totalCnt() {
		return mapper.selectCount();
	}



	

}
