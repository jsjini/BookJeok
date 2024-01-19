package com.yedam.book.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.service.BookService;
import com.yedam.book.serviceImpl.BookServiceImpl;
import com.yedam.book.vo.BookVO;
import com.yedam.book.vo.PageDTO;
import com.yedam.common.Control;

public class PagingListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		String bookno= req.getParameter("bookNo");
		String page = req.getParameter("page");
		page = (page == null)? "1" : page;
		
		BookService svc = new BookServiceImpl();
		List<BookVO> pageList = svc.booksPagingList(Integer.parseInt(bookno), Integer.parseInt(page));
		int total = svc.totalCnt();
		int totalPage = (int)Math.ceil(total/12.0);
		
		PageDTO dto = new PageDTO(Integer.parseInt(page),total); 
		
		req.setAttribute("pageList", pageList);
		req.setAttribute("total", total);
		req.setAttribute("totalPage", totalPage);
		req.setAttribute("dto", dto);
		
		RequestDispatcher rd = req.getRequestDispatcher("book/bookGenreList.tiles");
		try {
			rd.forward(req, resp); // 요청을 재 지정하겠습니다.
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		
	}

}
