<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div align = "center">
	<h1>판매주문 수정</h1>
	<form action="setUpdateSaleorders">
		주문번호 <input name= "order_no" value="">
		주문일자 <input name= "order_date">
		판매합계 <input name= "sale_sum">
		배송상태 <input name= "del_status">
		사원번호 <input name= "emp_id">
		거래처코드 <input name= "company_no">		
	<button type="submit">등록</button>
	</form>
</div>