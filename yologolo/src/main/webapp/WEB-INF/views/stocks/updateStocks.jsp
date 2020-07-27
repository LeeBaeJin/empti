<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h1>입출고내역 수정</h1>
	<form action="setUpdateStocks">
		<label>입출고번호</label>	<input name="stock_no" value="${updateList.stock_no}" readonly>
		<label>품목코드</label>	<input name="item_no" value="${updateList.item_no}">
		<label>거래유형</label>	<input name="stock_category" value="${updateList.stock_category}">
		<label>수량</label>		<input name="stock_qty" value="${updateList.stock_qty}" >
		<label>거래가</label>		<input name="stock_price" value="${updateList.stock_price}">
		<label>거래일자 </label>	<input name="stock_date" value="${updateList.stock_date}">
		<label>창고번호</label>	<input name="strg_no" value="${updateList.strg_no}" >
		<label>상세번호</label>	<input name="detail_no" value="${updateList.detail_no}">
		<label>비고</label>	<input name="note" value="${updateList.note}">
	<button type="submit">수정</button>
	</form>
</div>
