/**
 * commonFunc.js
 */

// 가격 천단위 ','넣기 
function makeComma(price) {
	// toString() 숫자 -> 문자열
	// replace(정규표현식, "대체문자열")
	// 정규표현식 \B(63개 문자에 일치하는 경계), {n}(n개) \d(숫자) g(전역검색)
	// x(?=y) -> "x" 뒤에 "y"가 오는 경우에만 "x"와 일치
	// x(?!y) -> "x" 뒤에 "y"가 없는 경우에만 "x"와 일치
	
	return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
}