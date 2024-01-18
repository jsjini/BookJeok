package com.yedam.orderItem.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderItemVO {
	//뷰로부터 전달받을 값
	private int bookNo;
	private int quantity;
	private int memberNo;
	//DB로부터 꺼내올 값
	private String name;
	private int price;
	private String img;
	
	private int orderitemNo; // 기능 지울때 지우자.
	//만들어 낼 값
	private int totalPrice;
	private int point;
	private int totalPoint;
	
	
	public void totalInfo() {
		this.totalPrice = this.price * this.quantity;
		this.point = (int)(this.price * 0.05);
		this.totalPoint = (int)(this.totalPrice * 0.05);
	}
}
