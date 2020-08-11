<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<style>
	label{display:inline-block; width:80px;}
</style>

<div align="center">
	<h2 class="display-4 text-dark"  style=font-size:35px>창고  수정</h2><br/>
	<form action="setUpdateStorages" class="from-group">
		<div class="col-sm-2" align="left" >
			<label>창고번호</label>	<input name="strg_no" value="${updateList.strg_no}" class="form-control" readonly><br>
			<label>창고유형</label>	<input name="strg_category" class="form-control" value="${updateList.strg_category}"><br>
			
			<label>담당사원</label>	
						<select name="emp_id" id="emp_id" class="form-control">
							<option value="" selected>==사원 선택==</option>
							<c:forEach items="${emps}" var="emps"> 
							<option value="${emps.emp_id}" <c:if test="${emps.emp_id == updateList.emp_id }">selected</c:if>   >${emps.name}</option>
							</c:forEach>
						</select><br/>
			<div align="center">
				<button class="btn btn-primary" type="submit">수정</button>
			</div>
		</div>
	</form>
</div>
