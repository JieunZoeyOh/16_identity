<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
$(function(){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp18582962');
	IMP.request_pay({
	    pg : 'inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    customer_uid: "${m_id}",
	    name : '주문명:${substate}',
	    amount : 16900,
	    buyer_email : '${m_id}',
	    buyer_name : '${m_name}',
	    buyer_tel : '${m_tel}',
	    buyer_addr : '${m_address}',
	    buyer_postcode : '${m_address_no}',
	    m_redirect_url : 'http://localhost:8088/16Identity/payments/complete'
	}, function(rsp) {
	    if ( rsp.success ) {
	        msg = '${substate} 결제가 완료되었습니다.';
	        location.href="/16Identity/kakaopaySuccess.com?m_id=${m_id}&substate=${substate}"; 
	        self.close();
	        
	    } else {
	    	msg = '${substate} 결제에 실패하였습니다.';
	    	self.close();
	    }
	    alert(msg);
	});
});
</script>
</head>
<body>
</body>
</html>