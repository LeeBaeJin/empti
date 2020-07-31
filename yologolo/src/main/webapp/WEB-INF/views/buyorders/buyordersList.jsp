<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>
<script>
	$(function(){
		buyorderSelect();
		
		buyorderDelete();
		
		returnList();
		
		retrunUpdate();
	});
	
	//전체 조회
	function buyorderSelect() {
		$.ajax({
			url: 'getBuyordersListMap',
			type: 'GET',
			dataType: 'json',
			success: BuyordersResult,
			error:function(xhr,status, msg){
				alert("전체 상태값: " + status + " 에러 메세지: "+ msg)
			}
		});
	}
	
	function BuyordersResult(data) {
		$('#tbodyBuyorders').empty();
		$.each(data, function(inx, item){
	         $('<tr>')
	         .append($('<td>').append($('<a>').attr({'href':"javascript:void(0)", "onclick":"orderDetails("+item.order_no+")"}).html(item.order_date)))
	         .append($('<td>').html(item.buy_sum))
	         .append($('<td>').html(item.name))
	         .append($('<td>').html(item.company_name))
	         .append($('<td>').html('<button id=\'btnReturn\'>반품</button>'))
	         .append($('<td>').html('<button id=\'btnUpdate\'>수정</button>'))
	         .append($('<td>').html('<button id=\'btnDelete\'>삭제</button>'))
	         .append($('<td style="display:none;" id=\'hidden_order_no\'>').val(item.order_no))
	         .appendTo('#tbodyBuyorders');
		});
		
	}
	
	//반품조회 처리
	function returnList() {
		$.ajax({
			url: 'getReturnBuyordersList',
			type: 'GET',
			dataType: 'json',
			success: BuyordersReturnResult,
			error:function(xhr,status, msg){
				alert("반품 상태값: " + status + " 에러 메세지: "+ msg)
			}
		});
	}
	
	//반품 버튼
	function retrunUpdate() {
		$('#tbodyBuyorders').on('click', '#btnReturn', function(){
			var order_no = $(this).closest('tr').find('#hidden_order_no').val();
			var result = confirm(order_no +"번 구매주문을 반품하시겠습니까?"); 
			console.log(order_no);
			if(result){
				$.ajax({
					url: "setUpdateBuyordersRetrun/" + order_no,
					type: 'PUT',
					dataType: 'json',
					success:  function(data){
						buyorderSelect();
						returnList();
					}						
				});	
			} else {
				return false;
			}
			
		})
	}	
	
	//반품조회
	function BuyordersReturnResult(data) {
		$('#tbodyReturn').empty();
		$.each(data, function(inx, item){
	         $('<tr>')
	         .append($('<td>').append($('<a>').attr({'href':"javascript:void(0)", "onclick":"orderDetails("+item.order_no+")"}).html(item.order_date)))
	         .append($('<td>').html(item.return_date))
	         .append($('<td>').html(item.buy_sum))
	         .append($('<td>').html(item.company_name))
	         .append($('<td>').html(item.name))
	         .append($('<td style="display:none;" id=\'hidden_order_no\'>').val(item.order_no))
	         .appendTo('#tbodyReturn');
		});
	}

	//삭제 버튼
	function buyorderDelete(){
		$('#tbodyBuyorders').on('click','#btnDelete', function() {
			var order_no = $(this).closest('tr').find('#hidden_order_no').val();
			console.log(order_no);
			var result = confirm(order_no +"번 구매주문을 삭제하시겠습니까?"); 
			if(result){
				$.ajax({
					url: 'setDeleteBuyorders/' + order_no,
					type: 'DELETE',
					contentType:'application/json;charset=utf-8',
					dataType:'json',
					success: function(data) {
						console.log(data.result);
						buyorderSelect();
						returnList();			
					}
					
				});
			}
		    else {
		    	return false;
		    }
		        	
		});
	}
	
	//주문일자를 누르면 상세정보를 새창으로 띄워주는 소스
	function orderDetails(order_no) {
		window.open('getBuyorderdetailList?order_no=' + order_no,
					'buyorderdetails',
					'width=800, height=250, left=150, top=250, location=no, status=no, scrollbars=yes');
		return false;
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
						<th style="display:none;">주문번호</th>
						<th>반품</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>
				</thead>
				<tbody id="tbodyBuyorders">	</tbody>
			</table>
		</div>
	</div>
			<hr/>
<div class="card shadow mb-4">
	<div class="card-header py-3">
		<div class="card-body">
			<div class="table-responsive">
				<table class="table table-bordered">
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

