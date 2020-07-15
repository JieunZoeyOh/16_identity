<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://localhost:82/socket.io/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-1.11.1.js"></script>
<script>
// "/subscription/issue-billing"에 대한 POST 요청을 처리
app.post("/subscriptions/issue-billing", async (req, res) => {
  try {
    const {
      card_number, // 카드 번호
      expiry, // 카드 유효기간
      birth, // 생년월일
      pwd_2digit, // 카드 비밀번호 앞 두자리,
      customer_uid, // 카드(빌링키)와 1:1로 대응하는 값
    } = req.body; // req의 body에서 카드정보 추출
    
  } catch (e) {
    res.status(400).send(e);
  }
});
</script>
<title>Insert title here</title>
</head>
<body>
  <form action="https://www.myservice.com/subscription/issue-billing" method="post">
    <div>
        <label for="card_number">카드 번호 XXXX-XXXX-XXXX-XXXX</label>
        <input id="card_number" type="text" name="card_number">
    </div>
    <div>
        <label for="expiry">카드 유효기간 YYYY-MM</label>
        <input id="expiry" type="text" name="expiry">
    </div>
    <div>
        <label for="birth">생년월일 YYMMDD</label>
        <input id="birth" type="text" name="birth">
    </div>
    <div>
        <label for="pwd_2digit">카드 비밀번호 앞 두자리 XX</label>
        <input id="pwd_2digit" type="text" name="pwd_2digit">
    </div>
    <input type="text" value="gildong_0001_1234" name="customer_uid" hidden="">
    <input type="submit" value="결제하기">
  </form>
</body>
</html>