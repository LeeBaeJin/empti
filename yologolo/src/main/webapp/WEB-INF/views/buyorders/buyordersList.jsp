<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	
	$(function(){
		buyorderDelete();
		
		returnList();
		
		retrunUpdate();
	});
	
	//반품조회 처리
	function returnList() {
		$.ajax({
			url: 'getReturnBuyordersList',
			type: 'GET',
			dataType: 'json',
			success: BuyordersReturnResult,
			error:function(xhr,status, msg){
				alert("상태값: " + status + " 에러 메세지: "+ msg)
			}
		});
	
	}
	
	//반품 버튼
	function retrunUpdate() {
		$('.btnReturn').on('click', function(){
			var order_no = $('#tbodyReturn').find("#hidden_order_no").val();
			console.log(order_no);
			$.ajax({
				url: "setUpdateBuyordersRetrun/" + order_no,
				type: 'GET',
				dataType: 'json',
				success:  function(data){
					returnList();
				}						
			});	
		});
	}	
	
	//반품조회
	function BuyordersReturnResult(data) {
		$('#tbodyReturn').empty();
		$.each(data, function(inx, item){
	         $('<tr>')
	         .append($('<td>').html(item.order_date))
	         .append($('<td>').html(item.return_date))
	         .append($('<td>').html(item.buy_sum))
	         .append($('<td>').html(item.company_no))
	         .append($('<td>').html(item.emp_id))
	         .append($('<input type=\'hidden\' id=\'hidden_order_no\'>').val(item.order_no))
	         .appendTo('#tbodyReturn');
		});
	}



	
		
	
	//삭제 버튼
		function buyorderDelete(){
		$('.btnDelete').on("click", function() {
			var order_no = $(this).closest('tr').find('.buyorder01').text();
			console.log(order_no);
			var result = confirm(order_no +"번 구매주문을 삭제하시겠습니까?"); 
			if(result)
	            location.href="setDeleteBuyorders/" + order_no;
		    else 
		        	return false;
		});
	}
		

	


</script>

<div class="card shadow mb-4">
	<div class="card-header py-3">
		<h6 class="m-0 font-weight-bold text-primary">
			<a href="getBuyordersList">구매주문 내역 </a> | 
			<a href="setInsertFormBuyorders">구매주문 입력</a> |
			<a href="buyorders_list_pdf.do">PDF</a>
		</h6>
	</div>
	<div class="card-body">
		<div class="table-responsive">
			<table class="table table-bordered" id="dataTable" width="100%"	cellspacing="0">
				<thead>
					<tr>
						<th>주문일자</th>
						<th>구매합계</th>
						<th>담당사원</th>
						<th>거래처</th>
						<th>반품</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${buyordersList}" var="buy">
						<tr>
						<td>${buy.order_date}</td>
						<td>
						<fmt:parseNumber value="${buy.buy_sum}" var="fmt"/>
						<fmt:formatNumber type="number" maxFractionDigits="3" value="${fmt}"/>
						</td>
						<td>${buy.name}</td>
						<td>${buy.company_name}</td>
						<input type="hidden" value="${buy.order_no}" class="hidden_order_no">
						<td><button type="button" class="btnReturn">반품</button></td>
						<td><button type="button" class="btnUpdate">수정</button></td>
						<td><button type="button" class="btnDelete">삭제</button></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<hr/>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered" id="dataTable">
					<thead>
						<tr>
							<th>주문일자</th>
							<th>반품일자</th>
							<th>구매합계</th>
							<th>담당사원</th>
							<th>거래처</th>
						</tr>
					</thead>
					<tbody id="tbodyReturn">
					</tbody>
			
				</table>
				</div>
			</div>
		</div>
	</div>
</div>

