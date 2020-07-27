<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>

</script>
<div align="center">
	<h1>거래처수정</h1>
	<form action="setUpdateCompany">
		<label>회사번호</label><input name="company_no" value="${company.company_no}" readonly="readonly">
		<label>회사이름</label><input name="company_name" value="${company.company_name}">
		<label>회사대표번호</label>	<input name="phone" value="${company.phone}">
		<label>대표 이름</label><input name="ceo_name" value="${company.ceo_name}">
		<label>주소</label><input name="address" value="${company.address}">
		<label>담당자 전화번호</label><input name="dealer_phone" value="${company.dealer_phone}">
		<label>담당자 이름</label><input name="dealer_name" value="${company.dealer_name}">
		<label>거래은행</label><input name="bank_name" value="${company.bank_name}">
		<label>은행계좌</label><input name="account_no" value="${company.account_no}">
		<label>비고</label><input name="note" value="${company.note}">
	<button type="submit">수정</button>
	</form>
</div>