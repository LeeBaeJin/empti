<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
		<a href="getCompanyList">거래처 목록</a> | 
		<a href="setInsertFormCompany">거래처 입력</a> |
		<a href="companyPdf.do">PDF</a> |
		<a href="company_excel.do">EXCEL</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
				<thead>
					<tr>
						<th>거래처 넘버</th>
						<th>거래처 명</th>
						<th>대표번호</th>
						<th>주소</th>
						<th>대표자 성명</th>
						<th>담당자명</th>
						<th>담당자 전화번호</th>
						<th>거래은행</th>
						<th>계좌번호</th>
						<th>비고</th>
<!-- 						<th>수정</th>
						<th>삭제</th> -->
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${companyList}" var="company">
						<tr>
							<td>${company.company_no}</td>
							<td>${company.company_name}</td>
							<td>${company.phone}</td>
							<td>${company.address}</td>
							<td>${company.ceo_name}</td>
							<td>${company.dealer_name}</td>
							<td>${company.dealer_phone}</td>
							<td>${company.bank_name}</td>
							<td>${company.account_no}</td>
							<td>${company.note}</td>
<%-- 							<td><a href="setUpdateFormCompany?company_no=${company.company_no}">수정ㄱㄱ</a></td>
							<td><a href="setDeleteCompany?company_no=${company.company_no}">삭제</a></td> --%>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
