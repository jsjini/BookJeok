package com.yedam.member.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.member.mapper.MemberMapper;
import com.yedam.member.service.MemberService;
import com.yedam.member.vo.MemberVO;

public class MemberServiceImpl implements MemberService{
	
	SqlSession session = DataSource.getInstance().openSession(true);
	MemberMapper mapper = session.getMapper(MemberMapper.class);
	
	@Override
	public boolean joinMember(MemberVO vo) {		
		return mapper.insertMember(vo) == 1;
	}
	
	@Override
	public MemberVO loginBook(String id, String pw) {
		// 여기서 로그인 없는 기본상태를 체크하자
		return mapper.selectMember(id, pw);
	}
	
	//마이페이지
	public MemberVO selectPage(int memberNo) {
		return mapper.selectPage(memberNo);
	}

}
