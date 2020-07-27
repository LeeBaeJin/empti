<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align="center">
	<h1>거래처등록</h1>
	<form action="setInsertCompany">
		<label>회사번호</label>	<input name="company_no"> <br/>
		<label>회사이름</label>	<input name="company_name"> <br/>
		<label>회사대표번호</label>	<input name="phone"> <br/>
		<label>대표 이름</label>	<input name="ceo_name"> <br/>
		<label>주소</label>	<input name="address"> <br/>
		<label>담당자 전화번호</label>	<input name="dealer_phone"> <br/>
		<label>담당자 이름</label>	<input name="dealer_name"> <br/>
		<label>거래은행</label>	<input name="bank_name"> <br/>
		<label>은행계좌</label>	<input name="account_no"> <br/>
		<label>비고</label>	<input name="note"> <br/>
	<button type="submit">등록</button>
	</form>
</div>