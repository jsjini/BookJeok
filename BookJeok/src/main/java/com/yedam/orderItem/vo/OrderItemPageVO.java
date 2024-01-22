package com.yedam.orderItem.vo;

import lombok.Data;
@Data
public class OrderItemPageVO {
	private int orderitemNo;
	private int odNo;
	private int bookNo;
	private String img;
	private String name;
	private int price;
	private int quantity;
	
	private String contents;
	private String rdt;
}
