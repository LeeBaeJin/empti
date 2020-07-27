<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h1>창고 수정</h1>
	<form action="setUpdateItems">
		<label>품목코드</label>	<input name="item_no" value="${updateList.item_no}" readonly>
		<label>품목명</label>	<input name="item_name" value="${updateList.item_name}">
		<label>품목유형</label>	<input name="category" value="${updateList.category}">
		<label>단위</label>	<input name="unit" value="${updateList.unit}" >
		<label>유통기한</label>	<input name="exp_date" value="${updateList.exp_date}">
		<label>가공품 원가</label>	<input name="item_price" value="${updateList.item_price}">
		
	<button type="submit">수정</button>
	</form>
</div>
