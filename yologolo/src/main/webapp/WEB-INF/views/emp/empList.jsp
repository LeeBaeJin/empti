<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<style>
a.role {
 color: white;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script type="text/javascript">
	//권한부여 새창
	function openRole(empId) {
		window.open('getRoleList', 'roleList',
		'width=1700, height=600, left=150, top=100, location=no, status=no, scrollbars=yes');
		
		return false;
	}
</script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
		<a href="getEmpList">사원 목록</a> | 
		<a href="setInsertFormEmp">사원 등록</a> |
		<a href= "employees_list.do" onclick="window.open(this.href, 'width=800', 'height=1200', 'toolbars=no', 'scrollbars=yes'); return false">PDF</a> |
		
<!-- 		<a href="employees_list.do">PDF</a> | -->
		<a href="emp_excel.do">EXCEL</a> 
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" style="width: 100%;">
				<thead>
					<tr>
						<th style="width: 100px;">사원번호</th>
						<th>이름</th>
						<th>입사일</th>
						<th>구분</th>
						<th>부서명</th>
						<th>부서매니저</th>
						<th>권한부여</th>
					</tr>
				</thead>
				<tbody id="tblBody">
					<c:forEach items="${empList}" var="emp">
						<tr>
							<td><a href="setUpdateFormEmp?emp_id=${emp.emp_id}">${emp.emp_id}</a></td>
							<td>${emp.name}</td>
							<td>${emp.hire_date}</td>
							<td>${emp.position}</td>
							<td>${emp.dept_name}</td>
							<td>${emp.manager}</td>
							<td><a class="btn btn-info role" onclick="openRole(${emp.emp_id});">권한부여</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>