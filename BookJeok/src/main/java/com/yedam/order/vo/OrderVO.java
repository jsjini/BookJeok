package com.yedam.order.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderVO {
	private int odNo;
	private String odTg;
	private String odAd;
	private String odt;
	private String odStatus;
	private int odPrice;
	private int usePoint;
	private int odTotal;
	private int memberNo;
	private String phone;
	
}
