<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	label{display:inline-block; width:80px;}
</style>

<div>
	<h2 class="display-4 text-dark"  style=font-size:30px>창고  수정</h2>
	<form action="setUpdateStorages" class="from-group">
		<label>창고번호</label>	<input name="strg_no" value="${updateList.strg_no}" readonly><br>
		<label>창고유형</label>	<input name="strg_category" value="${updateList.strg_category}"><br>
		<label>담당사원 사번</label>	<input name="emp_id" value="${updateList.emp_id}"><br>
	<button class="btn btn-primary" type="submit">수정</button>
	</form>
</div>
