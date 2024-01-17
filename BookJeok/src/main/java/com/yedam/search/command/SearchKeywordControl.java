package com.yedam.search.command;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Control;
import com.yedam.search.service.SearchService;
import com.yedam.search.serviceImpl.SearchServiceImpl;
import com.yedam.search.vo.SearchVO;

public class SearchKeywordControl implements Control {

	@Override
	public void execute(HttpServletRequest req, HttpServletResponse resp) {
		resp.setContentType("text/json;charset=utf-8");
		// 검색어 실시간으로 보여주는 기능
		SearchService svc = new SearchServiceImpl();
		
		// 어제 날짜 기준
		Calendar today = Calendar.getInstance();
		
		int year = today.get(Calendar.YEAR);
		int month = today.get(Calendar.MONTH) + 1;
		int day = today.get(Calendar.DATE) - 7;
		
		String daysAgo = year + "/" + month + "/" + day;
		
		List<SearchVO> list = svc.searchKeyword(daysAgo);
		
		Gson gson = new GsonBuilder().create();
				
		try {
			resp.getWriter().print(gson.toJson(list));
		} catch (IOException e) {
			e.printStackTrace();
		}	
		
	}

}
