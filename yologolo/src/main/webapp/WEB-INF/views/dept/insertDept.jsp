<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
    
<script>
var emp_select_value = function(select_obj) {
	if($("#emp_name").text() == ""){
	$("#emp_name").append(select_obj.value);
	}
	else {
	$("#emp_name").empty();
	$("#emp_name").append(select_obj.value);
	}	
}

function check() {
	if(frm.dept_id.value ==""){
		alert("부서번호를 입력해주세요.");
		frm.dept_id.focus();
		return;
	}
	if(frm.dept_name.value == ""){
		alert("부서이름을 입력해주세요.");
		frm.dept_name.focus();
		return;
	}
	if(frm.emp_id.value == ""){
		alert("부서장을 선택해주세요.");
		frm.emp_id.focus();
		return;
	}
}

</script>    
    
<div align="center">
	<h1>부서등록</h1>
	<form action="setInsertDept" id="frm">
		<label>부서번호</label>	 <input name="dept_id" id="dept_id"> <br/>
		<label>부서이름</label>	 <input name="dept_name" id="dept_name"> <br/>
		<label>부서장</label>	 <select name="emp_id" id="emp_id"onchange="emp_select_value(this);"> 
									<option value="" selected> ==선택하세요== </option>
									<c:forEach items="${emp}" var="emp" >
										<option value="${emp.emp_id}">${emp.name}</option>
									</c:forEach>
								 </select>
								 <span id="emp_name"></span>
								 <br/>
	<button type="submit" onclick="check()">등록</button>
	</form>
</div>