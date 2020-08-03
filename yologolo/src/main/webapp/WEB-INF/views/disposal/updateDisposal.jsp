<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<div align="center">
	<h1>폐기/불량 수정</h1>
	<form action="setUpdateDisposal">
		<label>폐기/불량 번호</label>	<input name="disposal_no" value="${updateList.disposal_no}" readonly><br/>
		<label>폐기 수량</label>	<input type="number" name="disposal_qty" value="${updateList.disposal_qty}"><br/>
		<label>단가</label>	<input type="number" name="price" value="${updateList.price}"><br/>
		<label>폐기일</label>	<input name="disposal_date" value="${updateList.disposal_date}" ><br/>
		<label>구분</label>	<input name="category" value="${updateList.category}"><br/>
		<label>창고번호</label>	<input name="strg_no" value="${updateList.strg_no}"><br/>
		<label>품목코드</label>	<input name="item_no" value="${updateList.item_no}"><br/>
	<button type="submit">수정</button>
	</form>
</div>
