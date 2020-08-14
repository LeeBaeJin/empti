<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="getStocksList">입출고 목록</a> | 
			<a href="setInsertStocks">입출고내역 입력</a> |
			<a href= "" onclick="window.open(this.href, 'width=800', 'height=1200', 'toolbars=no', 'scrollbars=yes'); return false">PDF</a> |
			<a href="">EXCEL</a> 
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<a href="" class="btn btn-outline-primary">전체내역</a> | 
			<a href="" class="btn btn-outline-primary">입고내역</a> |
			<a href="" class="btn btn-outline-primary">출고내역</a> <br><br>
			<table class="table table-bordered" id="dataTable" style="width: 100%; cellspacing=0;">
				<thead id="tblHead">
					<tr style="text-align: center;">
						<th><input type="checkbox" class="chkAll"></th>
						<th>입출고날짜</th>
						<th>유형</th>
						<th>주문번호</th>
						<th>품목명</th>
						<th>수량</th>
						<th>거래처명</th>
						<th>창고</th>
						<th>비고</th>
						<th style="display:none;">입출고번호</th>
					</tr>
				</thead>
				<tbody id="tblBody">
					<c:forEach items="${stocks}" var="stc">
						<tr>
							<td align="center"><input type="checkbox" value="${stc.stock_no}"></td>
							<td>
								<fmt:parseDate value="${stc.stock_date}" var="fmtDate" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:formatDate value="${fmtDate}" pattern="yyyy-MM-dd HH:mm"/>
							</td>
							<td>${stc.stock_category}</td>
							<c:if test="${stc.stock_category eq '입고'}">
								<td>B_${stc.border_no}</td>
							</c:if>
							<c:if test="${stc.stock_category eq '출고'}">
								<td>S_${stc.sorder_no}</td>
							</c:if>
							<td>${stc.item_name}</td>
							<td align="right">${stc.stock_qty}</td>
							<td>${stc.company_name}</td>
							<td>${stc.strg_category }</td>
							<td>${stc.stock_status}</td>
							<td style="display:none;">${stc.stock_no}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
