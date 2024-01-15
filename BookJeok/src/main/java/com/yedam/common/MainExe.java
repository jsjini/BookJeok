package com.yedam.common;

import java.util.List;

import com.yedam.search.service.SearchService;
import com.yedam.search.serviceImpl.SearchServiceImpl;
import com.yedam.search.vo.SearchVO;

public class MainExe {

	public static void main(String[] args) {
		// 검색어 테스트
		// 저장된 검색어 실시간으로 보여주는 기능
				SearchService ssvc = new SearchServiceImpl();
				// 오늘 날짜 기준
				String today = "24/01/15"; 
				List<SearchVO> searchVO = ssvc.searchList(today);
				
				System.out.println(searchVO.toString());

	}

}
