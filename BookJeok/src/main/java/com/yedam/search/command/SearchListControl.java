package com.yedam.search.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.book.vo.BookVO;
import com.yedam.common.Control;
import com.yedam.search.service.SearchService;
import com.yedam.search.serviceImpl.SearchServiceImpl;

public class SearchListControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 검색 목록 리스트
		SearchService svc = new SearchServiceImpl();
		
		String search = req.getParameter("search"); // 검색어 파라미터
		
		svc.addKeyword(search); // 검색어 저장
		
		List<BookVO> result = svc.searchList(search); // 검색결과
		req.setAttribute("resultVO", result);
		
		RequestDispatcher rd = req.getRequestDispatcher("book/bookSearchList.tiles");
		try {
			rd.forward(req, resp); // 요청을 재 지정하겠습니다.
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}
		

	}

}
