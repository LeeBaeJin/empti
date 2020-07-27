<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
$(function() {
	$(".emlDetail").on("click", function() {
		var empid = $(this).html();
		$.ajax({
			url: "empDetail",
			data: {emp_id:empid},
			method: 'post',
			dataType: 'json',
		}).done(function(result) {

			var wo = window.open("about:blank", "empDetail","width=300,height=auto");
			wo.document.write("emp_id: " + result.emp_id + '<br/>');
			wo.document.write("name: " + result.name + '<br/>');
			wo.document.write("phone:  " + result.phone + '<br/>' );
			wo.document.write("account_no:  " + result.account_no  + '<br/>');
			wo.document.write("address:  " + result.address + '<br/>' );
			wo.document.write("bank_name:  " + result.bank_name + '<br/>' );
			wo.document.write("dept_id:  " + result.dept_id  + '<br/>');
			wo.document.write("email:  " + result.email + '<br/>' );
			wo.document.write("hire_date:  " + result.hire_date  + '<br/>');
			wo.document.write("salary:  " + result.salary  + '<br/>');
			wo.document.write("position:  " + result.position  + '<br/>');
			wo.document.write("status:  " + result.status  + '<br/>');
			wo.document.write("mgr_id:  " + result.mgr_id  + '<br/>');
			if(result.profile != null)
			wo.document.write("profile: " + '<img src="download?name='+result.profile+ '" style="width:80px">' );
		     return wo;
		})
	});
});


</script>


<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
		<a href="getEmpList">사원 목록</a> | 
		<a href="setInsertFormEmp">사원 등록</a> |
		<a href="employees_list.do">PDF</a>
		
		</h6>
	</div>
	
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>사원아이디</th>
						<th>이름</th>
						<th>입사일</th>
						<th>구분</th>
						<th>부서명</th>
						<th>부서매니저</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${empList}" var="emp">
						<tr>
							<td><a href="#" class="emlDetail">${emp.emp_id}</a></td>
							<td>${emp.name}</td>
							<td>${emp.hire_date}</td>
							<td>${emp.position}</td>
							<td>${emp.dept_name}</td>
							<td>${emp.manager}</td>
							<td><a href="setUpdateFormEmp?emp_id=${emp.emp_id}">수정</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>