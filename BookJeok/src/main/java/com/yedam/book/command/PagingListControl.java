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
		String[] cat= req.getParameterValues("categories");
		String page = req.getParameter("page");
		page = (page == null || page.equals(""))? "1" : page;
		
		System.out.println(page);
		BookService svc = new BookServiceImpl();
		BookVO vo = new BookVO();
		vo.setCategories(cat);
		//List<BookVO> list = svc.bookGenreList(vo,Integer.parseInt(page));
		List<BookVO> pageList = svc.booksPagingList(vo,Integer.parseInt(page));
		int total = svc.totalCnt(vo);
		int totalPage = (int)Math.ceil(total/12.0);
		
		PageDTO dto = new PageDTO(Integer.parseInt(page),total); 
		//req.setAttribute("bookGenreList", list);
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
