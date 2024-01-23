package com.yedam.order.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.order.mapper.OrderMapper;
import com.yedam.order.service.OrderService;
import com.yedam.order.vo.OrderVO;

public class OrderServiceImpl implements OrderService {

	SqlSession session = DataSource.getInstance().openSession(true);
	OrderMapper mapper = session.getMapper(OrderMapper.class);
	
	@Override
	public List<OrderVO> orderList(int memberNo) {
		return mapper.selectList(memberNo);
	}
	
	@Override
	public String checkOdNo(int memberNo) {
		return mapper.checkOrderNo(memberNo);
	}

	@Override
	public int addOrder(OrderVO vo) {
		return mapper.insertOrder(vo);
	}

	@Override
	public boolean modPoint(OrderVO vo) {
		return mapper.updatePoint(vo) == 1;
	}

	@Override
	public boolean remOrder(int odNo) {
		return mapper.deleteOrder(odNo) == 1;
	}

	@Override
	public boolean remOrderItem(int odNo) {
		return mapper.deleteOrderItem(odNo) == 1;
	}

}
