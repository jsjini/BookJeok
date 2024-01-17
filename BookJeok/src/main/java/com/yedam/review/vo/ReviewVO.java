package com.yedam.review.vo;

import lombok.Data;

@Data
public class ReviewVO {

	private int reviewNo;
	private String contents;
	private String rdt;
	private int memberNo;
	private int orderItemNo;
	private String mname;
	private int price; 
}
