package com.yedam.likeIt.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.likeIt.mapper.LikeItMapper;
import com.yedam.likeIt.service.LikeItService;
import com.yedam.likeIt.vo.LikeItVO;

public class LikeItServiceImpl implements LikeItService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	LikeItMapper mapper = session.getMapper(LikeItMapper.class);

	@Override
	public List<LikeItVO> selectList(int memberNo) {
		return mapper.selectList(memberNo);
	}

	@Override
	public boolean remLikeIt(int bookNo, int memberNo) {
		return mapper.deleteLikeIt(bookNo, memberNo) == 1;
	}
	

}
