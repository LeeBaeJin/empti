<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://code.jquery.com/jquery-3.5.1.js integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>  
<style>
	label{display:inline-block; width:80px;}
</style>
<script>
	function check() {
		if(frm.strg_no.value ==""){
			alert("창고번호를 입력해주세요.");
			frm.strg_no.focus();
			return;
		}
		if(frm.strg_category.value == ""){
			alert("창고유형을 입력해주세요.");
			frm.strg_category.focus();
			return;
		}
		if(frm.emp_id.value == ""){
			alert("담당사원을 입력해주세요.");
			frm.emp_id.focus();
			return;
		}

	}
</script>
<div align="center">
		<h2 class="display-4 text-dark"  style=font-size:35px>창고 입력</h2><br/>
			<form action="setInsertStorages" id="frm" class="from-group">
				<div class="col-sm-2" align="left" >
				<label>창고번호</label>	<input name="strg_no" id="strg_no" class="form-control"><br/>
				<label>창고유형</label>	<input name="strg_category" id="strg_category" class="form-control"><br/>
				<label>담당사원</label>	
						<select name="emp_id" id="emp_id" class="form-control">
							<option value="" selected>=======사원 선택========</option>
							<c:forEach items="${emps}" var="emps"> 
							<option value="${emps.emp_id}">${emps.name}</option>
							</c:forEach>
						</select><br/>
			<div align="center">
				<button class="btn btn-success" type="submit" onclick="check()">등록</button>
			</div>
		</div>
			</form>
</div>