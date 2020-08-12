<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<head>
<script>
//페이지 로드
$(function(){
	//데이터 테이블 주문일자 역 정렬
	$('#dataTable').DataTable({
		  order: [[0, 'desc']],
		  ordering: true,
		  serverSide: false
	});
});

function orderDetails(return_no) {
	window.open('getSaleorderdetailList?sorder_no=' + return_no,
				'saleorderdetails',
				'width=800, height=300, left=150, top=250, location=no, status=no, scrollbars=yes');
	return false;
}
</script>
</head>
<body>
<div class="card shadow mb-4">
	<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">
			<a href="getSaleordersListMap">판매주문 목록</a> | 
			<a href="setInsertFormSaleorders">판매주문 입력</a> |
			<a href= "saleorders_list.do" onclick="window.open(this.href, 'width=800', 'height=1200', 'toolbars=no', 'scrollbars=yes'); return false">PDF</a> |
			<!-- <a href="saleorders_list.do">PDF</a> | -->
			<a href="sorderexcel.do">EXCEL</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<a href="getSaleordersListMap" class="btn btn-outline-primary">주문내역</a> | 
			<a href="getReturnSaleordersList" class="btn btn-outline-primary">반품내역</a> <br><br>
			<table class="table table-bordered" id="dataTable" style="width: 100%; cellspacing=0;">
				<thead id="tblhead">
					<tr>
						<th>주문일자</th>
						<th>반품일자</th>
						<th>반품합계</th>
						<th>주문담당</th>
						<th>거래처</th>
						<th style="display: none;"></th>
						<th style="display: none;"></th>
					</tr>
				</thead>
				<tbody id="tblBody">
					<c:forEach items="${returnSorders}" var="rs">
					<tr>
						<td> <a href="javascript:void(0);" onclick="orderDetails(${rs.return_no});">${rs.sorder_date}</a></td>
						
						<td>${rs.return_date}</td>
						
						<td align="right">
						<fmt:parseNumber value="${rs.sale_sum}" var="fmt"/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${fmt}"/>
						</td>
						
						<td>${rs.name}</td>
						
						<td>${rs.company_name}</td>
						
						<td style="display: none;">${rs.sorder_no}</td>
						<td style="display: none;">${rs.return_no}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</div>
</body>