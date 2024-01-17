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
	public List<LikeItVO> selectOne(int memberNo) {
		return mapper.selectOne(memberNo);
	}
	

}
