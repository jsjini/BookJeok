package com.yedam.cart.vo;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import lombok.Data;
@Data
public class CartVO {
	private int cartNo;
	private int quantity;
	private int memberNo;
	private int bookNo;

	private String name;
	private int price;
	private String img;

	private int totalPrice;
	private String putDate;

	private int addPoint;
	
	public CartVO(int cartNo, int quantity, int memberNo, int bookNo, String name, int price, String img) {
		LocalDate now = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		String formatedNow = now.format(formatter);
		this.quantity = quantity;
		this.price = price;
		this.totalPrice = this.price * this.quantity;
		this.putDate = formatedNow;
		this.addPoint = (int)(this.totalPrice * 0.05);
	}

}
