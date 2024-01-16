package com.yedam.search.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Control;
import com.yedam.search.service.SearchService;
import com.yedam.search.serviceImpl.SearchServiceImpl;
import com.yedam.search.vo.SearchVO;

public class SearchKeywordControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		// 저장된 검색어 실시간으로 보여주는 기능
		SearchService svc = new SearchServiceImpl();
		
		// 오늘 날짜 기준
		String today = "24/01/05"; 
		
		//List<SearchVO> list = svc.searchList(today);
		
		//req.setAttribute("searchVO", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("book/bookList.tiles");
		try {
			rd.forward(req, resp); // 요청을 재 지정하겠습니다.
		} catch (ServletException | IOException e) {
			e.printStackTrace();
		}

	}

}
