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
			 let newLi = document.createElement('li');
			 let content = ``;
			 
			 content += `<span>${idx +1}위<span> `;
			 content += `${item.keyword}`;
			 
			 newLi.innerHTML = content;
			 
			 document.querySelector('.search-popular').appendChild(newLi);
		 }
		$('.search-popular li').css('display', 'inline-block');
		$('.search-popular li').css('border', '1px solid #568A35');
		$('.search-popular li').css('border-radius', '.25rem');
		$('.search-popular li').css('color', '#568A35');
		$('.search-popular li').css('cursor', 'pointer');
				
		$('.search-popular li').addClass('mx-2 p-2 h6');
		
	 })
 
	 
 })

/*
$('.search-popular li').hover(function(){
	$('.search-popular li').css('color','blue');
});
*/
