<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
	label{display:inline-block; width:120px;}
</style>
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

//비밀번호 유효성 검사
$(function (){
	$('.pw').focusout(function() {
		var pwd1 = $("#pwd").val();
		var pwd2 = $("#pwd2").val();
		if (pwd1 != '' && pwd2 == '') {

		} else if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$('#pw').empty()
				$('#pw')
				.append($('<span>')).text(" 비밀번호가 일치합니다.")
			} else {
				$('#pw').empty()
				$('#pw')
				.append($('<span>')).text("비밀번호가 일치하지 않습니다.")
				
			}
		}
	});
});

</script>  
<div class="col-sm-12 my-auto">
	<h2 class="display-4 text-dark"  style=font-size:30px;>사원수정</h2>
	<form action="setUpdateEmp" method="post" enctype="multipart/form-data" class="form form-group">
		<label>사원아이디 </label>	 <input name="emp_id" value="${empUp.emp_id}" readonly> <br/>
		<label>이름 </label>		 <input name="name" value="${empUp.name}"> <br/>
		<label>패스워드 </label>	 <input type="password" name="pwd" id="pwd" class="pw" value="${empUp.pwd}"> <br/>
		<label>패스워드 확인 </label> <input type="password" name="pwd2" id="pwd2" class="pw" value="${empUp.pwd2}"> <br/>
		<div id="pw"></div>
		<label>전화번호 </label>	 <input name="phone" value="${empUp.phone}"> <br/>
		<label>주소 </label>		 <input class="form-control" name="zip_code" id="addr1" readonly="readonly" style="width: 15%; display: inline;" placeholder="우편번호" value="${empUp.zip_code}">
		<label></label>			 <button class="btn btn-default" type="button"  onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button><br/>                             
		<label></label>			 <input class="form-control" name="address" id="addr2" readonly="readonly" style="top: 5px; width: 35%; display: inline;" placeholder="도로명 주소" value="${empUp.address}"><br/>
		<label></label>			 <input class="form-control" name="address_detail" id="addr3" style="width: 35%; display: inline;" placeholder="상세주소" value="${empUp.address_detail}">
								 <br/>
		<label>이메일 </label>		 <input name="email" value="${empUp.email}"> <br/>
		<label>입사일 </label>		 <input name="hire_date" value="${empUp.hire_date}" type="date"> <br/>
		<label>급여 </label>		 <input name="salary" value="${empUp.salary}"> <br/>
		<label>계약유형: </label>	 <input name="position" value="${empUp.position}"> <br/>
		<label>상태 </label>		 <input name="status" value="${empUp.status}"> <br/>
		<label>거래은행 </label>	 <input name="bank_name" value="${empUp.bank_name}"> <br/>
		<label>은행계좌</label>	 <input name="account_no" value="${empUp.account_no}"> <br/>
		<label>부서번호 </label>	 <select name="dept_id" onchange="dept_select_value(this);"> 
									<option selected value="${empUp.dept_id}">${empUp.dept_name}</option>
									<option >--------------</option>
									<c:forEach items="${deptList}" var="dept">
										<option value="${dept.dept_id}">${dept.dept_name}</option>
									</c:forEach>
								</select>
								<span id="dept_name"></span>
								<br/>
		<label>이미지 </label>    <input type="file" name="uploadFile" />${empUp.profile}<br>
								<input type="hidden" name="uploadFile" value="${empUp.profile}">
	<button type="submit" class="btn btn-primary">수정</button>
	</form>
</div>
