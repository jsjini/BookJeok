/**
 * search.js
 */

// ajax로 인기검색어 출력하기
 fetch('searchKeyword.do', {
 })
 .then(result => result.json())
 .then(result => {
	 //console.log(result);
	 
	 result.forEach((item, idx) => {
		 //console.log(item);
		 if(idx < 5) {
			 let span = document.createElement('span');
			 span.innerHTML = `${item.keyword}  (${item.hit}회)`;
			 document.querySelector('.search-popular').appendChild(span);
			 span.setAttribute('class', 'mx-2');
		 }
	 })
 })