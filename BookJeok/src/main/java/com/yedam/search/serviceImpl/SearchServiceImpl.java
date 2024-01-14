package com.yedam.search.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.search.mapper.SearchMapper;
import com.yedam.search.service.SearchService;
import com.yedam.search.vo.SearchVO;

public class SearchServiceImpl implements SearchService {
	
	SqlSession session = DataSource.getInstance().openSession(true);
	SearchMapper mapper = session.getMapper(SearchMapper.class);

	@Override
	public List<SearchVO> searchList(String today) {
		return mapper.selectList(today);
	}

}
