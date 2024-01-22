/**
 * searchKeyword.js
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
			 let newSpan = document.createElement('span');
			 newSpan.innerHTML = `${idx +1}위 ${item.keyword} `;
			 document.querySelector('.search-popular').appendChild(newSpan);
			 document.querySelector('.search-popular span').setAttribute('class', 'mx-2');
		 }
	 })
 })