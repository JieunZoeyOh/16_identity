$(function(){
	$(".card_wrap").hide(); 
	
	function getList(currentPage){
		$.ajax({
			type : "get",
			url : "myReview.net",
			data : {
				"content" : cmt_content,
				"page" : currentPage
			},
			dataType ="json",
			succeess : function(resp){
				if(resp.length > 0){
					$(".card_wrap").show(); //문서 로딩 될 때 보이게함
					$("flip-card-wrap clearfix").show(); //리뷰가 있으면 
					output = "";
					$(resp).each( //반복
							function(){
								var cmt_content = this.cmt_content;
								console.log(this.cmt_id);
								console.log(this.cmt_content);
								output += "<div class ='flip-card'> <a href='https://www.naver.com/' class = 'flip-card-inner'>;"
								output += "<div class = 'flip-card-front'>";
								output += "<p>"+this.cmt_content+"</p>";
								output += "</div> <div class = 'flip-card-back'>";
								output += "<p>카드 뒷면</p>";
								output += "</div>";
								output += "</a> </div>"; 
							});
				}
			}
		})
	}
});