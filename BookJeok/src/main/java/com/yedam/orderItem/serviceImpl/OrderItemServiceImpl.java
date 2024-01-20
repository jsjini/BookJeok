package com.yedam.orderItem.serviceImpl;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.orderItem.mapper.OrderItemMapper;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.vo.OrderItemPageVO;
import com.yedam.orderItem.vo.OrderItemVO;

public class OrderItemServiceImpl implements OrderItemService {

	SqlSession session = DataSource.getInstance().openSession(true);
	OrderItemMapper mapper = session.getMapper(OrderItemMapper.class);

	@Override
	public OrderItemVO memberInfo(int memberNo) {
		return mapper.selectMemberInfo(memberNo);
	}

	@Override
	public boolean addOrderItem(OrderItemPageVO vo) {
		return mapper.insertOrderItem(vo) == 1;
	}

}
