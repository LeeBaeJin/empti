<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<h1>사원등록</h1>
	<form action="setInsertEmp" method="post" enctype="multipart/form-data">
		<label>사원아이디</label>	<input name="emp_id"> <br/>
		<label>이름</label>		<input name="name"> <br/>
		<label>패스워드</label>	<input type="password" name="pwd"> <br/>
		<label>전화번호</label>	<input name="phone"> <br/>
		<label>주소</label>		<input name="address"> <br/>
		<label>이메일</label>		<input name="email"> <br/>
		<label>입사일</label>		<input name="hire_date" type="datetime-local"> <br/>
		<label>급여</label>		<input name="salary"> <br/>
		<label>계약유형</label>	<select name="position"> 
									<option value="" selected disabled hidden> ==선택하세요== </option>
									<option>정직원</option>
									<option>계약직</option>
									<option>일용직</option>
								</select><br/>
		<label>상태</label>		<select name="status">
									<option>재직</option>
									<option>퇴직</option>
									<option>휴가</option>
								</select> <br/>
		<label>거래은행</label>	<input name="bank_name"> <br/>
		<label>은행계좌</label>	<input name="account_no"> <br/>
		<label>부서번호</label>	<select name="dept_id" onchange="dept_select_value(this);"> 
									<c:forEach items="${dept}" var="dept">
										<option value="${dept.dept_name}">${dept.dept_id}</option>
									</c:forEach>
								</select>
								<span id="dept_name"></span>
								<br/>
		<label>이미지</label>     <input type="file" name="uploadFile"/>
	<button type="submit">등록</button>
	</form>
</div>
