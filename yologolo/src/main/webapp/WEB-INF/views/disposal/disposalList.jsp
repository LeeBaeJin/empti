<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="getDisposalList">폐기 내역 </a> | 
			<a href="setInsertFormDisposal">폐기 입력</a> | 
			<a href="disposal_list.do">PDF</a> | 
			<a href="disposal_excel.do">EXCEL</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" style="width: 100%;">
				<thead>
					<tr>
						<th>폐기/불량 번호</th>
						<th>폐기 수량</th>
						<th>단가</th>
						<th>폐기일</th>
						<th>구분</th>
						<th>창고번호</th>
						<th>품목코드</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${disposalList}" var="disposal">
						<tr>
							<td>${disposal.disposal_no}</td>
							<td>${disposal.disposal_qty}</td>
							<td>${disposal.price}</td>
							<td>${disposal.disposal_date}</td>
							<td>${disposal.category}</td>
							<td>${disposal.strg_no}</td>
							<td>${disposal.item_no}</td>
							<td>
							<a href="setUpdateFormDisposal?disposal_no=${disposal.disposal_no}">수정</a>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>



<%--    
<!DOCTYPE html>
<html>
<head>
<title>창고목록</title>
</head>
<body>
	<div align="center">
			<table>
				<tr>
					<th>폐기/불량 번호</th>
					<th>폐기 수량</th>
					<th>단가</th>
					<th>폐기일</th>
					<th>구분</th>
					<th>창고번호</th>
					<th>품목코드</th>
				
				</tr>
				<c:forEach items="${disposalList}" var="disposal">
				<tr>
					<td>${disposal.disposal_no}</td>
					<td>${disposal.disposal_qty}</td>
					<td>${disposal.price}</td>
					<td>${disposal.disposal_date}</td>
					<td>${disposal.category}</td>
					<td>${disposal.strg_no}</td>
					<td>${disposal.item_no}</td>
					<td><a href="setUpdateFormDisposal?disposal_no=${disposal.disposal_no}">수정</a></td>
					
				</tr>
				</c:forEach>
			</table>
		</div>
</body>
</html> --%>