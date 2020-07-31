<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
		<a href="getStoragesListMap">창고 목록</a> | 
		<a href="setInsertFormStorages">창고 등록</a> |
		<a href="storages.do">PDF</a> |
		<a href="storages_excel.do">EXCEL</a>
		
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
				<thead>
					<tr>
						<th>창고번호</th>
						<th>창고유형</th>
						<th>담당사원</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${storagesList}" var="storages">
						<tr>
							<td>${storages.strg_no}</td>
							<td>${storages.strg_category}</td>
							<td>${storages.name}</td>
							<td><a href="setUpdateFormStorages?strg_no=${storages.strg_no}">수정</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>