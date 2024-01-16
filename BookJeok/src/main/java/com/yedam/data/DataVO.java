package com.yedam.data;

import lombok.Data;

@Data
public class DataVO {
	private int bookNo;
	private String name;
	private String author;
	private String comp;
	private int price;
	private String dt;
	private String category;
	private String about;
	private String img;
	private String isbn;
	
	public DataVO(String author, String name, String isbn, String comp, int price) {
		this.author = author;
		this.name = name;
		this.isbn = isbn;
		this.comp = comp;
		this.price = price;
	}
	public DataVO() {
		
	}
}
