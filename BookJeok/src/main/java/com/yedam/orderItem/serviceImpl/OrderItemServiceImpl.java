package com.yedam.orderItem.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.orderItem.mapper.OrderItemMapper;
import com.yedam.orderItem.service.OrderItemService;
import com.yedam.orderItem.vo.OrderItemVO;

public class OrderItemServiceImpl implements OrderItemService {

	SqlSession session = DataSource.getInstance().openSession(true);
	OrderItemMapper mapper = session.getMapper(OrderItemMapper.class);

	@Override
	public List<OrderItemVO> orderItemList(int odNo) {
		return mapper.selectList(odNo);
	}

	@Override
	public boolean remOrderItem(int orderitemNo) {
		return mapper.deleteOrderItem(orderitemNo) == 1;
	}

}
