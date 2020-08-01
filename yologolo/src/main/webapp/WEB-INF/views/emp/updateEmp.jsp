<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>    

<script>
var dept_select_value = function(select_obj) {
	if($("#dept_name").text() == ""){
	$("#dept_name").append(select_obj.value);
	}
	else {
	$("#dept_name").empty();
	$("#dept_name").append(select_obj.value);
	}	
}

</script>  
<div align="center">
	<h1>사원수정</h1>
	<form action="setUpdateEmp" method="post" enctype="multipart/form-data">
		<label>사원아이디</label>	<input name="emp_id" value="${empUp.emp_id}" readonly> <br/>
		<label>이름</label>		<input name="name" value="${empUp.name}"> <br/>
		<label>패스워드</label>	<input type="password" name="pwd" value="${empUp.pwd}"> <br/>
		<label>전화번호</label>	<input name="phone" value="${empUp.phone}"> <br/>
		<label>주소</label>		<input name="address" value="${empUp.address}"> <br/>
		<label>이메일</label>		<input name="email" value="${empUp.email}"> <br/>
		<label>입사일</label>		<input name="hire_date" value="${empUp.hire_date}" type="datetime-local"> <br/>
		<label>급여</label>		<input name="salary" value="${empUp.salary}"> <br/>
		<label>계약유형</label>	<input name="position" value="${empUp.position}"> <br/>
		<label>상태</label>		<input name="status" value="${empUp.status}"> <br/>
		<label>거래은행</label>	<input name="bank_name" value="${empUp.bank_name}"> <br/>
		<label>은행계좌</label>	<input name="account_no" value="${empUp.account_no}"> <br/>
		<label>부서번호</label>	<select name="dept_id" onchange="dept_select_value(this);"> 
									<option selected>==선택하세요==</option>
									<c:forEach items="${deptList}" var="dept">
										<option value="${dept.dept_id}">${dept.dept_name}</option>
									</c:forEach>
								</select>
								<span id="dept_name"></span>
								<br/>
		<label>이미지</label>     <input type="file" name="uploadFile" />${empUp.profile}
	<button type="submit">수정</button>
	</form>
</div>
