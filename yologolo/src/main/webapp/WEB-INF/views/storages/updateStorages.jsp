<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h1>창고 수정</h1>
	<form action="setUpdateStorages">
		<label>창고번호</label>	<input name="strg_no" value="${updateList.strg_no}" readonly>
		<label>창고유형</label>	<input name="strg_category" value="${updateList.strg_category}">
		<label>담당사원 사번</label>	<input name="emp_id" value="${updateList.emp_id}">
	<button type="submit">수정</button>
	</form>
</div>
