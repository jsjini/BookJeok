package com.yedam.member.mapper;

import org.apache.ibatis.annotations.Param;

import com.yedam.member.vo.MemberVO;

public interface MemberMapper {

	public int insertMember(MemberVO vo);
	public MemberVO selectMember(@Param("id") String id, @Param("pw") String pw);
	public MemberVO selectPage(int memberNo); 
}
