<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
	<h1>부서수정</h1>
	<form action="setUpdateDept">
		<label>부서번호</label>	 <input name="dept_id" value="${deptUp.dept_id}" readonly>
		<label>부서이름</label>	 <input name="dept_name" value="${deptUp.dept_name}">
		<label>매니저아이디</label>	 <input name="emp_id" value="${deptUp.emp_id}">
	<button type="submit">수정</button>
	</form>
</div>