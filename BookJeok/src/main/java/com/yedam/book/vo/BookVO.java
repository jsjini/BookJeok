package com.yedam.book.vo;

import java.util.List;

import lombok.Data;

@Data
public class BookVO {

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
	private String[] categories;

}

