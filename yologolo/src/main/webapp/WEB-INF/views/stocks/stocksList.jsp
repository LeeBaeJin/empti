<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
		<a href="getStocksList">입출고 내역</a> | 
		<a href="setInsertFormStocks">입출고 입력</a> |
		<a href="stocks_list.do">PDF</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
				<thead>
					<tr>
						<th>입출고번호</th>
						<th>품목코드</th>
						<th>거래유형</th>
						<th>수량</th>
						<th>거래가</th>
						<th>거래일자</th>
						<th>창고번호</th>
						<th>상세번호</th>
						<th>비고</th>
						<th>수정</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${stocksList}" var="stocks">
						<tr>
							<td>${stocks.stock_no}</td>
							<td>${stocks.item_no}</td>
							<td>${stocks.stock_category}</td>
							<td>
								<fmt:parseNumber value="${stocks.stock_qty}" var="fmt"/>
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${fmt}"/>
							
							</td>
							<td>
								<fmt:parseNumber value="${stocks.stock_price}" var="fmt"/>
								<fmt:formatNumber type="number" maxFractionDigits="3" value="${fmt}"/>
							</td>
							<td>${stocks.stock_date}</td>
							<td>${stocks.strg_no}</td>
							<td>${stocks.detail_no}</td>
							<td>${stocks.note}</td>
							<td><a href="setUpdateFormStocks?stock_no=${stocks.stock_no}">수정</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>