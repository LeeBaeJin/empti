<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	//거래처 상세조회
	function compDetail(company_no) {
		location.href = "getCompanyList/" + company_no
	}
	
	//수정폼으로 이동
	function upFrom(companyNo) {
		location.href = "setUpdateFormCompany?company_no=" + companyNo
	}
</script>
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
			<table class="table table-bordered" id="dataTable" style="width: 100%;">
				<thead>
					<tr>
						<th>거래처 명</th>
						<th>주소</th>
						<th>대표자 성명</th>
						<th>담당자 성명</th>
						<th>담당자 번호</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${companyList}" var="company">
						<tr>
							<td><a href="#" onclick="compDetail(${company.company_no});">${company.company_name}</a></td>
							<td>
							${company.zip_code}<br>
							${company.address}<br>
							${company.address_detail}
							</td>
							<td>${company.ceo_name}</td>
							<td>${company.dealer_name}</td>
							<td>${company.dealer_phone}</td>
 							<td><button type="button" onclick="upFrom(${company.company_no})" class="btn btn-primary">수정</button></td>
							<td><a href="setDeleteCompany?company_no=${company.company_no}" class="btn btn-primary">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
