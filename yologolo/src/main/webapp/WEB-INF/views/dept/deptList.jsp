<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
		<a href="getDeptList">부서 목록</a> | 
		<a href="setInsertFormDept">부서 입력</a> |
		<a href="departments_list.do">PDF</a>
		
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>부서번호</th>
						<th>부서명</th>
						<th>매니저번호</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${deptList}" var="dept">
						<tr>
							<td>${dept.dept_id}</td>
							<td>${dept.dept_name}</td>
							<td>${dept.emp_id}</td>
						</tr>
						
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>