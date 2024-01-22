package com.yedam.order.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class OrderVO {
	private int odNo;  			// 주문번호
	private String odTg;  		// 주문자 이름
	private String odAd;  		// 배송 주소
	private String odt;   		// 주문일자
	private String odStatus;	// 주문상태
	private int odPrice;		// 총 상품금액
	private int usePoint;		// 사용포인트
	private int odTotal;		// 총 결제금액
	private int memberNo;		// 회원번호
	private String phone;		// 주문자 폰번호
	private int point;			// 사용 후 남은 포인트
}
