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

</script>    
    
<div align="center">
	<h1>부서등록</h1>
	<form action="setInsertDept">
		<label>부서번호</label>	 <input name="dept_id"> <br/>
		<label>부서이름</label>	 <input name="dept_name"> <br/>
		<label>매니저아이디</label>	 <select name="emp_id" onchange="emp_select_value(this);"> 
									<c:forEach items="${emp}" var="emp" >
										<option value="" selected> ==선택하세요== </option>
										<option value="${emp.name}">${emp.emp_id}</option>
									</c:forEach>
								 </select>
								 <span id="emp_name"></span>
								 <br/>
	<button type="submit">등록</button>
	</form>
</div>