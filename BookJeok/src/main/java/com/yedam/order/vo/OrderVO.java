package com.yedam.order.vo;

import java.util.List;

import com.yedam.orderItem.vo.OrderItemVO;

import lombok.Data;
@Data
public class OrderVO {
	private List<OrderItemVO> orders;
}
