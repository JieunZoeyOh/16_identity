$('.fa-filter').on('click',function(){
	$('#filtering_detail').toggle();
})
var checkboxValues = []; //checkbox 값
//처음 실행시  MBTI 전체 선택
$("input[type=checkbox]").prop("checked",true); 

$('input[type="radio"]').on('click', function(){
	var radioVal = $('input[type="radio"]:checked').val();
	if(radioVal == 'recency'){
		console.log('최신순');
		$('#sort_text').text('최신순');
	}else{
		$('#sort_text').text('인기순');
	}
})

//체크박스 전체 선택
$("#all").click(function(){ 
	if($("#all").prop("checked")) { 
		$("input[type=checkbox]").prop("checked",true);
		$('#Rall').css('display', 'inline-block');
		$('#Iall').css('display', 'none');
		$('#Eall').css('display', 'none');
	} else {
		$("input[type=checkbox]").prop("checked",false); 
		$('#Rall').css('display', 'none');
	} 
})

$('#all_i').click(function(){
	if($('#all_i').prop("checked")){//선택되었을 때
		$('input[id^=i]').prop('checked',true);//i로 시작하는 체크박스 모두 선택
		if($("#all").prop("checked")){//전체가 선택되어져있는 경우
			$('#Iall').css('display', 'none');//I전체 박스 숨기기
		}
		if($("#all_e").prop("checked")){
			$('#Rall').css('display', 'inline-block');
			$('#Eall').css('display', 'none');
			
		}
		$('#Iall').css('display', 'inline-block');
		if($('#all_e').prop("checked")){
			$('#all').prop('checked', true);
			$('#Iall').css('display', 'none');//I전체 박스 숨기기
		}
	}else{//선택 해제 시
		$('input[id^=i]').prop('checked',false);
		$('#Iall').css('display', 'none');
		if($("#all").prop("checked")){
			$('#all').prop('checked', false);
			$('#Rall').css('display', 'none');//전체 박스 숨기기
			$('#Eall').css('display', 'inline-block');//E전체 박스 나타내기
		}
	}
})

$('#all_e').click(function(){
	if($('#all_e').prop("checked")){//선택되었을 때
		$('input[id^=e]').prop('checked',true);//i로 시작하는 체크박스 모두 선택
		if($("#all").prop("checked")){//전체가 선택되어져있는 경우
			$('#Eall').css('display', 'none');//I전체 박스 숨기기
		}
		if($("#all_i").prop("checked")){
			$('#Rall').css('display', 'inline-block');
			$('#Iall').css('display', 'none');
			
		}
		$('#Eall').css('display', 'inline-block');
		if($('#all_i').prop("checked")){
			$('#all').prop('checked', true);
			$('#Eall').css('display', 'none');//I전체 박스 숨기기
		}
	}else{//선택 해제 시
		$('input[id^=e]').prop('checked',false);
		$('#Eall').css('display', 'none');
		if($("#all").prop("checked")){
			$('#all').prop('checked', false);
			$('#Rall').css('display', 'none');//전체 박스 숨기기
			$('#Iall').css('display', 'inline-block');//E전체 박스 나타내기
		}
	}
})

$('input[id^=e]').on('click',function(){
	if($('#all').prop('checked')){
		$('#all').prop('checked', false);
		$('#all_e').prop('checked', false);
		$('#Rall').css('display', 'none');//전체 박스 숨기기
		$('#Eall').css('display', 'none');//E 박스 숨기기
		if($('#all_i').prop("checked")){
			$('#Iall').css('display', 'inline-block');
		}
	}
	if($('#all_e').prop('checked')){
		$('#all_e').prop('checked', false);
		$('#Eall').css('display', 'none');
	}
})

$('input[id^=i]').on('click',function(){
	if($('#all').prop('checked')){
		$('#all').prop('checked', false);
		$('#all_i').prop('checked', false);
		$('#Rall').css('display', 'none');//전체 박스 숨기기
		$('#Iall').css('display', 'none');//I 박스 숨기기
		if($('#all_e').prop("checked")){
			$('#Eall').css('display', 'inline-block');
		}
	}
	if($('#all_i').prop('checked')){
		$('#all_i').prop('checked', false);
		$('#Iall').css('display', 'none');
	}
})

$('#Rall').on('click', function(){
	$('#Rall').css('display', 'none');//전체 박스 숨기기
	$("input[type=checkbox]").prop("checked",false); 
})

$('#Eall').on('click', function(){
	$('#Eall').css('display', 'none');//전체 박스 숨기기
	$('input[id^=e]').prop('checked',false);
	$('#all_e').prop('checked',false);
})

$('#Iall').on('click', function(){
	$('#Iall').css('display', 'none');//전체 박스 숨기기
	$('input[id^=i]').prop('checked',false);
	$('#all_i').prop('checked',false);
})
let page=1;
checkboxValues = ['istp', 'istj', 'isfp', 'isfj', 'intp', 'intj', 'infp', 'infj', 'estp', 'estj', 'esfp', 'esfj', 'entp', 'entj', 'enfp', 'enfj'];
getListReviewBoardAjax(1, 'recency');
$('#filter_button').on('click',function(e){
	$('#filtering_detail').hide();
	e.preventDefault();
	checkboxValues = [];
	$("input[name='mbti']:checked").each(function() {
        checkboxValues.push($(this).val());
    });
	var sort = $('input[type="radio"]:checked').val();
	page=1;
	getListReviewBoardAjax(page, sort);
	//return false; //submit 하지 않습니다.
})

function getListReviewBoardAjax(input_page, input_sort){
	$.ajax({
		url : "reviewBoardAjax.net",
		data : {
			page : input_page,
			sort : input_sort,
			mbti : checkboxValues
		},
		dataType : "json",
		success : function(data){
			var list_mbti = [];
			for(var i=0; i<data.mbti.length; i++){
				list_mbti.push("'"+data.mbti[i]+"'");
			}
			console.log(data.mbti.length);
			$('.board_wrap').empty();
			output ='';
			if(data.listcount > 0){
				$(data).each(function(){
					var num = data.listcount - (data.page - 1) * data.limit;
					output ='<table class="content_table"><thead><tr>'
						+ '<td colspan="2" rowspan="2">NO</td><td>책 제목</td><td>저자</td><td>날짜</td>'
						+ '<td>작성자</td><td>MBTI</td><td>좋아요</td></tr></thead><tbody>';
					$(data.reviewlist).each(function(index, item){
						output += '<tr><td rowspan="2">'+ (num--) + '</td>'
							   + '<td rowspan="2"><img src="'+item.b_thumbnail+'" /></td>'
							   + '<td><a href="./reviewpost.minji?isbn='+item.isbn+'">'+item.b_title+'</a></td>';
						output += '<td>'+ item.b_authors +'</td>';
						output += '<td>'+ item.cmt_date +'</td>';
						output += '<td>'+ item.cmt_nickname +'</td>';
						output += '<td>'+ item.cmt_mbti.toUpperCase() +'</td>';
						output += '<td><i class="fa fa-heart" aria-hidden="true"></i>'+ item.cmt_like;
						if(data.sort == 'popular'){
							output += '<i class="fa fa-plus" aria-hidden="true"></i><span>'+item.pluscount+'</span><i class="fa fa-long-arrow-up" aria-hidden="true"></i>'
						}
						output += '</td></tr>';
						output += '<tr><td colspan="6">'+ item.cmt_content +'</td></tr>';
					})
					output += '</tbody></table>';
				})
				output += '<div class="section"><div class="demo"><nav class="pagination">';
				
				if (data.page <= 1){
        			output += '<a class="r-link pagination__control pagination__control_prev" style="color:#cbccd278 !important;">prev</a>';
        		}
        		if (data.page > 1){
        			output += '<a href="javascript:getListReviewBoardAjax('+(data.page -1)+', '+"'"+data.sort+"'"+');" class="r-link pagination__control pagination__control_prev">prev</a>';
        		}
        		
        		output += '<ol class="r-list pagination__list">';
        		for(var pagecount = data.startpage; pagecount<= data.endpage; pagecount++) {
        			if(pagecount == data.page){
        				output += '<li class="pagination__group"><span class="pagination__point">'+pagecount+'</span></li>';
        			}
        			if(pagecount != data.page){
        				output += '<li class="pagination__group"><a href="javascript:getListReviewBoardAjax('+pagecount+', '+"'"+data.sort+"'"+');" class="r-link pagination__point">'+pagecount+'</a></li>';
        			}
        		}
        		output += '</ol>'
        		if(data.page >= data.maxpage) {
        			output += '<a class="r-link pagination__control pagination__control_next" style="color:#cbccd278 !important;">next</a>';
        		}           		
        		if(data.page < data.maxpage) {
        			output += '<a href="javascript:getListReviewBoardAjax('+(data.page + 1)+', '+"'"+data.sort+"'"+');" class="r-link pagination__control pagination__control_next">next</a>';
        		}
        		output += '</nav></div></div>'
			} else {
				output = '<font size=5>좋아요 한 책이 없습니다.</font>';
			}
			$('.board_wrap').append(output);
		},
		error : function(request,status,error){
			console.log("code = "+ request.status + " message = " + request.responseText + " error = " + error);
		}
	})
}